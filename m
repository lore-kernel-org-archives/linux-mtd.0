Received: from 147.175.241.83.in-addr.dgcsystems.net ([83.241.175.147]
	helo=tmnt04.transmode.se)
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HRlpG-0005Fe-Ck
	for linux-mtd@lists.infradead.org; Thu, 15 Mar 2007 09:00:48 +0000
Subject: Re: Slow JFFS2 mount on one particular system
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: linux-mtd@lists.infradead.org
In-Reply-To: <1173887256.26465.151.camel@gentoo-jocke.transmode.se>
References: <1173887256.26465.151.camel@gentoo-jocke.transmode.se>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Thu, 15 Mar 2007 09:50:20 +0100
Message-Id: <1173948620.26465.184.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-03-14 at 16:47 +0100, Joakim Tjernlund wrote:
> I got this system(embedded PowerPC, big endian) with a JFFS2 root FS and it is very slow to
> mount(~50 sec) at boot, which is about 45 sec longer that other comparable system in the lab.
> 
> This system has been subjected to alot abuse like powercycling, adding and removing lots of
> small and big files. Currently there are no errors from the FS when booting/using it other
> that it is very slow. About 20% FS usage. I have forced GC by sending kill -HUP and kill -CONT
> to the GC thread in a loop for about an hour and it didn't get any better.
> There aren't and big log files either that are fragmented.
> 
> I have dumped an image of the FS here:
> ftp://www.transmode.net/pub/slow_jffs2_image
> It is 128509 KB.
> 
> Would very much like to know why this FS is so slow. Any ideas?
> 
>  Jocke

Did some investigation with jffs2dump and found alot of
  Dirent     node at 0x05652880, totlen 0x00000033, #pino     4, version 123831, #ino         0, nsize       11, name passwd.lock
         Inode      node at 0x056528b4, totlen 0x00000044, #ino  43247, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x056528f8, totlen 0x00000033, #pino     4, version 123832, #ino     43247, nsize       11, name passwd.1667
         Inode      node at 0x0565292c, totlen 0x00000049, #ino  43247, version     2, isize        5, csize        5, dsize        5, offset        0
         Dirent     node at 0x05652978, totlen 0x00000033, #pino     4, version 123833, #ino     43247, nsize       11, name passwd.lock
         Dirent     node at 0x056529ac, totlen 0x00000033, #pino     4, version 123834, #ino         0, nsize       11, name passwd.1667
         Inode      node at 0x056529e0, totlen 0x00000044, #ino  43248, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x05652a24, totlen 0x00000033, #pino     4, version 123835, #ino     43248, nsize       11, name shadow.1667
         Inode      node at 0x05652a58, totlen 0x00000049, #ino  43248, version     2, isize        5, csize        5, dsize        5, offset        0
         Dirent     node at 0x05652aa4, totlen 0x00000033, #pino     4, version 123836, #ino     43248, nsize       11, name shadow.lock
         Dirent     node at 0x05652ad8, totlen 0x00000033, #pino     4, version 123837, #ino         0, nsize       11, name shadow.1667
         Inode      node at 0x05652b0c, totlen 0x00000044, #ino   1585, version 23417, isize      710, csize        0, dsize        0, offset        0
         Dirent     node at 0x05652b50, totlen 0x00000033, #pino     4, version 123838, #ino         0, nsize       11, name shadow.lock
         Dirent     node at 0x05652b84, totlen 0x00000033, #pino     4, version 123839, #ino         0, nsize       11, name passwd.lock
         Inode      node at 0x05652bb8, totlen 0x00000044, #ino  43249, version     1, isize        0, csize        0, dsize        0, offset        0
         Dirent     node at 0x05652bfc, totlen 0x00000033, #pino     4, version 123840, #ino     43249, nsize       11, name passwd.1668
         Inode      node at 0x05652c30, totlen 0x00000049, #ino  43249, version     2, isize        5, csize        5, dsize        5, offset        0
         Dirent     node at 0x05652c7c, totlen 0x00000033, #pino     4, version 123841, #ino     43249, nsize       11, name passwd.lock
         Dirent     node at 0x05652cb0, totlen 0x00000033, #pino     4, version 123842, #ino         0, nsize       11, name passwd.1668

which looks like old deleted files still present in the image. Had a look in the jffs2 code and found this in
write.c:
int jffs2_do_unlink(struct jffs2_sb_info *c, struct jffs2_inode_info *dir_f,
		    const char *name, int namelen, struct jffs2_inode_info *dead_f,
		    uint32_t time)
{
	struct jffs2_raw_dirent *rd;
	struct jffs2_full_dirent *fd;
	uint32_t alloclen;
	int ret;

	if (1 /* alternative branch needs testing */ ||
	    !jffs2_can_mark_obsolete(c)) {
		/* We can't mark stuff obsolete on the medium. We need to write a deletion dirent */

This makes unlink always write a deletion entry instead of making a node obsolete, which will pollute the
flash needlessly for NOR based JFFS2 FS:es.

Now I started another GC loop with:
while [[ 1 ]] ; do killall -HUP jffs2_gcd_mtd6 ; ps | grep gcd ; done
and let it run for 2-3 hours. Now I see that the FS usage has dropped to 13% and my
boot times has decreased to 13 seconds, the system also behaves much better.

I think this boils down to two things:
1) The unlink code above should be changed to obsolete nodes when possible
2) Automatic GC isn't working well, but I don't know how to make it better

 Comments?

 Jocke

PS.
    David, my emails don't seem to reach the list 

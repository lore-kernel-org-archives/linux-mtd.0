Received: from mail.utfors.se ([195.58.103.125])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15izb0-00078I-00
	for <linux-mtd@lists.infradead.org>; Mon, 17 Sep 2001 15:42:02 +0100
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: Re(2): trouble compiling mkfs.jffs2 
Date: Mon, 17 Sep 2001 16:48:06 +0200
Message-ID: <IGEFJKJNHJDCBKALBJLLMEBMEPAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <14988.1000734691@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi

When mounting a mkfs.jffs2 made jffs2 image, I get:
root@board8:~# mount /dev/mtdblock4 /jffs2/
Child dir "." (ino #1) of dir ino #1 appears to be a hard link
root@board8:~# cd /jffs2/                                     
root@board8:/jffs2# ls -l
total 4
drwxr-xr-x    2 root     root            0 Sep 14 09:05 ./
drwxr-xr-x    2 root     root            0 Sep 14 09:05 ./
drwxrwxrwx   17 root     root         4096 Sep 11 09:53 ../
drwxr-xr-x    1 root     root            0 Sep 11 09:38 bin/
drwxr-xr-x    1 root     root            0 Sep  4 08:55 boot/
drwxr-xr-x    1 root     root            0 Sep 14 09:33 dev/
drwxr-xr-x    1 root     root            0 Sep 11 09:49 etc/
-rw-r--r--    1 root     root            0 Sep  4 13:38 fastboot
drwxr-xr-x    1 root     root            0 Sep  4 08:57 home/
drwxr-xr-x    1 root     root            0 Jul 10 07:04 lib/
drwxr-xr-x    1 root     root            0 May 23 19:49 mnt/
drwxr-xr-x    1 root     root            0 May 23 19:49 opt/
drwxr-xr-x    1 root     root            0 Sep  4 08:52 proc/
drwsr--r--    1 root     root            0 Sep 17 12:36 root/
drwxr-xr-x    1 root     root            0 Sep  4 11:57 sbin/
drwxrwxrwt    1 root     root            0 Aug 29 07:19 tmp/
drwxr-xr-x    1 root     root            0 Sep  4 10:28 usr/
drwxr-xr-x    1 root     root            0 Jun  8 17:29 var/

This is with mkfs.jffs2 v1.16

I am not sure what I was running before I upgraded to v1.16, but it could 
have been as old as v1.11

This FS is created from MV 2.0 by doing(on Host, Redhat 7.1):
cp -a /opt/hardhat/.../target /root/target
<rm /root/target a lot of unnedded files>
mkfs.jffs2 -b -e 0x40000 -o rootfs -d /root/target

On target(custom PPC 860):
eraseall /dev/mtd4
cp rootfs /dev/mtdblock4




   Joakim
> 
> 
> james@telos-systems.com said:
> >  Thanks...  I got it to compile (v1.15), but when I run it  it creates
> > a file size == one erase block.
> 
> 1.15 was doing naughty things when given a relative rootdir, and just 
> segfaulting when the rootdir wasn't specified.  1.16 should fix it.
> 
> ftp.uk.linux.org:/pub/people/dwmw2/jffs2/mkfs.jffs2-1.16
> 
> --
> dwmw2
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

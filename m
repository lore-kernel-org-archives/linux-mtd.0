Received: from web57905.mail.re3.yahoo.com ([68.142.236.98])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IE4gA-0005l0-Eq
	for linux-mtd@lists.infradead.org; Thu, 26 Jul 2007 10:51:18 -0400
Date: Thu, 26 Jul 2007 07:44:21 -0700 (PDT)
From: Paul Wakeman <prwakeman@yahoo.com>
Subject: Re: jffs2: mount problems when XATTR is enabled
To: KaiGai Kohei <kaigai@ak.jp.nec.com>
In-Reply-To: <46A81923.3060503@ak.jp.nec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <54323.51026.qm@web57905.mail.re3.yahoo.com>
Cc: Paul Wakeman <prwakeman@yahoo.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

KaiGai Kohei <kaigai@ak.jp.nec.com> wrote:

> KaiGai Kohei wrote:
> > Is it possible to send the following logs?
> > - "ls /" after "dmesg -n 8"

I managed to boot a debug kernel when /mnt/userdata was showing jffs2
errors. "ls /mnt/userdata" returns IO error.

aseries# ls /mnt/userdata
JFFS2 warning: (1783) jffs2_get_inode_nodes: Eep. No valid nodes for
ino #2.
JFFS2 warning: (1783) jffs2_do_read_inode_internal: no data nodes found
for ino #2
ls: /mnt/userdata/4242-1111-1111-0001: Input/output error
aseries# echo 8 > /proc/sys/kernel/printk
aseries# ls /mnt/userdata
jffs2_follow_link(): target path is 'busybox'
jffs2_follow_link(): target path is 'ld-2.4.so'
jffs2_follow_link(): target path is 'libcrypt-2.4.so'
jffs2_follow_link(): target path is 'libc-2.4.so'
jffs2_readdir() for dir_i #1
Dirent 0: ".", ino #1
Dirent 1: "..", ino #1
Dirent 2: "4242-1111-1111-0001", ino #2, type 8
Skipping deletion dirent "4242-1111-1111-0001.new"
jffs2_readdir() for dir_i #1
Skipping dirent: "4242-1111-1111-0001", ino #2, type 8, because curofs
2 < offset 4
Skipping dirent: "4242-1111-1111-0001.new", ino #0, type 0, because
curofs 3 < offset 4
ls: /mnt/userdata/4242-1111-1111-0001: Input/output error

> >  It seems to me that some warnning or notice messages from kernel
> are filtered
> >  due to log message level configuration.
> >  Xattr implementation has a possibility to return -EIO, but I could
> not found
> >  those messages in jffs2-dbg-flashboot.log.gz.
> 
> In addition, is it possible to execute "ls <any other
> directories/files>" ?
> e.g) $ ls /mnt

Yes it is.

aseries# ls /mnt
jffs2_follow_link(): target path is 'busybox'
jffs2_follow_link(): target path is 'ld-2.4.so'
jffs2_follow_link(): target path is 'libcrypt-2.4.so'
jffs2_follow_link(): target path is 'libc-2.4.so'
jffs2_readdir() for dir_i #9
Dirent 0: ".", ino #9
Dirent 1: "..", ino #1
Dirent 2: "nfs", ino #497, type 4
Dirent 3: "src", ino #499, type 4
Dirent 4: "userdata", ino #494, type 4
Dirent 5: "maps", ino #496, type 4
Dirent 6: "rwfs", ino #498, type 4
Dirent 7: "cdrom", ino #492, type 4
Dirent 8: "crash", ino #493, type 4
Dirent 9: "floppy", ino #495, type 4
jffs2_readdir() for dir_i #9
Skipping dirent: "nfs", ino #497, type 4, because curofs 2 < offset 10
Skipping dirent: "src", ino #499, type 4, because curofs 3 < offset 10
Skipping dirent: "userdata", ino #494, type 4, because curofs 4 <
offset 10
Skipping dirent: "maps", ino #496, type 4, because curofs 5 < offset 10
Skipping dirent: "rwfs", ino #498, type 4, because curofs 6 < offset 10
Skipping dirent: "cdrom", ino #492, type 4, because curofs 7 < offset
10
Skipping dirent: "crash", ino #493, type 4, because curofs 8 < offset
10
Skipping dirent: "floppy", ino #495, type 4, because curofs 9 < offset
10
cdrom   crash   userdata    floppy  maps    nfs     rwfs    src

The /mnt/userdata partition is the one where files have XATTRs.

Are others using XATTR with jffs2?

Paul



       
____________________________________________________________________________________
Boardwalk for $500? In 2007? Ha! Play Monopoly Here and Now (it's updated for today's economy) at Yahoo! Games.
http://get.games.yahoo.com/proddesc?gamekey=monopolyherenow  

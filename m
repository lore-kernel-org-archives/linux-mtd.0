Received: from c135.h203149222.is.net.tw
	([203.149.222.135] helo=ms.gv.com.tw ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17c3zg-0006ID-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Aug 2002 14:03:25 +0100
Message-ID: <000701c23d49$aefcb860$1b0448c0@gv.com.tw>
From: "??" <kevin@gv.com.tw>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>, "? ??" <djh@gv.com.tw>, <cms@gv.com.tw>,
   "jiunrong" <jiunrong@gv.com.tw>
References: <010801c23d3e$7d0f0c00$1b0448c0@gv.com.tw>  <003501c23d10$5f6c4f60$1b0448c0@gv.com.tw> <01c201c23c69$7995faa0$1b0448c0@gv.com.tw> <00bc01c239cf$4ef3a8c0$1b0448c0@gv.com.tw> <013d01c2388f$94c655a0$1b0448c0@gv.com.tw> <0H04006C5M7GUI@smtp-out.bhp.t-online.de> <00f801c2390a$d956dd40$1b0448c0@gv.com.tw> <0H05001Y6RM950@smtp-out.bhp.t-online.de> <001001c23957$3a290520$1b0448c0@gv.com.tw> <28541.1028541296@redhat.com> <31970.1028543113@redhat.com> <000701c23cfe$a1542040$1b0448c0@gv.com.tw> <31481.1028622389@redhat.com>  <31830.1028636815@redhat.com>
Subject: No free space left for GC(test2 with log)
Date: Tue, 6 Aug 2002 21:03:39 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

(console log of evb241x:)

# mkdir aaa

# df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/mtdblock1            6904      1612      5292  23% /
/dev/ram1                 1009        17       992   2% /var
192.72.4.43:/home/test/mips   4134900    328600   3596252   8% /mnt

(/mnt is a mounted nfs directory on pc)

# cp /mnt/* /aaa/
jffs2_g_c_deletion_dirent(): Short read (40 not 12) reading from obsolete
node at 00633ae0
jffs2_g_c_deletion_dirent(): Short read (40 not 12) reading from obsolete
node at 00665b68

(after about 10 minutes, we do a ctrl-c here to interrupt the files copy)

#

(it begin to show "No free space left for GC" repeatly after ctrl-c)

Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
mjffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_bloc
----- Original Message -----
From: "David Woodhouse" <dwmw2@infradead.org>
To: "??" <kevin@gv.com.tw>
Cc: <linux-mtd@lists.infradead.org>; "? ??" <djh@gv.com.tw>;
<cms@gv.com.tw>; "jiunrong" <jiunrong@gv.com.tw>
Sent: Tuesday, August 06, 2002 8:26 PM
Subject: Re: fail to rm files when jffs2 is full


>
> kevin@gv.com.tw said:
> > when we test disk-full with jffs2/mtd, we fail to rm files when jffs2
> > is full
>
> Were there any other errors leading up to this? The flash should never get
> so full that it doesn't allow you to remove things.
>
> --
> dwmw2
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

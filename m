Received: from c135.h203149222.is.net.tw
	([203.149.222.135] helo=ms.gv.com.tw ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17c2jz-00063k-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Aug 2002 12:43:07 +0100
Message-ID: <010801c23d3e$7d0f0c00$1b0448c0@gv.com.tw>
From: "??" <kevin@gv.com.tw>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>, "? ??" <djh@gv.com.tw>, <cms@gv.com.tw>,
   "jiunrong" <jiunrong@gv.com.tw>
References: <003501c23d10$5f6c4f60$1b0448c0@gv.com.tw>  <01c201c23c69$7995faa0$1b0448c0@gv.com.tw> <00bc01c239cf$4ef3a8c0$1b0448c0@gv.com.tw> <013d01c2388f$94c655a0$1b0448c0@gv.com.tw> <0H04006C5M7GUI@smtp-out.bhp.t-online.de> <00f801c2390a$d956dd40$1b0448c0@gv.com.tw> <0H05001Y6RM950@smtp-out.bhp.t-online.de> <001001c23957$3a290520$1b0448c0@gv.com.tw> <28541.1028541296@redhat.com> <31970.1028543113@redhat.com> <000701c23cfe$a1542040$1b0448c0@gv.com.tw>  <31481.1028622389@redhat.com>
Subject: fail to rm files when jffs2 is full
Date: Tue, 6 Aug 2002 19:43:31 +0800
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

dear all,

when we test disk-full with jffs2/mtd,
we fail to rm files when jffs2 is full
it keeps showing the following messages repeatly:
----fail to rm files when jffs2 is
full------------------------------------------------
jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
0. (e
rasableempty: yes, erasingempty: yes, erasependingempty: yes)
.....repeat ........
----------------------------------------------------------------------------
------
any idea?
thanks in advanced!:)

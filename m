Received: from c135.h203149222.is.net.tw
	([203.149.222.135] helo=ms.gv.com.tw ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17c2ny-00064H-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Aug 2002 12:47:15 +0100
Message-ID: <011e01c23d3f$145f0240$1b0448c0@gv.com.tw>
From: "??" <kevin@gv.com.tw>
To: "??" <kevin@gv.com.tw>
Cc: <linux-mtd@lists.infradead.org>, "? ??" <djh@gv.com.tw>, <cms@gv.com.tw>,
   "jiunrong" <jiunrong@gv.com.tw>
Subject: Re: fail to rm files when jffs2 is full
Date: Tue, 6 Aug 2002 19:47:44 +0800
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

jffs2 ?????,

? disk full ?,?????
jffs2 ? garbage collection ??????......

??mailing list ???........

----- Original Message -----
From: "??" <kevin@gv.com.tw>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>; "? ??" <djh@gv.com.tw>;
<cms@gv.com.tw>; "jiunrong" <jiunrong@gv.com.tw>
Sent: Tuesday, August 06, 2002 7:43 PM
Subject: fail to rm files when jffs2 is full


> dear all,
>
> when we test disk-full with jffs2/mtd,
> we fail to rm files when jffs2 is full
> it keeps showing the following messages repeatly:
> ----fail to rm files when jffs2 is
> full------------------------------------------------
> jffs2_reserve_space_gc of 196 bytes for garbage_collect_dnode failed: -28
> Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is
> 0. (e
> rasableempty: yes, erasingempty: yes, erasependingempty: yes)
> .....repeat ........
> --------------------------------------------------------------------------
--
> ------
> any idea?
> thanks in advanced!:)
>
>

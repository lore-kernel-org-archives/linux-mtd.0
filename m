Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cNhE-0000pH-00
	for <linux-mtd@lists.infradead.org>; Wed, 07 Aug 2002 11:05:40 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <000701c23d49$aefcb860$1b0448c0@gv.com.tw> 
References: <000701c23d49$aefcb860$1b0448c0@gv.com.tw>  <010801c23d3e$7d0f0c00$1b0448c0@gv.com.tw> <003501c23d10$5f6c4f60$1b0448c0@gv.com.tw> <01c201c23c69$7995faa0$1b0448c0@gv.com.tw> <00bc01c239cf$4ef3a8c0$1b0448c0@gv.com.tw> <013d01c2388f$94c655a0$1b0448c0@gv.com.tw> <0H04006C5M7GUI@smtp-out.bhp.t-online.de> <00f801c2390a$d956dd40$1b0448c0@gv.com.tw> <0H05001Y6RM950@smtp-out.bhp.t-online.de> <001001c23957$3a290520$1b0448c0@gv.com.tw> <28541.1028541296@redhat.com> <31970.1028543113@redhat.com> <000701c23cfe$a1542040$1b0448c0@gv.com.tw> <31481.1028622389@redhat.com> <31830.1028636815@redhat.com> 
To: "??" <kevin@gv.com.tw>
Cc: linux-mtd@lists.infradead.org, "? ??" <djh@gv.com.tw>, cms@gv.com.tw,
    "jiunrong" <jiunrong@gv.com.tw>
Subject: Re: No free space left for GC(test2 with log) 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 07 Aug 2002 11:05:35 +0100
Message-ID: <32140.1028714735@redhat.com>
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

kevin@gv.com.tw said:
> jffs2_g_c_deletion_dirent(): Short read (40 not 12) reading from
> obsolete node at 00633ae0

Ok, this was a stupid error on my part which prevented GC from working. It 
may well have been causing the problem. CVS update and try again.


--
dwmw2

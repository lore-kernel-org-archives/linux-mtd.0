Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15oSNW-0002Bx-00
	for <linux-mtd@lists.infradead.org>; Tue, 02 Oct 2001 17:26:42 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20011002091421.A15650@recycle.lbl.gov> 
References: <20011002091421.A15650@recycle.lbl.gov> 
To: Larry Doolittle <ldoolitt@recycle.lbl.gov>
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2_RESERVED_BLOCKS_* 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 02 Oct 2001 17:35:44 +0100
Message-ID: <30731.1002040544@redhat.com>
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

ldoolitt@recycle.lbl.gov said:
>  Maybe my use is atypical, and maybe 5 blocks is a theoretical
> minimum.  I don't want to sound like a complainer, either -- this file
> system certainly looks like it meets my needs. I guess I just want to
> point out the superficial imbalance between the amount of sweat people
> pour out on projects like busybox to reduce code size by a few kB,
> when there is 320 kB "just lying around" on any JFFS2 on a 64 kB erase
> block chip.

Theoretical minimum is one block, not five. Give me formal proof that 
this is also the _practical_ minimum, and we can drop the 
overly-conservative limits.

Actually, we'd drop it to two, to allow for at least one block going bad on 
us. More than two on NAND flash.

--
dwmw2

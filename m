Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15tWd1-00028K-00
	for <linux-mtd@lists.infradead.org>; Tue, 16 Oct 2001 16:59:39 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20011016083420.A18642@recycle.lbl.gov> 
References: <20011016083420.A18642@recycle.lbl.gov> 
To: Larry Doolittle <ldoolitt@recycle.lbl.gov>
Cc: linux-mtd@lists.infradead.org
Subject: Re: NAND flash 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 16 Oct 2001 17:08:51 +0100
Message-ID: <21715.1003248531@redhat.com>
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
>  I think you should double check that assertion.  My understanding is
> that the "Smart" in the name is a bug.  These are actually NAND chips,
> consumer-grade packaged, standardized, and marketed, with no smarts at
> all.  So you _could_ use the nand.c driver, with the right interface-
> specific wrapper layer to get at the device.

Correct, with the proviso that some SmartMedia 'adapters' have 
microcontrollers built in, and the host can't actually _get_ at the raw 
flash.

> Unfortunately, the result would not be content-compatible with other
> SmartMedia users, because SmartMedia also has a standard for encoding
> blocks on the nand chips.  I tried to read that standard, but the PDF
> file is encrypted in a way that is incompatible with xpdf-0.92.  The
> URL for that reference material has been posted here before, it's
>  http://www.ssfdc.or.jp/spec/english/

Acroread can manage it. It all looks fairly simple to implement.

--
dwmw2

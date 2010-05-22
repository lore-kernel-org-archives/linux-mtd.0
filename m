Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OFjbB-0000y2-6l
	for linux-mtd@lists.infradead.org; Sat, 22 May 2010 07:58:21 +0000
Received: by bwz9 with SMTP id 9so85142bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 22 May 2010 00:58:19 -0700 (PDT)
Subject: Re: [PATCH 3/3] MTD: Kconfig cleanups
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1274514430.11551.13808.camel@macbook.infradead.org>
References: <1274490185.15285.22.camel@maxim-laptop>
	<1274490476-16057-3-git-send-email-maximlevitsky@gmail.com>
	<1274514430.11551.13808.camel@macbook.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 22 May 2010 10:58:16 +0300
Message-ID: <1274515096.19375.2.camel@maxim-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2010-05-22 at 08:47 +0100, David Woodhouse wrote: 
> On Sat, 2010-05-22 at 04:07 +0300, Maxim Levitsky wrote:
> > 
> > @@ -129,6 +131,7 @@ config MTD_NAND_RICOH
> >         default n
> >         depends on PCI
> >         select MTD_SM_COMMON
> > +       select MTD_NAND_ECC_SMC 
> 
> I thought we had a better solution than this -- weren't we going to make
> it a runtime thing? And default to the 'correct' order?
> 
> Then, only the legacy devices which need to retain the 'wrong' byteorder
> for compatibility reasons will need to do it.
> 
Sure, but I'll need to do several changes to drivers that I can't test.
For now this ensures correctness, then I fix all of this.

Best regards,
Maxim Levitsky

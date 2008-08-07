Received: from fg-out-1718.google.com ([72.14.220.153])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KR2vI-0001Az-QH
	for linux-mtd@lists.infradead.org; Thu, 07 Aug 2008 10:40:49 +0000
Received: by fg-out-1718.google.com with SMTP id l26so188289fgb.26
	for <linux-mtd@lists.infradead.org>;
	Thu, 07 Aug 2008 03:40:47 -0700 (PDT)
Message-ID: <cd73a99e0808070340s29932337o74293afc91d128f4@mail.gmail.com>
Date: Thu, 7 Aug 2008 12:40:47 +0200
From: "Andrew Victor" <avictor.za@gmail.com>
To: "David Brownell" <david-b@pacbell.net>
Subject: Re: [patch 2.6.27-rc2] MTD: make dataflash write-verify be optional
In-Reply-To: <200808062155.14366.david-b@pacbell.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <200808062155.14366.david-b@pacbell.net>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	Andrew Victor <linux@maxim.org.za>,
	Haavard Skinnemoen <hskinnemoen@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi,

> It doesn't seem to add a
> lot in terms of reliability, and wouldn't detect errors which
> crop up when transferring data to the on-chip SRAM buffer.

Yes, it was originally added for detecting bad/dead bits on the flash.

[I think some (obsolete) DataFlash revisions (C?) didn't have the
compare functionality, though revision B did.  Or atleast it wasn't
defined in the rev C datasheets.  It did return "success" on those
chips though].


Acked-by: Andrew Victor <linux@maxim.org.za>

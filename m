Received: from albatros.havelsan.com.tr ([195.142.233.60])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 192tWt-00032j-Pa
	for <linux-mtd@lists.infradead.org>; Tue, 08 Apr 2003 14:52:54 +0100
Message-ID: <00ba01c2fdd6$0096d9b0$3064000a@nur>
From: "nur" <nurpinar@e-kolay.net>
To: <linux-mtd@lists.infradead.org>
References: <009801c2fdd2$eb0d1da0$3064000a@nur>
Date: Tue, 8 Apr 2003 16:51:49 +0300
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Re: UnitSizeFactor 
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In addition, I have had disabled DOC_SINGLE_DRIVER from docprobe.c
The kernel image works fine with DoC Millennium but I got this error when
working with DoC Millennium Module
Is there any patch to apply for Millennium Module?

> "Sorry we don't support UnitSizeFactor of !=1 yet"
>
> I m getting such an error message during boot.
> I have kernel 2.2.20. 8MB DoC Millennium Module
> 32 MB Ram. I have enabled Doc Millennium Only from Kernel and let kernel
> find window address of it. And mtd char device nftl support.
> DoC512.exb is installed. What should I do ?
> Is it safe to install doc42.exb which I think will solve the problem?
> Thanks
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

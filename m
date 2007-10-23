Received: from wr-out-0506.google.com ([64.233.184.224])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Ik7ml-0004Hq-Hz
	for linux-mtd@lists.infradead.org; Tue, 23 Oct 2007 01:38:21 +0100
Received: by wr-out-0506.google.com with SMTP id c48so920837wra
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Oct 2007 17:37:17 -0700 (PDT)
Message-ID: <366f00c80710221737l3d2b6ec5qd51160253f7c73d6@mail.gmail.com>
Date: Tue, 23 Oct 2007 06:07:17 +0530
From: "Sudeep K N" <sudeepholla.maillist@gmail.com>
To: "z l" <zql@glomationinc.com>
Subject: Re: MTD driver for MLC NAND chips
In-Reply-To: <38608.90724.qm@web405.biz.mail.mud.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <38608.90724.qm@web405.biz.mail.mud.yahoo.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

No special changes are required for MLC chip.
It works fines as it is.
Just make sure that the chip is getting detected
as large page nand chip as the BI is at different
offset in spare area compared to small page chip.

Regards,
Sudeep

On 10/23/07, z l <zql@glomationinc.com> wrote:
> Does current MTD support MLC NAND chips?  I tried the
> Samsung K9LAG08U0M (2GiB) on our board with Linux
> 2.6.22.1 kernel but got a invalid pointer 0 reference
> in the nand_scan function.  The same kernel works fine
> without any problem when using Samsung K9F1G08U0M
> (128MiB).  Is there any thing special that must be
> done in the NAND driver for MLC chip?
>
> Thanks in advance
>
> zl
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>

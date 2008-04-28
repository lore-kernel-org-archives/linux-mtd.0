Received: from wf-out-1314.google.com ([209.85.200.171])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JqSP0-0001A2-6W
	for linux-mtd@lists.infradead.org; Mon, 28 Apr 2008 12:24:15 +0000
Received: by wf-out-1314.google.com with SMTP id 29so4258444wff.24
	for <linux-mtd@lists.infradead.org>;
	Mon, 28 Apr 2008 05:24:13 -0700 (PDT)
Message-ID: <bae050c10804280524o6555551cm90088d816674965b@mail.gmail.com>
Date: Mon, 28 Apr 2008 20:24:12 +0800
From: Nancy <nancydreaming@gmail.com>
To: "Adrian Hunter" <ext-adrian.hunter@nokia.com>
Subject: Re: UBI: badblock management confusion!
In-Reply-To: <4815BBDD.4090004@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <bae050c10804242354s722c9a58r1ed4e1ad1afaff90@mail.gmail.com>
	<4811B6BF.9020200@nokia.com>
	<bae050c10804250508g68df553qcce03bb6551aa5c5@mail.gmail.com>
	<48158370.9090001@nokia.com>
	<bae050c10804280450g591c74bfn711f668863b693f1@mail.gmail.com>
	<4815BBDD.4090004@nokia.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > Let me clarify the problem I met:
> >        there are so many Nand flash for burning. Each one of them may have
> > different numbers of badblocks, but that number do not exceed the reserved
> > badblock number. Each one of them should have the same maximum avaliable
> > volume size. But the practice tell no, the maximum avaliable volume size
> > effect by number of badblocks the current MTD partition has. That's wrong.
> > You can try by yourself.
> >
> >
>
> The following section from UBI documentation may help you:
>
>
> http://linux-mtd.infradead.org/doc/ubi.html#L_autoresize
>
> Let us know if it doesn't meet your needs.

Sorry, my bad english, I can't get what autoresize for.
I just want to set every Nand same! Just like I defined my MTD
partitions. Each product has same partitions table.
same reserved badblock number.
same user space useable blocks.
Is that requirement abnormal?



-- 
Best wishes,
Nancy

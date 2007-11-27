Received: from rn-out-0910.google.com ([64.233.170.187]
	helo=rn-out-0102.google.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1IxA3c-00032K-BU
	for linux-mtd@lists.infradead.org; Tue, 27 Nov 2007 23:41:42 +0000
Received: by rn-out-0102.google.com with SMTP id e25so825318rng
	for <linux-mtd@lists.infradead.org>;
	Tue, 27 Nov 2007 15:41:35 -0800 (PST)
Message-ID: <9c9fda240711271541t699a76a7hea6eb280f10e8957@mail.gmail.com>
Date: Wed, 28 Nov 2007 08:41:35 +0900
From: "Kyungmin Park" <kmpark@infradead.org>
Sender: kyungmin78@gmail.com
To: "=?ISO-8859-1?Q?J=F6rn_Engel?=" <joern@logfs.org>
Subject: Re: [RFC][PATCH][JFFS2] JFFS2 support for NOP 1
In-Reply-To: <20071127130333.GB29456@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <20071127073616.GA22556@party>
	<20071127095518.GA29456@lazybastard.org>
	<9c9fda240711270348q7798ddd5jfb7bf763b3497500@mail.gmail.com>
	<20071127130333.GB29456@lazybastard.org>
Cc: dwmw2@infradead.org, Kyungmin Park <kyungmin.park@samsung.com>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> On Tue, 27 November 2007 20:48:33 +0900, Kyungmin Park wrote:
> > >
> > > NAK.  This does not describe the limitations of your chip, but a rand=
om
> > > name.  In fact, the limitations appear to be identical to
> > > (MTD_NORFLASH & !MTD_BIT_WRITEABLE).
> > >
> > > Maybe something like ALLOW_SEPERATE_OOB_WRITE with reversed logic?
> > >
> >
> > However MTD_NORFLASH doesn't have the write buffer. It means it can be
> > write one more.
>
> Some NOR flashes _do_ require write buffers.  The ones I know must be
> written in aligned multiples of 8, 16 or 1024 bytes, respectively.  In
> spite of being NOR, that sounds quite similar to what you try to achieve
> for NAND.
>

Hi J=F6rn,

You probably mean the "Intel Sibley NOR".
Yes, the concept is same. It want to use write buffer but oob in NAND.
I hope to modify the code with small modification to work the MLC NAND.
As written in previous mail, we only update the mtd->flags and sub
page value at driver level.

Thank you,
Kyungmin Park

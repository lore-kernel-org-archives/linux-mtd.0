Received: from ug-out-1314.google.com ([66.249.92.170])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1IxCLp-0004QX-Be
	for linux-mtd@lists.infradead.org; Wed, 28 Nov 2007 02:08:39 +0000
Received: by ug-out-1314.google.com with SMTP id 23so1372484ugr
	for <linux-mtd@lists.infradead.org>;
	Tue, 27 Nov 2007 18:08:31 -0800 (PST)
Message-ID: <9c9fda240711271808gcbd0964jf73d564d56ebccc4@mail.gmail.com>
Date: Wed, 28 Nov 2007 11:08:30 +0900
From: "Kyungmin Park" <kmpark@infradead.org>
Sender: kyungmin78@gmail.com
To: "=?ISO-8859-1?Q?J=F6rn_Engel?=" <joern@logfs.org>
Subject: Re: [RFC][PATCH][JFFS2] JFFS2 support for NOP 1
In-Reply-To: <20071127233108.GC29456@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <20071127073616.GA22556@party>
	<20071127095518.GA29456@lazybastard.org>
	<9c9fda240711270348q7798ddd5jfb7bf763b3497500@mail.gmail.com>
	<1196164758.20132.6.camel@sauron>
	<9c9fda240711271528j5dd89cacg9b1b1c11e700b16b@mail.gmail.com>
	<20071127233108.GC29456@lazybastard.org>
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

On 11/28/07, J=F6rn Engel <joern@logfs.org> wrote:
> On Wed, 28 November 2007 08:28:56 +0900, Kyungmin Park wrote:
> >
> > Umm, I'm not sure it's the right term. "sub-page" doesn't cover the
> > oob area. It's only meanful at data area.
> > Anyway it should be sub-page is 0 in MLC case.
>
> Maybe we need a good description of the problem before we proceed.  This
> argument about NOP vs. sub-page sounds as if not everyone has the same
> definition for those words.  Without agreeing on those definitions, we
> could argue for weeks without useful results.
>
> Kyungmin, can you describe the problem again, including definitions of
> potentially confusing terms?
>

sub-page: possible write size(?)
MTD usually write data with 'page size' (1KiB, 2KiB, and 4KiB) but
some upper layer such as UBI can write it with 'sub-page size (sector
size)'.

Number Of Program (NOP): How many times flash can be programed.
In general SLC NAND has 4 but this value will be smaller as the
technology is advanced and MLC NAND has 1.

The problem is that current JFFS2 implementation uses the NOP 2, data
area and oob area in NAND case. It breaks the NOP 1 limitation in MLC
case.

If the description is wrong, please let me know.

Thank you,
Kyungmin Park

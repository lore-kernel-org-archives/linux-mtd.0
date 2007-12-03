Received: from wa-out-1112.google.com ([209.85.146.182])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Iz2zj-0006rD-Cj
	for linux-mtd@lists.infradead.org; Mon, 03 Dec 2007 04:33:29 +0000
Received: by wa-out-1112.google.com with SMTP id v33so4557781wah
	for <linux-mtd@lists.infradead.org>;
	Sun, 02 Dec 2007 20:33:21 -0800 (PST)
Message-ID: <9c9fda240712022033y693b4c99s8905b10a0789f5dc@mail.gmail.com>
Date: Mon, 3 Dec 2007 13:33:20 +0900
From: "Kyungmin Park" <kmpark@infradead.org>
Sender: kyungmin78@gmail.com
To: "=?ISO-8859-1?Q?J=F6rn_Engel?=" <joern@logfs.org>
Subject: Re: [RFC][PATCH][JFFS2] JFFS2 support for NOP 1
In-Reply-To: <20071128024743.GA4767@lazybastard.org>
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
	<9c9fda240711271808gcbd0964jf73d564d56ebccc4@mail.gmail.com>
	<20071128024743.GA4767@lazybastard.org>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Nov 28, 2007 11:47 AM, J=F6rn Engel <joern@logfs.org> wrote:
> On Wed, 28 November 2007 11:08:30 +0900, Kyungmin Park wrote:
> >
> > sub-page: possible write size(?)
> > MTD usually write data with 'page size' (1KiB, 2KiB, and 4KiB) but
> > some upper layer such as UBI can write it with 'sub-page size (sector
> > size)'.
> >
> > Number Of Program (NOP): How many times flash can be programed.
> > In general SLC NAND has 4 but this value will be smaller as the
> > technology is advanced and MLC NAND has 1.
> >
> > The problem is that current JFFS2 implementation uses the NOP 2, data
> > area and oob area in NAND case. It breaks the NOP 1 limitation in MLC
> > case.
> >
> > If the description is wrong, please let me know.
>
> Sounds plausible.  And reading up on the subpage code I start to doubt
> its robustness wrt. newer SLC flashes as well.  If the NOP is lower than
> the number of ECC steps, trouble is brewing.
>
> But back to your original patch, you want JFFS2 to behave on MLC flashes
> just as it already behaves on Sibley and those dreaded STMicro NORs.
> And I claim that you should not only reach identical behaviour, but also
> share the same code.  There is no point in having two sets of "special"
> initializations with the exact same effect.
>
> Maybe add a flag MTD_OOB_WRITEABLE (or some better name) to SLC flashes
> and have the nand initializations in JFFS2 depend on those.  Without
> this flag, the nor_wbuf_* code is called.  "nor_wbuf" could use a better
> name as well, since it extends to more than just NOR flash.
>

Okay, I will add the MTD_OOB_WRITABLE as NOR.

Are there more opinions or comments?
If not, I will send the updated patch.

Thank you,
Kyungmin Park

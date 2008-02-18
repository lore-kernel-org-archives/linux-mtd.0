Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JR7x7-00053c-DW
	for linux-mtd@lists.infradead.org; Mon, 18 Feb 2008 15:30:46 +0000
Subject: Re: ubi-utils: Moving mkpfi, pfiflash, ... to old-tools
From: Artem Bityutskiy <dedekind@infradead.org>
To: haver@vnet.ibm.com
In-Reply-To: <1203342580.8085.23.camel@august>
References: <1203342580.8085.23.camel@august>
Content-Type: text/plain; charset=utf-8
Date: Mon, 18 Feb 2008 17:28:36 +0200
Message-Id: <1203348516.3758.14.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: "Artem B. Bityutskiy" <dedekind@oktetlabs.ru>,
	"Monte K. Copeland" <catboat@texas.net>, Andreas Arnez <arnez@de.ibm.com>,
	MTD Mailinglist <linux-mtd@lists.infradead.org>,
	Alexander Schmidt1 <ALEXSCHM@de.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2008-02-18 at 14:49 +0100, Frank Haverkamp wrote:
> We need the tool-chain to generate PFI files for the code-update
> process. Those pfi-files are suited to be used in streaming mode
> together with the pfiflash utility. We use the for NOR and NAND flash
> system the same pfi. Therefor the pfi format does not contain flash
> geometry information e.g. vid-hdr-offset, erase-block size.

Yeah. I tried to use the tools but they did not generate correct UBI
images. I tried to fix this and found out that the internals are too
messy to be maintainable, at least by me.

I cleaned-up what I could, made the utilities consistent, small, and
easy to maintain.

Vs. the PFI stuff, I also tried to clean-up this, but gave up after few
days, and just implemented another utility - ubinize.

I know what is PFI and I decided not to do this, because pfi =3D
configuration ini file + ubi images. I figured that it does not make
much sense to inroduce this additional magic format.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)

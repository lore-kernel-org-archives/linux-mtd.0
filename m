Received: from ik-out-1112.google.com ([66.249.90.183])
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1IpX0j-0006f5-Rp
	for linux-mtd@lists.infradead.org; Tue, 06 Nov 2007 17:35:12 -0500
Received: by ik-out-1112.google.com with SMTP id c29so1330734ika
	for <linux-mtd@lists.infradead.org>;
	Tue, 06 Nov 2007 14:35:01 -0800 (PST)
Message-ID: <f383264b0711061434gc0d9f44ibcefae70da1fa70f@mail.gmail.com>
Date: Tue, 6 Nov 2007 14:34:54 -0800
From: "Matt Reimer" <mattjreimer@gmail.com>
To: "=?ISO-8859-1?Q?J=F6rn_Engel?=" <joern@logfs.org>
Subject: Re: [PATCH] MTD: fix s3c2410 error correction
In-Reply-To: <20071106181121.GH25953@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <1192755764-26269-1-git-send-email-mattjreimer@gmail.com>
	<f383264b0710251116v8847c64i871ba7675106e04f@mail.gmail.com>
	<f383264b0711060909r43cd9d38t2653785cb79e3a65@mail.gmail.com>
	<20071106181121.GH25953@lazybastard.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/6/07, J=F6rn Engel <joern@logfs.org> wrote:
> On Tue, 6 November 2007 09:09:00 -0800, Matt Reimer wrote:
> >
> > ping
>
> Ben doesn't seem to comment on this, so I will.  And I must say, I don't
> like the function either before or after your patch.
>
> 1. In principle this is just the bog-standard 1-bit error correction
>    code everyone and his dog is using.
> 2. The original version of this function is subtly different from
>    nand_correct_data().  12 of the constants are off-by-one.  But no
>    explanation why.
> 3. After your patch the bit-position constants are back to original, the
>    0x54 remains 0x55, half the byte-position constants are back to
>    original and the other half that were identical are off-by-one now.
>    Still no explanation why.
>
> So my first question is not whether your patch is correct or not, but
> what makes s3c2410 so different from all the other bog-standard ecc
> schemes?

The explanation is that the s3c hardware ECC gives us the bits in that
order, and this order is what Samsung recommends.

"For more information, compare the s3c2440a or s3c2410 manuals with
page 8 of the following documentation:
http://www.samsung.com/global/business/semiconductor/products/flash/downloa=
ds/applicationnote/ecc_algorithm_for_web_512b.pdf"


> Side note:
> The last conditional in both functions,
>         if ((diff0 & ~(1<<fls(diff0))) =3D=3D 0)
> can be replaced by is_power_of_2().

Thanks, that makes it much more readable.

Matt

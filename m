Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eedEC-0001Ny-SP
 for linux-mtd@lists.infradead.org; Thu, 25 Jan 2018 08:49:50 +0000
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 11.2 \(3445.5.20\))
Subject: Re: [RFC] UBIFS authentication
From: David Gstir <david@sigma-star.at>
In-Reply-To: <E6D3BD02-AF3A-4B75-92FD-A8A07B4C9C51@sigma-star.at>
Date: Thu, 25 Jan 2018 09:49:32 +0100
Cc: Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de
Content-Transfer-Encoding: quoted-printable
Message-Id: <AF303146-8E37-48B2-B9DF-8C3193138EFA@sigma-star.at>
References: <E6D3BD02-AF3A-4B75-92FD-A8A07B4C9C51@sigma-star.at>
To: linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

> On 17.01.2018, at 16:19, David Gstir <david@sigma-star.at> wrote:
>=20
> Hi everybody!
>=20
> Richard and I have been working on extending UBIFS' security features =
and came
> up with the following concept to add full file contents and metadata =
authentication.
>=20
> For block devices like eMMCs dm-crypt and dm-verity/dm-integrity can =
be used to
> get full data confidentiality and authenticity, but for raw flash or =
more
> specifically UBIFS, existing options are not ideal:
>=20
> One option is to use eCryptfs with some out-of-tree patches that add =
AEAD cipher
> (AES-GCM) support, but does not look like there was much progress =
recently [1].
>=20
> Another option is to use IMA/EVM as described by Marc Kleine-Budde in =
his
> ELCE 2016 talk [2], but this just protects the file payload and some =
attributes
> and not the full filesystem data structures.
>=20
> A short overview of existing options is also given here [3].
>=20
> Due to the design of UBIFS it is actually a bit easier than on other =
filesystems
> to authenticate its data structures and ensure consistency of on-flash =
data.
>=20
> I've attached the whitepaper below and also published it here [4].
>=20
> Comments are welcome. :)

*ping*

Did anybody get a chance to look at this yet, or is everybody still busy =
with Meltdown and Spectre? ;D

Thanks,
David=

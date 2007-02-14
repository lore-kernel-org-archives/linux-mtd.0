Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HHJcL-000123-2v
	for linux-mtd@lists.infradead.org; Wed, 14 Feb 2007 07:52:18 -0500
Subject: Re: UBI bad block Management
From: Artem Bityutskiy <dedekind@infradead.org>
To: Brijesh Singh <brijesh.s.singh@gmail.com>
In-Reply-To: <6b5362aa0702140128h69cc8f11k48bec5b739640ded@mail.gmail.com>
References: <6b5362aa0702140128h69cc8f11k48bec5b739640ded@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 14 Feb 2007 14:51:58 +0200
Message-Id: <1171457518.8593.6.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Wed, 2007-02-14 at 14:58 +0530, Brijesh Singh wrote:
> Hi,
>    The flash devices are getting of bigger in Size.The Init Scan time
> will increase with bigger Size flash.How long are we going to rely on
> MTD for Bad block Management.Even MTD doesn't maintain List but calls
> the hardware, if hardware supports it.
> This can be done in two ways,
> 1:) Straight right the bitmap,and if changed erase it.We can do it in
> One reserved block.
>            If allowed bad blocks are 20%,it will be erased 20% times
> of total PEB count.
> 2:)Keep a Queue in Scan of Bad blocks.Ec header contains one field
> called last bad block.Which is PEb no.So if block is found bad,next
> block to be written first will have Bad block no in EC.So it is
> maintained across reboots.
> 3:)Keep a Log in reserved Block.When it is getting full,create bitmap
> and write it on the block.This will reduce the erasing of that block.
>=20
> So we can maintain Bad block Map in UBI if it is necessary.

I really tried to realize what you mean, but failed, sorry. I do not
understand at all what are you about. May you re-phrase?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)

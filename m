Received: from nproxy.gmail.com ([64.233.182.197])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Dhzlf-0001Jt-1c
	for linux-mtd@lists.infradead.org; Mon, 13 Jun 2005 20:59:06 -0400
Received: by nproxy.gmail.com with SMTP id l37so72441nfc
	for <linux-mtd@lists.infradead.org>;
	Mon, 13 Jun 2005 17:59:01 -0700 (PDT)
Message-ID: <2cd57c90050613175226477eb0@mail.gmail.com>
Date: Tue, 14 Jun 2005 08:52:21 +0800
From: Coywolf Qi Hunt <coywolf@gmail.com>
To: Andre <andre@rocklandocean.com>
In-Reply-To: <007401c57049$9fbd6440$6702a8c0@niro>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <007401c57049$9fbd6440$6702a8c0@niro>
Cc: linux-mtd@lists.infradead.org
Subject: Re: diskonchip2000 how to
Reply-To: Coywolf Qi Hunt <coywolf@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 6/14/05, Andre <andre@rocklandocean.com> wrote:
> I have a msys doc2000 384MB device and are running 2.6.11. I used to run =
in
> 2.4.27 with msys' trueffs doc driver, however I would like to give the
> linux-mtd driver a try.
>=20
> Is it better to use NFTL or JFFS2?
>=20
> The documentation lists the following kernel options for getting JFFS2 on
> NAND support in the kernel:
> CONFIG_MTD=3Dy
> CONFIG_MTD_PARTITIONS=3Dy
> CONFIG_MTD_CHAR=3Dy
> CONFIG_MTD_BLOCK=3Dy
> CONFIG_MTD_NAND=3Dy
> CONFIG_MTD_NAND_YOURBOARD=3Dy
> CONFIG_JFFS2_FS=3Dy
> CONFIG_JFFS2_FS_DEBUG=3D0
> CONFIG_JFFS2_FS_NAND=3Dy
>=20
> What are the options that are needed to get NFTL to work on diskonchip
> devices?

Don't you use make menuconfig? You could figure out yourself. It's CONFIG_N=
FTL.
--=20
Coywolf Qi Hunt
http://ahbl.org/~coywolf/

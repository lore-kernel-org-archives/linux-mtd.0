Received: from nproxy.gmail.com ([64.233.182.204])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DhzaM-000184-Hs
	for linux-mtd@lists.infradead.org; Mon, 13 Jun 2005 20:47:23 -0400
Received: by nproxy.gmail.com with SMTP id l37so72399nfc
	for <linux-mtd@lists.infradead.org>;
	Mon, 13 Jun 2005 17:47:18 -0700 (PDT)
Message-ID: <2cd57c9005061317475230cfee@mail.gmail.com>
Date: Tue, 14 Jun 2005 08:47:18 +0800
From: Coywolf Qi Hunt <coywolf@gmail.com>
To: Andre <andre@rocklandocean.com>
In-Reply-To: <004d01c57074$ad3758d0$6702a8c0@niro>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <004d01c57074$ad3758d0$6702a8c0@niro>
Cc: linux-mtd@lists.infradead.org
Subject: Re: suggestion on use of linux-mtd
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
> My apologies for my previous post
> http://lists.infradead.org/pipermail/linux-mtd/2005-June/012816.html
>=20
> I managed to find the mtd-jffs2-howto in the mtd source tree, which conta=
ins
> all the instructions for building the kernel.
>=20
> I have been running ext3 on diskonchip2000 (using m-sys trueffs driver) f=
or
> quite a while now and have not run into any problems yet, although I neve=
r
> did any asynchronous power off tests. I can boot off diskonchip using a
> special version of lilo and initrd.
>=20
> I would really like to try linux-mtd, however I am not quite sure if it i=
s
> suitable for my use of the diskonchip. First of all, my application will
> create up to 32KB/s of data, and it will run for several hours (if not da=
ys
> at lower data rate). The diskonchip will be at least 384MB up to a maximu=
m
> of 1GB. The OS (trimmed down LFS5.0, patched 2.4.27) is about 35M and liv=
es
> in the same partition. Asynchronous power offs cannot be ruled out due to
> the nature of the instrument that will host the cpu board with the
> diskonchip.
>=20
> The mtd-jffs-howto refers to NFTL for diskonchip devices, but also talks
> about JFFS2 and how production worthy it is and it looks like some work h=
as
> been done in the area of powercycle testing, but the link provided is not
> valid.
>=20
> What exactly does one get with *just* NFTL, i.e. does it makes sense to r=
un
> ext3 on top of NFTL? Is NFTL production ready?

No. NFTL is for compatibility purpose.

>=20
> There is also a comment that says JFFS2 does not work on DOC, but I assum=
e
> that comment is old. What exactly is the status of JFFS2 for diskonchip

--=20
Coywolf Qi Hunt
http://ahbl.org/~coywolf/

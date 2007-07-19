Received: from wp110.webpack.hosteurope.de ([80.237.132.117])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IBeuC-0002Bn-8r
	for linux-mtd@lists.infradead.org; Thu, 19 Jul 2007 18:55:33 -0400
From: Tobias Simon <tobias.simon@sp-ss.de>
To: linux-mtd@lists.infradead.org
Subject: Re: flashcp
Date: Fri, 20 Jul 2007 00:55:29 +0200
References: <200707192046.47340.tobias.simon@sp-ss.de>
	<200707192308.21410.tobias.simon@sp-ss.de>
	<20070719221339.GC27750@lazybastard.org>
In-Reply-To: <20070719221339.GC27750@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200707200055.29457.tobias.simon@sp-ss.de>
Cc: joern@logfs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello J=C3=B6rn,

and thanks for your advices!

> Still off-by-one and needlessly complicated.
>
> 	erase.length =3D (filestat.st_size / mtd.erasesize) * mtd.erasesize
>
> This always rounds down, just like the current implementation.  Whether
> rounding down is correct I don't know.  Maybe Josh does.

I thought that rounding up would be a better choice, because the length is=
=20
passed to the erase callback of the device driver.
Won't "flashcp" forget to erase the last block if we round down?

I will test both versions next week, because I have no hardware here.


Best Regards,
Tobias

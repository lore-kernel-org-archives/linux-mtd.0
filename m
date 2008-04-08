Received: from moutng.kundenserver.de ([212.227.126.187])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jj1oE-0004DS-Q6
	for linux-mtd@lists.infradead.org; Tue, 08 Apr 2008 00:35:35 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: joern@logfs.org
Subject: Re: [patch 3/15] fs/logfs/logfs.h
Date: Tue, 8 Apr 2008 02:35:28 +0200
References: <20080401181308.512473173@logfs.org>
	<20080401181332.853833003@logfs.org>
In-Reply-To: <20080401181332.853833003@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200804080235.28946.arnd@arndb.de>
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 01 April 2008, joern@logfs.org wrote:
> +/*
> + * Private errno for accessed beyond end-of-file. =A0Only used internall=
y to
> + * logfs. =A0If this ever gets exposed to userspace or even other parts =
of the
> + * kernel, it is a bug. =A0256 was chosen as a number sufficiently above=
 all
> + * used errno #defines.
> + *
> + * It can be argued that this is a hack and should be replaced with some=
thing
> + * else. =A0My last attempt to do this failed spectacularly and there ar=
e more
> + * urgent problems that users actually care about. =A0This will remain f=
or the
> + * moment. =A0Patches are welcome, of course.
> + */
> +#define EOF=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0(=
512)
> +

Try to make the comment match the definition, it still says the value is 25=
6.

	Arnd <><

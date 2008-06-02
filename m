Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K32ng-0008KZ-PY
	for linux-mtd@lists.infradead.org; Mon, 02 Jun 2008 05:41:45 +0000
Subject: Re: next 20080530: ubifs build errors
From: Artem Bityutskiy <dedekind@infradead.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
In-Reply-To: <20080530093147.cc1d389f.randy.dunlap@oracle.com>
References: <20080530093147.cc1d389f.randy.dunlap@oracle.com>
Content-Type: text/plain; charset=utf-8
Date: Mon, 02 Jun 2008 08:42:49 +0300
Message-Id: <1212385369.31023.147.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: akpm <akpm@linux-foundation.org>, linux-next@vger.kernel.org,
	linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2008-05-30 at 09:31 -0700, Randy Dunlap wrote:
> with:
> CONFIG_UBIFS_FS=3Dy
> # CONFIG_UBIFS_FS_XATTR is not set
> CONFIG_UBIFS_FS_ADVANCED_COMPR=3Dy
> # CONFIG_UBIFS_FS_LZO is not set
> # CONFIG_UBIFS_FS_ZLIB is not set
> # CONFIG_UBIFS_FS_DEBUG is not set
>=20
> build gets:
> fs/built-in.o: In function `compr_exit':
> compress.c:(.text+0x4a3fc): undefined reference to `crypto_free_tfm'
> fs/built-in.o: In function `compr_init':
> compress.c:(.init.text+0x11d4): undefined reference to `crypto_alloc_base=
'
> make[1]: *** [.tmp_vmlinux1] Error 1
>=20
>=20
> because CRYPTO is not enabled.

Fixed, pushed to the git tree, thank you!

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)

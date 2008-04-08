Received: from moutng.kundenserver.de ([212.227.126.177])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JjE5d-0004i6-KV
	for linux-mtd@lists.infradead.org; Tue, 08 Apr 2008 13:42:21 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: =?utf-8?q?J=C3=B6rn_Engel?= <joern@logfs.org>
Subject: Re: [patch 1/15] Makefiles and Kconfig
Date: Tue, 8 Apr 2008 15:41:59 +0200
References: <20080401181308.512473173@logfs.org>
	<200804080230.17426.arnd@arndb.de>
	<20080408083316.GA31262@logfs.org>
In-Reply-To: <20080408083316.GA31262@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200804081542.00333.arnd@arndb.de>
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

On Tuesday 08 April 2008, J=C3=B6rn Engel wrote:
> "Logfs file system" might make sense. =C2=A0LOGFS_FS is something I would
> rather avoid. =C2=A0For some reason my brain reacts strongly to repetitio=
n,
> redundancy and superfluous information.
>=20

How about LOG_FS then? I don't think there is a really good argument
either way, but a large majority uses the *_FS notation in Kconfig.

	Arnd <><

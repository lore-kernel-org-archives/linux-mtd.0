Received: from moutng.kundenserver.de ([212.227.126.179])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IIuY3-0004ck-Hu
	for linux-mtd@lists.infradead.org; Wed, 08 Aug 2007 19:02:48 -0400
From: Arnd Bergmann <arnd@arndb.de>
To: =?utf-8?q?J=C3=B6rn_Engel?= <joern@logfs.org>
Subject: Re: [Patch 16/18] fs/Kconfig
Date: Thu, 9 Aug 2007 01:01:26 +0200
References: <20070808161234.GB15319@lazybastard.org>
	<20070808162339.GR15319@lazybastard.org>
In-Reply-To: <20070808162339.GR15319@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200708090101.27226.arnd@arndb.de>
Cc: akpm@osdl.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-fsdevel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 08 August 2007, J=C3=B6rn Engel wrote:
> +config LOGFS
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool "Log Filesystem (EXPERIME=
NTAL)"
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0depends on MTD && BLOCK && EXP=
ERIMENTAL

The dependency on MTD _and_ BLOCK looks correct for your code, but
not necessary. How about making it=20

	depends on (MTD || BLOCK) && EXPERIMENTAL

and allowing to build without the mtd/bdev specific code?

	Arnd <><

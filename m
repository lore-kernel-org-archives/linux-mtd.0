Received: from moutng.kundenserver.de ([212.227.126.171])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IIuSz-0004Nf-Fl
	for linux-mtd@lists.infradead.org; Wed, 08 Aug 2007 18:57:26 -0400
From: Arnd Bergmann <arnd@arndb.de>
To: =?utf-8?q?J=C3=B6rn_Engel?= <joern@logfs.org>
Subject: Re: [Patch 02/18] include/linux/logfs.h
Date: Thu, 9 Aug 2007 00:56:29 +0200
References: <20070808161234.GB15319@lazybastard.org>
	<20070808161428.GD15319@lazybastard.org>
In-Reply-To: <20070808161428.GD15319@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200708090056.30350.arnd@arndb.de>
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
> +++ linux-2.6.21logfs/include/linux/logfs.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
2007-08-08 02:57:37.000000000 +0200
> @@ -0,0 +1,500 @@
> +/*
> + * fs/logfs/logfs.h
> + *

The comment does not match the file name. Better remove the file names
entirely from introduction comments.

	Arnd <><

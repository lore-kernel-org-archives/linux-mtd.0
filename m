Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CDEC61D97
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Nov 2023 12:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wNR6i4txltacSsA+Mrhpig1g4XUq+48Vm5AYElBorRM=; b=hZeiBRoU2VFdmwfOm/A2rFt1ta
	+enHbBgGO5hoPdcwFNouLOjq7bS8+iPWimJd5TpkrXT36pK1WAXX1EX7wB+fEpsYnbZDdYZ+lc9Pd
	Bb4YkdJSde0pphe3yuxG2hk0acb0GcQ4Bb8Ys4Y1JIJPvxuQi/FVn6TC3A0njRzveZC3oo0+d+HNg
	AXpM5BeU5k7RsPrh4u5ipeEFKEShCpXv1Uof0lVeVtA+p2TIpLABon23ggjHPyBLtXdeRF9PxJNgd
	t8DjdGwe5PW593L1lDuGBzKkYlJvcBERd64QNOqk6fezWSx9sqt35iUjmhuOSaMNyI/4mwdezKu5x
	G6zR9W6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6UvW-007A0Y-1C;
	Fri, 24 Nov 2023 12:04:54 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6UvR-0079yY-0q;
	Fri, 24 Nov 2023 12:04:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 0A61EB8301D;
	Fri, 24 Nov 2023 12:04:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C12FAC433C7;
	Fri, 24 Nov 2023 12:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700827484;
	bh=iYS7ANsuZ6vwOLgQk5XN795HJ5oXfHcHZNUjCJ6SXCw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ASSOqFUTTJHCjKWaYnDmAWOsdJx6xpTr/qPcu1HB+Fm5a/QclWrV0vncK2Q3Q7xX2
	 aCCX9KBbw2Az9X58fZvG86NOH/nrOeX7BVzsNXr5gajrQU9ziayJ62atPHT8DwDcCc
	 ahgZtb/ixwvuzDrehPu48aUVx6G2ccUCRb+KcZHUWGGyWnosZcOgffotJMEG6Q3zmg
	 BKh8HHr1sjhFvHUZ1Iby4sERa66rD1silvF54u1GkmzyyDomzoGyssBaqUowuIrSEm
	 G36HFkUDw4hjv0/b3iAj4rjrfH4/y0Ks3nDD/1Xr+xB/Qamv83b+9r9W6Jyz43KFdu
	 6MPuY/CW+rmPA==
Date: Fri, 24 Nov 2023 12:04:40 +0000
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Guo Ren <guoren@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Greg Ungerer <gerg@linux-m68k.org>, Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Geoff Levand <geoff@infradead.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, x86@kernel.org,
	Helge Deller <deller@gmx.de>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Timur Tabi <timur@kernel.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	David Woodhouse <dwmw2@infradead.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
	Kees Cook <keescook@chromium.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	netdev@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-bcachefs@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Aishwarya TCV <aishwarya.tcv@arm.com>
Subject: Re: [PATCH 15/22] arch: vdso: consolidate gettime prototypes
Message-ID: <ZWCRWArzbTYUjvon@finisterre.sirena.org.uk>
References: <20231108125843.3806765-1-arnd@kernel.org>
 <20231108125843.3806765-16-arnd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20231108125843.3806765-16-arnd@kernel.org>
X-Cookie: Am I in GRADUATE SCHOOL yet?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_040449_567656_E9AD16C4 
X-CRM114-Status: GOOD (  14.32  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1384630426745277802=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============1384630426745277802==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="woSdJmrFfLwaS8m2"
Content-Disposition: inline


--woSdJmrFfLwaS8m2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 08, 2023 at 01:58:36PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The VDSO functions are defined as globals in the kernel sources but inten=
ded
> to be called from userspace, so there is no need to declare them in a ker=
nel
> side header.

This is in -next as commit 42874e4eb35bdfc54f8514685e50434098ba4f6c and
breaks an arm64 defconfig build, the 32 bit vDSO build is broken:

/build/stage/linux/arch/arm64/kernel/vdso32/vgettimeofday.c:10:5: error: co=
nflic
ting types for =E2=80=98__vdso_clock_gettime=E2=80=99; have =E2=80=98int(cl=
ockid_t,  struct old_timespec
32 *)=E2=80=99 {aka =E2=80=98int(int,  struct old_timespec32 *)=E2=80=99}
   10 | int __vdso_clock_gettime(clockid_t clock,
      |     ^~~~~~~~~~~~~~~~~~~~
In file included from /build/stage/linux/arch/arm64/kernel/vdso32/vgettimeo=
fday.
c:8:
/build/stage/linux/include/vdso/gettime.h:16:5: note: previous declaration =
of =E2=80=98__vdso_clock_gettime=E2=80=99 with type =E2=80=98int(clockid_t,=
  struct __kernel_timespec *)=E2=80=99 {aka =E2=80=98int(int,  struct __ker=
nel_timespec *)=E2=80=99}
   16 | int __vdso_clock_gettime(clockid_t clock, struct __kernel_timespec =
*ts);
      |     ^~~~~~~~~~~~~~~~~~~~
/build/stage/linux/arch/arm64/kernel/vdso32/vgettimeofday.c:28:5: error: co=
nflicting types for =E2=80=98__vdso_clock_getres=E2=80=99; have =E2=80=98in=
t(clockid_t,  struct old_timespec32 *)=E2=80=99 {aka =E2=80=98int(int,  str=
uct old_timespec32 *)=E2=80=99}
   28 | int __vdso_clock_getres(clockid_t clock_id,
      |     ^~~~~~~~~~~~~~~~~~~
/build/stage/linux/include/vdso/gettime.h:15:5: note: previous declaration =
of =E2=80=98__vdso_clock_getres=E2=80=99 with type =E2=80=98int(clockid_t, =
 struct __kernel_timespec *)=E2=80=99 {aka =E2=80=98int(int,  struct __kern=
el_timespec *)=E2=80=99}
   15 | int __vdso_clock_getres(clockid_t clock, struct __kernel_timespec *=
res);
      |     ^~~~~~~~~~~~~~~~~~~

--woSdJmrFfLwaS8m2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVgkVgACgkQJNaLcl1U
h9Dz9gf/VMa1PvhU/bO1IxdTJVCJWAk44qPipqzqyUg2pLaBosU5v8Dx8eAPyIg0
DgxKA9Cycd3l3JSSqWIwJ1xEztqi2CvdmV5Ljrml8UqOvqHNPtg16JgCCOZ+Ssww
82B8fl93C3CmUtTLFx3u3lZRKd7FjyeOiiemekfHvdbZSOn+K6Dk9zvPAE63gI0I
5m6xp+q1eJ7Uyq7o4kCOnJOo/y9eDGX3lGqOsVQ7bnQAH6Id5y32aplMkStvzLKI
TrSlxBsnU/wry1msxEbcgmhN2YebA1wWGNC0j6fT4xg0MzuHevZwPTSm/2sK5Exc
fOQ/QL09MCXtNwNJ3QpItc8VaAFrVQ==
=sHT7
-----END PGP SIGNATURE-----

--woSdJmrFfLwaS8m2--


--===============1384630426745277802==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1384630426745277802==--


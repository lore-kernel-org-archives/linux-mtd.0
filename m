Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q75cQ-0003Y4-Ju
	for linux-mtd@lists.infradead.org; Tue, 05 Apr 2011 12:44:30 +0000
Received: by wwb39 with SMTP id 39so289736wwb.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 05 Apr 2011 05:44:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <d47b1aaa839631e454cbfeb14684ca851d941d43.1302002802.git.ext-andriy.shevchenko@nokia.com>
References: <38fa03e74a299568e73f69b03ffcacd5ee38b62b.1302002802.git.ext-andriy.shevchenko@nokia.com>
	<d47b1aaa839631e454cbfeb14684ca851d941d43.1302002802.git.ext-andriy.shevchenko@nokia.com>
Date: Tue, 5 Apr 2011 08:44:24 -0400
Message-ID: <BANLkTimsfEKUMGBAfyLoeqSQnB-6u-jWPw@mail.gmail.com>
Subject: Re: [PATCHv1 2/3] tests: build tests by default
From: Josh Boyer <jwboyer@gmail.com>
To: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 5, 2011 at 7:33 AM, Andy Shevchenko
<ext-andriy.shevchenko@nokia.com> wrote
>
> -install:: ${TARGETS} ${SCRIPTS}
> +install:: ${TARGETS} ${SCRIPTS} tests
> =A0 =A0 =A0 =A0mkdir -p ${DESTDIR}/${SBINDIR}
> =A0 =A0 =A0 =A0install -m 0755 ${TARGETS} ${SCRIPTS} ${DESTDIR}/${SBINDIR=
}/
> =A0 =A0 =A0 =A0mkdir -p ${DESTDIR}/${MANDIR}/man1
> diff --git a/tests/Makefile b/tests/Makefile
> new file mode 100644
> index 0000000..05b37e9
> --- /dev/null
> +++ b/tests/Makefile
> @@ -0,0 +1,8 @@
> +
> +SUBDIRS =3D checkfs fs-tests jittertest ubi-tests
> +
> +all clean tests: $(SUBDIRS)
> +
> +.PHONY: $(SUBDIRS)
> +$(SUBDIRS):
> + =A0 =A0 =A0 $(MAKE) -C $@ $(MAKECMDGOALS)

We don't want the tests installed by default, do we?  If we do for
some reason, it might be better to stick them in
/usr/libexec/mtd-utils/ or /usr/share/mtd-utils/ or something.  I
doubt we need them sitting in /usr/sbin,/sbin,/bin,/usr/bin on 99% of
the installs.

josh

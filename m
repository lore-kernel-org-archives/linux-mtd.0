Received: from smtp4-g21.free.fr ([212.27.42.4])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Q75nO-0003ny-Qx
	for linux-mtd@lists.infradead.org; Tue, 05 Apr 2011 12:55:51 +0000
From: Florian Fainelli <ffainelli@freebox.fr>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCHv1 2/3] tests: build tests by default
Date: Tue, 5 Apr 2011 14:57:06 +0200
References: <38fa03e74a299568e73f69b03ffcacd5ee38b62b.1302002802.git.ext-andriy.shevchenko@nokia.com>
	<d47b1aaa839631e454cbfeb14684ca851d941d43.1302002802.git.ext-andriy.shevchenko@nokia.com>
	<BANLkTimsfEKUMGBAfyLoeqSQnB-6u-jWPw@mail.gmail.com>
In-Reply-To: <BANLkTimsfEKUMGBAfyLoeqSQnB-6u-jWPw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201104051457.06706.ffainelli@freebox.fr>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Josh Boyer <jwboyer@gmail.com>,
	Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 05 April 2011 14:44:24 Josh Boyer wrote:
> On Tue, Apr 5, 2011 at 7:33 AM, Andy Shevchenko
> <ext-andriy.shevchenko@nokia.com> wrote
> 
> > -install:: ${TARGETS} ${SCRIPTS}
> > +install:: ${TARGETS} ${SCRIPTS} tests
> >        mkdir -p ${DESTDIR}/${SBINDIR}
> >        install -m 0755 ${TARGETS} ${SCRIPTS} ${DESTDIR}/${SBINDIR}/
> >        mkdir -p ${DESTDIR}/${MANDIR}/man1
> > diff --git a/tests/Makefile b/tests/Makefile
> > new file mode 100644
> > index 0000000..05b37e9
> > --- /dev/null
> > +++ b/tests/Makefile
> > @@ -0,0 +1,8 @@
> > +
> > +SUBDIRS = checkfs fs-tests jittertest ubi-tests
> > +
> > +all clean tests: $(SUBDIRS)
> > +
> > +.PHONY: $(SUBDIRS)
> > +$(SUBDIRS):
> > +       $(MAKE) -C $@ $(MAKECMDGOALS)
> 
> We don't want the tests installed by default, do we?  If we do for
> some reason, it might be better to stick them in
> /usr/libexec/mtd-utils/ or /usr/share/mtd-utils/ or something.  I
> doubt we need them sitting in /usr/sbin,/sbin,/bin,/usr/bin on 99% of
> the installs.

Most embedded distributions would prefer tests to be disabled by default.

If this is absolutely required, they should still be built as a separate Make 
target.
--
Florian

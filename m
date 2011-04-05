Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q75g8-0003fX-OI
	for linux-mtd@lists.infradead.org; Tue, 05 Apr 2011 12:48:20 +0000
Subject: Re: [PATCHv1 2/3] tests: build tests by default
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Josh Boyer <jwboyer@gmail.com>
In-Reply-To: <BANLkTimsfEKUMGBAfyLoeqSQnB-6u-jWPw@mail.gmail.com>
References: <38fa03e74a299568e73f69b03ffcacd5ee38b62b.1302002802.git.ext-andriy.shevchenko@nokia.com>
	<d47b1aaa839631e454cbfeb14684ca851d941d43.1302002802.git.ext-andriy.shevchenko@nokia.com>
	<BANLkTimsfEKUMGBAfyLoeqSQnB-6u-jWPw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 05 Apr 2011 15:45:22 +0300
Message-ID: <1302007522.2760.123.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org,
	Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-04-05 at 08:44 -0400, Josh Boyer wrote:
> On Tue, Apr 5, 2011 at 7:33 AM, Andy Shevchenko
> <ext-andriy.shevchenko@nokia.com> wrote
> >
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

I agree that installing tests should be a separate option.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

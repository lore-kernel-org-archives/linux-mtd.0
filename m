Received: from [218.4.236.5] (helo=bqc-fe03.BQC.CORP.COM)
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QC6vJ-0003a8-Ik
	for linux-mtd@lists.infradead.org; Tue, 19 Apr 2011 09:08:42 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
Subject: RE: Question about nand tests
Date: Tue, 19 Apr 2011 17:08:38 +0800
Message-ID: <33579C238B096249ADEFFC942E9C396301BA2C57@guru-msv.BQC.CORP.COM>
In-Reply-To: <1303203648.2779.6.camel@localhost>
References: <33579C238B096249ADEFFC942E9C396301BA2C52@guru-msv.BQC.CORP.COM>
	<4DAD4EF1.5040305@nokia.com> <1303203648.2779.6.camel@localhost>
From: "Ryan Liu" <RyanLiu@BENQ.com>
To: <dedekind1@gmail.com>,
	"Adrian Hunter" <adrian.hunter@nokia.com>
Cc: linux-mtd Mailing List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


thanks, I'll look into it=20

-----Original Message-----
From: Artem Bityutskiy [mailto:dedekind1@gmail.com]=20
Sent: Tuesday, April 19, 2011 5:01 PM
To: Adrian Hunter
Cc: Ryan Liu; linux-mtd Mailing List
Subject: Re: Question about nand tests

On Tue, 2011-04-19 at 11:59 +0300, Adrian Hunter wrote:
> > I download nand-tests-f9f10b8.tar.gz from=20
> > http://git.infradead.org/users/ahunter/nand-tests.git first, and=20
> > modify KERNEL_PATH in the Makefile.
>=20
> Those tests are out of date.  The uptodate tests are in the kernel=20
> itself, in drivers/mtd/tests

Yes, they are upstream:

http://www.linux-mtd.infradead.org/doc/general.html#L_mtd_tests

--
Best Regards,
Artem Bityutskiy (=E1=D2=D4=A3=CD =E2=C9=D4=C0=C3=CB=C9=CA)

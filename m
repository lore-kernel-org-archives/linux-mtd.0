Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QC6qW-0003Ws-Ll
	for linux-mtd@lists.infradead.org; Tue, 19 Apr 2011 09:03:45 +0000
Received: by bwz1 with SMTP id 1so5634304bwz.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 19 Apr 2011 02:03:41 -0700 (PDT)
Subject: Re: Question about nand tests
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
In-Reply-To: <4DAD4EF1.5040305@nokia.com>
References: <33579C238B096249ADEFFC942E9C396301BA2C52@guru-msv.BQC.CORP.COM>
	<4DAD4EF1.5040305@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 19 Apr 2011 12:00:48 +0300
Message-ID: <1303203648.2779.6.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd Mailing List <linux-mtd@lists.infradead.org>,
	Ryan Liu <RyanLiu@BENQ.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-04-19 at 11:59 +0300, Adrian Hunter wrote:
> > I download nand-tests-f9f10b8.tar.gz from
> > http://git.infradead.org/users/ahunter/nand-tests.git first, and modify
> > KERNEL_PATH in the Makefile.
> 
> Those tests are out of date.  The uptodate tests are in the kernel itself,
> in drivers/mtd/tests

Yes, they are upstream:

http://www.linux-mtd.infradead.org/doc/general.html#L_mtd_tests

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

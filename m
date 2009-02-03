Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LUJab-0006p0-Pb
	for linux-mtd@lists.infradead.org; Tue, 03 Feb 2009 11:37:16 +0000
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LUJaZ-0004Vf-Cg
	for linux-mtd@lists.infradead.org; Tue, 03 Feb 2009 11:37:11 +0000
Received: from gw-c.sigma-chemnitz.de ([62.153.82.26])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 03 Feb 2009 11:37:11 +0000
Received: from enrico.scholz by gw-c.sigma-chemnitz.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 03 Feb 2009 11:37:11 +0000
To: linux-mtd@lists.infradead.org
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: Regarding UBI scalability
Date: Tue, 03 Feb 2009 12:27:30 +0100
Message-ID: <ly7i47iwv1.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <31956721.196931233319535527.JavaMail.weblogic@epml10>
	<1233567078.7085.62.camel@localhost.localdomain>
	<618F1BB69C6C43C895C260C527C4F159@sisodomain.com>
	<4986D3F6.5030208@nokia.com>
	<1233572259.7085.64.camel@localhost.localdomain>
	<4986D677.3020500@nokia.com>
	<71cd59b00902021544w594d4acandc0183bc523aafb0@mail.gmail.com>
	<6b5362aa0902030235t4175ec11re9b6335df558e6a@mail.gmail.com>
	<1233658130.24809.107.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy <dedekind@infradead.org> writes:

> For UBI2 I would just forget about static volumes support. They
> are not so necessary, and a rare user needs them

I store my kernel, the 2nd level bootloader and bootenv in such
volumes.  Having the number of used bytes available without
introducing special storage formats simplifies things in the
initial bootloader and when writing images into the volumes.

This is nothing which can not be changed, but static volumes are
not a rare needs imo.


Enrico

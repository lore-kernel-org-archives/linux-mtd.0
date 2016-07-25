Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bRhQ5-0006vz-ER
 for linux-mtd@lists.infradead.org; Mon, 25 Jul 2016 15:03:50 +0000
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: richard@nod.at,
	computersforpeace@gmail.com
Subject: mtd-utils: Swtich to autotools based build system
Date: Mon, 25 Jul 2016 17:02:29 +0200
Message-Id: <20160725150234.5276-1-david.oberhollenzer@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch series is based on Richards RFC to replace the hand
written Makefiles with an autoconf/automake based build system
to gain all the advantages of having an _actual_ build system
that is high level, widely used, well known and mature/stable.

Switching to the GNU buildsystem should make it a lot easier for
people to [cross] compile the mtd-utils and integrating them into
existing, automated [cross] build toolchains, as the autotools are
very widely used/known, effectively representing a pseudo-standard
that people are familiar with and that a lot of tools have been
adapted to.

The GNU build system also had a few more decades time and a _lot_
more testing to mature in regards to cross compilation setups and
toolchains than the previous mtd-utils build system that would have
to be further supported and maintained in its entirety.

The proposed autotools based build system should also be easier to
maintain than a hurdle of makefiles. The automake files are more
high level and only contain a list of input files for each program.
Generating the makefiles with precise dependencies and build steps
is done by the build system.

Furthermore, files like the test scripts can fairly easily be
processed with autoconf at compile time to (for instance) replace
file locations with the actual path where a program is configured
to be installed.

Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bV0Rv-0000d5-91
 for linux-mtd@lists.infradead.org; Wed, 03 Aug 2016 17:59:24 +0000
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: richard@nod.at, computersforpeace@gmail.com,
 thomas.petazzoni@free-electrons.com, gustavo@zacarias.com.ar,
 otavio@debian.org, riku.voipio@linaro.org, pascal.bleser@opensuse.org,
 mpluskal@suse.com, dwmw2@infradead.org
Subject: [PATCH v2] mtd-utils: Swtich to autotools based build system
Date: Wed,  3 Aug 2016 19:57:10 +0200
Message-Id: <20160803175715.1171-1-david.oberhollenzer@sigma-star.at>
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


Changes from version 1:
 - Add files missing in distribution bundle to automake file
 - In make_a_release.sh: Create output directory if it doesn't exists
 - Fix various typos/copy-paste-fails in comments and help string
 - Fix --without-xattr switch ($enableval was used instead of $withval)


The following tests have been successfully performed:
 - Use make_a_release to create a release tar ball
 - Unpack and compile on Arch Linux, x86_64
 - Unpack and compile on Debian Wheezy 7.11, x86
 - Unpack and compile on CentOS 7, x86_64
 - Unpack and cross compile on Arch Linux x86_64 for arm-linux-gnueabihf
 - Run cross built binaries on ARM board with Debian Wheezy 7.5 armhf

You can find the whole series on:
https://github.com/sigma-star/mtd-utils.git autoconf_03082016


Thanks,

David

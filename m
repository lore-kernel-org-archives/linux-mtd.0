Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bSsUj-0007YV-DH
 for linux-mtd@lists.infradead.org; Thu, 28 Jul 2016 21:05:30 +0000
Subject: Re: mtd-utils: Swtich to autotools based build system
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
 linux-mtd@lists.infradead.org
References: <20160725150234.5276-1-david.oberhollenzer@sigma-star.at>
Cc: computersforpeace@gmail.com,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 gustavo@zacarias.com.ar, otavio@debian.org, riku.voipio@linaro.org,
 pascal.bleser@opensuse.org, mpluskal@suse.com,
 David Woodhouse <dwmw2@infradead.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <579A737A.6090308@nod.at>
Date: Thu, 28 Jul 2016 23:04:58 +0200
MIME-Version: 1.0
In-Reply-To: <20160725150234.5276-1-david.oberhollenzer@sigma-star.at>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

Am 25.07.2016 um 17:02 schrieb David Oberhollenzer:
> This patch series is based on Richards RFC to replace the hand
> written Makefiles with an autoconf/automake based build system
> to gain all the advantages of having an _actual_ build system
> that is high level, widely used, well known and mature/stable.
> 
> Switching to the GNU buildsystem should make it a lot easier for
> people to [cross] compile the mtd-utils and integrating them into
> existing, automated [cross] build toolchains, as the autotools are
> very widely used/known, effectively representing a pseudo-standard
> that people are familiar with and that a lot of tools have been
> adapted to.
> 
> The GNU build system also had a few more decades time and a _lot_
> more testing to mature in regards to cross compilation setups and
> toolchains than the previous mtd-utils build system that would have
> to be further supported and maintained in its entirety.
> 
> The proposed autotools based build system should also be easier to
> maintain than a hurdle of makefiles. The automake files are more
> high level and only contain a list of input files for each program.
> Generating the makefiles with precise dependencies and build steps
> is done by the build system.
> 
> Furthermore, files like the test scripts can fairly easily be
> processed with autoconf at compile time to (for instance) replace
> file locations with the actual path where a program is configured
> to be installed.

Let's ask also package maintainers for their opinion.
They have to (cross)build and package mtd-utils. :-)

You can find the whole series on:
https://github.com/sigma-star/mtd-utils.git autoconf_25072016

Thanks,
//richard

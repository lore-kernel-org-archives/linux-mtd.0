Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bT3xQ-0002KP-NN
 for linux-mtd@lists.infradead.org; Fri, 29 Jul 2016 09:19:53 +0000
Message-ID: <1469783966.24141.8.camel@suse.cz>
Subject: Re: mtd-utils: Swtich to autotools based build system
From: Martin Pluskal <mpluskal@suse.cz>
To: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: otavio@debian.org, Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>,  computersforpeace@gmail.com, David
 Woodhouse <dwmw2@infradead.org>,  riku.voipio@linaro.org,
 pascal.bleser@opensuse.org, gustavo@zacarias.com.ar
Date: Fri, 29 Jul 2016 11:19:26 +0200
In-Reply-To: <579A737A.6090308@nod.at>
References: <20160725150234.5276-1-david.oberhollenzer@sigma-star.at>
 <579A737A.6090308@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

On Thu, 2016-07-28 at 23:04 +0200, Richard Weinberger wrote:
> Hi!
> 
> Am 25.07.2016 um 17:02 schrieb David Oberhollenzer:
> > 
> > This patch series is based on Richards RFC to replace the hand
> > written Makefiles with an autoconf/automake based build system
> > to gain all the advantages of having an _actual_ build system
> > that is high level, widely used, well known and mature/stable.
> > 
> > Switching to the GNU buildsystem should make it a lot easier for
> > people to [cross] compile the mtd-utils and integrating them into
> > existing, automated [cross] build toolchains, as the autotools are
> > very widely used/known, effectively representing a pseudo-standard
> > that people are familiar with and that a lot of tools have been
> > adapted to.
> > 
> > The GNU build system also had a few more decades time and a _lot_
> > more testing to mature in regards to cross compilation setups and
> > toolchains than the previous mtd-utils build system that would have
> > to be further supported and maintained in its entirety.
> > 
> > The proposed autotools based build system should also be easier to
> > maintain than a hurdle of makefiles. The automake files are more
> > high level and only contain a list of input files for each program.
> > Generating the makefiles with precise dependencies and build steps
> > is done by the build system.
> > 
> > Furthermore, files like the test scripts can fairly easily be
> > processed with autoconf at compile time to (for instance) replace
> > file locations with the actual path where a program is configured
> > to be installed.
> 
> Let's ask also package maintainers for their opinion.
> They have to (cross)build and package mtd-utils. :-)
> 
> You can find the whole series on:
> https://github.com/sigma-star/mtd-utils.git autoconf_25072016
> 
> Thanks,
> //richard
> 
Hello

definitely autotools - issue with custom makefiles is that they often
ignore conventions, when trying to enforce distribution specific things
one has to go through them, in case of mtd-utils for openSUSE [1], to
use distribution specific flags and have verbose build following has to
be done:
make CC="cc %{optflags}" V=1

Cheers

Martin

1. https://build.opensuse.org/package/view_file/openSUSE:Factory/mtd-ut
ils/mtd-utils.spec?expand=1
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXmx+eAAoJEFskXWf93mhXAM0P/RNKUZGyGwK0tB9lZqItAWse
HKYwuEH0ASceNIkY1oaCxo+s2JAR00wP4wv2woSp6NdYDa9RALEtlH4xWatPhq/D
tcQk5Tvu0awucAyL/gaVY39vryn5cx6cJKGXkSW9y6xs6N280H4ouvnFUPvR0E+w
HkdKRlSxbXVy1qT+uOGsXJs5yGmMMRkgC4Lavd8imm+62om4jWUl5iVaV+alNaT+
sj9i0neiIVnMg7d2whwqrwJkRJO5uLWiWq1SBlkoU+6cHSd4lQms0VXwwBOtyecR
AXmvFHRbQp2wRUI1IsucejNCP5XDv1P5SiutEZ5Y+DB7iV2+NHOV5J2MTJd7wQ67
etocM837+YUDNws9l26wGvi4TKtXZ42n+4JvWGVeigDRubidwT+9cE1Tpg7U6xjs
WB/yNIY0Th3QH8bzP18Y+67dqSrF1nlLK8jyO530siYxho5iB7fg4ynAho/gI/dy
flVAy4jCImbAGIRAqGb+6xro+vsQR+HPBoja+RWK5sxwOV55ZDQVPxtiarpPA0by
vDsEdPWx1qB/5U3qrAPeS3/Mzcli2I2q0niLwaDtRrg8WblvcI6TXeCwpQTJZw/b
i2cDl852M8S3k5Xryxg3N8nFsePqm9FuKCie5AW5ijEXEVWOL5BdyC5PGwUKZ6hk
ddCdKMPsC+ULf9AktNfi
=0rQu
-----END PGP SIGNATURE-----

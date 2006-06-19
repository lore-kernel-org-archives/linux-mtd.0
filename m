Received: from e4.ny.us.ibm.com ([32.97.182.144])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FsIqs-0007Et-1P
	for linux-mtd@lists.infradead.org; Mon, 19 Jun 2006 08:27:39 -0400
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e4.ny.us.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5JCRTM9016656
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <linux-mtd@lists.infradead.org>; Mon, 19 Jun 2006 08:27:29 -0400
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
	by d01relay02.pok.ibm.com (8.13.6/NCO/VER7.0) with ESMTP id
	k5JCRTJn271746
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>; Mon, 19 Jun 2006 08:27:29 -0400
Received: from d01av01.pok.ibm.com (loopback [127.0.0.1])
	by d01av01.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	k5JCRSv4023900
	for <linux-mtd@lists.infradead.org>; Mon, 19 Jun 2006 08:27:28 -0400
Subject: Re: [UBI] Remove autotools from ubi-utils
From: Frank Haverkamp <haver@vnet.ibm.com>
To: Josh Boyer <jwboyer@gmail.com>
In-Reply-To: <625fc13d0606142102j46277f81gf45a6bf784dc6c90@mail.gmail.com>
References: <625fc13d0606142102j46277f81gf45a6bf784dc6c90@mail.gmail.com>
Content-Type: text/plain
Date: Mon, 19 Jun 2006 14:27:26 +0200
Message-Id: <1150720046.6087.34.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Linux-MTD Mailing List <linux-mtd@lists.infradead.org>
Reply-To: haver@vnet.ibm.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Josh,

On Wed, 2006-06-14 at 23:02 -0500, Josh Boyer wrote:
> Hi,
> 
> Take a look at the 'haver' branch of my mtd-utils tree.  It contains
> the ubi-tools import that Frank did, and the start of removing the
> autotools crap from them.
> 
> http://git.infradead.org/?p=users/jwboyer/mtd-utils;a=shortlog;h=haver
> 
> Next step would be to finish the standalone Makefiles, then add a
> couple toplevel Makefiles so that the ubi tools get built with the
> rest of the mtd-utils.
> 
> If this isn't the direction that people want to go with this, that's
> fine.  But until someone comes up with something better, it's a start.
> 
> I'll be out of town for the next few days, so responses will be limited.
> 
> josh

I saw your patches and figured that we should discuss an overall
strategy, what we want to do in which fashion. When Oliver started the
change to automake he had in mind, that he needed to provide libraries
for our users. So he made libraries for everything. Some of the utils
share the same libs. Finally (if you look at the configuration) the idea
with the shared libs did not fully work out. I had to change some apps
to be statically linked to get properly working binaries (automake
produced bash scripts and a .bin/... directory which was not what I
wanted). Olli was not there anymore and I did not took the time to
investigate if this could have been solved differently.

Now since you proposed to remove automake stuff and I do not
know how to maintain it, I agree with you that we should replace it
by something easier looking and better maintainable.

When looking at it, I would assume that we should take care that the
following stuff is resulting from the build:

Tools:
* ubimkvol
* ubirmvol
* ubiwritevol - Artem liked the name ubiupdatevol better
* mkpfi
* ubimirror
* nand2bin
* mkpfi
* pfiflash
* pfi2bin
* ubigen
* unubi
* pddcustomize
* mkbootenv

Libraries (or linked into the apps?):
* libubi

I wonder where we put ECC and CRC, error printout logic? We can link the
object files to the applications, or put them in a library, whatever. I
think the code is very very small, so linking it into the apps has the
advantage that we would not have to tweak library paths which I consider
to be a big evil.

My opinion is that we probably want to push all src into one directory 
and the interface .h also in one. The non interface .hs we should put in
the src directory too. What the makefile is concerned about I would
prefer only one if possible, if we can somehow manage to be simple
enough. Or multiple small ones including some reasonable Rules.mk files.

Artem wanted to beautify libubi, but that is something different.

Let us discuss tomorrow how we want to continue.

Frank

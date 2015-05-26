Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YxHjV-00067O-LA
 for linux-mtd@lists.infradead.org; Tue, 26 May 2015 16:29:41 +0000
Message-ID: <55649F58.5000101@nod.at>
Date: Tue, 26 May 2015 18:29:12 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Johannes Bauer <weolanwaybqm@spornkuller.de>,
 "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>
Subject: Re: Wear-leveling peculiarities
References: <5b9c6106e355c0a676481e1de95ad15c@joe.dyn.spornkuller.de>
 <55f052b8b8f65bf34b0ed9f20b4f2f07@joe.dyn.spornkuller.de>
 <CAFLxGvxQeeA8dk7DY6ZcsAm0WBch7c6gOn92gUZB138B6bfeGA@mail.gmail.com>
 <555A4D38.3070702@spornkuller.de> <555A4FFB.5040006@nod.at>
 <f0e983ad35f8be37ef51686615017016@joe.dyn.spornkuller.de>
 <5564460D.6010209@nod.at>
 <fa1a37d3deb8876079963af7ddc0ff25@joe.dyn.spornkuller.de>
 <0D23F1ECC880A74392D56535BCADD7357DEC6820@NTXBOIMBX03.micron.com>
 <b4b8ec63f4b8f638a2eee4f029e4309e@joe.dyn.spornkuller.de>
In-Reply-To: <b4b8ec63f4b8f638a2eee4f029e4309e@joe.dyn.spornkuller.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 26.05.2015 um 18:24 schrieb Johannes Bauer:
> Hi Jeff,
> 
> Am 26.05.2015 18:19, schrieb Jeff Lauruhn (jlauruhn):
>> If the part is ONFI compliant you can always dump the parameter page
>> and any information you need.
> 
> This sounds very much like something I'd like to do... only that I have no clue how :-) Any hints?

Read nand_base.c it does all NAND probing.
I'd start with a plain NAND_CMD_READID.

Thanks,
//richard

Received: from smtp.newsguy.com ([74.209.136.69])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RPfEB-0007DY-ER
 for linux-mtd@lists.infradead.org; Sun, 13 Nov 2011 18:56:28 +0000
Message-ID: <4EC020A2.9070003@newsguy.com>
Date: Sun, 13 Nov 2011 11:55:14 -0800
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v2 07/16] mtd/docg3: add OOB layout to mtdinfo
References: <1320912342-30147-1-git-send-email-robert.jarzmik@free.fr>	<1320912342-30147-8-git-send-email-robert.jarzmik@free.fr>	<4EBECB89.2020102@newsguy.com>
 <87vcqoiavr.fsf@free.fr>	<1321188825.2273.4.camel@koala>	<1321189398.2021.5.camel@shinybook.infradead.org>	<1321191352.2273.14.camel@koala>
 <87ehxchta0.fsf@free.fr>
In-Reply-To: <87ehxchta0.fsf@free.fr>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Ivan Djelic <ivan.djelic@parrot.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/13/2011 08:38 AM, Robert Jarzmik wrote:
>
> And while we're discussing MTD API, I'd like to add another thing I was thinking
> of, from a conversation Mike and Ivan had.
>
> They discussed how UBIFS is "intolerant" to bitflips, and marks a block as
> "unusable" if one bitflip occured, even if the ECC can fix much more.
>
> What I was thinking is that the MTD oob information which exposes how many ECC
> are available should expose as well how many bitflips can be fixed (for example
> 4 bitflips can be fixed, 5 bitflips can be detected). 


You're referring to struct nand_ecclayout?  I wouldn't think that would be the
appropriate place; it just describes the layout, not operational details.


> Then, the read_oob()
> function could return back 0 if read was successful, -Exxxx on error, or a
> positive number N if N bitflips were fixed.
> With this information, upper level could decide from (read_oob() return and
> ecc.fixable_bitflips) if a block should be marked as unusable (worn out) or not.


Something along these lines was suggested by Artem a few days ago:

http://lists.infradead.org/pipermail/linux-mtd/2011-November/038376.html

I'm looking into implementing this.  Currently the drivers return -EUCLEAN from
read() and read_oob() if *any* bit error corrections were made, and this is the
information used by ubi to determine whether to scrub, and also whether to mark
a block as "bad" after running the PEB torture test.  To summarize Artem's
suggestion in my own words... The drivers expose the ecc strength to the mtd
subsystem (as Robert also suggests).  Mtd assigns a "scrublevel" to the device,
settable by the user through sysfs, with ecc strength as the default.  Read
operations no longer go directly to the driver (as they currently do for
unpartitioned devices) but are handled in mtd.  The driver returns the corrected
error count to mtd, which makes the determination of whether to return -EUCLEAN
or 0, based on the number of corrected errors and the scrublevel.

An objection might be that mtd should not be setting policy.  It's also a fairly
sizeable modification.  The alternative would be to implement a mechanism to
return the corrected error count to the higher layer (e.g., ubi) for each read
operation.  This would be even more work, requiring modifications to mtd and ubi.

I'd like to work to resolve this either way, as ubi and ubifs are the killer
apps for these new drivers.

Thanks,
Mike

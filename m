Received: from smtp.newsguy.com ([74.209.136.69])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1REB0G-0000hc-QZ
	for linux-mtd@lists.infradead.org; Thu, 13 Oct 2011 02:26:38 +0000
Message-ID: <4E964C2F.9040608@newsguy.com>
Date: Wed, 12 Oct 2011 19:25:51 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH] Add driver for M-sys / Sandisk diskonchip G4 nand flash
References: <1318258091-12670-1-git-send-email-mikedunn@newsguy.com>	<8762jtlx19.fsf@free.fr>
	<201110130226.38567.marek.vasut@gmail.com>
In-Reply-To: <201110130226.38567.marek.vasut@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/12/2011 05:26 PM, Marek Vasut wrote:
> On Wednesday, October 12, 2011 11:28:34 PM Robert Jarzmik wrote:
>> Mike Dunn <mikedunn@newsguy.com> writes:
>>> This is a driver for the diskonchip G4 in my Palm Treo680.  I've tested
>>> it fairly well; it passes the nandtest utility, and I've been able to
>>> create a ubifs using it.
> Hi Robert,
> I had a look at your driver, to see how close it was to the docg3 I
>>
>>  - docg4 doesn't need to write to an "address register" before reading some
>>  random register (ie. between io+0x1000 and io+0x1800), docg3 needs it
> This can be done on both ...

Is that right?  I haven't tried writing it on the G4.  The TrueFFS library never
writes it on the G4, so I didn't.  I called it the "read-enable" register on the
P3.  "Address register" is probably more accurate.

> See above ... you can determine if it's G3 or G4 by version register iirc ?

Correct.  They both have ID registers.
>>  - some read/write sequences are different, with different registers, and
>> with additionnal reads in your case (ie. the MYSTERY register for
>> example).
> This can be done on G3 too?

Sequences are very different.  And G4 has quirks like registers that have to be
written twice in succession with the same value.  And the number of nops between
reads may be important.

>
> Definitelly looking forward to this too. I can try on PalmT5 if you like, it 
> SHOULD have a G3.

According to the link to the old hh.org page you sent me, it does.

As far as combining drivers goes, basically all the low-level stuff will be
different.  There would have to be separate functions for the register
interactions; e.g., what I called read_page_prologue() and Robert called
read_page_prepare().  What could (and probably should) be similiar is the
integration with the mtd nand infrastructure code.  This is messy, due to the
fact that all the DOC devices have a proprietary controller that does not
comport to the standard nand commands that the mtd code expects.  That may be a
good reason to try to combine them.  My feeling is that we should develop in
tandem, and strive to converge structurally.  Then we can maybe take a look at
combining if it makes sense.  Right now we're at different points of
development, with original work done in isolation, and I think we'd only be
getting in each others' way and confusing things.

Mike

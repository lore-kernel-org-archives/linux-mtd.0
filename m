Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WTWKd-0004Na-Qq
 for linux-mtd@lists.infradead.org; Fri, 28 Mar 2014 12:56:24 +0000
Date: Fri, 28 Mar 2014 13:56:00 +0100
From: Gerhard Sittig <gsi@denx.de>
To: David Mosberger <davidm@egauge.net>
Subject: Re: [PATCH] mtd: nand: Add support for Micron on-die ECC controller
 (rev2).
Message-ID: <20140328125600.GC3998@book.gsilab.sittig.org>
References: <1395875121-9320-1-git-send-email-davidm@egauge.net>
 <20980858CB6D3A4BAE95CA194937D5E73EAB5F84@DBDE04.ent.ti.com>
 <20140327112722.GQ3998@book.gsilab.sittig.org>
 <CALnQHM0PkQUQk0uYGBL3TwgWaComHfZNBxu1e45_FJK2i+TrbA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALnQHM0PkQUQk0uYGBL3TwgWaComHfZNBxu1e45_FJK2i+TrbA@mail.gmail.com>
Cc: "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2014-03-27 at 13:28 -0600, David Mosberger wrote:
> 
> On Thu, Mar 27, 2014 at 5:27 AM, Gerhard Sittig <gsi@denx.de> wrote:
> 
> > I was wondering, have you seen an explicit discussion of how many
> > data bytes to read and to write in read and program requests?  I
> > missed this in the datasheet, neither found it in TN-29-56, but
> > just might have been blind ...
> 
> Sorry, I'm not sure I understand the question.  Let me know if this doesn't
> answer your question: the way those chips work is that when you issue a
> READ command, the entire page gets transferred and ECC applied.
> After that, you can transfer bytes from the read buffer at will (even
> randomly).

It's the answer to one half of what I wondered. :)

Upon read, the chip does ECC detection and correction in
transparent ways.  So you probably just fetch the status and the
page's content (the writesize count), omitting the OOB area.
What would you get when you keep reading after the page size?
Probably the OOB area.  Is it required to read this as well, to
have it around in the write case?

Upon write, you certainly have to send the page content, i.e. a
stream of bytes with a count of the page's payload size.  But I
would not be certain whether you have to send the OOB area as
well.  Even if the chip will create and store ECC data by itself,
I could not find whether you have to "clock those bytes in" to
trigger the in-chip operation, too.  Am I overly paranoid?  Am I
talking nonsense? :)  There must have been a reason for the
introduction of the "oob_required" condition -- I just understood
it was other MLC chips, not the on-die-ECC that we are talking
about here.

But _if_ you have to send the OOB data upon write, most probably
you have to read this area as well, to pass back those data bytes
within OOB that are not ECC, or else you risk losing mgmt data.

Yes, I'm aware of the READ_OOB "pseudo command", which does a
read operation yet implies a specific offset within the cache,
i.e. it "forwards the read pointer".  This is used in a different
context, as is the raw operation.


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de

Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WTW8K-00041l-J6
 for linux-mtd@lists.infradead.org; Fri, 28 Mar 2014 12:43:41 +0000
Date: Fri, 28 Mar 2014 13:43:13 +0100
From: Gerhard Sittig <gsi@denx.de>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH] mtd: nand: Add support for Micron on-die ECC controller
 (rev2).
Message-ID: <20140328124313.GB3998@book.gsilab.sittig.org>
References: <1395875121-9320-1-git-send-email-davidm@egauge.net>
 <20980858CB6D3A4BAE95CA194937D5E73EAB5F84@DBDE04.ent.ti.com>
 <20140327112722.GQ3998@book.gsilab.sittig.org>
 <20980858CB6D3A4BAE95CA194937D5E73EAB9500@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EAB9500@DBDE04.ent.ti.com>
Cc: David Mosberger <davidm@egauge.net>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2014-03-28 at 08:37 +0000, Gupta, Pekon wrote:
> 
> >From: Gerhard Sittig [mailto:gsi@denx.de]
> 
> [...]
> 
> >AFAIU the sequence of commands which the NAND chip requires
> >doesn't quite map to the sequence of what the MTD layer does
> >(emit the read command, read the data, optionally check ECC)
> >
> >when "on die ECC" is enabled, the chip requires a sequence of
> >- read page command (READ0, addresses, READSTART)
> >- status check (mandatory! cmd 70, to check FAIL and REWRITE bits)
> >- re-enter data read mode (READ0, _without_ addresses and START)
> >- fetch data bytes
> >
> I checked Micron Datasheet for "MT29F4G16ABADAWP by name
> "m60a_4gb_8gb_16gb_ecc_nand.pdf" and on its 
> "Figure 39: READ PAGE (00h-30h) Operation with Internal ECC Enabled"
> There is no mention of above third step.
> 
> As per the "figure 39" a READ_PAGE Operation with internal ECC enabled
> requires following sequence..
> - [00h] <address> <address> ... <address> [30h]  /* READ_PAGE command */
> - [70h] <status> [00h]        /* READ_STATUS command */
> And after that data comes our serial on the bus. So in that case you can

They cheat. :)  You'll only notice when you look closely, I
misread this stuff too at first.  The Micron datasheet uses
different terms than the MTD implementation in Linux does.

Their "READ_PAGE" command, referred to as 00-30, actually is in
Linux the "READ0 command (0x00) and READSTART command (0x30)"
sequence.  (I'd like to see them as sequences or aggregates of
existing commands, instead of even more commands that happen to
re-use other command's opcodes, which I feel is confusing.)

The above "70 status 00" actually is "STATUS (command 70 and a
status byte) plus READ0 (command 00)".  Not re-emitting the READ0
(this time without the addresses and READSTART) would make you
fetch more status bytes instead of the cached data bytes.

So you will find everything that is done in the implementation,
it's just that you have to "translate" between the perspectives.
That's OK, Linux is not the reference, but one has to remain
aware of this difference.


It's nice to see that apparently the "regular read with
subsequent ECC check" can be done, too.  With an option for
another "raw read and bit flip counting" should errors have
occured.


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de

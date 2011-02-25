Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pst6a-00024C-UN
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2011 08:32:53 +0000
Received: by wyf23 with SMTP id 23so1431843wyf.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 25 Feb 2011 00:32:51 -0800 (PST)
Subject: Re: CONFIG_MTD_NAND_VERIFY_WRITE with Software ECC
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Peverley <pev@sketchymonkey.com>
In-Reply-To: <AANLkTimS2Dqn9W+1zMsb=wgQAPKZaPZ+UePUmAGbQLCz@mail.gmail.com>
References: <AANLkTikWMGSCzGdPUBgtZKY2F6=pZ=6X+p7LUUmuKhp+@mail.gmail.com>
	<Pine.LNX.4.64.1102151355160.2784@lnxricardw.se.axis.com>
	<AANLkTimS2Dqn9W+1zMsb=wgQAPKZaPZ+UePUmAGbQLCz@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 25 Feb 2011 10:31:27 +0200
Message-ID: <1298622687.2798.7.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Ricard Wanderlof <ricard.wanderlof@axis.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tue, 2011-02-15 at 14:00 +0000, David Peverley wrote:
> From the description of read disturb, it occurs due to many reads
> (hundreds of thousands or millions) prior to an erase. Currently my
> testing is using nandtestc.c and mtd_stresstest.ko - the former tests
> one cycle before re-programming and the latter is random but not
> expected to be more than tens of reads before a re-programme becomes
> statistically likely. Potentially program disturb sounds like it
> _could_ be the behaviour I observe but it's not clear.

If you verify the page just after you have programmed it, then program
disturb is out of the picture. AFAIK, program disturb is about
"disturbing" other NAND pages while programming.

> My general take on this is that only the permanent type failures i.e.
> those involving permanently stuck bits, require marking as bad blocks.
> The recovery recommended for the other scenarios is always to erase
> and re-programme. This potentially opens up a whole can of worms... My
> interpretation of this is that if we verify a write and we've had a
> (correctable and non-permanent) single bit error the Right Thing To Do
> would be to erase and re-programme the block, probably with a very
> small retry limit. We could argue that it's the responsibility of the
> file-system to do this but programatically I think nand_write_page()
> is best placed to be able to do this.

Yeah, UBI does this for example. If we program an eraseblock, and we get
and error while writing a NAND page, we try to recover:

1. We pick another eraseblock.
2. We move the data from the faulty eraseblock to the new one.
3. We erase and torture the faulty eraseblock.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

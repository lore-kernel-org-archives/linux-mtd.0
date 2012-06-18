Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SggEY-0006iB-2y
 for linux-mtd@lists.infradead.org; Mon, 18 Jun 2012 17:59:27 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: dedekind1@gmail.com
Subject: Re: [PATCH] mtd: nand: Use the mirror BBT descriptor when reading its
 version
References: <20120610135812.01dce4e7@pixies.home.jungo.com>
 <CAN8TOE_Li5bysfUS_MPPaBOF-vC64s3j-feTqfUJQsR6c_yb+A@mail.gmail.com>
 <1339497736.2401.24.camel@sauron.fi.intel.com>
 <CAN8TOE9icRO8t_qwn-k3R+Q1y1X39-PZU=devSW07YpDW_KqNQ@mail.gmail.com>
 <1340017963.2420.29.camel@sauron.fi.intel.com>
Date: Mon, 18 Jun 2012 19:59:08 +0200
In-Reply-To: <1340017963.2420.29.camel@sauron.fi.intel.com> (Artem
 Bityutskiy's message of "Mon, 18 Jun 2012 14:12:43 +0300")
Message-ID: <87ehpc1oyb.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Mike Dunn <mikedunn@newsguy.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy <dedekind1@gmail.com> writes:

> Let's probe Mike and Robert and see what they say.
Sure.

>> I retried NAND_BBT_ABSPAGE on my own driver, and it seems that this
>> code-path has no ability to *create* a bad block table where one
>> didn't exist previously. It simply reads whatever data is present at
>> the given page(s) (according to td->pages[]), regardless of ECC
>> errors, junk data, lack of BBT markers (i.e., "Bbt0" or "1tbB"), and
>> versioning.

OK, I can explain the driver behaviour, as it looks like it is the same on the
docg3.

The way I understand things are handled on diskonchip devices :
 (1) the chip is manufactured
 (2) the chip is factory-tested to check if there are any initial bad blocks
 (3) the information which blocks are good/bad is written into the "One Time
 Programmable" area of the chip
 (4) the chip is shipped

Now, this 'Bad Block Table' (in the DoC meaning) is a table of factory bad
blocks. It doesn't include worn out blocks, as the OTP area is ... read-only.

To store worn out blocks, each filesystem implementation has to do something
smart. UBI has it way, SAFTL (docg3 fs) has its way, etc ...

But in the end, the bad block table is immutable, and represents factory bad
blocks, not up-to-date list of bad blocks.

And of course, as it is factory written, no ECC is required (it looks to me as a
fuse system there rather that pure NAND thing).

>> And no blocks are detected bad (simply because there was 0xff "table
>> data"). But then, I get even worse results if the uninitialized BBT
>> block has arbitrary (non-0xff) data! nand_bbt would just mark random
>> blocks as bad...
All "0xff" is the nominal situation, ie. you had a perfect chip shipped.

>> So, this "feature" seems severely limited - designed for a somewhat
>> static, pre-initialized BBT. I can probably survive by continuing to
>> ignore this eyesore, but I'd rather just fix it or kill it.
As you say, static pre-initialized BBT, that fits.

As to whether you should kill it or not, it's up to the maintainer of diskonchip
I suppose.

Cheers.

-- 
Robert

Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Slc0M-00031f-BY
 for linux-mtd@lists.infradead.org; Mon, 02 Jul 2012 08:29:11 +0000
Message-ID: <4FF15BD1.9010109@parrot.com>
Date: Mon, 2 Jul 2012 10:29:05 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Subject: Re: [RFC] nand_btt : use nand chip->block_bad
References: <1340898442-1585-1-git-send-email-matthieu.castet@parrot.com>	<20120628213146.7d929204@halley>	<4FED6A2E.9010603@parrot.com>
 <20120630230252.58ca6bb4@halley>
In-Reply-To: <20120630230252.58ca6bb4@halley>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Shmulik Ladkani a écrit :
> Hi,
> 
> On Fri, 29 Jun 2012 10:41:18 +0200 Matthieu CASTET <matthieu.castet@parrot.com> wrote:
>>> - The new scheme lacks the potential error correction offered by the
>>>   mtd_read_oob call (invoked from the original scan functions).
>>>   OTOH, currently, AFAIK, it is only offered by an out-of-tree driver.
>> Could you explain more here ?
>> The current scheme doesn't handle bitflip in bad block. We don't care about
>> error correction : bad block are not protected by ecc !
> 
> I was refering to utilizing the ECC when reading the OOB, so we won't
> get a false "bad" indication when reading the BBM from the OOB.
> 
> See this post (and subsequent ones):
> http://lists.infradead.org/pipermail/linux-mtd/2012-June/042203.html
> 
But oob is not protected by ecc in normal configuration. I believe more than 95%
of current configuration don't protect bad block with ecc.
Manufacturer bad block are also not protected by ecc.

How could this work ?
Do you have example of linux driver that protect bad block with ecc ?

Finally if there is a config with bad block protected by ecc, we can provide
another chip->block_bad callback which use ecc.


Also note that the post speak of "nand_chip.badblockbits" [1] which can be used
with this patch.


Matthieu

[1]
Because when ECC is available on OOB, it is good to utilize it, so
that bitflips don't cause good blocks to be marked bad. Less
importantly, when bad block markers are written by Linux (with ECC),
then these markers can be read back more reliably. (I note that there
is a nand_chip.badblockbits option that could theoretically alleviate
the first issue, but I see it is not actually implemented throughout
nand_bbt.c - only in nand_base.c)

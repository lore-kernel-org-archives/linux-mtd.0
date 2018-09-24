Received: from mail.bugwerft.de ([46.23.86.59])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g4MGh-0005cQ-Fl
 for linux-mtd@lists.infradead.org; Mon, 24 Sep 2018 08:31:01 +0000
Subject: Re: Trouble with new marvell_nand driver on PXA3xx
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Chris Packham <chris.packham@alliedtelesis.co.nz>
References: <f3cf564d-7976-5b2e-ca07-ea872c165396@zonque.org>
 <20180924100902.7b177324@bbrezillon>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <0e773d54-a2c2-63be-12e3-5da6caabd215@zonque.org>
Date: Mon, 24 Sep 2018 10:30:47 +0200
MIME-Version: 1.0
In-Reply-To: <20180924100902.7b177324@bbrezillon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On 24/9/2018 10:09 AM, Boris Brezillon wrote:
> On Mon, 24 Sep 2018 08:45:44 +0200
> Daniel Mack <daniel@zonque.org> wrote:

[...]

>> The legacy pxa3xx_nand driver didn't have this issue, but my system was
>> also running a much older kernel with that. I'm currently still
>> struggling to resurrect the old code, but I'm running into "Wait time
>> out!!!" conditions immediately right now. Not sure what's going on.
> 
> Hm, so that means the old driver has pretty much the same issue.

I thought so too, but unlike the new driver, the old one bails out 
pretty much immediately, and also when using the in-kernel mtd tests, so 
the behavior seems different. Not sure if that's really the same effect.

>> Interestingly, I can't seem to reproduce the bug with any of the mtd
>> kernel tests, I've tried all of them, several times, and all succeed. So
>> a file system test that includes the UBI/UBIFS layers seems to trigger
>> different things in the driver than the the tests that operate on the
>> mtd device directly.
> 
> Looking at the backtrace, it seems to fail on a high PEB num. Are you
> interfacing with a dual-die chip? Can you share the part number of your
> chip?

The chip is a NAND01GR3B2BZA which is identified like this during probe:

[    3.980817] nand: device found, Manufacturer ID: 0x20, Chip ID: 0xa1
[    3.988736] nand: ST Micro NAND 128MiB 1,8V 8-bit
[    3.994644] nand: 128 MiB, SLC, erase size: 128 KiB, page size: 2048, 
OOB size: 64
[    4.003021] marvell-nfc 43100000.nand-controller: No minimum ECC 
strength, using 1b/512B
[    4.011219] Scanning device for bad blocks
[    4.128042] Bad eraseblock 399 at 0x0000031e0000
[    4.168843] Bad eraseblock 528 at 0x000004200000
[    4.174076] Bad eraseblock 529 at 0x000004220000

Note that the hardware design is now almost 10 years old.

> You can try to run the mtd tests on eraseblock 905, just to check if
> they pass or not.

Will do when I'm back on that board, but just for my better 
understanding: aren't the tests running on all eraseblocks anyway? Would 
it make a difference to just let it run on a specific one?

> Also, when you run the ubi/ubifs/bonnie++ tests, does
> it always fail on the same PEB?

Nope. My backlog shows the issue for PEB 465, 572, 569, 586, 612, 729, 
905, 962 etc.


Thanks for your help,
Daniel

Received: from smtp.exceet.ch ([77.245.33.226])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eOhKe-0006Qw-Tx
 for linux-mtd@lists.infradead.org; Tue, 12 Dec 2017 09:58:39 +0000
Subject: Re: [PATCH v6 00/15] A SPI NAND framework under generic NAND framework
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: =?UTF-8?B?UGV0ZXIgUGFuIOa9mOagiyAocGV0ZXJwYW5kb25nKQ==?=
 <peterpandong@micron.com>, Peter Pan <peterpansjtu@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <20170529225931.226da943@bbrezillon>
 <90bcb366-c494-2dee-3bb7-d16b77e347c6@exceet.de>
 <20171204150514.1f17671d@bbrezillon>
 <A0FE66EC-7E17-43BE-9B66-896F112B92A0@micron.com>
 <20171205135804.478902dc@bbrezillon> <20171205140313.40f3f17d@bbrezillon>
From: Frieder Schrempf <frieder.schrempf@exceet.de>
Message-ID: <256b4ab6-c104-4580-87cd-527178bde460@exceet.de>
Date: Tue, 12 Dec 2017 10:58:10 +0100
MIME-Version: 1.0
In-Reply-To: <20171205140313.40f3f17d@bbrezillon>
Content-Type: text/plain; charset="utf-8"; format=flowed
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

I spent some time looking at and working with your latest SPI NAND code.
In my previous mail I said, that we have some working code for our 3.14 
kernel based on the "mt29f_spinand" staging driver, but that was wrong 
as I got things mixed up in my head.
Actually our codebase was an early version of Peter's code, so the 
effort to port it to the latest framework code was not that big.

I forked your repo and you can find my working tree at [1].

What I did so far:

* Rebase your patches on latest Linux 4.14.5

* Add a driver for the Winbond W25M02GV SPI NAND chip, that we have on 
some of our boards.

* Add a driver for the Freescale QSPI controller, derived from the 
existing QSPI-NOR driver at drivers/mtd/spi-nor/fsl-quadspi.c.

* Add a setup and setup_late op to the controller layer (see [3]). I 
don't know if that makes sense, but at least the setup_late is needed 
for the FSL QSPI driver, as it needs to know the size of the flash to 
setup the memory mapping for the QSPI read operations.

* A bit of testing and fixing two small bugs, which look like copy and 
paste mistakes. See [2].

* Running nandtest successfully on our hardware (i.MX6UL -> FSL-QSPI -> 
W25M02GV)

I hope this is of use while moving on.
I guess you would like to have the basic framework with Micron support 
and generic SPI tested and stabilized first, before adding more code, 
but to be able to test with our hardware I need Micron and FSL QSPI.

Some questions/flaws that occurred to me:

* The W25M02GV chip has two dies of 128M each. My current driver only 
makes use of the first die. The chip expects a die-select command to 
switch between the two dies.
What would be the place to implement this?
Can I just add the command and issue it in 
winbond_spinand_adjust_cache_op if luns_per_target > 1?

* The FSL QSPI controller has a lookup table that needs to be filled 
with command sequences at the time of setup. Therefore the number of 
dummy bytes for each command is fixed and in my current implementation 
op->dummy_bytes is ignored.
That's not a problem if all chips need the same number of dummy bytes 
for each command, but I guess that's not the case, as there is a 
_spinand_get_dummy function.

* What is your plan for ECC and BBT? At least enabling the onchip ECC 
will be necessary to be able to use the flash properly (e.g. with UBI), 
or am I wrong?

* Do you have any special test cases? What do you usually do to test the 
code?

Thanks for your patience and best regards,

Frieder

[1] https://github.com/fschrempf/linux-0day/commits/spi-nand-exceet
[2] 
https://github.com/fschrempf/linux-0day/commit/213caf23a0467eba4002e3dd5832c48adbeee3f4
[3] 
https://github.com/fschrempf/linux-0day/commit/3f39780e7c7ca12aeab77963e6c7dc1c38f524b5

On 05.12.2017 14:03, Boris Brezillon wrote:
> On Tue, 5 Dec 2017 13:58:04 +0100
> Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
> 
>> Testing and reviewing, as usual. I'd really like to get the preparation
>> patches (all patches touching mtd core code) in 4.16. For the rest, it
>> really depends how much time you and other contributors (including me)
>> can spend testing/reviewing/fixing/documenting the code.
>>
>> I am totally aware that I'm the one blocking the progress on this
>> framework because of my constant hesitations on what the generic NAND
>> layer should look like, but I'm a bit more confident now that we
>> isolated the raw NAND code from the generic NAND changes (less risks of
>> breaking existing NAND users).
> 
> Lastest version, with fixup patches squashed in original patches is
> available here[1].
> 
> [1]https://github.com/bbrezillon/linux-0day/commits/nand/spi-nand-squashed
> 

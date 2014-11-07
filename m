Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xmj8z-0002dq-JH
 for linux-mtd@lists.infradead.org; Fri, 07 Nov 2014 13:00:02 +0000
Message-ID: <545CC25B.9030807@imgtec.com>
Date: Fri, 7 Nov 2014 13:00:11 +0000
From: Ionela Voinescu <ionela.voinescu@imgtec.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 0/2] staging: mtd: Support for GigaDevice SPI NAND flash
References: <1415289079-16922-1-git-send-email-ionela.voinescu@imgtec.com>
 <20141106160548.GB21363@kroah.com> <545BB0BB.3040905@imgtec.com>
 <20141106174459.GA3945@kroah.com> <545BB7F1.5050400@imgtec.com>
 <545BBB26.2040207@imgtec.com> <20141106192041.GB23619@ld-irv-0074>
In-Reply-To: <20141106192041.GB23619@ld-irv-0074>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Marek Vasut <marex@denx.de>, Kamlakant Patel <kamlakant.patel@broadcom.com>,
 abrestic@chromium.org, Greg KH <gregkh@linuxfoundation.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, dehrenberg@chromium.org,
 linux-mtd@lists.infradead.org, Ezequiel Garcia <ezequiel.garcia@imgtec.com>,
 james.hartley@imgtec.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

Thank you for your feedback.

On 11/06/14 19:20, Brian Norris wrote:
> On Thu, Nov 06, 2014 at 03:17:10PM -0300, Ezequiel Garcia wrote:
>> How about picking Sourav's v2 as a starting point:
>>
>> http://lists.infradead.org/pipermail/linux-mtd/2013-July/047434.html
> Completely irrelevant, but I found this amusing in that patch, a few
> lines into spinand.h:
>
> +/bin/bash: 4: command not found
>
> :)
>
>> And then try to use that to support Micron's MT29F and Gigadevice's GD5F ?
>>
>> Brian: Any ideas or suggestion on how to proceed?
> I'm not opposed to trying to build a proper SPI-NAND framework. But the
> linked v2 patch doesn't provide much to start from. It barely handles
> anything that is specific to SPI-NAND (pushing the details out to a
> flash-specific driver), and it doesn't address what I think the biggest
> question is: how similar will the various SPI-NAND implementations be?
> I've talked with a few flash vendors and seen that there were some
> growing pains with developing a first generation de-facto standard, so
> there is bound to be a bit of incompatibility if we try to support the
> earliest examples, but it seemed like there was some effort to keep
> things consistent across different manufacturers. I don't know the
> progress of any standardization effort there.
>
> Anyway, I think we really should look at whether any of the
> identification and command sequencing details can be abstracted into a
> drivers/mtd/spinand/spinand.c, with client drivers mostly handling the
> transport protocol differences (e.g., interfacing with the SPI layer,
> similar to what m25p80.c does for SPI NOR).

I know that the linked v2 does not provide much but it provides a starting
point. If you agree I'm going to start from that and try to add as much
of the command sequencing that is common between the micron chip
and the gigadevice chip that I have access to, through the exiting drivers and
the datasheets, following the example set by m25p80.c.

As far as I've seen from the datasheets I have available (SPI NAND
GigaDevice 1Gb/2Gb/4Gb, Micron 1Gb/2Gb/4Gb), the command sequencing
is the same for read/write/erase operations (read: enable ECC, read to cache,
wait, read from cache, check for errors, disable ECC; write: enable ECC,
write enable, program load, program execute, wait, verify, disable ECC;
erase: write enable, erase block, verify).

Regarding the stream of bytes for each command, the problematic
commands are the read from cache ones (read, fast read, read x2,
read x4, read dual read quad) that have different command format
(additional dummy bytes, a plane select bit to be set).
Other differences are in the structure of the protection and status registers
(some of them use more ECC and protection bits according to the size
of the chip). Also, each has a different ECC layout.
>
> I don't have any time to create such a framwork on my own, but I may be
> able to spare some limited resources for reviewing others' work. I'd
> really like to see some efforts from a few interested reviewers, as I
> haven't figured out how to squeeze more hours into my day yet.

As I said, I have some time to continue Sourav's work and I would
greatly appreciate the review effort.

>
> BTW, has there been any progress on whatever TODO items landed
> mt29f_spinand in staging in the first place?
>
> Brian
Thank you very much,
Ionela.

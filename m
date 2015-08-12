Received: from mail.kmu-office.ch ([178.209.48.109])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZPQ3C-0007lQ-O0
 for linux-mtd@lists.infradead.org; Wed, 12 Aug 2015 07:02:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Date: Wed, 12 Aug 2015 09:01:43 +0200
From: Stefan Agner <stefan@agner.ch>
To: Richard Weinberger <richard@nod.at>, computersforpeace@gmail.com
Cc: Bhuvanchandra DV <bhuvanchandradv@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: UBIFS errors when file-system is full
In-Reply-To: <55C4A695.7060608@nod.at>
References: <55A3C342.9010704@gmail.com>
 <CAFLxGvzriSX-aGh_NShqP7McyZQK6bOdnOm=yXkZSUfX=r8pzw@mail.gmail.com>
 <55A48EA7.6050302@gmail.com> <55A4A896.9050500@nod.at>
 <55A4AC7A.1020203@gmail.com> <55A4ACEF.20307@nod.at>
 <55A4C866.2010400@gmail.com> <55A4CB60.2080505@nod.at>
 <55A4DF83.5080505@gmail.com> <55A4ED47.4060802@nod.at>
 <55A74812.2020906@gmail.com> <55A74AA1.2000000@nod.at>
 <55A7540C.3050900@nod.at> <55A7592D.6010906@gmail.com>
 <55A75A05.7040603@nod.at> <55ADE0F1.9090809@gmail.com>
 <55ADE35F.6050808@nod.at> <55AF41DD.2060902@gmail.com>
 <55AF4447.50500@nod.at> <55B24F2F.9020705@gmail.com>
 <55B26D24.3060006@nod.at> <55BBA6A5.9020701@gmail.com>
 <55BC68D6.2070008@nod.at> <55C3379E.50000@gmail.com>
 <55C4A695.7060608@nod.at>
Message-ID: <e3d338cfd875b941061d5ac3da9f29c0@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

[also added Brian to the discussion, since he had a look into that
driver before]

On 2015-08-07 14:37, Richard Weinberger wrote:
> Hi!
> 
> Am 06.08.2015 um 12:31 schrieb Bhuvanchandra DV:
>>>> The tests ran on ubi partition after isolating it from U-Boot completly.
>>>> Formatted the ubi partition and then boot with SD card (4.1.2 kernel fastmap enabled/disabled, fm_debug enabled).
>>>> Please find the below log of ubi-tests:
>>>>
>>>> [io_paral] write_thread():222: written and read data are different
>>> *blink*
>>
>> Tried to run the io_paral test multiple times seperately with few debug prints added to see what exact
>> differences with read and write buffers, so far we could see one complete page is read twice even though
>> it is written once. I'm now confused is the issue happen while reading or while writing. Can you give us
>> some pointers so that we can narrow down the cause for this failure.
> 
> The test verifies that the data has been written correctly to the block.
> (Maybe a buffer problem in your MTD driver?)
> 
> You can also enable UBI's IO checks.
> i.e. echo 1 > /sys/kernel/debug/ubi/ubi0/chk_io
> 
> It will also verify it's writes. Maybe it can give you a clue.

According to Bhuvan's test, it really seems that we have an issue on
write path (this error is reproduceable):
root@colibri-vf:~/ubi-tests-bin# ./io_paral /dev/ubi0 2>&1 | tee
~/io-parl4.log
[ 6451.223087] ubi0 error: self_check_write: self-check failed for PEB
843:4096, len 126976
[ 6451.231650] ubi0: data differ at position 61440
[ 6451.236325] ubi0: hex dump of the original buffer from 61440 to
126976
[ 6451.331045] ubi0: hex dump of the read buffer from 61440 to 126976
[ 6451.426703] CPU: 0 PID: 1182 Comm: io_paral Not tainted
4.1.4-00704-g2631972 #21
[ 6451.434506] Hardware name: Freescale Vybrid VF5xx/VF6xx (Device Tree)

This 4.1.4 with v10 of the driver applied:
http://thread.gmane.org/gmane.linux.drivers.devicetree/130300


I worked on the driver since quite some time, currently v10 is in
review. With this issue in mind, I went through the driver however I
currently can't see an issue.

The error position is always page aligned, but at different pages. We
printed the reread buffers once: It seems that one page lands on flash
twice. My guess is that the second page doesn't get transmitted
properly, while the new column/row gets transmitted and
NAND_CMD_PAGEPROG executed... Hence the same buffer would be written to
the device again.

The NFC IP in Vybrid (vf610) has a higher level programming model which
takes care of the command sequencing. Therefore some callbacks are not
actually sending a command to the device (e.g. NAND_CMD_SEQIN) since
this will be done one command later, on in NAND_CMD_PAGEPROG. Now, of
course, the driver relies heavily on not being interrupted by other
requests in between, (also not read!) but I thought that this is taken
care of by the MTD subsystem? So for me it is a bit hard to spot the
error since I'm always unsure whether the assumptions regarding
locking/exclusiveness between the calls is really guaranteed...

--
Stefan

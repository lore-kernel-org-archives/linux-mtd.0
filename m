Received: from mail-vc0-x22b.google.com ([2607:f8b0:400c:c03::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vg417-0000sQ-Lg
 for linux-mtd@lists.infradead.org; Tue, 12 Nov 2013 02:47:50 +0000
Received: by mail-vc0-f171.google.com with SMTP id lc6so218991vcb.2
 for <linux-mtd@lists.infradead.org>; Mon, 11 Nov 2013 18:47:27 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <528192F1.5040300@freescale.com>
References: <1384197222-23783-1-git-send-email-festevam@gmail.com>
 <528192F1.5040300@freescale.com>
Date: Mon, 11 Nov 2013 18:47:26 -0800
Message-ID: <CAN8TOE8BV5NpX06MUGCcN2-Th=oAh9KzQUXAANRJtMi9CyrXNQ@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: gpmi: Fix NULL pointer dereference
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Fabio Estevam <festevam@gmail.com>, stable@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 11, 2013 at 6:31 PM, Huang Shijie <b32955@freescale.com> wrote:
> 于 2013年11月12日 03:13, Fabio Estevam 写道:
>> From: Fabio Estevam <fabio.estevam@freescale.com>
>>
>> Currently mx23_check_transcription_stamp() uses chip->buffers->databuf
>> as its buffer, which is allocated by nand_scan_tail().
>>
>> Since commit 720e7ce5 ("mtd: gpmi: remove the nand_scan()"),
>> mx23_check_transcription_stamp() is called before nand_scan_tail(), which causes
>> a NULL pointer dereference:
>>
>> [    1.150000] NAND device: Manufacturer ID: 0xec, Chip ID: 0xd7 (Samsung NAND 4GiB 3,3V 8-bit), 4096MiB, page size: 4096, OOB size: 8
>> [    1.160000] Unable to handle kernel NULL pointer dereference at virtual address 000005d0
>> [    1.170000] pgd = c0004000
>> [    1.170000] [000005d0] *pgd=00000000
>> [    1.180000] Internal error: Oops: 5 [#1] ARM
>> [    1.180000] Modules linked in:
>> [    1.180000] CPU: 0 PID: 1 Comm: swapper Not tainted 3.12.0 #89
>> [    1.180000] task: c7440000 ti: c743a000 task.ti: c743a000
>> [    1.180000] PC is at memcmp+0x10/0x54
>> [    1.180000] LR is at gpmi_nand_probe+0x42c/0x894
>> [    1.180000] pc : [<c025fcb0>]    lr : [<c02f6a68>]    psr: 20000053
>> [    1.180000] sp : c743be2c  ip : 600000d3  fp : ffffffff
>> [    1.180000] r10: 000005d0  r9 : c02f5f08  r8 : 00000000
>> [    1.180000] r7 : c75858a8  r6 : c75858a8  r5 : c7585b18  r4 : c7585800
>> [    1.180000] r3 : 000005d0  r2 : 00000004  r1 : c05c33e4  r0 : 000005d0
>> [    1.180000] Flags: nzCv  IRQs on  FIQs off  Mode SVC_32  ISA ARM  Segment kernel
>> [    1.180000] Control: 0005317f  Table: 40004000  DAC: 00000017
>> [    1.180000] Process swapper (pid: 1, stack limit = 0xc743a1c0)
>>
>> In order to fix this problem, allocate the buffer locally via kzalloc().
>>
>> Also, as mx23_check_transcription_stamp() can return en error code now, adapt
>> the logic in mx23_boot_init() to take this into account.
>>
>> Cc: <stable@vger.kernel.org> # 3.12
>> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
>> ---
>> Changes since v1:
>> - Drop sizeof(*buffer) from size calculatio in kzalloc (Brian Norris)
>> - Propagate the error if mx23_check_transcription_stamp returns a negative
>> error code (Brian Norris)
>>
>>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 13 +++++++++++--
>>  1 file changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
>> index a9830ff..f99b876 100644
>> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
>> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
>> @@ -1342,7 +1342,7 @@ static int mx23_check_transcription_stamp(struct gpmi_nand_data *this)
>>       unsigned int search_area_size_in_strides;
>>       unsigned int stride;
>>       unsigned int page;
>> -     uint8_t *buffer = chip->buffers->databuf;
>> +     uint8_t *buffer;
>>       int saved_chip_number;
>>       int found_an_ncb_fingerprint = false;
>>
>> @@ -1352,6 +1352,9 @@ static int mx23_check_transcription_stamp(struct gpmi_nand_data *this)
>>       saved_chip_number = this->current_chip;
>>       chip->select_chip(mtd, 0);
>>
>> +     buffer = kzalloc(strlen(fingerprint), GFP_KERNEL);
>> +     if (!buffer)
>> +             return -ENOMEM;
>>       /*
>>        * Loop through the first search area, looking for the NCB fingerprint.
>>        */
>> @@ -1380,6 +1383,8 @@ static int mx23_check_transcription_stamp(struct gpmi_nand_data *this)
>>
>>       chip->select_chip(mtd, saved_chip_number);
>>
>> +     kfree(buffer);
>> +
>>       if (found_an_ncb_fingerprint)
>>               dev_dbg(dev, "\tFound a fingerprint\n");
>>       else
>> @@ -1488,7 +1493,11 @@ static int mx23_boot_init(struct gpmi_nand_data  *this)
>>        * transcription stamp. If we find it, then we don't have to do
>>        * anything -- the block marks are already transcribed.
>>        */
>> -     if (mx23_check_transcription_stamp(this))
>> +
>> +     ret = mx23_check_transcription_stamp(this);
>> +     if (ret < 0)
>> +             return ret;
>> +     else if (ret)
>>               return 0;
>>
>>       /*
> Thanks Fabio.
> In actually, this patch only fixes partial of the bug.
>
> When we login the rootfs, and erase all the mtd partitions, and reboot
> the mx23 again,
> you will meet a NULL pointer too. Why? because the
> mx23_write_transcription_stamp() will work
> again.

But how is this reboot situation a different case? As far as the
kernel is concerned, this reboot would be the same as any other
boot...

What NULL pointer are you talking about for this reboot case? AFAICT,
the only identified NULL pointer was on the 'buffer' in
mx23_write_transcription_stamp(), and Fabio's patch ensures that this
buffer points to a proper memory region. So where's your NULL pointer?

> So my patch is better. :)

Perhaps, but you haven't made it clear why. Also IMO, it's not ideal.
If we have to do something like your patch, I have a different
suggestion. But please, answer my concerns first, then we can consider
if a more invasive patch is necessary.

Brian

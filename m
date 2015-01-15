Received: from mail-qc0-f180.google.com ([209.85.216.180])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YBoXz-0003ZS-9g
 for linux-mtd@lists.infradead.org; Thu, 15 Jan 2015 17:49:31 +0000
Received: by mail-qc0-f180.google.com with SMTP id r5so7184500qcx.11
 for <linux-mtd@lists.infradead.org>; Thu, 15 Jan 2015 09:49:09 -0800 (PST)
MIME-Version: 1.0
Sender: root@kryo.se
In-Reply-To: <alpine.DEB.2.02.1501142353210.5742@lnxricardw1.se.axis.com>
References: <CAGgu=sBpckw_J1sMcQi+Df8N8=sVjaeLZCLL9bVqEm_uHMB-5Q@mail.gmail.com>
 <CAFLxGvwaqLfshJGHT=tfwh=SFt4nRBTPpMBVyE9DMxkhyWr-Wg@mail.gmail.com>
 <alpine.DEB.2.02.1501142353210.5742@lnxricardw1.se.axis.com>
Date: Thu, 15 Jan 2015 18:49:09 +0100
Message-ID: <CAGgu=sBM=vaVi52yGP6+QzUAdeG7yhuzry0DHndm6Zgtjhh2nw@mail.gmail.com>
Subject: Re: Flash filesystem questions
From: Erik Ekman <erik@kryo.se>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Content-Type: text/plain; charset=UTF-8
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 14, 2015 at 11:59 PM, Ricard Wanderlof
<ricard.wanderlof@axis.com> wrote:
>
> On Wed, 14 Jan 2015, Richard Weinberger wrote:
>
>> On Wed, Jan 14, 2015 at 9:21 PM, Erik Ekman <erik@kryo.se> wrote:
>> > Hi all,
>> >
[...]
>> >
>> > Could this problem be because of my driver? Is there some way to configure UBI
>> > for to only write once per flash block or is that the default?
>>
>> You can a block only write once. Then you have to erase it again.
>
> When I read Erik's original post I interpreted the 'write once per flash
> block' to mean that you can do a single write per block, and that's it.
> Given the usage as a speedup component, it would make sense to copy the
> relevant data in one go, since no read/write file system would be
> implemented on the device, there would be no need for page based writes.
> The flash memory most likely doesn't have this limitation but the
> controller could I suppose.
>
> Erik, was that in fact what you meant?
>
> None of the Linux-based read/write file systems can handle the case of
> only being able to do a single write operation to a block. They are all
> based on the fact that you normally can write a page of data at a time.

I meant that each 4kB sector within in erase block can only be written
once per erase.
In the SoC flashes I have run into at work you can usually write many
times (only clearing
bits of course, not setting them) to the same sector. What I see when
I try is that the writes
complete without problem but the next read of the same sector returns an error.

My code only read up to 4kB in one read command. It seems the kernel
part attaching ubi
did not like not getting all data in one operation. After fixing long
reads I no longer get any
asserts in the log. ubiattach does still not work though, but now I
get a more normal CRC error:

[  834.723114] UBI: attaching mtd0 to ubi0
[  841.609879] UBI: scanning is finished
[  841.612442] UBI error: vtbl_check: bad CRC at record 23:
0xf116c36b, not 0x000000
[  841.612450] Volume table record 23 dump:
[  841.612453] reserved_pebs   0
[  841.612456] alignment       0
[  841.612459] data_pad        0
[  841.612462] vol_type        0
[  841.612465] upd_marker      0
[  841.612468] name_len        0
[  841.612470] name            NULL
[  841.612501] UBI error: vtbl_check: bad CRC at record 23:
0xf116c36b, not 0x000000
[  841.612504] Volume table record 23 dump:
[  841.612507] reserved_pebs   0
[  841.612510] alignment       0
[  841.612513] data_pad        0
[  841.612515] vol_type        0
[  841.612518] upd_marker      0
[  841.612521] name_len        0
[  841.612523] name            NULL
[  841.612527] UBI error: process_lvol: both volume tables are corrupted
[  841.615924] UBI error: ubi_attach_mtd_dev: failed to attach mtd0, error -22

I will try with the tests and investigate more.

Thanks for the help,

Erik

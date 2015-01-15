Received: from mail-qg0-f49.google.com ([209.85.192.49])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YBowL-0006xm-Tx
 for linux-mtd@lists.infradead.org; Thu, 15 Jan 2015 18:14:42 +0000
Received: by mail-qg0-f49.google.com with SMTP id f51so12878281qge.8
 for <linux-mtd@lists.infradead.org>; Thu, 15 Jan 2015 10:14:19 -0800 (PST)
MIME-Version: 1.0
Sender: root@kryo.se
In-Reply-To: <CAGgu=sBM=vaVi52yGP6+QzUAdeG7yhuzry0DHndm6Zgtjhh2nw@mail.gmail.com>
References: <CAGgu=sBpckw_J1sMcQi+Df8N8=sVjaeLZCLL9bVqEm_uHMB-5Q@mail.gmail.com>
 <CAFLxGvwaqLfshJGHT=tfwh=SFt4nRBTPpMBVyE9DMxkhyWr-Wg@mail.gmail.com>
 <alpine.DEB.2.02.1501142353210.5742@lnxricardw1.se.axis.com>
 <CAGgu=sBM=vaVi52yGP6+QzUAdeG7yhuzry0DHndm6Zgtjhh2nw@mail.gmail.com>
Date: Thu, 15 Jan 2015 19:14:14 +0100
Message-ID: <CAGgu=sBLzZa=iWjo39fcrx1ph-WjErg6FuxQqBMZaF1=1gcJ0Q@mail.gmail.com>
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

On Thu, Jan 15, 2015 at 6:49 PM, Erik Ekman <erik@kryo.se> wrote:
>
> My code only read up to 4kB in one read command. It seems the kernel
> part attaching ubi
> did not like not getting all data in one operation. After fixing long
> reads I no longer get any
> asserts in the log. ubiattach does still not work though, but now I
> get a more normal CRC error:
>
> [  834.723114] UBI: attaching mtd0 to ubi0
> [  841.609879] UBI: scanning is finished
> [  841.612442] UBI error: vtbl_check: bad CRC at record 23:
> 0xf116c36b, not 0x000000
> [  841.612450] Volume table record 23 dump:
> [  841.612453] reserved_pebs   0
> [  841.612456] alignment       0
> [  841.612459] data_pad        0
> [  841.612462] vol_type        0
> [  841.612465] upd_marker      0
> [  841.612468] name_len        0
> [  841.612470] name            NULL
> [  841.612501] UBI error: vtbl_check: bad CRC at record 23:
> 0xf116c36b, not 0x000000
> [  841.612504] Volume table record 23 dump:
> [  841.612507] reserved_pebs   0
> [  841.612510] alignment       0
> [  841.612513] data_pad        0
> [  841.612515] vol_type        0
> [  841.612518] upd_marker      0
> [  841.612521] name_len        0
> [  841.612523] name            NULL
> [  841.612527] UBI error: process_lvol: both volume tables are corrupted
> [  841.615924] UBI error: ubi_attach_mtd_dev: failed to attach mtd0, error -22
>
> I will try with the tests and investigate more.

Ok, when reading long data actually works then attaching ubi is fine..

Next problem is bad blocks. I have not found anything in the hardware that
keeps track of them. I am thinking about using the first two working blocks as
maps, one u8 per erase block. Since I only have 8k, 16k or 32k erase blocks it
should not wear them out too much during updates.

Is this a valid strategy or is there a common smart solution?

Thanks,

Erik

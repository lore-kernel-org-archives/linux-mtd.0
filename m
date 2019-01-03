Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gf9Sv-0003Ap-Me
 for linux-mtd@lists.infradead.org; Thu, 03 Jan 2019 20:19:43 +0000
Received: by mail-pf1-x42d.google.com with SMTP id i12so17173451pfo.7
 for <linux-mtd@lists.infradead.org>; Thu, 03 Jan 2019 12:19:40 -0800 (PST)
MIME-Version: 1.0
References: <CANNa7-XH1Qm8A5fzUM29pDsmLke4SP-+=PoJtumai8jv1nqFBg@mail.gmail.com>
In-Reply-To: <CANNa7-XH1Qm8A5fzUM29pDsmLke4SP-+=PoJtumai8jv1nqFBg@mail.gmail.com>
From: Emil Lenngren <emil.lenngren@gmail.com>
Date: Thu, 3 Jan 2019 21:19:28 +0100
Message-ID: <CAO1O6sfwJ48V3RA33DUMNT-bRq0_LeY4jyFKwB7FkH6_+MLppw@mail.gmail.com>
Subject: Re: Having trouble with a UBI filesystem
To: Ron Bowes <ron@skullsecurity.net>
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ron,

Den tors 3 jan. 2019 kl 20:52 skrev Ron Bowes <ron@skullsecurity.net>:
>
> Hey Linux-mtd folks,
>
> I'm a security consultant that does a variety of different consulting
> work for our customers. In my current project, I'm trying to read a
> UBI filesystem from a flash-chip dump, but I'm having a lot of
> trouble. I've tried to use both the MTD userland tools (from you
> folks) and ubi-reader (from https://github.com/jrspruitt/ubi_reader).
>
> I'm struggling to understand the filesystem, and it seems to be - at
> least initially - because the VID header is offset by 0x40 bytes from
> where I think it should be. I was wondering if anybody recognizes
> what's going on here, and can help point me in the right direction?
>
> I've been working directly on the file dump in a hex editor right now,
> and I see why the tools are struggling, but I don't understand why.
>
> In the image, the block sizes are 0x21000 bytes, the VID header is at
> offset 0x800, and the data offset is 0x1000. The first block is empty,
> but here's the second EB block header:
>
> ```
>           ---magic---     ver -  -  -     --------- EC --------------
> 00021000: 55 42 49 23     01 00 00 00     00 00 00 00     00 00 10 0d
> UBI#............
>           vid_hdr_off     data_offset     -image_seq-     --padding--
> 00021010: 00 00 08 00     00 00 10 00     8b 19 3b a0     00 00 00 00
> ..........;.....
>           --------------------------padding--------------------------
> 00021020: 00 00 00 00     00 00 00 00     00 00 00 00     00 00 00 00
> ................
>           -----------------padding-------------------     ----crc----
> 00021030: 00 00 00 00     00 00 00 00     00 00 00 00     c4 b3 6f 75
> ..............ou
>
> 00021040: 00 00 00 00     00 00 00 00     00 00 00 00     00 00 00 00
> ................
> ...empty...
> 000217f0: 00 00 00 00     00 00 00 00     00 00 00 00     00 00 00 00
> ................
> ```
>
> That all looks legit. It lists the vid_hdr_offset as 0x800, and the
> data_offset at 0x1000. Looks good so far!
>
> If I fast forward to 0x800 bytes into the block, where I'd expect to
> see the VID header, I see:
>
> ```
> 00021800: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  ................
> 00021810: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  ................
> 00021820: 12 2e e1 ff ff ff ff ff ff ff ff ff ff ff ff ff  ................
> 00021830: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  ................
> ```
>
> It appears that the checksum is set, but nothing else at all,
> including the 'magic'. However, if I go an additional 0x40 bytes to
> 0x840 from the start of the block, I see what appears to be a UBI VID
> header (starts with 'UBI!'):
>
> ```
>                              type  compat
>           ---magic---     ver   copy      --vol_id---     ---lnum----
> 00021840: 55 42 49 21     01 01 00 00     00 00 00 00     00 00 01 18
> UBI!............
>
>           ----pad----     -data_size-     -used_ebs--     data_padding
> 00021850: 00 00 00 00     00 00 00 00     00 00 00 00     00 00 00 00
> ................
>
>           data_crc        padding         ----------seq_num----------
> 00021860: 00 00 00 00     00 00 00 00     00 00 00 00     00 7e 0c ad
> .............~..
>
>           ------------------padding------------------     ----crc----
> 00021870: 00 00 00 00     00 00 00 00     00 00 00 00     bc b0 9f 45
> ...............E
>
> 00021880: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> ...empty...
> 00021ff0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
> ```
>
> It doesn't look 100% perfect, but it does start with the "UBI!" magic
> and apparently has a CRC32 at the end.
>
> If I go to 0x1000 offset from the start, it looks like it could be a
> data block, but I haven't gotten far enough to know what that's
> supposed to look like yet. I'm still working through the headers.
>
> I haven't dug super deep into the RFC or docs just yet, just the list
> of headers. But I thought maybe somebody here with a deeper knowledge
> might tell me if I'm on the right track.
>
> Can anybody help me understand what I'm looking at? And how I can
> either mount or extract this?
>
> Thanks!

What's the flash parameters? Is it NAND or NOR? What's your page size,
oob size etc.?
Assuming you have a NAND flash, a first guess would be that your flash
chip dump contains also the pages' OOB data after every page. If your
page size is 2048 (0x800) bytes and OOB size is 64 bytes (0x40), that
would explain why the VID header is 0x40 bytes offset, since those
extra 0x40 bytes are filled with OOB data.

/Emil

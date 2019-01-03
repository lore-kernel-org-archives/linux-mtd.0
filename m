Received: from mail-lj1-f172.google.com ([209.85.208.172])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gf9e5-00087D-MS
 for linux-mtd@lists.infradead.org; Thu, 03 Jan 2019 20:31:15 +0000
Received: by mail-lj1-f172.google.com with SMTP id t18-v6so30764480ljd.4
 for <linux-mtd@lists.infradead.org>; Thu, 03 Jan 2019 12:31:13 -0800 (PST)
MIME-Version: 1.0
References: <CANNa7-XH1Qm8A5fzUM29pDsmLke4SP-+=PoJtumai8jv1nqFBg@mail.gmail.com>
 <CAFLxGvw2QXVJ29mwJt-1WMkpXBrq4fAgzJPS2BQi+ErPZFL1Lg@mail.gmail.com>
In-Reply-To: <CAFLxGvw2QXVJ29mwJt-1WMkpXBrq4fAgzJPS2BQi+ErPZFL1Lg@mail.gmail.com>
From: Ron Bowes <ron@skullsecurity.net>
Date: Thu, 3 Jan 2019 12:30:59 -0800
Message-ID: <CANNa7-XkT=PnK4P6g_T1NCSRC+2v_kpU2hNJJY8dv+UB0ifEdQ@mail.gmail.com>
Subject: Re: Having trouble with a UBI filesystem
To: Richard Weinberger <richard.weinberger@gmail.com>
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

Hi Emil and Richard,

Thanks for the quick responses!

Email - It is indeed a NAND flash chip. I did some googling about OOB
data, and that looks very promising. I'll have to read up some more,
but I'm guessing this is why I'm seeing a UBI header every 0x21000
bytes instead of the more normal 0x20000 bytes - there's 0x1000 bytes
of OOB data in each block. I'll do some more reading and see if I can
eliminate that.

Richard - yeah, the tool hasn't worked well so far, but I was hoping
it'd work well enough to avoid reading kernel code. I'm definitely out
of my element!

I tried using mtdram and ubiattach, but I couldn't get it to work
right. It always complained that the data started at 0x1000 instead of
0x840, and I couldn't figure out why:

[ 5828.047122] ubi0 error: validate_ec_hdr: bad data offset 4096, expected 2112
[ 5828.047499] ubi0 error: validate_ec_hdr: bad EC header
[ 5828.047817] Erase counter header dump:
[ 5828.048099]  magic          0x55424923
[ 5828.048377]  version        1
[ 5828.048643]  ec             0
[ 5828.048911]  vid_hdr_offset 2048
[ 5828.049197]  data_offset    4096
[ 5828.049469]  image_seq      606494591
[ 5828.049747]  hdr_crc        0x9116275f

I traced my way through ubiattach, but it looks like this is a
kernel-level thing. That's when I started looking at the Python tool.

Emil's comment about OOB data might be the issue, though. Other parts
of the memory dump were unexpected sizes, as well, so I think OOB data
is probably the culprit.

Thanks!

On Thu, Jan 3, 2019 at 12:25 PM Richard Weinberger
<richard.weinberger@gmail.com> wrote:
>
> On Thu, Jan 3, 2019 at 8:52 PM Ron Bowes <ron@skullsecurity.net> wrote:
> > folks) and ubi-reader (from https://github.com/jrspruitt/ubi_reader).
>
> Last time I looked at ubi_reader I was not satisfied at all.
> So I'd not recommend it. But this was over a year ago.
>
> > Can anybody help me understand what I'm looking at? And how I can
> > either mount or extract this?
>
> Find the correct flash parameters and load the image into mtdram
> or nandsim to mount it.
>
> --
> Thanks,
> //richard

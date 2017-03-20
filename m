Received: from mail-ot0-x231.google.com ([2607:f8b0:4003:c0f::231])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cq6E5-0005Mb-P4
 for linux-mtd@lists.infradead.org; Mon, 20 Mar 2017 22:56:36 +0000
Received: by mail-ot0-x231.google.com with SMTP id a12so72311534ota.0
 for <linux-mtd@lists.infradead.org>; Mon, 20 Mar 2017 15:56:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CADFuHZ6xb=M_zRkktnq2b8QBOhq-WDsqgzViPHU1g8Gj9M3E-g@mail.gmail.com>
References: <CADFuHZ6xb=M_zRkktnq2b8QBOhq-WDsqgzViPHU1g8Gj9M3E-g@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 20 Mar 2017 23:56:08 +0100
Message-ID: <CAFLxGvx6S8V7c8YYR2-G7+hDDcRi-0Cnk+EWeWWN9i2oy-DVvQ@mail.gmail.com>
Subject: Re: Regarding UBI fastmap data CRC failure
To: Ronak Desai <ronak.desai@rockwellcollins.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 20, 2017 at 10:47 PM, Ronak Desai
<ronak.desai@rockwellcollins.com> wrote:
> Hi All,
>
> In one of the products with MLC NAND flash, we are using UBI
> filesystem with kernel 3.12.

MLC NAND is currently not supported.

> Fastmap is enabled to reduce the attach time and it works as expected.
> We performed number of powercycles on the unit and never seen a
> continuous failure of attached by fastmap. But, at one occurrence I
> observed that there was a  "fastmap data CRC failure". UBI was
> complaining about not find anchor node error when performing detach
> (that's why was not able to write new fastmap data). It was a
> permanent failure until I reformatted that NAND partition.
>
> I understand that UBI stores fastmap data in initial few KBs of that
> NAND device and it was not able to find spare block in that region to
> store fastmap data. But, I am not able to understand that why UBI end
> up with this situation when it already manages the erasure of the bad
> fastmap blocks?
>
> I would like to know that how I can avoid this situation or get a
> workaround of it. Any advice will be appreciated.

Maybe the error you're facing is due to the lack of MLC support.

Another point is your kernel version, Fastmap saw tons of fixes
and updates in recent kernel. Please make sure that you have
all these fixes. Ideally backport the whole UBI subsystem.

-- 
Thanks,
//richard

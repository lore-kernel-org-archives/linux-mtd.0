Received: from mail-ob0-x233.google.com ([2607:f8b0:4003:c01::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zz8vP-0002cz-US
 for linux-mtd@lists.infradead.org; Wed, 18 Nov 2015 20:01:53 +0000
Received: by obbnk6 with SMTP id nk6so42547551obb.2
 for <linux-mtd@lists.infradead.org>; Wed, 18 Nov 2015 12:01:29 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <5640A7D0.6080104@writesys.com.br>
References: <1315747066.18731.53.camel@sauron>
 <5640A7D0.6080104@writesys.com.br>
Date: Wed, 18 Nov 2015 21:01:29 +0100
Message-ID: <CAFLxGvwZ0gXkGHDu5fGo5ZX-td2rk1Wt=pHZBH+a_gp-PgyN=g@mail.gmail.com>
Subject: Re: can't mount ubifs after resizing with ubirsvol
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Ibrahim Mattus Neto <ibrahim.neto@writesys.com.br>
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

On Mon, Nov 9, 2015 at 3:04 PM, Ibrahim Mattus Neto
<ibrahim.neto@writesys.com.br> wrote:
> Hi!
>
> I am having problems resizing a ubifs volume, I used the command ubirsvol
> (version: 1.5.1) but when I try mounting it I get the following error:
>
> [ 8840.450000] UBIFS error (ubi0:1 pid 720): validate_sb: bad LEB count: 413
> in superblock, 331 on UBI volume, 19 minimum required
> [ 8840.460000] UBIFS error (ubi0:1 pid 720): validate_sb: bad superblock,
> error 1
> [ 8840.470000]  magic          0x6101831
> [ 8840.480000]  crc            0x539e8e1c
> [ 8840.480000]  node_type      6 (superblock node)
> [ 8840.480000]  group_type     0 (no node group)
> [ 8840.490000]  sqnum          1
> [ 8840.490000]  len            4096
> [ 8840.490000]  key_hash       0 (R5)
> [ 8840.500000]  key_fmt        0 (simple)
> [ 8840.500000]  flags          0x0
> [ 8840.500000]  big_lpt        0
> [ 8840.510000]  space_fixup    0
> [ 8840.510000]  min_io_size    2048
> [ 8840.510000]  leb_size       126976
> [ 8840.520000]  leb_cnt        413
> [ 8840.520000]  max_leb_cnt    413
> [ 8840.520000]  max_bud_bytes  2158592
> [ 8840.530000]  log_lebs       3
> [ 8840.530000]  lpt_lebs       2
> [ 8840.530000]  orph_lebs      2
> [ 8840.540000]  jhead_cnt      1
> [ 8840.540000]  fanout         8
> [ 8840.540000]  lsave_cnt      256
> [ 8840.540000]  default_compr  1
> [ 8840.550000]  rp_size        2558566
> [ 8840.550000]  rp_uid         0
> [ 8840.550000]  rp_gid         0
> [ 8840.560000]  fmt_version    4
> [ 8840.560000]  time_gran      1000000000
> [ 8840.560000]  UUID           B1F16610-EEDF-471F-B5AD-279F21C00729
> mount: mounting ubi0:recover on /recover failed: Invalid argument
>
> I was reading through the archives and found a similar issue but no
> solution, is there a way to shrink a volume?
>
> I was thinking about changing the LEB count inside the superblock but I
> didn't know how to (and thought it would be too risky)

Please more details. :)
What exactly did you do?

-- 
Thanks,
//richard

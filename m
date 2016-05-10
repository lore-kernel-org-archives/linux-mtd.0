Received: from mail-oi0-x234.google.com ([2607:f8b0:4003:c06::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b08Bz-00064g-SQ
 for linux-mtd@lists.infradead.org; Tue, 10 May 2016 13:59:20 +0000
Received: by mail-oi0-x234.google.com with SMTP id x19so16532986oix.2
 for <linux-mtd@lists.infradead.org>; Tue, 10 May 2016 06:58:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160510122343.GB16841@visteon-gnana>
References: <20160510122343.GB16841@visteon-gnana>
Date: Tue, 10 May 2016 15:58:58 +0200
Message-ID: <CAFLxGvwmCywSV7G50Wvn6X6tGUnbvDUJa=iZncUAfAer7qtojQ@mail.gmail.com>
Subject: Re: UBIFS Index Node Corruption - Invalid Key Type
From: Richard Weinberger <richard.weinberger@gmail.com>
To: "DHANAPAL, GNANACHANDRAN (G.)" <gdhanapa@visteon.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "CN, Aananth (A.A.)" <caananth@visteon.com>,
 "Gunasundar, Balamanikandan (B.)" <bgunasun@visteon.com>, "Babu,
 Viswanathan (V.)" <vbabu3@visteon.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>,
 "gnanachandran@gmail.com" <gnanachandran@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 10, 2016 at 2:14 PM, DHANAPAL, GNANACHANDRAN (G.)
<gdhanapa@visteon.com> wrote:
> Hi There,
>
> We have i.MX6d based platform that has FSL BSP 3.10.17 running.
> There is SLC Micron NAND of size 2GB with 512K Block size and 4K min I/O  used
> for software storage. This NAND has got 7 partitions, Among that two partitions
> have Read-Write ubifs file system for runtime data and one has Read-only ubifs
> file system that has all the system files. Recently we have observed a issue that
> one of RW ubifs partition failed to mount due to invalid key type in one of index
> node in ubifs. we have seen the same issue in two units out of 1000 units running
> in the field.
>
> Following is the index node that has  invalid key in its first branch.
> key type = 0xa917dd4c >> 29 = 5 (invalid key)
>
>         magic          0x6101831
>         crc            0x944add59
>         node_type      9 (indexing node)
>         group_type     0 (no node group)
>         sqnum          378678
>         len            148
>         child_cnt      6
>         level          2
>         Branches:
>         0: LEB 569:280144 len 108 key (bad key type: 0x000001, 0xa917dd4c)
>         1: LEB 446:349792 len 108 key (5595, inode)
>         2: LEB 584:361528 len 108 key (5822, inode)
>         3: LEB 602:255360 len 108 key (6050, inode)
>         4: LEB 613:480280 len 188 key (6258, inode)
>         5: LEB 614:373784 len 88 key (6521, data, 25)
>
> Please help us to understand following points
>
>         1. Did this happen because abrupt power cut ? if so, how could CRC of the node still be intact?
>         2. Could there be any bit flip ? but still again CRC intact.
>         3. Would the key pointed by  corrupted branch be  UBIFS_DENT_KEY or  UBIFS_XENT_KEY ?
>                 Because  29 bit of key[0] (0xa917dd4c  & 0x1FFFFFFF) seems to have some kind of  hash value.
>                 but node (at leb 569:280144)  that is pointed by corrupted branch seem to be index node.
>         4. This corrupted entry is always seen  in first branch of an index node  in two failed units. Could there be reason?
>         5. Since CRC is intact, would there be any possibility or scenario that corrupted node can be written with valid CRC?

Hmm, this looks like some UBIFS inconsistency.
If the header CRC is correct it should be be any kind of bitflip or
power cut issue.

Can you please share the whole UBI image (a nanddump) such that I can
inspect it?

-- 
Thanks,
//richard

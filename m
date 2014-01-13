Received: from mail-lb0-x230.google.com ([2a00:1450:4010:c04::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W2k5A-00045M-Ld
 for linux-mtd@lists.infradead.org; Mon, 13 Jan 2014 16:09:45 +0000
Received: by mail-lb0-f176.google.com with SMTP id l4so5393273lbv.21
 for <linux-mtd@lists.infradead.org>; Mon, 13 Jan 2014 08:09:20 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA6120D@DBDE04.ent.ti.com>
References: <20980858CB6D3A4BAE95CA194937D5E73EA6120D@DBDE04.ent.ti.com>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Mon, 13 Jan 2014 17:08:59 +0100
Message-ID: <CACQ1gAjpEfY7Rqfk6ysg2ddLy_9n2yf1F8o6C381S53rKJd+rQ@mail.gmail.com>
Subject: Re: UBI: calculation for max number of bad-blocks
To: "Gupta, Pekon" <pekon@ti.com>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2014/1/13 Gupta, Pekon <pekon@ti.com>:
> Hi Richard,
Hi !
>
> With reference to commit message:
>         commit ba4087e956d336488c6df9dfca65d1e70cf480f1
>         Author:     Richard Genoud <richard.genoud@gmail.com>
>         UBI: use the whole MTD device size to get bad_peb_limit
> -----------------
> " NAND flash manufacturers give a
>     minimum number of valid block (NVB) during the endurance life of the
>     device, e.g.:
>
>     Parameter             Symbol    Min    Max    Unit      Notes
>     --------------------------------------------------------------
>     Valid block number     NVB     1004    1024   Blocks     1
>
>     From this number we can deduce the maximum number of bad PEB that a device will
>     contain during its endurance life: a 128MiB NAND flash (1024 PEB) will not have
>     less than 20 bad blocks during the flash endurance life.
>
>     But the manufacturer doesn't tell where those bad block will appear. He doesn't
>     say either if they will be equally disposed on the whole device (and I'm pretty
>     sure they won't). So, according to the datasheets, we should reserve the
>     maximum number of bad PEB for each UBI device (worst case scenario: 20 bad
>     blocks appears on the smallest MTD partition).
>
>     So this patch make UBI use the whole MTD device size to calculate the maximum
>     bad expected eraseblocks.
>
>     The Kconfig option is in per1024 blocks, thus it can have a default value of 20
>     which is *very* common for NAND devices."
> -----------------
>
> I was not able to understand the need to do the convert
> Min.NVB (Minimum number of valid blocks) into a ratio of  'max_beb_per1024'.
> Can't we just use " Max(bad-blocks) = Max(NVB) - Min(NVB)" ?
> And make reserve_PEB > Max(bad-blocks) in UBI partitions, as all bad-blocks
> can appear together in same partition itself.
>
> with regards, pekon

Well, It's just to have a number independent from the flash size.
On the flash I'm currently working with, I've got:
Min(NVB) = 1008 and Max(NVB)=2048
Still, the kernel default config value of 20max_beb_per1024 is still correct.

regards,
Richard.

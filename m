Received: from mail-pg0-x22c.google.com ([2607:f8b0:400e:c05::22c])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1diezr-0002a5-WE
 for linux-mtd@lists.infradead.org; Fri, 18 Aug 2017 10:59:25 +0000
Received: by mail-pg0-x22c.google.com with SMTP id t80so34677902pgb.5
 for <linux-mtd@lists.infradead.org>; Fri, 18 Aug 2017 03:59:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <2d11efa2-dda2-7810-dd22-965b295bbff9@nod.at>
References: <dbc5bc9f-6c38-a0c3-e776-050a70382814@rempel-privat.de>
 <20170802140642.kpsdh3jfow2azevm@pengutronix.de>
 <2d11efa2-dda2-7810-dd22-965b295bbff9@nod.at>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Fri, 18 Aug 2017 12:59:02 +0200
Message-ID: <CAFLxGvwK=J0zMyNa6zYG9jHXz3yTb_TFfEQBkMy0sqJyw7K73g@mail.gmail.com>
Subject: Re: "UBIFS error (pid 396): dbg_check_space_info: free space changed
 from" + ecryptfs
To: Richard Weinberger <richard@nod.at>
Cc: Oleksij Rempel <ore@pengutronix.de>, kernel@pengutronix.de,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Aug 6, 2017 at 11:25 AM, Richard Weinberger <richard@nod.at> wrote:
> Oleksij,
>
> Am 02.08.2017 um 16:06 schrieb Oleksij Rempel:
>> Hallo all,
>>
>> Initial issue was detected on kernel 4.0.9 and is still reproducible
>> with same kernel version + most of back ported ubi/ubifs patches till
>> the kernel v4.12. UBIfs encryption patches was not backported.
>>
>> To reproduce it I needed:
>> - system with fresh flashed ubi image.
>> - on first start it should run following script:
>>> mount -o remount,rw /
>>> mount -t ecryptfs ... /dst
>>> ... do some work and mv some files to /dst
>>> umount /dst
>>> mount -o remount,ro / <--  UBIFS error (pid 396): dbg_check_space_info:
>
> Does this also happen on mainline?
> Also please try in nandsim to rule out chip specific issues.
>
> Can you please share the ecryptfs configuration?
> i.e. are file names encrypted or not?

Ping?

-- 
Thanks,
//richard

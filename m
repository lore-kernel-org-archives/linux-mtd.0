Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dje4B-0007VH-0H
 for linux-mtd@lists.infradead.org; Mon, 21 Aug 2017 04:11:57 +0000
Subject: Re: "UBIFS error (pid 396): dbg_check_space_info: free space changed
 from" + ecryptfs
To: Richard Weinberger <richard.weinberger@gmail.com>,
 Richard Weinberger <richard@nod.at>
Cc: kernel@pengutronix.de,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <dbc5bc9f-6c38-a0c3-e776-050a70382814@rempel-privat.de>
 <20170802140642.kpsdh3jfow2azevm@pengutronix.de>
 <2d11efa2-dda2-7810-dd22-965b295bbff9@nod.at>
 <CAFLxGvwK=J0zMyNa6zYG9jHXz3yTb_TFfEQBkMy0sqJyw7K73g@mail.gmail.com>
From: Oleksij Rempel <ore@pengutronix.de>
Message-ID: <7ba72b1b-faaf-a324-1b4b-934ec9f7cf81@pengutronix.de>
Date: Mon, 21 Aug 2017 06:11:27 +0200
MIME-Version: 1.0
In-Reply-To: <CAFLxGvwK=J0zMyNa6zYG9jHXz3yTb_TFfEQBkMy0sqJyw7K73g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On 18.08.2017 12:59, Richard Weinberger wrote:
> On Sun, Aug 6, 2017 at 11:25 AM, Richard Weinberger <richard@nod.at> wrote:
>> Oleksij,
>>
>> Am 02.08.2017 um 16:06 schrieb Oleksij Rempel:
>>> Hallo all,
>>>
>>> Initial issue was detected on kernel 4.0.9 and is still reproducible
>>> with same kernel version + most of back ported ubi/ubifs patches till
>>> the kernel v4.12. UBIfs encryption patches was not backported.
>>>
>>> To reproduce it I needed:
>>> - system with fresh flashed ubi image.
>>> - on first start it should run following script:
>>>> mount -o remount,rw /
>>>> mount -t ecryptfs ... /dst
>>>> ... do some work and mv some files to /dst
>>>> umount /dst
>>>> mount -o remount,ro / <--  UBIFS error (pid 396): dbg_check_space_info:
>>
>> Does this also happen on mainline?
>> Also please try in nandsim to rule out chip specific issues.
>>
>> Can you please share the ecryptfs configuration?
>> i.e. are file names encrypted or not?
> 
> Ping?

thank you for your attention. It is on TODO, just need a bit more time :)

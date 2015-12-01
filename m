Received: from mail-ig0-x22f.google.com ([2607:f8b0:4001:c05::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a3YfX-0007Lo-Nr
 for linux-mtd@lists.infradead.org; Tue, 01 Dec 2015 00:19:44 +0000
Received: by igbxm8 with SMTP id xm8so85793651igb.1
 for <linux-mtd@lists.infradead.org>; Mon, 30 Nov 2015 16:19:22 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20151201000923.GQ64635@google.com>
References: <1448519122-6259-1-git-send-email-mar.kolya@gmail.com>
 <20151130203518.GL64635@google.com>
 <CALGY4fv1rbzng+aUbevJQRwj5X0R3NmzZ0iXz5ZNXxya0Rx6zw@mail.gmail.com>
 <20151201000923.GQ64635@google.com>
Date: Mon, 30 Nov 2015 19:19:22 -0500
Message-ID: <CALGY4ftNVdGs_fYQAeCWe5_NUOTh7d8T5TGvEtbjeHXhs9VKdA@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: Fix Spansion sparearea size detection
From: Nikolay Martynov <mar.kolya@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi.

  I'm using mt7621 board, so this would be mtk_nand with matches from openwrt.

2015-11-30 19:09 GMT-05:00 Brian Norris <computersforpeace@gmail.com>:
> Hi Nikolay,
>
> On Mon, Nov 30, 2015 at 06:59:32PM -0500, Nikolay Martynov wrote:
>>   I'm sorry, I only have board with S34ML02G2 and I've tested by
>> change on it - it works fine. But unfortunately I do not have any way
>> to test S34ML01G2.
>>   It looks like that logic can be simplified if just check id_data[1]
>> is one of 0xda, 0xdc, 0xca, 0xcc - this should be safer option.
>
> Possibly safer, but it's uglier, and I'd like not to have to make this
> change at all, if ONFI can help it.
>
>>   I'm sorry, I'm very new to all this. This patch made kernel boot on
>> a board that I have. The kernel was 'oldish' - 3.18. So I'm not sure
>> why ONFI is not used here, I will see if I can figure it out.
>
> What NAND driver are you using? It's possible that it doesn't support
> the PARAMETER READ command properly. If so, it'd be better to fix that
> than to clutter the NAND core.
>
> Regards,
> Brian



-- 
Martynov Nikolay.
Email: mar.kolya@gmail.com

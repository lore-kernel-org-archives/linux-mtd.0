Received: from mail-oi0-x22c.google.com ([2607:f8b0:4003:c06::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZiRHB-0003bE-4Z
 for linux-mtd@lists.infradead.org; Sat, 03 Oct 2015 18:11:18 +0000
Received: by oibi136 with SMTP id i136so73222706oib.3
 for <linux-mtd@lists.infradead.org>; Sat, 03 Oct 2015 11:10:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150929013526.GW31505@google.com>
References: <1435912576-27878-1-git-send-email-richard@nod.at>
 <1435912576-27878-3-git-send-email-richard@nod.at>
 <20150929013526.GW31505@google.com>
Date: Sat, 3 Oct 2015 20:10:55 +0200
Message-ID: <CAFLxGvx7uBNz641f80bnpvzDcUWsd+MBHRY2ZdGyfvVZOx5whQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] UBI: Fix debug message
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Sep 29, 2015 at 3:35 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> Digging through some old stuff:
>
> On Fri, Jul 03, 2015 at 10:36:16AM +0200, Richard Weinberger wrote:
>> We have to use j instead of i. i is the volume id
>> and not the block.
>>
>> Reported-by: Alexander.Block@continental-corporation.com
>> Signed-off-by: Richard Weinberger <richard@nod.at>
>
> Acked-by: Brian Norris <computersforpeace@gmail.com>

Applied.

-- 
Thanks,
//richard

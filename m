MIME-Version: 1.0
In-Reply-To: <1342471797.25411.31.camel@shinybook.infradead.org>
References: <1341303873-23040-1-git-send-email-b32955@freescale.com>
 <1341303873-23040-2-git-send-email-b32955@freescale.com>
 <1342471797.25411.31.camel@shinybook.infradead.org>
Date: Tue, 17 Jul 2012 11:28:32 +0800
Message-ID: <CAMiH66F5vzEio_tPdORnZ44CwN47arHhyi7jyX_1mEA1=6HQKg@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: gpmi: update the bitflip_threshold
From: Huang Shijie <shijie8@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Cc: Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 17, 2012 at 4:49 AM, David Woodhouse <dwmw2@infradead.org> wrote:
> On Tue, 2012-07-03 at 16:24 +0800, Huang Shijie wrote:
>> The origin code misses to update the bitflip_threshold when
>> we have already get the right ecc_strength.
>>
>> The patch fixes it.
>>
>> Signed-off-by: Huang Shijie <b32955@freescale.com>
>
> Should we be pushing this for 3.5?
>
I think it's not needed to push this patch for 3.5.

It's okay to merge it in 3.6.


thanks
Huang Shijie

> --
> dwmw2
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>

Message-ID: <4FC33C6A.4070104@atmel.com>
Date: Mon, 28 May 2012 16:50:50 +0800
From: Josh Wu <josh.wu@atmel.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v9 1/3] MTD: at91: extract hw ecc initialization to one
 function and use relaxed read/write
References: <1338038677-6752-1-git-send-email-josh.wu@atmel.com>
 <1338038677-6752-2-git-send-email-josh.wu@atmel.com>
 <1338122668.19389.4.camel@koala>
In-Reply-To: <1338122668.19389.4.camel@koala>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: hongxu.cn@gmail.com, nicolas.ferre@atmel.com, linux-mtd@lists.infradead.org,
 ivan.djelic@parrot.com, plagnioj@jcrosoft.com,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5/27/2012 8:44 PM, Artem Bityutskiy wrote:
> On Sat, 2012-05-26 at 21:24 +0800, Josh Wu wrote:
>> use _relaxed read/write in most place. And use writel in operations of Control Register since it needs memory barrier.
>>
>> Signed-off-by: Hong Xu<hong.xu@atmel.com>
>> Signed-off-by: Josh Wu<josh.wu@atmel.com>
> This should be split on 2 or even 3 parts:
>
> 1. You move definitions and things around.
> 2. You separate out the init stuff into a function
> 3. You start using _relaxed helpers.
>
> And you should provide better commit messages. You should explain why
> you do things - just cleanup? improvement? fix? preparation for
> something?

My goal here is to prepare for the PMECC support.
    Point 1 is consistent for the later PMECC patch.
    Point 2 is prepare for PMECC support.

So I think I will not add the _relaxed helpers for HW ECC operation in 
this patch series. Since that is out of the goal of this patch series.

>
> I think this patch is too big, commit message is poor, patch does more
> things than documented in the commit message.
>

Indeed the commit message is poor. I will fix it.

Best Regards,
Josh Wu

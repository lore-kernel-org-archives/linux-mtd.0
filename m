Received: from mail-gh0-f177.google.com ([209.85.160.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SpjnS-0006Tm-Sg
 for linux-mtd@lists.infradead.org; Fri, 13 Jul 2012 17:36:55 +0000
Received: by mail-gh0-f177.google.com with SMTP id f11so4177666ghb.36
 for <linux-mtd@lists.infradead.org>; Fri, 13 Jul 2012 10:36:54 -0700 (PDT)
Message-ID: <50005C5B.2010004@gmail.com>
Date: Fri, 13 Jul 2012 14:35:23 -0300
From: "William F." <william76.sh@gmail.com>
MIME-Version: 1.0
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] mtd: add a new macro about the subpage write (REPORT SPAM)
References: <1341293533-2214-1-git-send-email-b32955@freescale.com>
 <201207131853.46136.marex@denx.de>
 <CAN8TOE_XF=ou5Nb9ErNhVM4TRHkAitAjGbien5xZTGz_sZZFUA@mail.gmail.com>
 <201207131910.35337.marex@denx.de>
In-Reply-To: <201207131910.35337.marex@denx.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: dedekind1@gmail.com, Jan Weitzel <j.weitzel@phytec.de>,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Scott Wood <scottwood@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>, Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Em 13-07-2012 14:10, Marek Vasut escreveu:
> Dear Brian Norris,
>
>> On Fri, Jul 13, 2012 at 9:53 AM, Marek Vasut<marex@denx.de>  wrote:
>>>> On 07/13/2012 11:08 AM, Huang Shijie wrote:
>>>>> On Fri, Jul 13, 2012 at 11:40 AM, Marek Vasut<marex@denx.de>  wrote:
>>>>>> Why not remove the mask?
>>>>> I do not understand why this line was added here,  was it added on
>>>>> purpose? so I am not sure whether we can just remove this line.
>>>> If whoever wanted that line to be there cared enough, they could have
>>>> justified it with a comment (in the code, in the changelog, or in one of
>>>> these threads).  We can't just let cruft sit there (or worse, produce
>>>> more cruft to work around existing cruft) just because we don't know
>>>> exactly what the original author was thinking.  It appears to just have
>>>> been a misguided attempt at enforcing any given option to come from only
>>>> one place.
>>> I think it was there to allow having two different chips on the same NAND
>>> bus ... or something. But this is just a guess. Anyway, it proved
>>> irrelevant, so let's drop it.
>> I agree. Then review/test/ack my patch that I just sent :)
> It's in the queue, as I'm really interested to see this finally fixed.
>
>> Brian
> Best regards,
> Marek Vasut
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>

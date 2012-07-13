Received: from va3ehsobe005.messaging.microsoft.com ([216.32.180.31]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Spiky-0008PU-AT
 for linux-mtd@lists.infradead.org; Fri, 13 Jul 2012 16:30:17 +0000
Message-ID: <50004D06.10303@freescale.com>
Date: Fri, 13 Jul 2012 11:29:58 -0500
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: Huang Shijie <shijie8@gmail.com>
Subject: Re: [PATCH] mtd: add a new macro about the subpage write
References: <1341293533-2214-1-git-send-email-b32955@freescale.com>
 <201207131235.43633.marex@denx.de>
 <CAMiH66GzmAJV+GfeuaigakiAFPB2gvzQaLd47yLcrz9dht3pLA@mail.gmail.com>
 <201207131740.10668.marex@denx.de>
 <CAMiH66FNn3YrqiCdYj7aAP8qR3VtH5r7q4Gza=0=vQtOoj_5bw@mail.gmail.com>
In-Reply-To: <CAMiH66FNn3YrqiCdYj7aAP8qR3VtH5r7q4Gza=0=vQtOoj_5bw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: Marek Vasut <marex@denx.de>, dedekind1@gmail.com,
 Jan Weitzel <j.weitzel@phytec.de>, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07/13/2012 11:08 AM, Huang Shijie wrote:
> On Fri, Jul 13, 2012 at 11:40 AM, Marek Vasut <marex@denx.de> wrote:
>> Dear Huang Shijie,
>>
>>> On Fri, Jul 13, 2012 at 6:35 AM, Marek Vasut <marex@denx.de> wrote:
>>>> Dear Huang Shijie,
>>>>
>>>>> Hi Brian:
>>>>>> Wood [1]; I don't see a good reason not to just kill the
>>>>>> NAND_CHIPOPTIONS_MSK instead of adding more flags. As long as we
>>>>>> perform a few sanity tests, I think it'd be safe.
>>>>>
>>>>> I think it's more clear in logic to add this new macro:
>>>>>     The NAND_NO_SUBPAGE_WRITE can be used only by the MLC nands which do
>>>>>
>>>>> no support the subpage write;
>>>>>
>>>>>     The NAND_CONTROLLER_NO_SUBPAGE_WRITE only used by the nand
>>>>>
>>>>> controller such as gpmi nand.
>>>>
>>>> It's not clearer at all. It's just more error-prone.
>>>
>>> ok, thanks. But I do not how to fix it now. I hope some one could give a
>>> patch.
>>
>> Why not remove the mask?
>>
> 
> I do not understand why this line was added here,  was it added on purpose?
> so I am not sure whether we can just remove this line.

If whoever wanted that line to be there cared enough, they could have
justified it with a comment (in the code, in the changelog, or in one of
these threads).  We can't just let cruft sit there (or worse, produce
more cruft to work around existing cruft) just because we don't know
exactly what the original author was thinking.  It appears to just have
been a misguided attempt at enforcing any given option to come from only
one place.

-Scott

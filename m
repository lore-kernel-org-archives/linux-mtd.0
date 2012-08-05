Message-ID: <501E516F.2020507@gmail.com>
Date: Sun, 05 Aug 2012 12:56:47 +0200
From: Dirk Behme <dirk.behme@gmail.com>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] mtd: mxc_nand: Fix compiler warnings
References: <1343466310-14584-1-git-send-email-dirk.behme@gmail.com>
 <20120730073454.GI1528@pengutronix.de> <501D4405.6030900@googlemail.com>
 <20120805083926.GL2626@pengutronix.de>
In-Reply-To: <20120805083926.GL2626@pengutronix.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, shawn.guo@linaro.org, shijie8@gmail.com,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05.08.2012 10:39, Uwe Kleine-König wrote:
> On Sat, Aug 04, 2012 at 05:47:17PM +0200, Dirk Behme wrote:
>> On 30.07.2012 09:34, Uwe Kleine-König wrote:
>>> Hello,
>>>
>>> On Sat, Jul 28, 2012 at 11:05:10AM +0200, Dirk Behme wrote:
>>>> From: Dirk Behme<dirk.behme@googlemail.com>
>>>>
>>>> Fix the compiler warnings
>>>>
>>>> drivers/mtd/nand/mxc_nand.c:1267: warning: initialization discards qualifiers from pointer target type
>>>> drivers/mtd/nand/mxc_nand.c:1270: warning: initialization discards qualifiers from pointer target type
>>>> drivers/mtd/nand/mxc_nand.c:1273: warning: initialization discards qualifiers from pointer target type
>>>> drivers/mtd/nand/mxc_nand.c:1276: warning: initialization discards qualifiers from pointer target type
>>> These should be gone in next already.
>>
>> Hmm, which next?
>>
>> I tried linux-next [1] from today (next-20120803, 55fa9961f) and still get
> next-20120725 contained 98d7bbb9929bcc14e11ac8a55245a4f2dc174e17, don't
> konw why it isn't included in the newer next snapshorts.

First, yes, it was part of next-20120725. Second, I can confirm that 
the patch [1] fixes the compiler warnings I reported above. So my 
patch is obsolete now.

And third, strange is the absence in next-20120803 and 3.6-rc1. Do we 
a chance to find out what's ongoing here? It would be a shame if your 
patch get lost.

Many thanks

Dirk


[1] https://patchwork.kernel.org/patch/1226851/

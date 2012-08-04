Message-ID: <501D4405.6030900@googlemail.com>
Date: Sat, 04 Aug 2012 17:47:17 +0200
From: Dirk Behme <dirk.behme@gmail.com>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] mtd: mxc_nand: Fix compiler warnings
References: <1343466310-14584-1-git-send-email-dirk.behme@gmail.com>
 <20120730073454.GI1528@pengutronix.de>
In-Reply-To: <20120730073454.GI1528@pengutronix.de>
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

On 30.07.2012 09:34, Uwe Kleine-König wrote:
> Hello,
>
> On Sat, Jul 28, 2012 at 11:05:10AM +0200, Dirk Behme wrote:
>> From: Dirk Behme<dirk.behme@googlemail.com>
>>
>> Fix the compiler warnings
>>
>> drivers/mtd/nand/mxc_nand.c:1267: warning: initialization discards qualifiers from pointer target type
>> drivers/mtd/nand/mxc_nand.c:1270: warning: initialization discards qualifiers from pointer target type
>> drivers/mtd/nand/mxc_nand.c:1273: warning: initialization discards qualifiers from pointer target type
>> drivers/mtd/nand/mxc_nand.c:1276: warning: initialization discards qualifiers from pointer target type
> These should be gone in next already.

Hmm, which next?

I tried linux-next [1] from today (next-20120803, 55fa9961f) and still get

 > make drivers/mtd/nand/
...
  CC      drivers/mtd/nand/mxc_nand.o 

drivers/mtd/nand/mxc_nand.c:1298: warning: initialization discards 
qualifiers from pointer target type
drivers/mtd/nand/mxc_nand.c:1301: warning: initialization discards 
qualifiers from pointer target type
drivers/mtd/nand/mxc_nand.c:1304: warning: initialization discards 
qualifiers from pointer target type
drivers/mtd/nand/mxc_nand.c:1307: warning: initialization discards 
qualifiers from pointer target type
drivers/mtd/nand/mxc_nand.c:1310: warning: initialization discards 
qualifiers from pointer target type
   CC      drivers/mtd/nand/gpmi-nand/gpmi-nand.o
...

Sorry if I missed something ;)

Best regards

Dirk

[1] 
http://git.kernel.org/?p=linux/kernel/git/next/linux-next.git;a=shortlog;h=refs/heads/master

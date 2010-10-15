Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P6q3H-0007EY-5G
	for linux-mtd@lists.infradead.org; Fri, 15 Oct 2010 19:34:52 +0000
Message-ID: <4CB8ACD7.6070206@eukrea.com>
Date: Fri, 15 Oct 2010 21:34:47 +0200
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: mxc_nand: do not depend on disabling the irq in
	the interrupt handler
References: <1285054802-21388-1-git-send-email-s.hauer@pengutronix.de>	<1285054802-21388-2-git-send-email-s.hauer@pengutronix.de>
	<1285240612.29268.76.camel@localhost>
In-Reply-To: <1285240612.29268.76.camel@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org,
	dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,

Le 23/09/2010 13:16, Artem Bityutskiy a écrit :
> On Tue, 2010-09-21 at 09:40 +0200, Sascha Hauer wrote:
>> This patch reverts the driver to enabling/disabling the NFC interrupt
>> mask rather than enabling/disabling the system interrupt. This cleans
>> up the driver so that it doesn't rely on interrupts being disabled
>> within the interrupt handler.
>> For i.MX21 we keep the current behaviour, that is calling
>> enable_irq/disable_irq_nosync to enable/disable interrupts.
>> This patch is based on earlier work by John Ogness.
>>
>> Signed-off-by: Sascha Hauer<s.hauer@pengutronix.de>
>> Acked-by: John Ogness<john.ogness@linutronix.de>
>> Tested-by: John Ogness<john.ogness@linutronix.de>
>
> I've created l2-mtd-2.6.git/for-2.6.36 branch, pushed your patch there,
> pinged dwmw2 for you. I do not give you any guarantees this will reach
> 2.6.36, you have to ping dwmw2.
>
Would that be possible to merge Artem's l2-mtd-2.6.git/for-2.6.36 branch for 
2.6.36 (or at least cherry-pick 34e15930f2c322389d4f946bf891601a2d1e4280 from 
this branch) ? Without it mxc-nand is broken in 2.6.36.

Many thanks
Eric

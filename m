Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by bombadil.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P1Ogw-0007xl-K8
	for linux-mtd@lists.infradead.org; Thu, 30 Sep 2010 19:21:19 +0000
Message-ID: <4CA4E327.6090505@eukrea.com>
Date: Thu, 30 Sep 2010 21:21:11 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
MIME-Version: 1.0
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH] mtd: mxc_nand: do not depend on disabling the irq in
	the interrupt handler
References: <1285054802-21388-1-git-send-email-s.hauer@pengutronix.de>	<1285054802-21388-2-git-send-email-s.hauer@pengutronix.de>	<1285240612.29268.76.camel@localhost>
	<20100929072843.GC23406@pengutronix.de>
In-Reply-To: <20100929072843.GC23406@pengutronix.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 29/09/2010 09:28, Sascha Hauer a écrit :
> David,
>
> On Thu, Sep 23, 2010 at 02:16:52PM +0300, Artem Bityutskiy wrote:
>> On Tue, 2010-09-21 at 09:40 +0200, Sascha Hauer wrote:
>>> This patch reverts the driver to enabling/disabling the NFC interrupt
>>> mask rather than enabling/disabling the system interrupt. This cleans
>>> up the driver so that it doesn't rely on interrupts being disabled
>>> within the interrupt handler.
>>> For i.MX21 we keep the current behaviour, that is calling
>>> enable_irq/disable_irq_nosync to enable/disable interrupts.
>>> This patch is based on earlier work by John Ogness.
>>>
>>> Signed-off-by: Sascha Hauer<s.hauer@pengutronix.de>
>>> Acked-by: John Ogness<john.ogness@linutronix.de>
>>> Tested-by: John Ogness<john.ogness@linutronix.de>
>>
>> I've created l2-mtd-2.6.git/for-2.6.36 branch, pushed your patch there,
>> pinged dwmw2 for you. I do not give you any guarantees this will reach
>> 2.6.36, you have to ping dwmw2.
>
> Any chance to get this in? The mxc-nand driver is nonfunctional at the
> moment and 2.6.36 is getting closer.
>
Acked-by: Eric Bénard <eric@eukrea.com>
Tested-by: Eric B2nard <eric@eukrea.com>

Eric

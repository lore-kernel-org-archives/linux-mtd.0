Received: from smtp05.smtpout.orange.fr ([80.12.242.127]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YO7Cd-0001Xa-JQ
 for linux-mtd@lists.infradead.org; Wed, 18 Feb 2015 16:10:20 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH] mtd: pxa3xx-nand: handle PIO in threaded interrupt
References: <1424203617-29431-1-git-send-email-robert.jarzmik@free.fr>
 <54E47ABF.8070306@free-electrons.com>
Date: Wed, 18 Feb 2015 17:09:52 +0100
In-Reply-To: <54E47ABF.8070306@free-electrons.com> (Ezequiel Garcia's message
 of "Wed, 18 Feb 2015 08:42:55 -0300")
Message-ID: <8738639p67.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ezequiel Garcia <ezequiel.garcia@free-electrons.com> writes:

>> +static irqreturn_t pxa3xx_nand_irq_thread(int irq, void *data)
>> +{
>> +	struct pxa3xx_nand_info *info = data;
>> +
>> +	handle_data_pio(info);
>> +
>> +	info->state = STATE_CMD_DONE;
>
> Are you sure you need to set the state here?
Euh no, I'm not. I made it to be symmetric with dma_complete_func(). If it's not
needed, why is it needed in dma_complete_func() ?

Cheers.

-- 
Robert

From: "Kyungmin Park" <kmpark@infradead.org>
To: "'Pete MacKay'" <linux@architechnical.net>, <linux-mtd@lists.infradead.org>
References: <33135.69.30.123.186.1175908894.squirrel@architechnical.net>
Subject: RE: OneNAND IRQ usage?
Date: Mon, 9 Apr 2007 16:50:55 +0900
Message-ID: <009c01c77a7b$d31bf7a0$c7a3580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
In-reply-to: <33135.69.30.123.186.1175908894.squirrel@architechnical.net>
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> 
> We've dedicated a GPIO line on the PXA-270 to monitor the INT 
> line of a 1G
> OneNAND.  Using an IRQ resource and the "generic platform 
> support" I was
> able to get the OneNAND driver to request the IRQ, but the 
> interrupt was
> not being handled and the driver reverted to polling.  I was 
> able to get
> this to work by changing the IRQF_SHARED flag to 
> IRQF_TRIGGER_FALLING. 
> Should onenand_base.c be patched or am I mapping it to the platform
> improperly?
> 

You should put the proper interrupt trigger type in platform file.
In my board, it's rising. why don't you try to change from falling to rising?
I think it's reasonable to use the rising trigger.

see http://lists.infradead.org/pipermail/linux-mtd/2006-November/016708.html

+static inline void __init apollon_init_flash(void)
+{
+	if (omap_request_gpio(APOLLON_FLASH_GPIO_IRQ) < 0) {
+		printk(KERN_ERR "Failed to request GPIO%d for onenand IRQ\n",
+			APOLLON_FLASH_GPIO_IRQ);
+		return;
+	}
+	omap_set_gpio_direction(APOLLON_FLASH_GPIO_IRQ, 1);
+	set_irq_type(OMAP_GPIO_IRQ(APOLLON_FLASH_GPIO_IRQ), IRQT_RISING);
+}

The current interrupt wait use all operations. but in practice it's better to
use the polling method in READ case.

Refer to OMAP2 specific implmentation. it uses the memcpy in case READ,
otherwise interrupt and DMA.
http://source.mvista.com/git/gitweb.cgi?p=linux-omap-
2.6.git;a=commitdiff;h=d11289c48a19dd7f976c4ccf7c5bef634a82e9f2;hp=8321a57ca4cdd
547e975fd2c66ae0f8a6a7452f8

Thank you,
Kyungmin Park

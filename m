Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HiR30-0001FC-DG
	for linux-mtd@lists.infradead.org; Mon, 30 Apr 2007 04:15:52 -0400
Subject: Re: [PATH] NAND Flash support for Intel IXP4xx platform
From: Thomas Gleixner <tglx@linutronix.de>
To: "Ruslan V. Sushko" <rsushko@ru.mvista.com>
In-Reply-To: <46359C8A.4040306@ru.mvista.com>
References: <463332F9.9040105@ru.mvista.com>
	<1177763736.7646.149.camel@localhost.localdomain>
	<46334F28.70506@ru.mvista.com>
	<1177794151.7646.312.camel@localhost.localdomain>
	<46359C8A.4040306@ru.mvista.com>
Content-Type: text/plain
Date: Mon, 30 Apr 2007 10:17:56 +0200
Message-Id: <1177921076.5791.189.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ruslan,

Can you please read, understand and comply with
http://www.infradead.org/~dwmw2/email.html

On Mon, 2007-04-30 at 11:36 +0400, Ruslan V. Sushko wrote:
> Thomas,
>
> I have tried to fit driver's functionality into common platform 
> structures. Unfortunately the device hasn't NAND controller and some 
> signals (ALE/CLE(pins on data bus) and CS(gpio)) are driven in custom 
> way. Current platform structures have not enough fields to carry 
> platform dependent data for this driver without hack (I guess use fields 
> not used in driver but designed for other things is not good idea). 
> Additionally due to device haven't NAND controller future version of 
> board may change the way which is used to drive CS signal, 

I really do not understand what you are talking about. There is no need
for extra fields and no need for hacks at all.

A generic platform driver, which can be used for any board with a
similar simple interface structure as yours, is just a basic interface
to the nand driver and provides common code like initialization, .....

The platform dependent code (in arch/whatever) has the hardware
dependent functions, which are given via the platform mechanism to the
generic platform driver:

struct platform_nand_ctrl {
        void            (*hwcontrol)(struct mtd_info *mtd, int cmd);
        int             (*dev_ready)(struct mtd_info *mtd);
        void            (*select_chip)(struct mtd_info *mtd, int chip);
        void            *priv;
};

It does not matter whether your board has a special NAND controller or
not. A GPIO based interface fits into this as well, simply because it is
the hardware interface, which controls the NAND flash.

> So I move 
> this functionality completely to hardware dependent part of driver (sent 
> to LAKML)

Sigh. You need a platform driver in drivers/mtd/nand first to move
anything related to nand into your arch code.

	tglx

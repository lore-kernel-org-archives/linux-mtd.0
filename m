Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D15uT-0004Ln-JP
	for linux-mtd@lists.infradead.org; Tue, 15 Feb 2005 11:50:50 -0500
Date: Tue, 15 Feb 2005 17:50:48 +0100
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050215165048.GE831@synertronixx3>
References: <20050215154819.GB831@synertronixx3>
	<Pine.LNX.4.61.0502151055150.27338@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.61.0502151055150.27338@localhost.localdomain>
Subject: Re: XIP aware file system
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

You got it!

Finally I considered the OSCR running at 3.6MHz and did

#define xip_elapsed_since(x)    (signed)((IMX_TCN(IMX_TIM1_BASE) - (x)) * 28)

i.e. 112/4. And it runs and does xip and I can write to flash.
Im not believing what I see...

Am 2005-02-15 11:38 -0500 schrieb Nicolas Pitre:

> I'm not sure if it is strictly necessary to use ICMR.  According to the 
> manual quoted above masked interrupts only update ICPR and not ICIP.  If 
> so the & with ICMR is redundent.

I think it is redundant but I don't know exactly the meaning of
ICMR|ICCR.

> If your time base runs at 32kHz you need:
> 
> #define xip_elapsed_since(x) (signed)((IMX_TCN(IMX_TIM1_BASE) - (x)) * 31)

Right. As said, I assumed OSCR runs 3.6MHz and came to * 28, but I
should do 112/3.6.
Thanks for your nice explanation.

> Where do you see that?

ARGH! It was mine! 

> Please study carefully xip_udelay() and try to understand _when_ it is 

Im trying hard :)

> Look at your xip_elasped_since() implementation.

All right, I did while you calculated the values for me :)

Thanks for your help, Konsti

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF

Received: from rt-soft-2.moscow.itn.ru ([80.240.96.70] helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E3Jzb-0003j8-8g
	for linux-mtd@lists.infradead.org; Thu, 11 Aug 2005 16:49:38 -0400
Message-ID: <42FBB9DD.2020907@ru.mvista.com>
Date: Fri, 12 Aug 2005 00:49:33 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <42FB5E72.2010402@ru.mvista.com> <42FBB3B1.2080609@mvista.com>
	<1123792307.23647.71.camel@tglx.tec.linutronix.de>
In-Reply-To: <1123792307.23647.71.camel@tglx.tec.linutronix.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: power management routines for NAND driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Thomas Gleixner wrote:

>On Thu, 2005-08-11 at 13:23 -0700, Todd Poynor wrote:
>
>  
>
>>Yes, the pm_send etc. APM-style calls are deprecated.  The Linux Driver 
>>Model PM hooks (incl. struct device_driver suspend/resume callbacks) are 
>>the way to do it now.  I floated a patch for another board in thread 
>>"MTD PM Resume" in July that does approximately what you're talking 
>>about, although calling existing Intel/Sharp CFI NOR flash routines.  If 
>>there's no objections to that style of PM support then I'll check it in.
>>    
>>
>
>I removed the pm_oldstyle stuff in mtdcore.c anyway. 
>
>Look at the SA1100 driver as reference. Thats the way to go.
>
>tglx
>
>  
>
That will require some extensions to nand_base.c. I'm planning to 
provide the corresponding patch shortly, if you don't mind.

Best regards,
   Vitaly

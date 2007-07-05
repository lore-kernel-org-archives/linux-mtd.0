Received: from elcamino.pasemi.com ([67.155.108.98])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I6VNT-0006J6-38
	for linux-mtd@lists.infradead.org; Thu, 05 Jul 2007 13:44:32 -0400
Message-ID: <468D2DF8.4050609@pasemi.com>
Date: Thu, 05 Jul 2007 10:44:24 -0700
From: "Egor N. Martovetsky" <egor@pasemi.com>
MIME-Version: 1.0
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] [2.6.23] nand_flash_dev - add manufacturer ID
References: <200707032354.l63Ns7gh010492@escobita.pasemi.com>	
	<1183507424.29081.73.camel@shinybook.infradead.org>
	<1183528554.3291.60.camel@chaos>
In-Reply-To: <1183528554.3291.60.camel@chaos>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: olof@lixom.net, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas Gleixner wrote:

>On Tue, 2007-07-03 at 20:03 -0400, David Woodhouse wrote:
>  
>
>>The difference between LP_OPTIONS and the options you've set for the new
>>chip is just NAND_NO_PADDING | NAND_COPYBACK, right? Neither of which we
>>actually use right now _anyway_.
>>    
>>
that's correct, and the flash works as things are - right now.  However, 
I didn't want to leave
it exposed for possible future addition of these features.

>>I wonder if we should do this differently, and mask certain features in
>>or out according to the manufacturer, after identifying the chip.
>>    
>>
>
>  
>
Right now, there is no way to uniquely identify the device and assign 
options to it.  I saw that
as a potential future problem.  Instead of adding code to 
nand_get_flash_type() to special treat
our device, I thought it would be better to provide a general mechanism, 
which can be used to prevent
this in the future.  This only affects the flashes that need to be 
special cased.  For the rest of them,
manufacturer ID is not specified and the match occurs purely on Device 
ID - as before.

>We do that already:
>
>        /* Check if chip is a not a samsung device. Do not clear the
>         * options for chips which are not having an extended id.
>         */
>        if (*maf_id != NAND_MFR_SAMSUNG && !type->pagesize)
>                chip->options &= ~NAND_SAMSUNG_LP_OPTIONS;
>
>So we should do this for that one as well.
>
>	tglx
>
>
>  
>


-- 
Egor N. Martovetsky

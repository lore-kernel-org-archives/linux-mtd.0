Received: from gateway-1237.mvista.com ([12.44.186.158] helo=hermes.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Ex9bn-0004RE-AI
	for linux-mtd@lists.infradead.org; Thu, 12 Jan 2006 16:03:48 -0500
Message-ID: <43C6C44F.8060100@mvista.com>
Date: Thu, 12 Jan 2006 13:04:15 -0800
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: James Hughes <JHughes@linx.co.uk>
References: <DB1B6B12D0E2F0469EB35A9586066B6ECE79AD@stivesemail.stives.linx.gbr>
	<6934efce0601121114v63ffb32brd20ced641161c3cf@mail.gmail.com>
In-Reply-To: <6934efce0601121114v63ffb32brd20ced641161c3cf@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: Trying to get MTD to do anything...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>> This function simply does the following :
>>
>>         return driver_register(&sandgate2_flash_driver);
>>
>> and a printk in the function does display.
>>
>> I am not sure what there is to fix. The driver gets registered, but probe is
>> never called. Its correctly added to the driver structure (in fact a direct
>> copy from the mainstone variant, but with name changes to match sandgate2) -
>> what else is there to debug?

Make sure the .name field of your struct device_driver exactly matches 
the .name field of your struct device that you (hopefully) registered in 
your board file (since you're using mainstone-flash as an example see 
arch/arm/mach-pxa/mainstone.c for the board device side of it).

If you think that's setup right then debug what's going on in 
drivers/base/platform.c: platform_match().


-- 
Todd

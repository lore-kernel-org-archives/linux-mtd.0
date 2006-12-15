Received: from deck1210.hostdeck.com ([212.39.12.10])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Gv7uj-0007CC-PM
	for linux-mtd@lists.infradead.org; Fri, 15 Dec 2006 02:55:34 -0500
Message-ID: <458254B0.6020802@fatti.com>
Date: Fri, 15 Dec 2006 08:54:24 +0100
From: Enrico Migliore <enrico.migliore@fatti.com>
MIME-Version: 1.0
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: Eraseblocks torture: OneNAND results
References: <24414989.16841166158970543.JavaMail.weblogic@ep_ml08>
In-Reply-To: <24414989.16841166158970543.JavaMail.weblogic@ep_ml08>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


>> FYI: now I see that the tortured eraseblocks do not contain all 0xFFs
>> after erase which is strange - the driver must have returned an error.
>> But mtd->erase is totally silent about this. Most probably it is a bug
>> in the OneNAND driver.
>>
>> May you please take a look at onenand_wait() from
>> drivers/mtd/onenand/onenand_base.c in mtd-2.6.git. I see the following
>> code there:
>>
>>     
Hi,

my name is Enrico, I'm new to this list and I've been reading the 
messages since the end of November.

I've recently read  the Micron's "TN-29-16 Boot from NAND..."  technical 
note and got puzzled by the following:

"Avoid excessive reads to the area of the NAND Flash where code is 
stored. When
repeated accesses are required, the code should be copied to the DRAM. 
This minimizes
the probability of read-disturb errors in the NAND Flash device."

Does that mean that excessive readings might compromise the integrity of 
NAND cells?

Enrico

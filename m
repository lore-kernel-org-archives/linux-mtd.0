Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ud4Bj-0004Bt-JW
 for linux-mtd@lists.infradead.org; Thu, 16 May 2013 19:50:08 +0000
Message-ID: <51953863.4080609@newsguy.com>
Date: Thu, 16 May 2013 12:49:55 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH] mtd: nand: docg4: add udelay(1) to polling loop
References: <1366654990-15392-1-git-send-email-mikedunn@newsguy.com>
 <1368690236.15764.178.camel@sauron.fi.intel.com>
In-Reply-To: <1368690236.15764.178.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/16/2013 12:43 AM, Artem Bityutskiy wrote:
> On Mon, 2013-04-22 at 11:23 -0700, Mike Dunn wrote:
>>  	timeo = 1000;
>>  	do {
>> +		udelay(1);
>>  		cpu_relax();
>>  		flash_status = readb(docptr + DOC_FLASHCONTROL);
>>  	} while (!(flash_status & DOC_CTRL_FLASHREADY) && --timeo);
> 
> How about using jiffies instead? Something like:
> 
> timeout = jiffies + msecs_to_jiffies(delay);
> do {
> } while (time_before(jiffies, timeout))
> 


This works too (just tested it).  But the reason I did not do this originally is
because the timeout is very short.  With udelay(1) and timeo=1000, the timeout
is 1ms (plus processing time), and I think this is well in excess of the actual
time needed by the hardware.  Using jiffies and with HZ=100, my minimum timeout
is 10ms.  But there's no harm in having an excessive timeout since it's a
busy-wait loop, so your suggestion is probably fine.

Is use of udelay() frowned upon?  Will using jiffies cause a problem with a
"tickless" configuration?  Hoping to learn something...

Thanks Artem!
Mike

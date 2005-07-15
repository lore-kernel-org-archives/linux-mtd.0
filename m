Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DtL5y-0001X6-MS
	for linux-mtd@lists.infradead.org; Fri, 15 Jul 2005 03:59:01 -0400
Message-ID: <42D76CB8.4050606@mvista.com>
Date: Fri, 15 Jul 2005 00:58:48 -0700
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <20050715031948.GA22659@slurryseal.ddns.mvista.com>
	<1121412168.24449.98.camel@tglx.tec.linutronix.de>
In-Reply-To: <1121412168.24449.98.camel@tglx.tec.linutronix.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: NAND bbt build reads wrong oob data
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas Gleixner wrote:
> On Thu, 2005-07-14 at 20:19 -0700, Todd Poynor wrote:
> 
>>The value read seems to be a different byte, perhaps offset 14 instead
>>of offset 5 as specified by the placement scheme.  The hack that seems
>>to fix it for me, namely to read the whole OOB area instead of the
>>individual byte, is below. 
> 
> 
> That's pretty strange. Which chip type are you using ? 

NAND device: Manufacturer ID: 0xec, Chip ID: 0x45 (Samsung NAND 32MiB
1,8V 16-bit)

using omap-nand-flash.c driver from OMAP community tree 
linux-omap-2.6.git at source.mvista.com (which is slated for sending to 
linux-mtd after conversion of board specifics to LDM platform device stuff).

OK, this is pretty unexpected, so I'll try harder to figure out where it 
goes wrong or whether I've got another board that it affects (a 
colleague reported some new bad blocks messages after upgrading to the 
same software on a different board, will see if there's a similar 
situation).

>>and
>>NAND_BBT_SCAN2NDPAGE is triggering a BUG I haven't investigated yet.)
> 
> 
> You introduced it by setting readlen = mtd->ooblock. I know that the
> name of this is confusing. oobblock is the page size. So readlen is >
> buffersize.

d'oh!  Thanks,

-- 
Todd

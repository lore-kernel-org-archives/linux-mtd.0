Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DRdpY-0002o4-EO
	for linux-mtd@lists.infradead.org; Fri, 29 Apr 2005 18:19:29 -0400
Message-ID: <4272B2F0.3090803@mvista.com>
Date: Fri, 29 Apr 2005 15:19:28 -0700
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: "Timofei V. Bondarenko" <timm@ipi.ac.ru>
References: <426F40A3.8010308@ipi.ac.ru>	<1114592403.879.175.camel@tglx.tec.linutronix.de>
	<426F56C1.6020204@ipi.ac.ru> <426FD97D.9000105@mvista.com>
	<427089FF.4020704@ipi.ac.ru>
In-Reply-To: <427089FF.4020704@ipi.ac.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: nand locking
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Timofei V. Bondarenko wrote:
> Todd Poynor wrote:
...
>> I tried adding a callback to the chip driver at each device/partition 
>> add...
> 
> 
> Do you mean 'mtd_info::notify_add' ?

Yes.

> I've mentioned the 'mtd_partition::mtdp' - it could be an alternative
> (a bit complicated though). The register_mtd_user() also may help...

I originally tried the register_mtd_user() route, but in the case of 
partitions it is passed the "slave" struct mtd_info, while only the 
"master" whole-device struct has been filled in with chip-driver-private 
info (and only mtdpart.c knows how to map the slave back to the master), 
so that would need some ugly tweaks as well...

-- 
Todd

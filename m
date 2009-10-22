Received: from vega.surpasshosting.com ([72.29.83.9])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N0suw-0002Za-CE
	for linux-mtd@lists.infradead.org; Thu, 22 Oct 2009 08:21:10 +0000
Message-ID: <4AE015DD.1010009@embedded-sol.com>
Date: Thu, 22 Oct 2009 10:20:45 +0200
From: Felix Radensky <felix@embedded-sol.com>
MIME-Version: 1.0
To: Scott Wood <scottwood@freescale.com>
Subject: Re: UBIFS problem on MPC8536DS
References: <4AD5ADC9.30503@embedded-sol.com>
	<4AD5C5B4.3060303@nokia.com>	<4AD5D053.9000901@embedded-sol.com>
	<4AD5FFE7.7080703@nokia.com>	<4AD60EF4.4080306@embedded-sol.com>	<4AD614E4.6030005@freescale.com>
	<4AD7811A.6040501@freescale.com>	<4AD7FE37.1060705@embedded-sol.com>
	<20091016153128.GA11838@loki.buserror.net>
In-Reply-To: <20091016153128.GA11838@loki.buserror.net>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Scott

Scott Wood wrote:
> On Fri, Oct 16, 2009 at 07:01:43AM +0200, Felix Radensky wrote:
>   
>> Thanks for confirmation. So the real problem is eLBC ?
>> What happens if I access other devices on eLBC (e.g. FPGA)
>> simultaneously with NAND or NOR ?
>>     
>
> AFAICT, the problem is NAND being accessed simultaneously with anything else
> on the eLBC (at least GPCM -- not sure about UPM).  Instead of delaying the
> memory-like transaction until the NAND special operation has completed, it
> seems to just abort the NAND operation.
>
> eLBC can't really tell the difference whether you've got NOR or FPGA hooked
> up to a GPCM chip select, so the problem should still apply.
>   

Are you aware of Freescale plans to fix the problem in new silicon 
revisions ?
Also, can you please tell what CPUs are affected by this, except 8536 
and 8572.

Thanks a lot.

Felix.

Received: from vega.surpasshosting.com ([72.29.83.9])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Mzy5R-0008IS-KI
	for linux-mtd@lists.infradead.org; Mon, 19 Oct 2009 19:40:13 +0000
Message-ID: <4ADCC08D.5080207@embedded-sol.com>
Date: Mon, 19 Oct 2009 21:39:57 +0200
From: Felix Radensky <felix@embedded-sol.com>
MIME-Version: 1.0
To: Scott Wood <scottwood@freescale.com>
Subject: Re: UBIFS problem on MPC8536DS
References: <4AD5ADC9.30503@embedded-sol.com> <4AD5C5B4.3060303@nokia.com>
	<4AD5D053.9000901@embedded-sol.com> <4AD5FFE7.7080703@nokia.com>
	<4AD60EF4.4080306@embedded-sol.com>
	<4AD614E4.6030005@freescale.com> <4AD7811A.6040501@freescale.com>
	<4AD7FE37.1060705@embedded-sol.com>
	<20091016153128.GA11838@loki.buserror.net>
	<4ADAE205.7070106@embedded-sol.com>
	<20091019154002.GC19074@loki.buserror.net>
In-Reply-To: <20091019154002.GC19074@loki.buserror.net>
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

Scott Wood wrote:
> On Sun, Oct 18, 2009 at 11:38:13AM +0200, Felix Radensky wrote:
>   
>> Hi, Scott
>>
>> Scott Wood wrote:
>>     
>>> On Fri, Oct 16, 2009 at 07:01:43AM +0200, Felix Radensky wrote:
>>>       
>>>> Thanks for confirmation. So the real problem is eLBC ?
>>>> What happens if I access other devices on eLBC (e.g. FPGA)
>>>> simultaneously with NAND or NOR ?
>>>>         
>>> AFAICT, the problem is NAND being accessed simultaneously with anything else
>>> on the eLBC (at least GPCM -- not sure about UPM).  Instead of delaying the
>>> memory-like transaction until the NAND special operation has completed, it
>>> seems to just abort the NAND operation.
>>>
>>> eLBC can't really tell the difference whether you've got NOR or FPGA hooked
>>> up to a GPCM chip select, so the problem should still apply.
>>>
>>>       
>> Can you please provide some code example of synchronizing GPCM and NAND ?
>>     
>
> I don't have any.  It's something that would have to be written.
>   
OK, no problem. I just wanted to get an idea of what should be done.
Should the NOR code poll some eLBC register to wait for completion of
NAND special operation ? Can you tell what register is relevant ?

Thanks.

Felix.

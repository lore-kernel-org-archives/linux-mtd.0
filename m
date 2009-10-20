Received: from vega.surpasshosting.com ([72.29.83.9])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N0GfZ-0005MI-1w
	for linux-mtd@lists.infradead.org; Tue, 20 Oct 2009 15:30:45 +0000
Message-ID: <4ADDD790.3010306@embedded-sol.com>
Date: Tue, 20 Oct 2009 17:30:24 +0200
From: Felix Radensky <felix@embedded-sol.com>
MIME-Version: 1.0
To: Scott Wood <scottwood@freescale.com>
Subject: Re: UBIFS problem on MPC8536DS
References: <4AD5ADC9.30503@embedded-sol.com>
	<4AD5C5B4.3060303@nokia.com>	<4AD5D053.9000901@embedded-sol.com>
	<4AD5FFE7.7080703@nokia.com>	<4AD60EF4.4080306@embedded-sol.com>	<4AD614E4.6030005@freescale.com>
	<4AD7811A.6040501@freescale.com>	<4AD7FE37.1060705@embedded-sol.com>	<20091016153128.GA11838@loki.buserror.net>	<4ADAE205.7070106@embedded-sol.com>	<20091019154002.GC19074@loki.buserror.net>	<4ADCC08D.5080207@embedded-sol.com>
	<4ADCC247.6080107@freescale.com>
In-Reply-To: <4ADCC247.6080107@freescale.com>
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
> Felix Radensky wrote:
>> OK, no problem. I just wanted to get an idea of what should be done.
>> Should the NOR code poll some eLBC register to wait for completion of
>> NAND special operation ? Can you tell what register is relevant ?
>
> I was thinking you'd just share a mutex with the NAND code.
>
OK, I have NOR and NAND synchronized properly now.
Thanks a lot for your  help.

Felix.

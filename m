Received: from easi.embeddedalley.com ([71.6.201.124])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M8VYg-0007Ub-Qz
	for linux-mtd@lists.infradead.org; Mon, 25 May 2009 08:29:30 +0000
Message-ID: <4A1A56D7.4070603@embeddedalley.com>
Date: Mon, 25 May 2009 12:29:11 +0400
From: Vladimir Barinov <vbarinov@embeddedalley.com>
MIME-Version: 1.0
To: Magnus Lilja <lilja.magnus@gmail.com>
Subject: Re: ARM: MTD: mxc_nand: Question on NAND Flash support for mxc
References: <20090521174611.5a18ea3a@Marramao-laptop>
	<59b21cf20905210911h219d4aebi9177d271fabe6d5a@mail.gmail.com>
In-Reply-To: <59b21cf20905210911h219d4aebi9177d271fabe6d5a@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Alberto Panizzo <maramaopercheseimorto@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	linux-arm-kernel <linux-arm-kernel@lists.arm.linux.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Manus,

Magnus Lilja wrote:
> Hi
>
> 2009/5/21 Alberto Panizzo <maramaopercheseimorto@gmail.com>:
>   
>> Hi all!
>>
>> I am trying to give support for NAND flash device to Atmark Armadillo 500
>> developing board.
>> This board has an iMX31 processor and is shipped with an ST Micro NAND 256MiB 3,3V 8-bit Flash.
>> Atmark support this board with an old 2.6.26 kernel with some modification.
>> For this NAND Flash Atmark installed the old Freescale mxc_nd driver brought up by
>> Sascha Hauer in the on tree mxc_nand.
>>     
>
> Is the ST Micro NAND device a small page or large page NAND? I ran
> into problems when trying to use the MXC-driver from the mainline
> Linux kernel on the i.MX31 PDK board which has a large page device
> mounted. I haven't had time to dig into the details yet though.
>   
I have the patch to support 2k pagesizes tested on mx31pdk. Will post in 
separate thread.

Regards,
Vladimir

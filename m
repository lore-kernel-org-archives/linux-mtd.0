Received: from [206.162.170.236] (helo=gateway.wavesat.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 178P9j-0003wd-00
	for <linux-mtd@lists.infradead.org>; Thu, 16 May 2002 18:35:11 +0100
Message-ID: <00bf01c1fd00$653676a0$0200010a@WT0136>
From: "Ho-Kuo Chan" <hchan@wavesat.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
References: <009c01c1fce9$4415bf60$0200010a@WT0136>  <008101c1fce3$ae6588b0$0200010a@WT0136> <006401c1fcde$bc00e8c0$0200010a@WT0136> <001301c1fcd9$76792c40$0200010a@WT0136> <003801c1fc52$1eb60e10$0200010a@WT0136> <31716.1021552380@redhat.com> <5240.1021554647@redhat.com> <9456.1021556252@redhat.com> <14029.1021558521@redhat.com>  <19099.1021561319@redhat.com>
Subject: Re: Trouble indetifying FLASH part 
Date: Thu, 16 May 2002 13:37:48 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

dwmw2 wrote:
> Yeah. It really does look like the chip isn't where you think it is.
>
> Can you get Linux to boot anyway, with NFSroot or something?
>
> od -A x -t x1 /dev/mem | grep "13 03 43 49 53 46 39 00"

I am booting over tftp with nfs mounted root already. I executed the command
you provided at the console with no matches. I noted that the highest memory
address tested was ffffff which makes sense considering the system has 16 MB
RAM. Here is my physical memory map:
0x0 - 0xfffff : SDRAM
0x8000000 - 0x83FFFFF : Flash
0x9000000 - 0x90FFFFF : FPGA
0xEF600000 - 0xEFFFFFF : PPC405GP memory mapped registers
0xFFE00000 - 0xFFFFFFFF : BootPROM

Does this help?

Thanks again,
HK

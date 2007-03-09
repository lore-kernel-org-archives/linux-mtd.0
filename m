From: "Kyungmin Park" <kmpark@infradead.org>
To: "'Andrew Li'" <ALi@evertz.com>
References: <0474A5584072DA1197F50007E90E6B11052998A8@PORTIA>
Subject: RE: OneNand driver
Date: Fri, 9 Mar 2007 10:34:51 +0900
Message-ID: <006f01c761eb$2470f5a0$c7a3580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
In-reply-to: <0474A5584072DA1197F50007E90E6B11052998A8@PORTIA>
Cc: linux-mtd@lists.infradead.org
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Andrew,

> 
> 1. Thank you very much for your help. Now my Linux OneNAND 
> driver works for me. I can read and write OneNAND correctly. 
> What is interesting here is that we don't need any special 
> tool to write/read OneNAND. I do it this way:
> 
> cp x_load_Uboot.bin /dev/mtdblock0
> cp  /dev/mtdblock0 b0.bin

Yes. you can write block 0 directly useing mtdblock0 in kernel

> 
> 2.
> I am trying to make the X-load work. I have problem when 
> reading. It always read the first 4 sectors, no matter what 
> page/sectors address I set. 

OneNAND has 1KB BootRAM (2 sectors). it is filled automatically from page0,
block0 in OneNAND

> 
> I noticed that Linux driver does the reading a little bit 
> diffirently, It writes to ONENAND_REG_START_BUFFER with 
> 0x0800 and 0x0c00 alternatively. I also tried this method. 
> but it doesn't work.

xloader has size limitation. so I implemented it using just one bufferram.
and it just read 128KB - 2KB from block0
So I think there's no big performance improvement. But if you want it. try
it.
But you have to know that xloader don't exceed the 1KB size limitation.

You can refer following URL
http://source.mvista.com/git/gitweb.cgi?p=xloader.git;a=log

Thank you,
Kyungmin Park

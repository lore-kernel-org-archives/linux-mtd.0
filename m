Received: from galaxy.systems.pipex.net ([62.241.162.31])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DJ9Ni-0003Q4-L3
	for linux-mtd@lists.infradead.org; Wed, 06 Apr 2005 08:11:39 -0400
Message-ID: <4253D280.6090308@infocell-its.com>
Date: Wed, 06 Apr 2005 13:13:52 +0100
From: Zeri Virgo <zerivirgo@infocell-its.com>
MIME-Version: 1.0
To: Dan Brown <dan_brown@ieee.org>
References: <4249C357.2040600@ieee.org>	<424C1C58.3000905@infocell-its.com>	<424C5F16.8010809@ieee.org>	<424CA4EA.8090904@infocell-its.com>	<424CAE31.8040302@ieee.org>
	<425157C5.4040007@infocell-its.com>	<425181A7.2010809@ieee.org>
	<42527DD5.4080009@infocell-its.com> <4252EC5D.4090806@ieee.org>
In-Reply-To: <4252EC5D.4090806@ieee.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [UPDATE] DOCBoot support for NFTL-based DOC2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 > There is a small (but important) fix to
> memory size detection, which shouldn't affect you since you're not using 
> initrd (I think).
No, you're right - I'm not using initrd.

> There is also a new option in doc_bootstub.h: #define DEBUG_BUILD.  This 
> will print out some interesting info during the "Installing DOCBoot" 
> phase, and wait for a keypress.

--------------------------------------------------------------
Award Modular BIOS v4.51PG, An Energy Star Ally
...
HS-4020 VER:1.4

Cyrix MediaGX With MMX-S CPU at 300MHz
Memory Test :   64000K OK + 1536 shared memory

Award Plug and Play BIOS Extension v1.0A
...
Installing DOCBoot.
doc_seg = 0xD000    setup_seg = 0x2000
int15/88 returns 0xF600    initrd_start = 0x000000
top of low mem = 0x0280k    handler seg = 0x9FC0
   -- Press any key --
--------------------------------------------------------------

...<snip>...
Loading kernel ... page 0x.... <- this seems to start at zero and be 
going up at roughly 0x200 a second up to 0xFFFF then restarting at zero 
again over and over.

Just to give you a clearer picture, the bzImage is 1148021 bytes and 
doc_spl is 1187472 bytes. The nandwrite command wrote doc_spl from 0 up 
to the erase block at 0x118000 which is well within the 0x208000 
firmware area. The board is a Boser HS-4020 v1.4.

Unfortunately, assembler is greek to me!

- Zeri

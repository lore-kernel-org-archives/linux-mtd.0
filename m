Received: from pop3.galileo.co.il ([199.203.130.130] helo=galileo5.galileo.co.il)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17dBJq-000181-00
	for <linux-mtd@lists.infradead.org>; Fri, 09 Aug 2002 16:04:51 +0100
Message-ID: <3D53D947.7040309@galileo.co.il>
Date: Fri, 09 Aug 2002 18:01:27 +0300
From: Rabeeh Khoury <rabeeh@galileo.co.il>
MIME-Version: 1.0
To: "Xiaogeng (Shawn) Jin" <xjin@redswitch.com>
CC: linux-mtd@lists.infradead.org, linuxppc-embedded@lists.linuxppc.org
Subject: Re: MTD/JFFS2 on Intel 28F160F3
References: <3D530222.7040303@redswitch.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

>
> The basic problem is what the physical start address of flash mapping
> is? While on PPCBoot, I got flash information using command 'flinfo'.
> The start address is FFE00000. Is this address the one used to configure
> CFI flash device in physical memeory map? I tried using this address but
>  'physmap' couldn't find flash device.

It is not a must that the address mapping in PPCBoot is the same as in 
the kernel.

What board are you using ?

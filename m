Received: from [63.81.120.155] (helo=imap.sh.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HvuoE-00047x-QX
	for linux-mtd@lists.infradead.org; Wed, 06 Jun 2007 08:40:24 -0400
Message-ID: <4666AB89.1010206@ru.mvista.com>
Date: Wed, 06 Jun 2007 16:41:45 +0400
From: Sergei Shtylyov <sshtylyov@ru.mvista.com>
MIME-Version: 1.0
To: "Mark A. Greer" <mgreer@mvista.com>
Subject: Re: [PATCH] powerpc: Create "rom" (MTD) device prpmc2800
References: <20070601232022.GA21237@mag.az.mvista.com>
	<20070604205646.GD10612@mag.az.mvista.com>
	<4665C8F4.2090502@ru.mvista.com>
	<20070605211114.GA17131@mag.az.mvista.com>
In-Reply-To: <20070605211114.GA17131@mag.az.mvista.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linuxppc-dev <Linuxppc-dev@ozlabs.org>, linux-mtd@lists.infradead.org,
	segher@kernel.crashing.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

Mark A. Greer wrote:

>>Mark A. Greer wrote:

>>>		flash@a0000000 {
>>>			device_type = "rom";
>>>			compatible = "direct-mapped";
>>>			reg = <a0000000 4000000>; /* Default (64MB) */
>>>			probe-type = "CFI";
>>>			bank-width = <4>;
>>>			partitions = <00000000 00100000 /* RO */
>>>				      00100000 00040001 /* RW */
>>>				      00140000 00400000 /* RO */
>>>				      00540000 039c0000 /* RO */
>>>				      03f00000 00100000>; /* RO */

>>   Hm, this should have been the other way around -- ones with odd size are 
>>RO, ones with even size are RW.

> Yeah, that's what the comment says but the code says the opposite:

> 	if (*part++ & 1) /* bit 0 set signifies read only partition */
> 		(*parts)[i].mask_flags = MTD_WRITEABLE;

> Doesn't that make it RW if bit 0 is set?

    Contrarywise, though this may surprise you. ;-)
    This is a question to MTD people...

WBR, Sergei

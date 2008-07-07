Received: from hosted06.westnet.com.au ([203.10.1.221])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KFuSQ-0001e0-AB
	for linux-mtd@lists.infradead.org; Mon, 07 Jul 2008 17:24:59 +0000
Received: from hosted06.westnet.com.au (hosted06.westnet.com.au [127.0.0.1])
	by hosted06.westnet.com.au (Postfix) with SMTP id 59C2A2234AB
	for <linux-mtd@lists.infradead.org>;
	Tue,  8 Jul 2008 01:24:55 +0800 (WST)
Received: from [192.168.1.104] (dsl-220-235-139-223.wa.westnet.com.au
	[220.235.139.223])
	by hosted06.westnet.com.au (Postfix) with ESMTP id 460C5223612
	for <linux-mtd@lists.infradead.org>;
	Tue,  8 Jul 2008 01:24:55 +0800 (WST)
Message-ID: <4872514A.20906@westnet.com.au>
Date: Tue, 08 Jul 2008 01:24:26 +0800
From: SR <malternate@westnet.com.au>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: pcimciamtd usage
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello
I have a  16 bit 4MByte PCMCIA linear flash (type 2) card I want to use 
with a 2.6.25.7 vanilla kernel. I understand that the pcmciamtd driver 
is what I need to get raw mode access to it. However, I cannot find any 
option in menuconfig to enable  compilation of the pcmciamtd module. The 
pcmciamtd.c is there in the source but the pcmciamtd module is not 
produced. I thought the relevant sections in menuconfig to enable this 
would be found in

User Modules And Translation Layers
RAM/ROM/Flash chip drivers
 Mapping drivers for chip access
Self-contained MTD device drivers


My questions are

Is the PCMCIAMTD module what I need for this?
How do I enable production of this module?

regards

M Merewether

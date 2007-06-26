Received: from gutenberg.seattle.identitext.com ([207.114.238.3])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I3DQs-00015z-Ou
	for linux-mtd@lists.infradead.org; Tue, 26 Jun 2007 11:58:23 -0400
Received: from [10.6.12.156] (72-254-136-115.client.stsn.net [72.254.136.115])
	by gutenberg.seattle.identitext.com (Postfix) with ESMTP id
	7C0F3B1D00C for <linux-mtd@lists.infradead.org>;
	Tue, 26 Jun 2007 08:58:20 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v752.3)
Content-Transfer-Encoding: 7bit
Message-Id: <BCD0E2EC-DABE-435C-8369-1D980774372E@exbiblio.com>
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
To: linux-mtd@lists.infradead.org
From: Mathew Chasan <mathew@exbiblio.com>
Subject: max write speed with onenand while running kernel drivers
Date: Tue, 26 Jun 2007 11:58:17 -0400
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I've been testing my maximum *sustained* write speeds with onenand  
lately.  Without putting a filesystem over the device, using a /dev/ 
mtd/ device (which as it turns out seems to return faster average  
speeds than the block device for extremely large writes) i'm topping  
out about 4.7 mebibytes a second.

I'm using an i.MX31 processor and the standard onenand drivers.  My  
kernel is 2.16.19.2, although i have updated my MTD stack to a more  
recent one.  I wrote a simple program that outputs a large memory  
buffer directly to the flash and times the results, averaging the  
results over many tests.

I believe i could probably increase the speed a fair bit by tuning my  
hardware io ports to push the limits of the onenand- but i'm not sure  
how much i can expect to get out it.  Does anyone have numbers on  
what they think the max write speed should be on onenand?

Also, i've noticed that the drivers are using asynchronous mode.   
Synchronous mode is i believe, quite a bit faster.  Has anyone tried  
to make a driver that works on onenand in synchronous mode?  I  
haven't looked into this much yet... is such a task particularly  
complicated?

much thanks in advance for any advice, help, etc.

Mathew

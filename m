Received: from mail.picopeta.com ([202.62.79.232] helo=rapid.picopeta.com)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HKJHc-0002Ct-3V
	for linux-mtd@lists.infradead.org; Thu, 22 Feb 2007 14:07:17 -0500
Received: from localhost (localhost [127.0.0.1])
	by rapid.picopeta.com (Postfix) with ESMTP id 6DEC32D914
	for <linux-mtd@lists.infradead.org>;
	Fri, 23 Feb 2007 00:08:00 +0530 (IST)
Received: from rapid.picopeta.com ([202.62.79.232])
	by localhost (rapid.picopeta.com [202.62.79.232]) (amavisd-new,
	port 10024)
	with ESMTP id 42Vux41i+Vk3 for <linux-mtd@lists.infradead.org>;
	Fri, 23 Feb 2007 00:07:53 +0530 (IST)
Received: from [202.62.79.153] (rainbow.picopeta.com [202.62.79.153])
	(Authenticated sender: girish.a@geodesic.com)
	by rapid.picopeta.com (Postfix) with ESMTP id 13F782D90D
	for <linux-mtd@lists.infradead.org>;
	Fri, 23 Feb 2007 00:07:52 +0530 (IST)
Message-ID: <45DDE566.6040206@picopeta.com>
Date: Fri, 23 Feb 2007 00:18:06 +0530
From: Girish <girish@picopeta.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: nand with pcmcia interface
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Reply-To: girish@picopeta.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all ,
    I am writing a driver for 256MB Micron Nand flash On PXA270 board 
through PCMCIA interface as decribed in 
"http://download.intel.com/design/pca/applicationsprocessors/applnots/28014402.pdf". 
So I am trying it out in u-boot first. I wrote a u-boot command called 
mynand which writes the command at 0x30000000 (socket1 of pcmcia), data 
at 0x20000000(socket0 of pcmcia) and address at 0x20000040(i.e 
Address6=ALE). But u-boot hangs whenever I try to access pcmcia socket 
addresses i.e. 0x20000000 or 0x30000000. And I did "md 0x20000000" It too hangs the u-boot. 
Please suggest me how to go on further.

Waiting for your responses.



Thanks & Regards
Girish

----------------------------------------------------------------------
"When Ability Ends; Faith Begins....

Girish A J (girish.a@geodesiconline.com) 
Associate - Systems,		     Ph: (80) 2361 8184-86   Ext 135
PicoPeta Simputers Pvt Ltd.        Fax:(80) 2361 7568
146 5th Cross, RMV Extension,     
Bangalore - 560 080.               
URL  http://www.picopeta.com
-------------------------------------------------------------------------- 

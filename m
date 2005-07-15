Received: from xrelay.neomagic.com ([209.172.119.197] helo=scha24.neomagic.com)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1DtPna-0004dI-CB
	for linux-mtd@lists.infradead.org; Fri, 15 Jul 2005 09:00:19 -0400
Received: from mail.neomagic.com
	(IDENT:U2FsdGVkX19EQmECIKljzzEnG/mL0r8tPSwk1XiU2Bs@scha25.neomagic.com
	[192.168.51.45])
	by scha24.neomagic.com (8.12.5/8.12.5) with ESMTP id j6FCxxOa014564
	for <linux-mtd@lists.infradead.org>; Fri, 15 Jul 2005 05:59:59 -0700
Received: from neomagic.com ([192.168.31.186])
	by mail.neomagic.com (8.12.11/8.12.5) with ESMTP id j6FChoIK012059
	for <linux-mtd@lists.infradead.org>; Fri, 15 Jul 2005 05:43:51 -0700
Message-ID: <42D7B387.1010706@neomagic.com>
Date: Fri, 15 Jul 2005 18:30:55 +0530
From: Ajay Jain <ajain@neomagic.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [Fwd: Re: Nand Flash driver for dedicated conroller]
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


 

>>On Thu, 2005-07-14 at 05:28 -0700, Sunil Khandelwal
>>wrote:
>>    
>>
>>>I have an ARM based board, which has a flash
>>>controller on chip.
>>>
>>>There is no way I can control the signals like
>>>      
>>>
>>ALE, CE
>>    
>>
>>>etc to flash directly. 
>>>      
>>>

Hi, 

Even I have a similar problem, our flash controller does not allow us to control ALE, CLE etc, and the nand layer in mtd assumes that such a control is available. 
Our sandisk controller has exposed certain commands like Read, Write, Block Erase etc and it is does not allow any access to ALE. How can I use the current code to 
incorporate the controller.

Ajay

>  
>

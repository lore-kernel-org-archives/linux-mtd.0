Received: from gutenberg.seattle.identitext.com ([207.114.238.3])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HwP3f-0006NQ-JM
	for linux-mtd@lists.infradead.org; Thu, 07 Jun 2007 16:58:24 -0400
Received: from [10.20.12.236] (ip236.dhcp.seattle.identitext.com
	[10.20.12.236])
	by gutenberg.seattle.identitext.com (Postfix) with ESMTP id 52DB1AD695F
	for <linux-mtd@lists.infradead.org>;
	Thu,  7 Jun 2007 13:58:14 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v752.3)
Content-Transfer-Encoding: 7bit
Message-Id: <79F7EE04-68BE-48FA-986D-77090A9D597B@exbiblio.com>
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
To: linux-mtd@lists.infradead.org
From: Mathew Chasan <mathew@exbiblio.com>
Subject: newbie needs help getting onenand to work...
Date: Thu, 7 Jun 2007 13:58:09 -0700
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi List,

I'm trying to get a Samsung KFH4G16Q2M Onenand to work with the  
Freescale i.MX31.  I'm using a modified version of the 2.6.19.2 tree  
available on the freescale website.

Basically i have yet to get anywhere.  I've enabled the MTD and  
OneNand drivers in the kernel  but thats about it.  Interestingly, i  
don't see any sort of indication that the OneNand drivers are even  
getting initialized in any way during kernel boot.

I know that i'm going to need to somehow explain to the kernel where  
to look for my oneNand device, and what to look for, but i haven't  
figured out how to do this.  There's quite a lot out there on NAND  
and NOR devices of course, but i'm not clear on what needs to be the  
same and different for a OneNand part.  I spent all day yesterday  
searching for any sort of documentation either online or in the code,  
and found very little talking about oneNand.  Today i'm looking  
through the code trying to put together what i need to do, but was  
hoping someone might be able to help me, either by pointing me to a  
preexisting document, or by quickly telling me what steps i need to  
take/what i need to define to get this to work.

Any advice/help greatly appreciated.

thanks so much,

mathew

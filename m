Received: from [211.21.46.12] (helo=pluto.setabox.com.tw)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CcOkK-0000I9-6g
	for linux-mtd@lists.infradead.org; Thu, 09 Dec 2004 08:54:18 -0500
Message-ID: <41B858EF.6080702@setabox.com>
Date: Thu, 09 Dec 2004 21:53:51 +0800
From: William J Beksi <wjbeksi@setabox.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <000b01c4dc0f$69fd88e0$8500a8c0@nit37>	
	<41B695A0.6040608@setabox.com>
	<1102598452.3306.35.camel@tglx.tec.linutronix.de>
In-Reply-To: <1102598452.3306.35.camel@tglx.tec.linutronix.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: tglx@linutronix.de
Subject: Re: [PATCH] nand flash through IDE interface
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas Gleixner wrote:

>On Wed, 2004-12-08 at 13:48 +0800, William J Beksi wrote:
>  
>
>>Hi,
>>I use the ide interface for testing nand flash. I think this driver 
>>would be useful for anyone else that does the same. It would save people 
>>the time of hacking another board specific driver to work with ide.
>>    
>>
>
>Interesting. 
>
>Which card types can you access with this driver ?
>  
>
I've been able to access both Samsung 32MB (K9F5608U0C) and 64MB 
(K9F1208U0M) cards.
The guys in my hardware department build a small board consisting of a 
nand flash socket, switch, and ide connector that allows access to the 
flash from a pc's ide connector.

-- 
William

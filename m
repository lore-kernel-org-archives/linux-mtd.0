Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CcOE3-00081S-8a
	for linux-mtd@lists.infradead.org; Thu, 09 Dec 2004 08:20:57 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: William J Beksi <wjbeksi@setabox.com>
In-Reply-To: <41B695A0.6040608@setabox.com>
References: <000b01c4dc0f$69fd88e0$8500a8c0@nit37>
	<41B695A0.6040608@setabox.com>
Content-Type: text/plain
Date: Thu, 09 Dec 2004 14:20:52 +0100
Message-Id: <1102598452.3306.35.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] nand flash through IDE interface
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-12-08 at 13:48 +0800, William J Beksi wrote:
> Hi,
> I use the ide interface for testing nand flash. I think this driver 
> would be useful for anyone else that does the same. It would save people 
> the time of hacking another board specific driver to work with ide.

Interesting. 

Which card types can you access with this driver ?

tglx

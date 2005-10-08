Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EOBY5-0007tR-AU
	for linux-mtd@lists.infradead.org; Sat, 08 Oct 2005 06:03:46 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Vitaly Wool <vwool@ru.mvista.com>
In-Reply-To: <43479777.5060309@ru.mvista.com>
References: <5080.61.95.208.3.1128750482.squirrel@61.95.208.3>
	<43479777.5060309@ru.mvista.com>
Content-Type: text/plain
Date: Sat, 08 Oct 2005 12:04:45 +0200
Message-Id: <1128765885.1728.82.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: nreddy@netenrich.com, linux-mtd@lists.infradead.org
Subject: Re: "Timing issue when we use SPANSION 8MB Flash"
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2005-10-08 at 13:55 +0400, Vitaly Wool wrote:
> Hi,
> 
> am I right that it's a NOR flash? What's the reason for using JFFS2 on 
> it then?

Err, why shouldnt he use JFFS2 on NOR ? Is there a better suited file
system which can handle NOR FLASH?

tglx

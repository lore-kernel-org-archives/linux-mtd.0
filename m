Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CbvRw-0005gO-JO
	for linux-mtd@lists.infradead.org; Wed, 08 Dec 2004 01:37:21 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Subrahmanyam <subrahmanyam@navayuga.co.in>
In-Reply-To: <000b01c4dc0f$69fd88e0$8500a8c0@nit37>
References: <000b01c4dc0f$69fd88e0$8500a8c0@nit37>
Content-Type: text/plain
Date: Wed, 08 Dec 2004 07:37:12 +0100
Message-Id: <1102487832.13353.486.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: MTD driver
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-12-07 at 09:16 +0530, Subrahmanyam wrote:
>  Hi,
> 
>  I need to provide an user interface/GUI wherein when a certain data 
> (string/key) is entered, it should basically store the key in the flash 
> (this basically happens during run time after the target has been identified 
> by the host).
> 
> In the target we have a flash in which there is jffs2 file system and also 
> mtd drivers, since i need to store block oriented data, i am looking at the 
> possiblity of using mtd driver and storing data(key) in a particular 
> location in flash. How should i proceed in acheiving the same.

Is there any good reason, why the key cannot be stored on the already
available jffs2 filesystem ?

tglx

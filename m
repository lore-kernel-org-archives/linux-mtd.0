Received: from [64.170.22.142] (helo=mail.spewey.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15RYcu-0005Cv-00
	for <linux-mtd@lists.infradead.org>; Tue, 31 Jul 2001 13:27:56 +0100
Message-Id: <5.1.0.14.0.20010731074301.00a67ee8@mail.spewey.com>
Date: Tue, 31 Jul 2001 07:46:29 -0500
To: Patrick <patrick_chiu@coventive.com>,linux-mtd@lists.infradead.org
From: Vipin Malik <vipin@embeddedlinuxworks.com>
Subject: Re: I patch the MTD , but compiler do not compile any object
  code in /usr/src/linux/drivers/MTD/
In-Reply-To: <3B668812.7020405@coventive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

At 06:27 PM 7/31/2001 +0800, Patrick wrote:
>I patch the MTD code in kernel source 2.4.0-test9 for mipsel
>
>after I build the kernel , booting the kernel ,without any message about
>
>MTD

First you seem to have built all the MTD drivers as modules so you won't 
see any MTD messages during the bootup phase (unless something is 
explicitly loading a MTD module(s)- which I doubt as you are building this 
for the first time).

>when I try every kind of MTD driver.
>
>I found the /usr/src/linux/drivers/MTD/ without any object code (*.o)

I presume that you also did a "make modules" when you "built the kernel"?


># CONFIG_MTD_CHAR is not set

You also need CONFIG_MTD_CHAR

Vipin

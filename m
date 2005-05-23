Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DaDwQ-0001AP-5R
	for linux-mtd@lists.infradead.org; Mon, 23 May 2005 10:30:03 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Kluba Patrik <pajko@kukac.halom.u-szeged.hu>
In-Reply-To: <Pine.LNX.4.61.0505231612510.1137@kukac.halom.u-szeged.hu>
References: <Pine.LNX.4.61.0505230940590.25999@kukac.halom.u-szeged.hu>
	<1116846559.16577.18.camel@sauron.oktetlabs.ru>
	<4291D7D0.7010305@yandex.ru>
	<Pine.LNX.4.61.0505231612510.1137@kukac.halom.u-szeged.hu>
Content-Type: text/plain
Date: Mon, 23 May 2005 16:29:56 +0200
Message-Id: <1116858596.6736.45.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "Artem B. Bityuckiy" <dedekind@yandex.ru>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH][03/03] nandsim own geometry
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-05-23 at 16:17 +0200, Kluba Patrik wrote:

> OK, but what if somebody wants to add support for an unsupported chip? He has to 
> modify nand_ids.c, too. AFAIK there is no other way to specify a chip's size. 


That's intentional. nand_ids holds all _supported_ chips. And its not a
big problem to add a chip ID. If you add a new chip, you have to check,
if the nand driver can handle it. 

> It's a litte trouble that all the data is stored statically in a table. It 
> should be expandable somehow dinamically, from modules. I see what can I do.

I do not like this idea at all. Thats just another error source. I'm not
interested in "I added the chip-id XYZ, because the chip was not
detected, but it does not work" discussions on the mailing list. We have
already enough dumb questions to answer.

tglx

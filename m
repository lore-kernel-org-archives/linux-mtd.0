Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CI2AE-00045p-5s
	for linux-mtd@lists.infradead.org; Thu, 14 Oct 2004 05:44:51 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Balint Cristian <rezso@rdsor.ro>
In-Reply-To: <200410141123.56753.rezso@rdsor.ro>
References: <200410141027.44044.rezso@rdsor.ro>
	<1097740239.25287.17.camel@thomas> <200410141123.56753.rezso@rdsor.ro>
Content-Type: text/plain
Message-Id: <1097746617.25287.27.camel@thomas>
Mime-Version: 1.0
Date: Thu, 14 Oct 2004 11:36:58 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [MD-2811-032] DoCMilPlus32 missrecognized on pxa250.
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-10-14 at 10:23, Balint Cristian wrote:
>  Not yet a fix for this ?

Volunteers welcome :)

>  To try hardwire chip in 8 bit mode ? What do you think ?
>  I can use an unused GPIO of pxa to enable via software to control the DoC 
> 8/16 bit enabler pin if i want to have control over this.

8 bit mode should work

> I see only patch for the 0x0000000 probing issue [already hardcoded for me], 
> but my problem is that it see a 2GiB instead of 32MiB, is this still becouse
> you tell DoC is in 16bit and driver try 8bit access ? What that mean ?
> What can i do to figure out this ?

Read the whole thread !
The 16 bit todo's are discussed there !

Read also the "Issues with a Doc Milplus" thread an follow ups

tglx

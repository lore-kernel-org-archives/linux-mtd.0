Received: from mail02.prevas.se ([62.95.78.10])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eJby6-00022j-OW
 for linux-mtd@lists.infradead.org; Tue, 28 Nov 2017 09:14:20 +0000
To: ezequiel.garcia@free-electrons.com
Cc: linux-mtd@lists.infradead.org, "Kasper Revsbech (KREV)" <krev@triax.com>
From: =?UTF-8?Q?Sean_Nyekj=c3=a6r?= <sean.nyekjaer@prevas.dk>
Subject: [BUG] pxa3xx: wait time out when scanning for bb
Message-ID: <7df7abb5-e666-c999-e449-75762b551ea5@prevas.dk>
Date: Tue, 28 Nov 2017 10:12:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ezequiel

I'm currently in the process of doing bringup on a custom armada 38x board.
During the firsts boots of the Linux kernel we saw that the NAND driver 
throws a lot of timeout messages.

Like this:
[ 28.321054] pxa3xx-nand f10d0000.flash: Wait time out!!!
[ 28.521054] pxa3xx-nand f10d0000.flash: Wait time out!!!
[ 28.721054] pxa3xx-nand f10d0000.flash: Wait time out!!!

That lead me to investigate the issue and found this thread (quite old):
https://www.spinics.net/lists/arm-kernel/msg488581.html

In the thread some is describing a possible race condition when the NAND 
framework is scanning for bad blocks.
1. I tried enabling PREEMPT with no success.
2. I tried with commenting out the bad block scanning function, with 
success but not very useful :-)
3. I enabled the BBT function in uboot and the kernel, and that 
apparently fixes the problem.

Can we be sure not to see this issue/racecondition when we are up and 
running? Is there any way to test this?

Br
Sean

Received: from email.aftek.com ([128.121.126.111])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15DT5x-0008GN-00
	for <linux-mtd@lists.infradead.org>; Fri, 22 Jun 2001 16:43:41 +0100
Date: Fri, 22 Jun 2001 09:49:12 -0600 (MDT)
From: ashwinp@aftek.com
To: Vipin Malik <vipin.malik@daniel.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Is my flash being detected?
Message-Id: <993224949.73422@email.aftek.com>
In-Reply-To: <3B335971.27EBD23D@daniel.com>
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

Hi ,
	I got the mistake the fucntion check_cmd_set in cfi_probe.c assigns the probe function using inter_module_get_request .Since my kernel does not have module support the function returns null.For the time being I have assigned the address of the function cfi_cmdset_0002 to probe

Now I get the message
AMD/Fujitsu Extended Query table at 0x0040
number of CFI chips 1
mtd:Giving out device 0 to Physically mapped flash 
:)

so far so good  but if I try to read from the flash uisng cp /dev/mtd0 filename
Iget the following messages 
MTD_OPEN
MTD_READ
unable to handle kernel paging request at virtual address 8f80000

I think I know the reason this may be the readb from _memcpy_form_io may be trying to read from a wrong addres as the readb reads form PCMCIA_IO and I think I know the way to fix this .
	I can't use the latest kernel so I am  forced to used the mtd on a older kernel.

thanks for the suggestions,

Regards,
Ashwin 

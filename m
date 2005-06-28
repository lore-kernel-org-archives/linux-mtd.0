Received: from ms-smtp-03-smtplb.ohiordc.rr.com ([65.24.5.137]
	helo=ms-smtp-03-eri0.ohiordc.rr.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DnJ40-0008Ba-I6
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2005 12:35:57 -0400
Message-ID: <42C180D4.1010607@clarionsensing.com>
Date: Tue, 28 Jun 2005 11:54:44 -0500
From: "Brian O'Dell" <brian@clarionsensing.com>
MIME-Version: 1.0
To: Dan Brown <dan_brown@ieee.org>
References: <42C03FFB.3080208@clarionsensing.com> <42C04A65.5040804@ieee.org>
In-Reply-To: <42C04A65.5040804@ieee.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: DOCBoot doesn't compile
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dan Brown wrote:

> Ack! My fault.  I somehow forgot to check in doc_bootstub.h
>
> Checked in now.  Please let me know if that fixes the problem.  Or if 
> it doesn't.
>
>     -Dan


Thank you for the quick response Dan.  DOCBoot does compile now, but it 
freezes prior to any indication that it is trying to load the kernel.  
Here is what I get with DEBUG_BUILD defined: 

Installing DOCBoot.
doc_seg = 0xE000           setup_seg = 0x2400
int15/e801 returns 0x0F00    initrd_start = 0x0FFF0000
top of low mem = 0x0279k    handler seg = 0x9E00
 -- Press any key --

Prior to pressing any key, numlock and capslock respond normally.  I can 
also reboot via ctrl-alt-del.  I press enter, then the system freezes 
hard.  No numlock or capslock response, ctrl-alt-del does not work.  Any 
thoughts or ideas are much appreciated.

Thanks,
Brian  

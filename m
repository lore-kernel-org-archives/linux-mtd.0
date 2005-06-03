Received: from mailbox.radixs.com ([203.81.41.217])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1De22f-0007mo-T5
	for linux-mtd@lists.infradead.org; Thu, 02 Jun 2005 22:36:16 -0400
From: Munira Ahmed <munira.ahmed@radixs.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <20050602112637.GA442@synertronixx3>
References: <1117710064.23635.100.camel@server21>
	<20050602112637.GA442@synertronixx3>
Content-Type: text/plain
Date: Fri, 03 Jun 2005 10:36:02 +0800
Message-Id: <1117766162.23635.107.camel@server21>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: jffs2, intel flash and i.MX21
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-06-02 at 13:26 +0200, Konstantin Kletschke wrote:
> Am 2005-06-02 19:01 +0800 schrieb Munira Ahmed:
> 
> > 1)	how can I debug that 
> 
> Tell us what you did, what is happening, what should happening, what
> hardware you are using, which bootloader.

I am using an internally designed bootloader. I am using MX21
development board with intel strata flash. I copy bootloader, kernel
image and flash system to the flash and try to reboot the system. system
hangs although the same sequence is running fine with cram file system.
Of course with different kernel configs.



> 
> > 2) 	which part of the kernel should I look into i.e where do I found the
> > code to mount the jffs2 in the kernel tree
> 
> Oh my... fs/jffs2 or drivers/mtd.

	Both or either one. I know generally but I was hoping to be directed to
the specific file.


> > 3) what might be missing in the kernel config
> 
> Many many things. A mapping driver, or partition support, wrong
> commandline, wrong chip driver, modules instead of *'s.

Mapping driver and support for mtd partiion is there. also I am using *
instead of M in the menuconfig

> 
> > 4) any other idea?
> 
> Many, your provided information is very insufficient.
> 
> Regards, Konsti
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
-- 
Munira Ahmed
Senior Embedded Specialist

Radixs Pte Ltd
Email:munira.ahmed@radixs.com


Main: +65 6335 8600
Fax: +65 6335 8601
URL: www.radixs.com 

1 Temasek Avenue, #21-01, Millenia Tower, Singapore 039192

Disclaimer Notice: This email, its content and any files transmitted
with it are intended solely for the addressee(s) and may be confidential
and privileged. Any unauthorised disclosure or use or dissemination of
the information contained herein, either whole or partial, is
prohibited. Radixs Pte Ltd (Radixs) cannot accept liability for any
statements made which are clearly the sender's own and not expressly
made on behalf of Radixs or one of its agents. If you have received this
message in error, please notify the sender immediately, and delete this
email from your computer system. Radixs has taken reasonable precaution
to ensure no viruses are present in this email, however Radixs does not
accept responsibility for any loss or damage arising from the use of
this email or attachments.

Co. Reg. 200104892Z

Received: from mailserv.intranet.gr ([146.124.14.106])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19NpEc-0007Tu-28
	for <linux-mtd@lists.infradead.org>; Thu, 05 Jun 2003 08:32:30 +0100
Received: from mailserv.intranet.gr (localhost [127.0.0.1])
	by mailserv.intranet.gr (8.11.7/8.11.3) with ESMTP id h557ZXD07422
	for <linux-mtd@lists.infradead.org>;
	Thu, 5 Jun 2003 10:35:33 +0300 (EEST)
Message-ID: <3EDEF1D7.9030700@intracom.gr>
Date: Thu, 05 Jun 2003 10:31:35 +0300
From: Pantelis Antoniou <panto@intracom.gr>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <3EDB2F4E.6050502@intracom.gr>
	<200306042016.01366.tglx@linutronix.de>
In-Reply-To: <200306042016.01366.tglx@linutronix.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: NAND write verify failed problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas Gleixner wrote:

>On Monday 02 June 2003 13:04, Pantelis Antoniou wrote:
>  
>
>> > root$ fcp -v /tmp/root.jffs2.image /dev/mtd0
>> > Erasing blocks: 33/33 (100%)
>> > Writing data: 528k/528k (100%)
>> > Verifying data: 20k/528k (3%)File does not seem to match flash data.
>>    
>>
>Are you writing with ECC ? If not use nandwrite from mtd/utils
>
>  
>
>>Mount takes 30 seconds to finish, and during that time the board does not
>>respond to any external stimulus. This is caused I believe from the scaning
>>of the NAND, which I take it is normal.
>>    
>>
>Should be much faster with current MTD CVS code
>
>
>  
>
>>nand_write_page: Failed write verify, page 0x0000040b <5>Write of 68
>>bytes at 0x00081774 failed. returned -5, retlen 0
>>Mar 10 21:44:22 netvia-ppc kernel: Not marking the space at 0x00081774
>>as dirty because the flash driver returned retlen zero
>>Any ideas how to proceed?
>>
>
>Yes, update nand driver from MTD-CVS. It's fixed.
>  
>

I ran into problems by trying to use a vanilla 2.4.21-rc7 with utils 
from the MTD latest snapshot.

Patching the kernel with the MTD-CVS fixed everything.

BTW, is there something anologous to CRAMFS for NAND flash?
I have a need for a compressed read-only filesystem on NAND
but CRAMFS has no concept of bad blocks.

Regards and thanks for the reply.

Pantelis

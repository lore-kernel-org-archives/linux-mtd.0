Received: from avicenna.cc.boun.edu.tr ([193.140.210.25])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19JxNU-00019u-RH
	for <linux-mtd@lists.infradead.org>; Sun, 25 May 2003 16:25:41 +0100
Received: from saritepe.cc.boun.edu.tr ([193.140.192.31])
	M2003052518252204982
	for <linux-mtd@lists.infradead.org>; Sun, 25 May 2003 18:25:22 +0300
Message-ID: <1053887191.3ed10ad7ea7cf@webmail.boun.edu.tr>
Date: Sun, 25 May 2003 18:26:31 +0000
From: kusdogan@boun.edu.tr
To: David Woodhouse <dwmw2@infradead.org>
References: <1053811251.3ecfe23346059@webmail.boun.edu.tr>
	<1053855854.2082.3.camel@passion.cambridge.redhat.com>
In-Reply-To: <1053855854.2082.3.camel@passion.cambridge.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso8859-9;q=1.0
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Oops ERROR : Unable to handle kernel NULL pointer dereference
 at virtual address 00000000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> Thanks for the report. Please could you apply this patch and check what
> it prints...
> 
 Here's the new output. 

H720x-MTD probing 16bit FLASH
 Amd/Fujitsu Extended Query Table v1.0 at 0x0040
number of CFI chips: 1
cfi_cmdset_0002: Disabling fast programming due to code brokenness.
cmdlinepart partition parsing not available
Using builtin partition table
Creating 3 MTD partitions on "SinX Flash":
0x00000000-0x00010000 : "SinX Bootloader"
Add c00895d0 for notifier at c00c787c
Unable to handle kernel NULL pointer dereference at virtual address 00000000
pgd = c0004000
*pgd = 00000000, *pmd = 00000000
Internal error: Oops: ffffffffC

Received: from 220-130-17-250.hinet-ip.hinet.net ([220.130.17.250]
	helo=wellsyn.com)
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D6ltJ-0005S9-TG
	for linux-mtd@lists.infradead.org; Thu, 03 Mar 2005 03:41:09 -0500
Message-ID: <01e801c51fcc$ae93fa10$1b0a060a@WellSyn.org>
From: "Kevin Liao" <kevinliao@wellsyn.com>
To: "MTD List" <linux-mtd@lists.infradead.org>
References: <018701c51fac$bef413b0$1b0a060a@WellSyn.org>
	<1109838505.5398.3.camel@tglx.tec.linutronix.de>
Date: Thu, 3 Mar 2005 16:40:39 +0800
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="big5"; reply-type=original
Content-Transfer-Encoding: 7bit
Subject: Re: compile error (undefined reference to jffs2_getlink) forkernel
	2.4.26
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-03-03 at 16:28+0800, Thomas Gleixner wrote:
> On Thu, 2005-03-03 at 12:52 +0800, Kevin Liao wrote:
>> I use the snapshop 20050302 to patch kernel 2.4.26 for ARM. I get the
>> following
>> error messages when I try to "make zImage":
>>
>> fs/fs.o(.text+0x37944): In function `jffs2_readlink':
>> : undefined reference to `jffs2_getlink'
>> fs/fs.o(.text+0x3799c): In function `jffs2_follow_link':
>> : undefined reference to `jffs2_getlink'
>> drivers/mtd/mtdlink.o(.text+0x5f28): In function
>> `cfi_intelext_partition_fixup':
>> : undefined reference to `__ffs'
>>
>> I find this function "jffs2_getlink" should be in jffs2/read.c but it's 
>> does
>> not
>> exist. Should I wait for later snapshop or I can fix it manuly? Thank a 
>> lot!
>
> Read http://www.linux-mtd.infradead.org/#kernelversions
>
> tglx
>

Thanks for the reply. Actully I had read it before I ask this question.
According to the webpage, the kernel version I used should be ok.
I think the root cause is not the kernel version. Because I serach
the whole directory extracted from snapshop 20050302 but found
no implementation for jffs2_getlink function. Maybe I search the
wrong place?

Regards,
Kevin 

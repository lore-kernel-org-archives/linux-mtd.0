Received: from mail.windriver.com ([147.11.1.11])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PJNMO-00017u-N1
	for linux-mtd@lists.infradead.org; Fri, 19 Nov 2010 09:34:25 +0000
Received: from ALA-MAIL03.corp.ad.wrs.com (ala-mail03 [147.11.57.144])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id oAJ9YMv5021892
	for <linux-mtd@lists.infradead.org>;
	Fri, 19 Nov 2010 01:34:22 -0800 (PST)
From: jgq516@gmail.com
To: linux-mtd@lists.infradead.org
Subject: 
Date: Fri, 19 Nov 2010 17:35:42 +0800
Message-Id: <1290159342-20528-1-git-send-email-jgq516@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I encountered the kernel warning "MTD do_write_buffer(): software timeout" when copy 20KB file to nor flash with flashcp cmd. The flash type is s29gl256p, and the suitable driver for the flash is cfi_cmdset_0002.c.

I think the issue should caused by the following codes in do_write_buffer func.

if (time_after(jiffies, timeo) && !chip_ready(map, adr))
                        break;
[snip]
printk(KERN_WARNING "MTD %s(): software timeout\n",
               __func__ );

After experiments, I found if flashcp a file less than 12kB, the warning is disappeared. Or add some delay before check the chip is ready or not, then I could flashcp a larger size file, more delay can flashcp more size.

However I don't think add delay it is a good solution, from Figure"Write Buffer Programming Operation" of the flash datasheet, we should perform polling algorithm and check the polling status after write buffer program confirm. and xip_udelay implement the polling algorithm, is it right?  But it seems only the arch which support MTD_XIP can use xip_udelay, otherwise UDELAY is defined with cfi_udelay rather than xip_udelay,.

Unfortunately, the cpu in my board doesn't support MTD_XIP now, is this means these archs without MTD_XIP support don't need poll after write buffer?  or is there any good idea to handle the warning? Thanks.
Ps: I used 2.6.34 kernel, and the driver doesn't have obviously change after compare with the latest version.

Best Regards,
Xiao Jiang

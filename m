Received: from wx-out-0506.google.com ([66.249.82.230])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hyl9A-0001zh-CV
	for linux-mtd@lists.infradead.org; Thu, 14 Jun 2007 04:57:41 -0400
Received: by wx-out-0506.google.com with SMTP id h26so572102wxd
	for <linux-mtd@lists.infradead.org>;
	Thu, 14 Jun 2007 01:57:35 -0700 (PDT)
Message-ID: <467102FD.80803@gmail.com>
Date: Thu, 14 Jun 2007 11:57:33 +0300
From: Oleg Kechin <okechin@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Standby/resume and MTD driver
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi
I run 2.6.20-rt8 kernel on board like omap-innovator1510 (OMAP5910 cpu 
ARM925 v4) with NOR flash
and jffs2 filesystem.
In  case to enter standby mode, board enter  cleanly, and it is OK, but 
in resume there is a problem.
(I use echo -n standby > /sys/power/state command)
When it wakes up,  at some times I get string:

omapflash.0: Waiting for chip to be ready timed out. Status 3068
Write of 68 bytes at 0x00945628 failed. returned -5, retlen 0
Not marking the space at 0x00945628 as dirty because the flash driver 
returned retlen zero

I know that the error is in case flash go to standby in one state, but 
return in another. Mtd driver has functions
for such cases  - suspend and resume (cfi_intelext_suspend() & 
cfi_intelext_resume()),
but both of this functions are not calling in suspend/resume process.
I can not find a way to call this function from user space - I can not 
find ioctl or something like that.
May be I have to link those function in some pm list or something like 
that? Is there any example?

PS. Flash to board added like that:
static struct flash_platform_data innovator_flash_data = {
       .map_name       = "cfi_probe",
       .width          = 2,
       .parts          = innovator_partitions,
       .nr_parts       = ARRAY_SIZE(innovator_partitions),
};
static struct resource innovator_flash_resource = {
       .start          = OMAP_CS0_PHYS,
       .end            = OMAP_CS0_PHYS + SZ_32M - 1,
       .flags          = IORESOURCE_MEM,
};
static struct platform_device innovator_flash_device = {
       .name           = "omapflash",
       .id             = 0,
       .dev            = {
               .platform_data  = &innovator_flash_data,
       },
       .num_resources  = 1,
       .resource       = &innovator_flash_resource,
}

Oleg Kechin

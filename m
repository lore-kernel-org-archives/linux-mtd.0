Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R0nOX-00022P-89
	for linux-mtd@lists.infradead.org; Tue, 06 Sep 2011 04:36:22 +0000
Received: by yxk8 with SMTP id 8so2787459yxk.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 05 Sep 2011 21:36:19 -0700 (PDT)
Message-ID: <4E65A33F.5030405@gmail.com>
Date: Tue, 06 Sep 2011 16:36:15 +1200
From: CJ <cjpostor@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: UBIFS + device issue
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am having a problem with Nand and UBIFS. My hardware is similar to the 
OMAP3 BeagleBoard.
My system, kernel, uboot work perfectly when running from the SD card 
using EXT4, when I transfer the system files onto NAND using UBIFS there 
are unusual problems.

When booting everything appears to work and all modules appear to load 
correctly, however device /dev/media0 is not created and does not work 
when manually created. This is tied to a camera module and works fine 
when using the SD card and EXT4.
The rest of the system seems to work fine - however the camera does not 
work because the /dev/media0 device is required.
As mentioned above .. this works fine with everything exactly the same 
when boot from SD card using EXT4.

Has any body seen a problem like this in the past?
Really appreciate your help, I am lost as to what might be causing this 
issue.

Cheers,
CJ

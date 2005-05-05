Received: from xena.bway.net ([216.220.96.26] helo=mail.bway.net)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DTZme-0007RE-Cm
	for linux-mtd@lists.infradead.org; Thu, 05 May 2005 02:24:29 -0400
Message-ID: <4279BBD2.7090408@bway.net>
Date: Thu, 05 May 2005 06:23:14 +0000
From: "Ryan B. Lynch" <rlynch@bway.net>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Setting up multiple 'blkmtd' devices
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I've been using the 'blkmtd' driver as a module, and I understand that 
the only way to set up the device association and create a 
'dev/mtdblock/*' device is to load the module with the option 
'device=/dev/xxx'.

Couple of questions:

    - Is it possible to load more than one device during the 'modprobe' 
command, with something like multiple "device=xxx" options?  I tried 
that exactly, and it doesn't seem to work--it only loads the first 
device listed.

    - Is it possible to set up additional blkmtd devices after the 
module has loaded?  If I issue the command 'modprobe blkmtd 
device=/dev/hdc1', is it possible to add another device later without 
unloading the module?

    - When I've compiled the 'blkmtd' driver into the kernel, I 
understand that I can associate the block device at boot time with the 
boot parameter "blkmtd_device=/dev/xxx".  If I don't pass a 
"blkmtd_device=" parameter at boot-time, is there any way to associate a 
device later on?

    - Given the compiled-in scenario for the 'blkmtd' driver, is it 
possible to bring in multiple devices, regardless of whether the 
boot-time parameter is passed?

    - Is there a userspace tool, along the lines of 'losetup' or 
'brctl', that allows you to manipulate/query blkmtd devices without 
using the module options?

I hope these are straightforward enough.  Thanks for the time.

-Ryan

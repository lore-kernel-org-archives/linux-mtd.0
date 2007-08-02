Received: from wx-out-0506.google.com ([66.249.82.235])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IGhLK-0007wg-A3
	for linux-mtd@lists.infradead.org; Thu, 02 Aug 2007 16:32:29 -0400
Received: by wx-out-0506.google.com with SMTP id s7so525287wxc
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Aug 2007 13:32:20 -0700 (PDT)
Message-ID: <ac921f990708021332v2a2f50e0o49a2c70773e7a94d@mail.gmail.com>
Date: Thu, 2 Aug 2007 16:32:20 -0400
From: "James Olin Oden" <james.oden@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Having problem detecting ST Micro M50FW080 firmware hub
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am on a 2.6.18 Fedora Kernel, and I have tried to load the mtdchar
driver.  When I do this it loads fine but I do not see /dev/mtd0
appear (actually I would have assumed /dev/mtd0 and /dev/mtd1 would
have showed up as their are two hubs on the system).  The kernel does
have mtd support (other than the fact that modules do exist I looked
at the config), and this device appears to me to be supported by the
MTD subsystem (I saw its setup in jedec_probe.c).

All that said I have not been able to find docs that explain how to
setup a system to use MTD (i.e. what modules to load with what
paramters if any), and I am mostly out of my element digging around
with hardware at this level, so I have probably missed something
obvious.

Any idea what I have neglected to do or why MTD would not be detecting
my firmware hub?

My goal is to use this is as mechanism for updating our systems
BIOSes, and discard our home grown proprietary driver.  No filesystem
support is necessary, and I have surmised all I should need is the
char driver?  Is that correct?

Thanks...james

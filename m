Received: from main.gmane.org ([80.91.224.249])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BxlN6-00015R-Uf
	for linux-mtd@lists.infradead.org; Thu, 19 Aug 2004 07:46:26 -0400
Received: from list by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 1BxlN2-0005Jt-00
	for <linux-mtd@lists.infradead.org>; Thu, 19 Aug 2004 13:46:18 +0200
Received: from a2125958202.net-htp.de ([212.59.58.202])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 19 Aug 2004 13:46:16 +0200
Received: from sst by a2125958202.net-htp.de with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 19 Aug 2004 13:46:16 +0200
To: linux-mtd@lists.infradead.org
From: =?ISO-8859-1?Q?Stefan_St=FCrke?= <sst@pandatel.com>
Date: Thu, 19 Aug 2004 13:46:12 +0200
Message-ID: <cg23u5$gd0$1@sea.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Sender: news <news@sea.gmane.org>
Subject: MTD and 28F128J3A
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have a problem with the 28F128J3A flash during system reboot.

Environment:

- mpc8270
- linuxppc_2_4_devel (snapshot from the denx ppc tree based on 2.4.25)
- mtd version included in that tree
- a jffs2 file system is mounted on the flash

Problem:

When I reboot the system, I get a kernel panic right after the jump to 
the reset vector in m8260_gorom().

Using my BDI2000 I was able to find out that the kernel panic occurred
because 8260_gorom tries to execute some code in Flash (this is
correct because the bootloader is also located in that flash) but the
Flash is in query mode at this time. So the correct code could not be
read by the processor

So my question: Why is the flash left in query mode?
I found that also in normal operation the flash is in query mode after
writing to it. Is this ok? (I have no problems during normal operation).
What can I do to leave the query mode before reboot?

When I use the same hardware platform with another flash type
AMD29LV128M I have no problems during reboot.

One difference I can think of is, that in the case of the
28F128J3A the chips/cfi_cmdset_0001 driver is used, while in the case
of the AMD29LV128M the chips/cfi_cmdset_0002 driver is used.
Any ideas?

Thanks in advance,
Stefan

-- 
Stefan Stürke

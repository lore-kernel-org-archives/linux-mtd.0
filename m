Received: from [207.236.123.4] (helo=mail.oerlikon.ca)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19889Y-000142-FX
	for <linux-mtd@lists.infradead.org>; Wed, 23 Apr 2003 01:30:24 +0100
Date: Tue, 22 Apr 2003 20:31:06 -0400
From: Dominic Duval <dduval@oerlikon.ca>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Message-ID: <MAIL7EjQxzmWecm9t0C000000d9@mail.oerlikon.ca>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Subject: Unlocking Intel K3 StrataFlash at boot time
Reply-To: dduval@oerlikon.ca
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm currently trying to boot from a XScale board which has some Intel
StrataFlash banks (K3). However, it appears that the K3 flash in locked by
default, so I'm getting some errors when the root partition is mounted by
the Kernel in read/write mode.

I figured the only way to work around this problem is to unlock the K3
Flash before the Kernel mounts the root partition. Since our own bootloader
doesn't support the K3 Flash, the only place left is right in the Kernel,
probably just before the MTD device gets mounted.

I'd therefore like to know if this has been done before. If it has not, am
I on the right track here? And is there a place in the mtd code which would
be particularly well suited for placing the unlocking stuff? 

I'm no expert in MTD Flash devices, so your advice will be appreciated.

Cheers,

		-Dominic

-- 
Dominic Duval
dduval@oerlikon.ca

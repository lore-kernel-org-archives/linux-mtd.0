Received: from w228.z208176144.sjc-ca.dsl.cnc.net ([208.176.144.228]
	helo=ns1.pwrseries.com)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EKPvn-0003q8-S1
	for linux-mtd@lists.infradead.org; Tue, 27 Sep 2005 20:36:37 -0400
Received: from jmd (w238.z208176144.sjc-ca.dsl.cnc.net [208.176.144.238])
	(authenticated bits=0)
	by ns1.pwrseries.com (8.12.8/8.12.8) with ESMTP id j8S0DSYu025429
	(version=TLSv1/SSLv3 cipher=DES-CBC3-SHA bits=168 verify=NO)
	for <linux-mtd@lists.infradead.org>; Tue, 27 Sep 2005 17:13:28 -0700
From: "Joseph M Dupre (AVAB Inc.)" <dupre@avab.com>
To: linux-mtd@lists.infradead.org
Date: Tue, 27 Sep 2005 17:36:15 -0700
MIME-Version: 1.0
Message-ID: <4339830F.14600.1D083FD@localhost>
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body
Subject: DOCBoot: "diskonchip" driver depreciated?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The DOCboot README refers to the kernel's diskonchip driver.

I am currently working with an un-patched 2.6.11.12 kernel.  It it 
there are drivers for Disk-On-Chip 2000 and various Millennium 
devices.  These are all marked depreciated.  Menuconfig help suggests 
to use the generic NAND device driver instead on the Disk-On-Chip 
driver.

Should this generic NAND driver work in conjunction with the DOCboot 
code and a "newer" DOC 2000 device?

I'm not tied to this kernel by any means, it is just what was current 
when I started.  But I _do_ need to get booting from the DOC 2000 
device and have not yet figured out how to do this.  I am using the 
DOC MD2202 series DIP on an i486 platform.

Thanks,

- Joe
 

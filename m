Received: from w228.z208176144.sjc-ca.dsl.cnc.net ([208.176.144.228]
	helo=ns1.pwrseries.com)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EKhSm-0001Ck-Sh
	for linux-mtd@lists.infradead.org; Wed, 28 Sep 2005 15:20:05 -0400
Received: from jmd (w238.z208176144.sjc-ca.dsl.cnc.net [208.176.144.238])
	(authenticated bits=0)
	by ns1.pwrseries.com (8.12.8/8.12.8) with ESMTP id j8SIuVYu027134
	(version=TLSv1/SSLv3 cipher=DES-CBC3-SHA bits=168 verify=NO)
	for <linux-mtd@lists.infradead.org>; Wed, 28 Sep 2005 11:56:31 -0700
From: "Joseph M Dupre (AVAB Inc.)" <dupre@avab.com>
To: linux-mtd@lists.infradead.org
Date: Wed, 28 Sep 2005 12:19:21 -0700
MIME-Version: 1.0
Message-ID: <433A8A49.27652.B22ADB@localhost>
In-reply-to: <433AA62B.20102@ieee.org>
References: <4339830F.14600.1D083FD@localhost>
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body
Subject: Re: DOCBoot: "diskonchip" driver depreciated?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 28 Sep 2005 at 10:18, Dan Brown wrote:

> I'll have to check the menuconfig wording, but what it should say is
> to use the new DOC driver that works *with* the generic NAND device
> layer, rather than the old DOC driver(s) that doesn't.  If you enable
> NAND support, you'll find this new driver.

Ah ha.  I had CONFIG_EXPERIMENTAL unset which prevented the new 
driver from showing up under NAND Flash Device Drivers.  I will carry 
on...

- Joe

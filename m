Received: from node3.inaccessnetworks.com ([212.205.200.118]
	helo=vm-dmz.priv.inaccessnetworks.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LHFpP-0000n6-3s
	for linux-mtd@lists.infradead.org; Mon, 29 Dec 2008 10:58:31 +0000
Received: from bender.priv.inaccessnetworks.com ([192.168.1.223])
	by vm-dmz.priv.inaccessnetworks.com with esmtp (Exim 4.69)
	(envelope-from <knakos@inaccessnetworks.com>) id 1LHFpN-00068A-Oe
	for linux-mtd@lists.infradead.org; Mon, 29 Dec 2008 12:58:29 +0200
Message-ID: <4958AD4E.8090608@inaccessnetworks.com>
Date: Mon, 29 Dec 2008 12:58:22 +0200
From: Kostas Nakos <knakos@inaccessnetworks.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] ndfc driver
References: <4950D8EA.7010905@inaccessnetworks.com>
	<20081223170040.4e58de3f@lappy.seanm.ca>
In-Reply-To: <20081223170040.4e58de3f@lappy.seanm.ca>
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

Sean MacLennan wrote:
> I am not a DTS expert, I just use it ;) But are you sure the second
> value should be d0000000?

Alright, with:

<0 0 2000>  ->

__ioremap(): phys addr 0x0 is RAM lr c0008c94
ndfc 0.ndfc: failed to get memory
ndfc: probe of 0.ndfc failed with error -5

I notice that the 0xd0000000 value is also defined in the (our) platform 
include for our platform in u-boot (include/configs/...):

#define CFG_NAND_ADDR           0xd0000000

> Are you using u-boot and, if so, what version? The ecc_code was
> changed to match u-boot. We are using a heavily modified 1.3.3.

The uboot version string is:

U-Boot 1.3.3-svn2646 (Jul 11 2008 - 15:45:55)

Best Regards,
Kostas

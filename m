Received: from mail2.aviatnet.com ([192.147.115.134])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O2Glp-0000Vm-Uo
	for linux-mtd@lists.infradead.org; Thu, 15 Apr 2010 04:33:43 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: selecting UBI boot partition on startup
Date: Wed, 14 Apr 2010 21:32:58 -0700
Message-ID: <0687C69BF96AF349833719247B11C1CE76ED6C@exchtxus2.HSTX.global.vpn>
From: "Deon Carr" <Deon.Carr@Aviatnet.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,=20

I am designing a high availability system that requires two copies of
the system software with uboot booting the kernel / rootfs of the most
recent software.=20

My intended nand flash arrangement is along the lines of:

MTD0       MTD1
--------------------
UBOOT | UBI Layer
--------------------

The UBI layer will have two UBI volumes which will be formatted for
UBIFS. The intention is to package the kernel / rootfs and application
all in the single volume.=20


What is the best method of selecting UBI volume to boot from in uboot?

I could store a boot flag in each UBIFS along with the kernel, however
this will require reading both volumes in uboot to determine which one
to boot from. An alternative is to create a third smaller UBI volume
which instructs which UBI volume to boot from.

Is there a better way of handling this? Is it possible to reorder the
UBI volumes dynamically? If this were possible I could have uboot always
boot UBI0 and just rearrange UBI0, UBI1 whenever I need change the
volume to boot from.=20



Thanks in advance.

Deon

Received: from calf.ext.ti.com ([198.47.26.144])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IXtKq-0002x4-Di
	for linux-mtd@lists.infradead.org; Wed, 19 Sep 2007 02:47:01 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: modifying boot option
Date: Wed, 19 Sep 2007 12:16:02 +0530
Message-ID: <F6FE727D1D69E340844C253265136D5D032EE8B9@dbde01.ent.ti.com>
In-Reply-To: <001901c7fa13$248e0bc0$076fa8c0@Sara>
From: "Shah, Hardik" <hardik.s@ti.com>
To: "chanemouganandam saravanan" <schane@osmozis.com>,
	<linux-arm@lists.arm.linux.org.uk>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


-----Original Message-----
From: linux-arm-bounces@lists.arm.linux.org.uk
[mailto:linux-arm-bounces@lists.arm.linux.org.uk] On Behalf Of
chanemouganandam saravanan
Sent: Tuesday, September 18, 2007 10:14 PM
To: linux-arm@lists.arm.linux.org.uk
Cc: linux-mtd@lists.infradead.org
Subject: modifying boot option

Hi all,

Where can I find information to modify "Kernel command line" boot
parameters in the NOR flash=20
while running linux and not through bootloader commands.=20
I want to change the boot option root=3D/dev/mtdblock1 to =
root=3D/dev/nfs in
the NOR flash (/dev/mtdblock0 partition).

Thanks

Sara



Hi,
Change the CONFIG_CMDLINE variable in your .config file to mount network
file system. =20

e.g. CONFIG_CMDLINE=3D"console=3DttyS0,38400n81 ip=3Dbootp =
root=3D/dev/nfs rw"

Thanks,
Hardik
-------------------------------------------------------------------
List admin: http://lists.arm.linux.org.uk/mailman/listinfo/linux-arm
FAQ:        http://www.arm.linux.org.uk/mailinglists/faq.php
Etiquette:  http://www.arm.linux.org.uk/mailinglists/etiquette.php

Received: from mailrelay005.isp.belgacom.be ([195.238.6.171])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JeUz7-0004Yo-6d
	for linux-mtd@lists.infradead.org; Wed, 26 Mar 2008 12:44:05 +0000
From: Laurent Pinchart <laurentp@cse-semaphore.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] [MTD] Add support for RAM & ROM mappings in the
	physmap_of MTD driver.
MIME-Version: 1.0
Content-Disposition: inline
Date: Wed, 26 Mar 2008 13:44:03 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Message-Id: <200803261344.03438.laurentp@cse-semaphore.com>
Cc: ben@simtec.co.uk, linuxppc-dev@ozlabs.org,
	Rune Torgersen <runet@innovsys.com>,
	Sergei Shtylyov <sshtylyov@ru.mvista.com>,
	David Gibson <david@gibson.dropbear.id.au>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Laurent Pinchart <laurentp@cse-semaphore.com>
=2D--
 drivers/mtd/maps/physmap_of.c |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index 49acd41..65c30b5 100644
=2D-- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -273,6 +273,14 @@ static struct of_device_id of_flash_match[] =3D {
 		.data		=3D (void *)"jedec_probe",
 	},
 	{
+		.compatible	=3D "physmap-ram",
+		.data		=3D (void *)"map_ram",
+	},
+	{
+		.compatible	=3D "physmap-rom",
+		.data		=3D (void *)"map_rom",
+	},
+	{
 		.type		=3D "rom",
 		.compatible	=3D "direct-mapped"
 	},
=2D-=20
1.5.0


=2D-=20
Laurent Pinchart
CSE Semaphore Belgium

Chauss=E9e de Bruxelles, 732A
B-1410 Waterloo
Belgium

T +32 (2) 387 42 59
=46 +32 (2) 387 42 75

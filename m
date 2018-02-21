Received: from mail-oln040092003094.outbound.protection.outlook.com
 ([40.92.3.94] helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eoa8C-0006vp-7W
 for linux-mtd@lists.infradead.org; Wed, 21 Feb 2018 19:32:45 +0000
From: Bean Huo <beanhuo@outlook.com>
To: "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "boris.brezillon@free-elections.com"
 <boris.brezillon@free-elections.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "richard@nod.at" <richard@nod.at>,
 "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com"
 <mark.rutland@arm.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
CC: beanhuo <beanhuo@micron.com>
Subject: [PATCH v1 1/3] mtd: physmap: add dual die entry in devicetree binding
Date: Wed, 21 Feb 2018 19:32:32 +0000
Message-ID: <DM2PR12MB001463BD62775C388AEBFD3FA6CE0@DM2PR12MB0014.namprd12.prod.outlook.com>
References: <1519241514-6466-1-git-send-email-beanhuo@outlook.com>
In-Reply-To: <1519241514-6466-1-git-send-email-beanhuo@outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: beanhuo <beanhuo@micron.com>

This commit adds the dual die entry in the devicetree binding
for the daul die stacked parallel NOR.

Signed-off-by: beanhuo <beanhuo@micron.com>
---
 Documentation/devicetree/bindings/mtd/mtd-physmap.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/mtd-physmap.txt b/Docume=
ntation/devicetree/bindings/mtd/mtd-physmap.txt
index 4a0a48b..782bacc 100644
--- a/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
+++ b/Documentation/devicetree/bindings/mtd/mtd-physmap.txt
@@ -29,6 +29,8 @@ file systems on embedded devices.
  - use-advanced-sector-protection: boolean to enable support for the
    advanced sector protection (Spansion: PPB - Persistent Protection
    Bits) locking.
+ - dual-die-stack: boolean to enable support for the devices with the
+   two dies in stack.
=20
 For JEDEC compatible devices, the following additional properties
 are defined:
--=20
2.7.4

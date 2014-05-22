Received: from mail-ie0-f172.google.com ([209.85.223.172])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WnR7J-0003gL-NM
 for linux-mtd@lists.infradead.org; Thu, 22 May 2014 11:24:58 +0000
Received: by mail-ie0-f172.google.com with SMTP id tp5so3383552ieb.31
 for <linux-mtd@lists.infradead.org>; Thu, 22 May 2014 04:24:36 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/10] mtd: st_spi_fsm: Provide documentation for boot device
 mask property
Date: Thu, 22 May 2014 12:24:06 +0100
Message-Id: <1400757848-18075-9-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1400757848-18075-1-git-send-email-lee.jones@linaro.org>
References: <1400757848-18075-1-git-send-email-lee.jones@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The system configuration registers which display which device the system
booted on are in the same place on all boards which support the FSM.
However, the bits do shift every so slightly.  To combat these we're
adding a new property which supplies the necessary mask used to abstract
the required information.

Cc: devicetree@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 Documentation/devicetree/bindings/mtd/st-fsm.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/st-fsm.txt b/Documentation/devicetree/bindings/mtd/st-fsm.txt
index c248939..0523fd4 100644
--- a/Documentation/devicetree/bindings/mtd/st-fsm.txt
+++ b/Documentation/devicetree/bindings/mtd/st-fsm.txt
@@ -11,6 +11,8 @@ Optional properties:
   - st,syscfg          : Phandle to boot-device system configuration registers
   - st,boot-device-reg : Address of the aforementioned boot-device register(s)
   - st,boot-device-spi : Expected boot-device value if booted via this device
+  - st,boot-device-msk : Mask to use when extracting boot device from the
+			 above system config registers
 
 Example:
 	spifsm: spifsm@fe902000{
-- 
1.8.3.2

Received: from mail-ig0-f172.google.com ([209.85.213.172])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WnRf7-0003ZP-1d
 for linux-mtd@lists.infradead.org; Thu, 22 May 2014 11:59:53 +0000
Received: by mail-ig0-f172.google.com with SMTP id uy17so7487427igb.11
 for <linux-mtd@lists.infradead.org>; Thu, 22 May 2014 04:59:32 -0700 (PDT)
Date: Thu, 22 May 2014 12:59:27 +0100
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/10] mtd: st_spi_fsm: Provide documentation for boot
 device mask property
Message-ID: <20140522115927.GY6679@lee--X1>
References: <1400757848-18075-1-git-send-email-lee.jones@linaro.org>
 <1400757848-18075-9-git-send-email-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1400757848-18075-9-git-send-email-lee.jones@linaro.org>
Cc: devicetree@vger.kernel.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, arnd@arndb.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mtd: st_spi_fsm: Provide documentation for boot device mask property

The system configuration registers which display which device the system
booted on are in the same place on all boards which support the FSM.
However, the bits do shift every so slightly.  To combat these we're
adding a new property which supplies the necessary mask used to abstract
the required information.

Cc: devicetree@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>

diff --git a/Documentation/devicetree/bindings/mtd/st-fsm.txt b/Documentation/devicetree/bindings/mtd/st-fsm.txt
index c248939..2ef9710 100644
--- a/Documentation/devicetree/bindings/mtd/st-fsm.txt
+++ b/Documentation/devicetree/bindings/mtd/st-fsm.txt
@@ -11,6 +11,10 @@ Optional properties:
   - st,syscfg          : Phandle to boot-device system configuration registers
   - st,boot-device-reg : Address of the aforementioned boot-device register(s)
   - st,boot-device-spi : Expected boot-device value if booted via this device
+  - st,boot-device-msk : Mask to use when extracting boot device from the
+                        above system config registers
+  NB: If any of the st,boot-device-* properties are missing, the driver falls
+  back to the default assumption of 'booted from SPI'.
 
 Example:
        spifsm: spifsm@fe902000{

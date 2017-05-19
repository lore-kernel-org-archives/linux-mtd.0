Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by merlin.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWfG-0005jx-Ji
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:25:12 +0000
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 29/30] phy.txt: standardize document format
Date: Thu, 18 May 2017 22:24:21 -0300
Message-Id: <ac517573a4d8ba17ab1d0d1bfc08fa9c9d751ada.1495156975.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495156975.git.mchehab@s-opensource.com>
References: <cover.1495156975.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495156975.git.mchehab@s-opensource.com>
References: <cover.1495156975.git.mchehab@s-opensource.com>
Sender: Mauro Carvalho Chehab <mchehab@smtp.s-opensource.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Each text file under Documentation follows a different
format. Some doesn't even have titles!

Change its representation to follow the adopted standard,
using ReST markups for it to be parseable by Sphinx:

- mark titles;
- use :Author: for authorship;
- mark literal blocks.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/phy.txt | 106 +++++++++++++++++++++++++++++++-------------------
 1 file changed, 67 insertions(+), 39 deletions(-)

diff --git a/Documentation/phy.txt b/Documentation/phy.txt
index 383cdd863f08..457c3e0f86d6 100644
--- a/Documentation/phy.txt
+++ b/Documentation/phy.txt
@@ -1,10 +1,14 @@
-			    PHY SUBSYSTEM
-		  Kishon Vijay Abraham I <kishon@ti.com>
+=============
+PHY subsystem
+=============
+
+:Author: Kishon Vijay Abraham I <kishon@ti.com>
 
 This document explains the Generic PHY Framework along with the APIs provided,
 and how-to-use.
 
-1. Introduction
+Introduction
+============
 
 *PHY* is the abbreviation for physical layer. It is used to connect a device
 to the physical medium e.g., the USB controller has a PHY to provide functions
@@ -21,7 +25,8 @@ better code maintainability.
 This framework will be of use only to devices that use external PHY (PHY
 functionality is not embedded within the controller).
 
-2. Registering/Unregistering the PHY provider
+Registering/Unregistering the PHY provider
+==========================================
 
 PHY provider refers to an entity that implements one or more PHY instances.
 For the simple case where the PHY provider implements only a single instance of
@@ -30,11 +35,14 @@ of_phy_simple_xlate. If the PHY provider implements multiple instances, it
 should provide its own implementation of of_xlate. of_xlate is used only for
 dt boot case.
 
-#define of_phy_provider_register(dev, xlate)    \
-        __of_phy_provider_register((dev), NULL, THIS_MODULE, (xlate))
+::
 
-#define devm_of_phy_provider_register(dev, xlate)       \
-        __devm_of_phy_provider_register((dev), NULL, THIS_MODULE, (xlate))
+	#define of_phy_provider_register(dev, xlate)    \
+		__of_phy_provider_register((dev), NULL, THIS_MODULE, (xlate))
+
+	#define devm_of_phy_provider_register(dev, xlate)       \
+		__devm_of_phy_provider_register((dev), NULL, THIS_MODULE,
+						(xlate))
 
 of_phy_provider_register and devm_of_phy_provider_register macros can be used to
 register the phy_provider and it takes device and of_xlate as
@@ -47,28 +55,35 @@ nodes within extra levels for context and extensibility, in which case the low
 level of_phy_provider_register_full() and devm_of_phy_provider_register_full()
 macros can be used to override the node containing the children.
 
-#define of_phy_provider_register_full(dev, children, xlate) \
-	__of_phy_provider_register(dev, children, THIS_MODULE, xlate)
+::
 
-#define devm_of_phy_provider_register_full(dev, children, xlate) \
-	__devm_of_phy_provider_register_full(dev, children, THIS_MODULE, xlate)
+	#define of_phy_provider_register_full(dev, children, xlate) \
+		__of_phy_provider_register(dev, children, THIS_MODULE, xlate)
 
-void devm_of_phy_provider_unregister(struct device *dev,
-	struct phy_provider *phy_provider);
-void of_phy_provider_unregister(struct phy_provider *phy_provider);
+	#define devm_of_phy_provider_register_full(dev, children, xlate) \
+		__devm_of_phy_provider_register_full(dev, children,
+						     THIS_MODULE, xlate)
+
+	void devm_of_phy_provider_unregister(struct device *dev,
+		struct phy_provider *phy_provider);
+	void of_phy_provider_unregister(struct phy_provider *phy_provider);
 
 devm_of_phy_provider_unregister and of_phy_provider_unregister can be used to
 unregister the PHY.
 
-3. Creating the PHY
+Creating the PHY
+================
 
 The PHY driver should create the PHY in order for other peripheral controllers
 to make use of it. The PHY framework provides 2 APIs to create the PHY.
 
-struct phy *phy_create(struct device *dev, struct device_node *node,
-		       const struct phy_ops *ops);
-struct phy *devm_phy_create(struct device *dev, struct device_node *node,
-			    const struct phy_ops *ops);
+::
+
+	struct phy *phy_create(struct device *dev, struct device_node *node,
+			       const struct phy_ops *ops);
+	struct phy *devm_phy_create(struct device *dev,
+				    struct device_node *node,
+				    const struct phy_ops *ops);
 
 The PHY drivers can use one of the above 2 APIs to create the PHY by passing
 the device pointer and phy ops.
@@ -84,12 +99,16 @@ phy_ops to get back the private data.
 Before the controller can make use of the PHY, it has to get a reference to
 it. This framework provides the following APIs to get a reference to the PHY.
 
-struct phy *phy_get(struct device *dev, const char *string);
-struct phy *phy_optional_get(struct device *dev, const char *string);
-struct phy *devm_phy_get(struct device *dev, const char *string);
-struct phy *devm_phy_optional_get(struct device *dev, const char *string);
-struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
-				     int index);
+::
+
+	struct phy *phy_get(struct device *dev, const char *string);
+	struct phy *phy_optional_get(struct device *dev, const char *string);
+	struct phy *devm_phy_get(struct device *dev, const char *string);
+	struct phy *devm_phy_optional_get(struct device *dev,
+					  const char *string);
+	struct phy *devm_of_phy_get_by_index(struct device *dev,
+					     struct device_node *np,
+					     int index);
 
 phy_get, phy_optional_get, devm_phy_get and devm_phy_optional_get can
 be used to get the PHY. In the case of dt boot, the string arguments
@@ -111,30 +130,35 @@ the phy_init() and phy_exit() calls, and phy_power_on() and
 phy_power_off() calls are all NOP when applied to a NULL phy. The NULL
 phy is useful in devices for handling optional phy devices.
 
-5. Releasing a reference to the PHY
+Releasing a reference to the PHY
+================================
 
 When the controller no longer needs the PHY, it has to release the reference
 to the PHY it has obtained using the APIs mentioned in the above section. The
 PHY framework provides 2 APIs to release a reference to the PHY.
 
-void phy_put(struct phy *phy);
-void devm_phy_put(struct device *dev, struct phy *phy);
+::
+
+	void phy_put(struct phy *phy);
+	void devm_phy_put(struct device *dev, struct phy *phy);
 
 Both these APIs are used to release a reference to the PHY and devm_phy_put
 destroys the devres associated with this PHY.
 
-6. Destroying the PHY
+Destroying the PHY
+==================
 
 When the driver that created the PHY is unloaded, it should destroy the PHY it
-created using one of the following 2 APIs.
+created using one of the following 2 APIs::
 
-void phy_destroy(struct phy *phy);
-void devm_phy_destroy(struct device *dev, struct phy *phy);
+	void phy_destroy(struct phy *phy);
+	void devm_phy_destroy(struct device *dev, struct phy *phy);
 
 Both these APIs destroy the PHY and devm_phy_destroy destroys the devres
 associated with this PHY.
 
-7. PM Runtime
+PM Runtime
+==========
 
 This subsystem is pm runtime enabled. So while creating the PHY,
 pm_runtime_enable of the phy device created by this subsystem is called and
@@ -150,7 +174,8 @@ There are exported APIs like phy_pm_runtime_get, phy_pm_runtime_get_sync,
 phy_pm_runtime_put, phy_pm_runtime_put_sync, phy_pm_runtime_allow and
 phy_pm_runtime_forbid for performing PM operations.
 
-8. PHY Mappings
+PHY Mappings
+============
 
 In order to get reference to a PHY without help from DeviceTree, the framework
 offers lookups which can be compared to clkdev that allow clk structures to be
@@ -158,12 +183,15 @@ bound to devices. A lookup can be made be made during runtime when a handle to
 the struct phy already exists.
 
 The framework offers the following API for registering and unregistering the
-lookups.
+lookups::
 
-int phy_create_lookup(struct phy *phy, const char *con_id, const char *dev_id);
-void phy_remove_lookup(struct phy *phy, const char *con_id, const char *dev_id);
+	int phy_create_lookup(struct phy *phy, const char *con_id,
+			      const char *dev_id);
+	void phy_remove_lookup(struct phy *phy, const char *con_id,
+			       const char *dev_id);
 
-9. DeviceTree Binding
+DeviceTree Binding
+==================
 
 The documentation for PHY dt binding can be found @
 Documentation/devicetree/bindings/phy/phy-bindings.txt
-- 
2.9.4

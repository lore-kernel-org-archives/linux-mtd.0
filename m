Received: from qw-out-1920.google.com ([74.125.92.146])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MWXUx-0006nP-Ja
	for linux-mtd@lists.infradead.org; Thu, 30 Jul 2009 15:24:57 +0000
Received: by qw-out-1920.google.com with SMTP id 5so1017141qwf.24
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Jul 2009 08:24:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4A71B940.80607@uiuc.edu>
References: <1248958178-22599-1-git-send-email-sgayda2@uiuc.edu>
	<4A719A27.8050509@linutronix.de>
	<ce9ab5790907300639k3173446csbd07198055bfe122@mail.gmail.com>
	<4A71A483.30507@linutronix.de>
	<ce9ab5790907300714u5c88f1cdk8c0387de5ba9f413@mail.gmail.com>
	<4A71AD5E.4080704@uiuc.edu> <4A71B401.1090208@linutronix.de>
	<ce9ab5790907300813r2c35249csbce608a0f7533562@mail.gmail.com>
	<4A71B940.80607@uiuc.edu>
From: vimal singh <vimal.newwork@gmail.com>
Date: Thu, 30 Jul 2009 20:54:27 +0530
Message-ID: <ce9ab5790907300824i919aa54m5b483f257051add6@mail.gmail.com>
Subject: Re: [PATCH] [mtd] fixed faulty check
To: Stoyan Gaydarov <sgayda2@uiuc.edu>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: kay.sievers@vrfy.org, David.Woodhouse@intel.com, gregkh@suse.de,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, sr@denx.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch fixes a spelling error that has resulted from copy and
pasting. The location of the error was found using a semantic patch
but the semantic patch was not trying to find these errors. After
looking things over it seemed logical that this change was needed.

The patch also makes sure mtd_list is not being freed if it has not
been allocated

Signed-off-by: Stoyan Gaydarov <sgayda2@uiuc.edu>
Signed-off-by: Vimal Singh <vimalsingh@ti.com>
---

diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index 39d357b..584a1c8 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -204,7 +204,7 @@ static int __devinit of_flash_probe(struct of_device *dev,
 		dev_err(&dev->dev, "Malformed reg property on %s\n",
 				dev->node->full_name);
 		err = -EINVAL;
-		goto err_out;
+		goto err_flash_remove;
 	}
 	count /= reg_tuple_size;

@@ -212,14 +212,14 @@ static int __devinit of_flash_probe(struct of_device *dev,
 	info = kzalloc(sizeof(struct of_flash) +
 		       sizeof(struct of_flash_list) * count, GFP_KERNEL);
 	if (!info)
-		goto err_out;
-
-	mtd_list = kzalloc(sizeof(struct mtd_info) * count, GFP_KERNEL);
-	if (!info)
-		goto err_out;
+		goto err_flash_remove;

 	dev_set_drvdata(&dev->dev, info);

+	mtd_list = kzalloc(sizeof(struct mtd_info) * count, GFP_KERNEL);
+	if (!mtd_list)
+		goto err_flash_remove;
+
 	for (i = 0; i < count; i++) {
 		err = -ENXIO;
 		if (of_address_to_resource(dp, i, &res)) {
@@ -338,6 +338,7 @@ static int __devinit of_flash_probe(struct of_device *dev,

 err_out:
 	kfree(mtd_list);
+err_flash_remove:
 	of_flash_remove(dev);

 	return err;

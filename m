Received: from mail-qy0-f181.google.com ([209.85.221.181])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MWXKf-0004he-IU
	for linux-mtd@lists.infradead.org; Thu, 30 Jul 2009 15:14:18 +0000
Received: by qyk11 with SMTP id 11so967156qyk.28
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Jul 2009 08:14:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4A71B401.1090208@linutronix.de>
References: <1248958178-22599-1-git-send-email-sgayda2@uiuc.edu>
	<4A719A27.8050509@linutronix.de>
	<ce9ab5790907300639k3173446csbd07198055bfe122@mail.gmail.com>
	<4A71A483.30507@linutronix.de>
	<ce9ab5790907300714u5c88f1cdk8c0387de5ba9f413@mail.gmail.com>
	<4A71AD5E.4080704@uiuc.edu> <4A71B401.1090208@linutronix.de>
From: vimal singh <vimal.newwork@gmail.com>
Date: Thu, 30 Jul 2009 20:43:51 +0530
Message-ID: <ce9ab5790907300813r2c35249csbce608a0f7533562@mail.gmail.com>
Subject: Re: [PATCH] [mtd] fixed faulty check
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Stoyan Gaydarov <sgayda2@uiuc.edu>, kay.sievers@vrfy.org, gregkh@suse.de,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	sr@denx.de, David.Woodhouse@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 30, 2009 at 8:23 PM, Sebastian Andrzej
Siewior<bigeasy@linutronix.de> wrote:
> Stoyan Gaydarov wrote:
>>>>
>>>> We have to and of_flash_remove() takes care of it.
>>>>
>>>
>>>
>>
>> Does this mean that the original patch is fine or does it still need the
>> kfree? From what i understand when going to err_out it will take care of
>> info using of_flash_remove() so then it is not needed in the if check.
>
> The original patch was fine but it leaked info. of_flash_remove() does the
> cleanup of info but only if it is part of driver's data (after the
> of_flash_remove()). So you have to call dev_set_drvdata(&dev->dev, info)
> earlier, after the kzalloc() to save the data or else there is no clean
> up.
>

Is this patch looks OK??


diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index 39d357b..d104cfc 100644
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
+eerr_flash_remov:
 	of_flash_remove(dev);

 	return err;

Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53E860A2635
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RPgsmmgM;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KqWXhJSm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=A8l0oLrtiNqSVLx0y1MZELT/e8hpboIvxVxXVDngUII=; b=RPgsmmgMZrayoCcq3CJXVGg46n
	xg2XnmrRnhpZsLEZoYdLjBuoI49CqJYokaSTxtpkEOqTkMoTCu0DRxb7j03NJNH8gfYJKF6rvFuwX
	L0hQummrt+JrsVl8rfrf0lOsMRo+e9nrw5OguD9sh8C7zMjcjfpsEwuzOdzcveY+n+4vlcBjnFeL8
	4R4s7fYuoHrjMkdfaj6SN+O5FQZC7IeSH2s6qLOT0rghTyxhRx9deAe0NVN8YTtEeY0+loQI4mPhP
	Sm4ac0EQQ9LLiIBIrBoHgaULm6MX8f6y5lzbyldfVgxDN4QwN+HN4zdh6rEu68zJKyGQx0xNh2nex
	9USPJc9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgWn-00000002vjm-1mU1;
	Tue, 10 Nov 2026 07:44:25 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgWl-00000002vi9-0xK4
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:44:24 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-4d7034a99a9so956058b6e.3
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296662; x=1794901462; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q4Npotuz+vf92zyWk0dS+G8jQDeJZBCIwSnu3ob9NFI=;
        b=KqWXhJSm0sGND9eSUY+zXsPzOZjQNJuP8FtlXETJcwvOF/uyRQm5lcaklm8T6esNaM
         e8/PoE7dgSzUkV9FPyQP8HaZFBjRzguWFSyX4sBCz2ox2ZrC4UtphjR6tf0CcD+WAUnf
         4yJobElN/51xfcR347Q41PICkW8aLvuBLJMdm1oBqLLrQ1YSdlUcbBy6A591Qh3rpQ8a
         1yQTif+GWdVoyY17NM8u+E2PntjWg5ZBw1yIlktWddCjgiVZ916ZphdG4hV+a7l9MoJM
         9NKbRjZui4N8G6+7XMLawozi9W3ua+gM+91IM6AeH3DsRaDLKwKiXrygjTmZXIdJkxgv
         qn8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296662; x=1794901462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q4Npotuz+vf92zyWk0dS+G8jQDeJZBCIwSnu3ob9NFI=;
        b=L2/oPpd8/51x/QVVEKsnbioJ5a3vg/TssNu5UV4vgBqV2H4ijdJfVcqsUqQHI/3PHz
         R8S9mOaGBbCaEXVYThqP5FLZBopMoNvVD82tBW/rzkVw2+Tgzgs5qmPPzCYcDcDX1RQW
         k0ZaW6zEsfLqeVj98H4iuhL3GDhKgpRt5xy2Ztaf9kIhCyLSl5DYTfZzgX28AM8bJFyR
         7sCzu/9IjhKv89vUM/xEfxEBLxa7z41pH4Gy4A6vPdMk8lMWRTsNQJBQc/+vXY0OvLls
         WiiUAX0mzbKR1Cy2OAOCelfebg/OkHc/hyBXyEzPGwXqcVybV9O6FyCYXZGQxRe8Kpni
         SJBg==
X-Gm-Message-State: APuU4Z8PLjtVw4xIIwm4vEXVvIBNaqKVemfZ0QBjd8vfEQXzHqJ7cHen
	kegf7oS/OtzIjYrM8JOMK5NfeLV0Ca79DtQ2sfwNFlacqt3AM0PGN+0YIR4kRVdI
X-Gm-Gg: AYBFou1AnVFcAbRfBaSlza/f0UQ6E+wrkrsBgypORqE6zb8Nu2qGGAAKRPXGfKY7LGb
	r7aBM8sh8I7c7LOzc4gkUs9BULlON9tJOYwYQbkWMJZ5zPUGLe2D4ZT43Rhsz9varqm2h267rdv
	ly7IUQC9z1Y5cCEE1cdK/MVnKo8/zb1CUtOGusZ7s/1sKZ7kDq3RK7XvpjGMpES8+pWorx1EX8o
	apvOJTm+02gdHbgE0vbJCf7PUI4dTZ0gZNgiNPGODs94VoMZ/kACeONrz/1iLawvcJYabYyKgQU
	zCxNE5ipB4CqR+Cy5BYvg1E5jjfoVgk9mr6L40ThlnXVA7QCLQ1Uni1TMUKDRztFZ2pHsvqsvT0
	FvrFz1nllhGRdmRMld76FbcreHw8PovUdp/cpPhqUwThT6AnEQx29C7fnpBjVcuSITbzr+lfCCX
	osoWLsTozXUh9Yt5woX142ysPkguqa3q3/M10sYNWcnq6koKW2UzRH4mUmOA5MEsXvApDri403k
	pFEX8uIyimUmtG37cfmmpaSCqeo+kT6DKVy1SksSWbZRAdM/EZR8lsstPIV/wY0c6iKkdShLbF3
	BgC9JDUvGw5r3nhTYry4pT/OCStH+8XSUCokbl55cLMO3LMNne6z4qFdjTYPP1QNxNZ9T172GmY
	M769+YH+0QGMC19jdsG2K08JtyseICVsEA7E0CPBXA7lcNFKkkihb3q/2KK8geXJlc3wHuGfv2p
	aahWyYY7BkAHQp8uPFj9lv39KoKMwx3BkZ93dfkOBnwjEsjb2bYK/9
X-Received: by 2002:a05:6808:159c:b0:549:ef3b:1a90 with SMTP id 5614622812f47-5683ce4a928mr1595474b6e.54.1794296662184;
        Mon, 09 Nov 2026 23:44:22 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:05 -0700
Subject: [PATCH v2 02/58] driver core: retain the owner of device release
 callbacks
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-2-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 driver-core@lists.linux.dev
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_234423_313581_12FEA5F0 
X-CRM114-Status: GOOD (  18.23  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Device references can outlive the driver or subsystem operation that
unregistered the device. A modular release callback needs its code to
remain loaded until it returns. Dropping its last module reference inside
the callback permits concurrent unload before the function epilogue has
finished.

Add an optional release_owner to struct device. device_initialize() takes
the reference before the device can be published. The built-in device
core caches the owner before invoking the release callback and drops the
reference after the callback returns, allowing the callback to free the
device itself. This also covers initialized devices that were never added
and device_add() failures.

MTD will use this to keep its release callback available after retained
device references outlive driver unbind.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rafael J. Wysocki <rafael@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/base/core.c    | 9 +++++++++
 include/linux/device.h | 4 ++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 4c0c373998a1..03f8bf69219a 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -2617,6 +2617,7 @@ static void device_release(struct kobject *kobj)
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct device_private *p = dev->p;
+	struct module *owner = dev->release_owner;
 
 	/*
 	 * Some platform devices are driven without driver attached
@@ -2642,6 +2643,7 @@ static void device_release(struct kobject *kobj)
 		WARN(1, KERN_ERR "Device '%s' does not have a release() function, it is broken and must be fixed. See Documentation/core-api/kobject.rst.\n",
 			dev_name(dev));
 	kfree(p);
+	module_put(owner);
 }
 
 static const struct ns_common *device_namespace(const struct kobject *kobj)
@@ -3225,11 +3227,18 @@ static void klist_children_put(struct klist_node *n)
  * approach is to use kzalloc() to allocate the structure containing
  * @dev.
  *
+ * If @dev->release_owner is set, the caller must keep that module loaded
+ * until this function acquires a reference. The core drops the reference
+ * after the release callback returns, including when device_add() fails.
+ * A module whose initialization fails must still drain its devices before
+ * returning the error, since module references do not prevent that unload.
+ *
  * NOTE: Use put_device() to give up your reference instead of freeing
  * @dev directly once you have called this function.
  */
 void device_initialize(struct device *dev)
 {
+	__module_get(dev->release_owner);
 	dev->kobj.kset = devices_kset;
 	kobject_init(&dev->kobj, &device_ktype);
 	INIT_LIST_HEAD(&dev->dma_pools);
diff --git a/include/linux/device.h b/include/linux/device.h
index aee79fd6b32b..cd39ebf47ee7 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -683,6 +683,9 @@ enum struct_device_flags {
  * @release:	Callback to free the device after all references have
  * 		gone away. This should be set by the allocator of the
  * 		device (i.e. the bus driver that discovered the device).
+ * @release_owner: Optional module containing the release callback. Set before
+ *		device_initialize() and leave unchanged for the device's lifetime.
+ *		The core holds a reference until the release callback returns.
  * @iommu_group: IOMMU group the device belongs to.
  * @iommu:	Per device generic IOMMU runtime data
  * @physical_location: Describes physical location of the device connection
@@ -787,6 +790,7 @@ struct device {
 	const struct attribute_group **groups;	/* optional groups */
 
 	void	(*release)(struct device *dev);
+	struct module		*release_owner;
 	struct iommu_group	*iommu_group;
 	struct dev_iommu	*iommu;
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

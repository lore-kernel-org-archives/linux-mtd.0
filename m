Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23BB1C04A94
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Aug 2023 07:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iB98nmy08MTonXYaeK6M3UmAj8lEyl3IMkiMgaDp91Y=; b=wuvthauIarYMBh
	Me1LRxdAV8jgS1U03n9EEcuER+qWLTTHQl7vlENGluiOJHTQm5KY8Bzyd1TTrx8uxhBtUgW55EhvQ
	ZWT2ylc9ZqgLr1UATvPGvnuE8njDqrSwOJlImLm51xvy6YuzANFvzDgj2C+zBADYmtAfVwS4y/4Gc
	xewlKhMHTi/tiBr3IjgcOlX4aEq8xuXopQqb4K6eONHUw2mfQRaWhiUILKdo08pC17yjQAsiTbkp+
	pEk1EZIi1qnHPFRIYnxQ0g20WxyZnTI4srKZAsrWWPubdmVgBx2h9JZJVVpEMoztxka5Nk19t3C92
	UA7CcPUHAOdgawANCJgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRoqh-00BjNh-1o;
	Fri, 04 Aug 2023 07:03:47 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRoqe-00BjMd-0I
	for linux-mtd@lists.infradead.org;
	Fri, 04 Aug 2023 07:03:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0774360009;
	Fri,  4 Aug 2023 07:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691132620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GtoxHNBucH0u6+GLGpFCwr/GAeii+9yfYYmXNFb3Tqg=;
	b=oQDYcPJ9pLvKhBJFz2vSMdCa4nwmzTA7sJUS9WciKrYLG/WKr5HaWtadvXDH7kdlrZXaHK
	kM/UYMxHGfma1Lj7NKXHZszqoeU9UK/WBnewFFp+svhoNSMcj9MZqglkoR70wRqoMaCFV+
	15tNra9V3oy3J46DdFU4m1FhPUzlfxk3Uay/23B2GUwiv+1P5bgK0AMuhwRDyasgwYMdND
	p4FYTDv8MdbFg0AWlAfp9+qUiQxPF6EPigh/qxuJVYfBs3JcK91IvbJdnlMJAwaNYQfhAC
	aMkd/ePIYU8YZ2YiLM2zz1KVK2no9sF6cZHvIwcAVB4wUXg+7X5E2+k1rswcAw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tomas Winkler <tomas.winkler@intel.com>,
	Vitaly Lubart <vitaly.lubart@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
Subject: Re: [PATCH v2] mtd: fix use-after-free in mtd release
Date: Fri,  4 Aug 2023 09:03:35 +0200
Message-Id: <20230804070335.369834-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731115836.542747-1-alexander.usyskin@intel.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'e9714c22c1a8238a85d069b1517941fc723312f7'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_000344_262026_9E159A4E 
X-CRM114-Status: UNSURE (   8.95  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 2023-07-31 at 11:58:36 UTC, Alexander Usyskin wrote:
> I case of partition device_unregister() in mtd_device_release()
> calls mtd_release() which frees mtd_info structure for partition.
> All code after device_unregister in mtd_device_release thus
> uses already freed memory.
> 
> Move part of code to mtd_release() and restict mtd->dev cleanup
> to non-partion object.
> For partition object such cleanup have no sense as partition
> mtd_info is removed.
> 
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
> Fixes: 19bfa9ebebb5 ("mtd: use refcount to prevent corruption")
> Reviewed-by: Tomas Winkler <tomas.winkler@intel.com>
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

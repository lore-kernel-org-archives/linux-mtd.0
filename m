Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8686C001DE
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Aug 2023 07:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0GG/7wNgv9k2jGnbTyEllgtxbHBUH+ynOS2/yHLui50=; b=1MRpG/5W03lJwe
	dIAg9cHBXtVcKTgr6i4wwS2ryIqLFbfW+sKulnbRzIzlXqpdeu2VbLT7CPpGDjg3q4P+vnsL2hTFG
	CdBbAUlbqpVGESy4JMUVyBgPDh5AZMzQF8+2opdaApi23c3s9qZpdXo8QhR615XjNN57MRX0/lsvQ
	VFqS2O0MIk4Ipw5AfRQ9q99IB6NeblS9MlfzRaINhInWQJ4vopIpBieBab/y/3bVBeZeWSVuF3g+D
	rTn0rWnRb2qy4k+Sd/NHZ5dGsEU77m0bbafCCQRXXi51ygH/+CFWC/q2hHpR7hEVdkMKzYzO9Stga
	u7NguyWwXh2eYsfw+qPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRoqY-00BjMD-2X;
	Fri, 04 Aug 2023 07:03:38 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRoqV-00BjLI-2n
	for linux-mtd@lists.infradead.org;
	Fri, 04 Aug 2023 07:03:37 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB0FBE000E;
	Fri,  4 Aug 2023 07:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691132612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aitIdD2MsEvnRaWZ30kkaPt7kZk1uKiC5wUazW9JQyg=;
	b=otRhiGhxtHaaGsK7/t17TPw18VLsjZHq8OiG+rpe+JnaCxshfyAESdGRkf6rXR5Ge0+26k
	CGD5c87CQt9DilJ6mhxbFeRjt6VJBiZFUXO8fFGzM/AXmjqQWW4KzOLmxh4J/IF2uO7htt
	aj5d8gQbrQclNgqoIvvf59+ygjcUgulzN+5zaHpp85FSi6SDfn+z8bsNozTxoKGm4CVc0c
	LkqGfhOlTaG2EM7otd76p9d2Xkh2ObnpD6emDzx9lnCH7ODwg8DgwMVjYY+QVMl34JYaKh
	d1dgkuDOj+mpD7Izadhg5EIK94CINkui91uoOYfcFfz/N6PocNGnUrPWEu+lbQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org
Cc: Tomas Winkler <tomas.winkler@intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
Subject: Re: [PATCH v2] mtd: Fix refcounting with MTD_PARTITIONED_MASTER
Date: Fri,  4 Aug 2023 09:03:28 +0200
Message-Id: <20230804070328.369173-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731090903.770277-1-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'264725e35fbc3b67e053a405e022393a6017e6da'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_000336_036695_49EED5F2 
X-CRM114-Status: GOOD (  10.40  )
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

On Mon, 2023-07-31 at 09:09:03 UTC, Miquel Raynal wrote:
> The logic is way too convoluted, let's clean the kref_get/put section to
> clarify what this block does, hopefully solving the refcounting issue
> when using CONFIG_MTD_PARTITIONED_MASTER at the same time:
> - Iterate through all the parent mtd devices
> - Grab a reference over them all but the master
> - Only grab the master whith CONFIG_MTD_PARTITIONED_MASTER
> Same logic must apply in the put path, otherwise it would be broken.
> 
> Cc: Tomas Winkler <tomas.winkler@intel.com>
> Cc: Alexander Usyskin <alexander.usyskin@intel.com>
> Cc: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
> Fixes: 19bfa9ebebb5 ("mtd: use refcount to prevent corruption")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Tested-by: Alexander Usyskin <alexander.usyskin@intel.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

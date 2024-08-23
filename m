Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B383CC531DC
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Aug 2024 17:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1SwrzA5bgkQD+dnsVjyeWl8eAYk/U8UM67QEozkPHxY=; b=0JkPUvf/YGsjfx
	7ZHaLN+Lpir3pMNczpj4wRhxKl6h92pPKTrBE5JN2EzL3jvKW2e6gTCHFv3A6AEXV7os2Gkl6rexJ
	J4dcw0FrHyQCMZE3XStKSic2P3zjgzXL4V4TAPqM4zaAGuGM9yxUfL/LRPgdwvJl4bEwwSFcYw4kC
	6bitsDE4pf0hOGQsftQjEy7+I1a47jQ+7ZxjMkPr/pGtHGodQYH6B/yYzGOZ+9Tau5aYTb31hY6Xw
	Z01Bn6NyWFLRWVHFQz3SFpsmCFLvlxL29xXNFYzbDQAwX8HPQqTopmpmgOhZ/lqAXKTrHfJcLJL0J
	F1wIJbmbu8HnMk61nKUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shYAH-000000009TU-0r7p;
	Fri, 23 Aug 2024 17:33:33 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shYAE-000000009RX-0qLW
	for linux-mtd@lists.infradead.org;
	Fri, 23 Aug 2024 17:33:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CDF86C0003;
	Fri, 23 Aug 2024 17:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724434407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y5mTqTOdc9pSBs6vZN4P0DsIlQ2ECczt0doqqJU0yUE=;
	b=WP5kf9sbcqcUiCOpn11scWXFR7bj845YG4FJTG5BzAX1T5+IyPix/seAo8lLqtEc4W0Rdx
	zwOwGoacHnzqGa9wjdePOy6wN9ugpA7/TerjhXkp1tf4o4Oc/tuVIUR0HG71hdvi8hnmfw
	S5LJCyijwqkLhmld95Havvml8cqH/J+jQoG96yNAnauMibgog88LwpMlX3HBBGR+mlMMez
	zpoBch/GMkZFQJkpt/hsy5mXeXxWVZCxNLFtzTBfgFlZ8txAvPfq0hWW1ydSKpWPasPew2
	JfBXz4G9+Dehz8U1Pq435vYT6T5i0Do0IpHWz9UcTPl2zwbu3zvCEP5gGd4RJA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: Use of_property_read_bool()
Date: Fri, 23 Aug 2024 19:33:26 +0200
Message-ID: <20240823173326.441823-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240731191312.1710417-22-robh@kernel.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ea265e483eb3d9750c7cfc642dedd5be31dc22c2'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_103330_404831_D32CEFBF 
X-CRM114-Status: UNSURE (   8.13  )
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

On Wed, 2024-07-31 at 19:13:00 UTC, "Rob Herring (Arm)" wrote:
> Use of_property_read_bool() to read boolean properties rather than
> of_get_property(). This is part of a larger effort to remove callers
> of of_get_property() and similar functions. of_get_property() leaks
> the DT property data pointer which is a problem for dynamically
> allocated nodes which may be freed.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

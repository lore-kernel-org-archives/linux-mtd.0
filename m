Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 206F0C433ED
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 10:21:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8B7661007
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 10:21:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8B7661007
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eLnanfDxpYzt/PQqPELi22xZQ7Hy2fLNk497EQjQJwI=; b=k+nYNTtKZEfdo0I7xSPHrW334
	3fO4PZhJV09x6WORRW/33TAOtkjZhHulNwt+NE1bkSFoweoQBJXLG2xwClukatrkDWMvU78mGfmLp
	GESZ12gU0FzdAL8+9ZCynIHKWddJ0Cp3Xg7ahQWE9DomMY0xv8s4lUwheGoWFdWszXihjYvD0pAim
	KQ5Azcf3MYnKFuNE1vfJowzIrxuARfCAxwTL0SjLKbWYaZMaNLPyxvAUZKAzyf6znAh4XkvFHl7t7
	BMc4Ve5i3TNXFArpgcY86+Hd8kevi187K8CFl4rSFH8tKUpv5JMuBWAkqK5dmGNOOylpNqeG0SY6J
	SRulhjCfQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg31k-00Dupe-KN; Mon, 10 May 2021 10:20:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg30o-00DucP-6H
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 10:19:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=RWupC0MVXRW9VXU1DKSV1TpLe7DYxkg4LgwgTWjoC70=; b=CtyqvuIuY1mrGzCfYebJOB7BMa
 914spbHOwQRv8K+E09cCg8X7C/53pe5JFoJ52d7oIFZncHpOvV7TLuzO/LmUr+ZSy3M/1A/Q6PwJh
 olwlBJ0in935ke9ukm7f/E3U0paBgqDtxuLhh/WwmMFUxd2lJ5fcSvVVGK6tsOMDmyz7O9SLKXzqZ
 LH26WgRaNq14i03NtO2Pu0my3n58QFDf258lEj6YcviPtrniQj0RN6Kfj9ZoZTCWBDllpNzZYGAcP
 83W7loxXnr3cvNM6l60xV3f5ryhf3TBK/0KfqEEQ0SLTvDjikuN8YocxeZgFqw6zrdGU8uZYAgwNp
 G4OYnIgQ==;
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg30l-008WGs-Kl
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 10:19:41 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 697BB1BF208;
 Mon, 10 May 2021 10:19:37 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Hauke Mehrtens <hauke@hauke-m.de>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 rafal@milecki.pl, musashino.open@gmail.com
Subject: Re: [PATCH v2 1/3] dt-bindings: mtd: brcm,trx: Add brcm,trx-magic
Date: Mon, 10 May 2021 12:19:37 +0200
Message-Id: <20210510101937.8013-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210418214616.239574-2-hauke@hauke-m.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'a4d82940ff85a7e307953dfa715f65d5ab487e10'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_031939_832443_3CB6EDD6 
X-CRM114-Status: UNSURE (   6.91  )
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

On Sun, 2021-04-18 at 21:46:14 UTC, Hauke Mehrtens wrote:
> This adds the description of an additional property which allows to
> specify a custom partition parser magic to detect a trx partition.
> Buffalo has multiple device which are using the trx format, but with
> different magic values.
> 
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> Acked-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

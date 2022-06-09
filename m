Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F031C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 12:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hjxAAAz0M948KuvKg4a4jgCSS+Dnnf9SeQBcCW7VKcE=; b=uQiO87DrV8FgSV
	akwDovfikgQWdqI97w7WLyKo19HmLvytTgD2Q0+GxkSAxJFrzhjMC01ncXR6mjDbcMx1w2crVqBtv
	ThCuXmCkWjRFUH+pkratcefCtLB/feX1CiJGQ9vTIS+J84B5BGUY6xEenmwagfRoqNDl9UtV+Rcbj
	ib+Vf0wQ1ALGmb7vYAMefCdgFI+ZKfIgr6G7xAbZE4e/GysZwdcvQUvixZih0JfSbFBKdKTD3ot8i
	3fgjRcQt7rINXLX6BC9saJdDh2iqxA7vumMgJE0Fecf5aFFQ7sAUVWGz5AjPxYj7aam7dr2Vj5Up8
	YC05Rrf6mO7In5L9lg7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHVZ-001pwH-Bf; Thu, 09 Jun 2022 12:43:29 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHV6-001pey-Rs; Thu, 09 Jun 2022 12:43:02 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 23D0DFF808;
	Thu,  9 Jun 2022 12:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654778579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e8ABBpdWcIcruCHUor6UAEtImYahjYa4OSrvNiOjESM=;
	b=ifEf3NZypWRbu1J9oQlH6AkCJCtmZYhoBkoVq7DXrcmUuAmWYOdGxnP+gQOmscKEQr5j4m
	5yc29jAvEM92Ktk1o6En6oOMqDm0V6gN3u7B94PHqmjn7zm9UwR1Eb95AvczgaBC6p7Q1r
	jWjnX/Bx0lctD9hLR/X77IJJyOn2qWqvqZeyYnUhrGiizAjz65dTDTnbIUiGwheCUlK2Jj
	QEj2iUjeVDZsjVUC+l+QbVwVGOUIUbjTTkSCCjoFSbHRP5JdyAAGjoP1jx8UVAv6mos0u/
	gG30T1dlu9HDl2dPa8hIEyALHvQ8EuwzVftChk+9oQNqTrMu1EHcGuWGtqbGDA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miaoqian Lin <linmq006@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: maps: Fix refcount leak in ap_flash_init
Date: Thu,  9 Jun 2022 14:42:57 +0200
Message-Id: <20220609124257.133067-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220523143255.4376-1-linmq006@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'77087a04c8fd554134bddcb8a9ff87b21f357926'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_054301_100157_56FBC934 
X-CRM114-Status: UNSURE (   7.96  )
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

On Mon, 2022-05-23 at 14:32:55 UTC, Miaoqian Lin wrote:
> of_find_matching_node() returns a node pointer with refcount
> incremented, we should use of_node_put() on it when not need anymore.
> Add missing of_node_put() to avoid refcount leak.
> 
> Fixes: b0afd44bc192 ("mtd: physmap_of: add a hook for Versatile write protection")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

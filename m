Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 590C4C433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Apr 2022 15:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AacbxyZGV/9u2ynugoG1uaQE63kR0R8swv2SD6429Mc=; b=2tTVlDbfaj8qAd
	GRMKGd7IUkSyNd7vD7YX+bdrf16afCs853w3geQEQQPW5brqWgufLuVY6HERXPYdu4isfmGa+TxEU
	3CjWncPyTg9ZNK8Qh35T+dFcDeP8OljUqLPYu5j+g3dXbz8iINHTsUMDa5epzrUUcQC5CIpjyLV1W
	+P6DHQY2Dzx9VrNX8fCPw3AF3I4zBf0cz9eg0SeEpKUKug/sW8RwGyxVKV53PmsDVacD+eMq5Ea+M
	+8EiXiXfA1FtD6YRs4I+WShu1vhP2ECcdnGam+/iKQOgys5K0iMJXyA/nRpNNlvfW7oug3L9vBTSD
	nKhDNiDZXn2FlVudNK7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njjYX-001ylI-7V; Wed, 27 Apr 2022 15:26:17 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njjYT-001yjW-JS
 for linux-mtd@lists.infradead.org; Wed, 27 Apr 2022 15:26:15 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F123CFF80D;
 Wed, 27 Apr 2022 15:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651073172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Br/ARAuWyrQx0Shx7ZTt5B5h8e1yAa6aF5x9EgWTdME=;
 b=QQtCHEe5N6e5yUN1VTPJzMTqqdHJQQf+73x4CU8CcONwnoXr6CGlp97ziX651mDXYxSbCt
 L7Gu1xPdv2cHqNTce8fyRFw5czCFRjwEf8mh3wQsuV3+4DAdIENoypbh4/s+pnaXF0tcFV
 MQp1oNZvEc6DyhS9PdONu+jEqh2c88I2c0TNvtXgFEv8sFmjs9jTIP4a826e82Mgjfe8X8
 mldHbFgqSz7wi4+4Zknoz9dq0FPUqIkv+1RIySJsSTt+1vm+0Jg8SQpwLTFTdZkHZHrolN
 4EvorbSC0GizDRVttS97TTUEQy/yZYUe9OoPcJhYfa21aT0H/11TmDOjY8xZfA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	richard@nod.at
Subject: Re: [PATCH 2/3] mtd: rawnand: intel: fix possible null-ptr-deref in
 ebu_nand_probe()
Date: Wed, 27 Apr 2022 17:26:10 +0200
Message-Id: <20220427152610.100972-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220426084913.4021868-2-yangyingliang@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ddf66aefd685fd46500b9917333e1b1e118276dc'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_082613_855285_6B9CA3E0 
X-CRM114-Status: UNSURE (   6.04  )
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

On Tue, 2022-04-26 at 08:49:12 UTC, Yang Yingliang wrote:
> It will cause null-ptr-deref when using 'res', if platform_get_resource()
> returns NULL, so move using 'res' after devm_ioremap_resource() that
> will check it to avoid null-ptr-deref.
> 
> Fixes: 0b1039f016e8 ("mtd: rawnand: Add NAND controller support on Intel LGM SoC")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

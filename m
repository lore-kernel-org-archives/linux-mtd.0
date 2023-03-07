Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE5CCC678D5
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Mar 2023 19:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9XRoWadY9/3AHTyXkl1+j3HR91fxXYLmn4J5qcucvZk=; b=ArI7DFbvTHqhcW
	l5lJwbqh531veEBG7kHjj7QXfsV7zp/tM40LzuEqdbvwPDwFEtOQ/uNK5zhAaexWpWIcQ+zRKddek
	x+0KZZW70L+qstIUfCUjK9lLAj9JdM0I8KO+WxqoSXbkp4/k0QUeDjOSLgrS6roFrJVSkBFPQEfnb
	YlcDrkJzSg8SHbj2AFHxFk9l906iG3KSpWvTd/EqVeogarcP01vtK10hom5oTaYrcTlwyWNfoBTn4
	UctRpAYzR68RdPXjW4BeRWrNqMHsTc9EhcoXnwEILEbc/iPjggMmndfYwTcdppYQO0l+xE2myjzed
	/KFPMtCEGGIJszfDyD7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZcvu-002EjD-0w; Tue, 07 Mar 2023 19:25:10 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZcvq-002Eao-1c
	for linux-mtd@lists.infradead.org; Tue, 07 Mar 2023 19:25:08 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 809A740004;
	Tue,  7 Mar 2023 19:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678217099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VrU8J9YB7fQPHk5/ael0OMDOC13vkm1stDSoSG3PYew=;
	b=ZpDIXDsfovyMckKIWaKBUOnFtR/7vWXdgr6OdQ058XmHA7uNsqGkqtubipCkZX/PivtPZs
	uA1NMga70CTjP3Bbg6VmBSJheiJ4KVpoYZYUCEwkq6UqDC67SgwL296JN9oSJfMegJpHVc
	UsV8Jew5yC8Qfif2UggmT1OnCUo3GnHQmI27B2LQ/vt6rvpGywbhphJLdCS0ndmwar57pB
	a96pmLITt1uUGdi6zW71mhqVLq7HJr5JpJHab1LahtjDzsHE2vTtUsi5R54ykwDOYRmJNy
	n6dPoP+0fsClzN4mwxeO34mk413Js5N1/6fhKi0qh6aL826oS8r77I4r2pl5ww==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: ye.xingchen@zte.com.cn,
	miquel.raynal@bootlin.com
Cc: richard@nod.at,
	vigneshr@ti.com,
	christophe.jaillet@wanadoo.fr,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: =?utf-8?q?=5BPATCH_v2=5D_mtd=3A_rawnand=3A_orion=3A_use_devm=5Fplat?=	=?utf-8?q?form=5Fioremap=5Fresource=28=29?=
Date: Tue,  7 Mar 2023 20:24:56 +0100
Message-Id: <20230307192456.433031-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <202302101723563685569@zte.com.cn>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'434b8356df416678fb29d21b02bb5755c5f778f0'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_112506_297758_8F9A12C4 
X-CRM114-Status: UNSURE (   5.51  )
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

On Fri, 2023-02-10 at 09:23:56 UTC,  wrote:
> From: Ye Xingchen <ye.xingchen@zte.com.cn>
> 
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_ioremap_resource(), as this is exactly what this
> function does.
> 
> Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

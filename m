Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A04DEC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 07:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HRvuFWVSmysigw9bJ+3EdvQvWg3AV5sqfSHPOQyZtEg=; b=B0wS9KqD6VoAvq
	UDRr6bmy6hFoIZc1fhlHkg8bnvPLz9Lq80lwDsqubCWHRADSoSeLQRi/JYijfPwoNLcdHYsL0LVaL
	zqnKTr6TvZ8svlPtY5AcAszudt2Wdu0p9KtnYZ/8aQl3bonjl2PmVTIzWK6hA3UwISqnVr07f0+Vk
	ZUrceI0CaJB3kKXjk5e3i0rHowNE8CNBzNfP6Rx4GCZ4I3puKz6HuHfT9i9CtkMrF/Sn8g+tPQXsW
	Xx6k0nw4A3EwM6Zi0nEu4TxsddHkbsL9dBkAktjNVfPtPonzBrMWh+30qxUKHWa6eoJAEmeYrch4m
	WIBGaKKVNn8b+lPo5Xag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhRNM-00C46F-7a; Thu, 21 Apr 2022 07:37:16 +0000
Received: from relay12.mail.gandi.net ([2001:4b98:dc4:8::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhRMS-00C3Jv-7w
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 07:36:24 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id ED276200004;
 Thu, 21 Apr 2022 07:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650526576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MLnPW+LzI3lgBT5U7Gf+ZC/2rVGSb+JzlunzqTddV30=;
 b=hAcwO+0dalo4eBsDGa+vx8nyX9+AnXaN28rO6xDVVs/Qt/ydjT6rLxSbgIjhA5tqMnt/nM
 ebVbl0ro0RlRB3mOQ0aLZdFPZFs4vXqXN5e7C+2xT15EOdQ+2z/4mdC5IJkjNWCsTBlItr
 YOntuhuOwm43dWD3jAntkQSvZodTyLBrZH0RAICbTeO5jxqw9HeyuDjBZjAVqnFKkCdAPL
 ENT4keC+SigwBTyhmWzn0Ta/PHLQw8gs+2ZSVwu7v5h3hjqvJ8n8CWoVc35ai73DFk7epd
 xGgYNr08OeLxnbGjkemCZGl7+pvlhvIbaWlwKthTNrSdPatLUb1KgFX4LX+UuA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Vincent Whitchurch <vincent.whitchurch@axis.com>, vigneshr@ti.com,
 richard@nod.at, miquel.raynal@bootlin.com, joern@lazybastard.org
Cc: kernel@axis.com, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, frowand.list@gmail.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] mtd: core: Check devicetree alias for index
Date: Thu, 21 Apr 2022 09:36:13 +0200
Message-Id: <20220421073613.72280-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220412135302.1682890-2-vincent.whitchurch@axis.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'304099a37cffdba2fd80af915334fc146e23132b'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_003620_477414_C9347174 
X-CRM114-Status: UNSURE (   7.82  )
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

On Tue, 2022-04-12 at 13:52:59 UTC, Vincent Whitchurch wrote:
> Allow the MTD index to be specified via a devicetree alias, so that the
> number does not just depend on probe order.  This is useful to allow
> pseudo-devices like phram to be optionally used on systems, without
> having this affect the numbering of the real hardware MTD devices.
> 
> Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

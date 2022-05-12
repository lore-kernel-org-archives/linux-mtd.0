Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA5AC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 12 May 2022 15:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CXqmSH7l8jdTkEZVCFz0gQkPoaoiWvveWKHqg7q1bCE=; b=f6wau+M92ML8wQ
	aNfGCi/xL5K/1eI9mwhCbLM21jx6BzH/Au0srPNX5z0tagQKv7IoA7KQgRDp2FeRaM5DxX/9IL0xW
	ZqZU+E3MmeWDiaZeMnwfw4aLcA0NwmrtBI01ZKpl+S6tofOr4kVHddiBqGnojw80igzBX8yb3we8G
	Cuzq4pYW8UUB9Kb9/Y9ZnEAm2qoIvfQR0vBqeS3lARajFXROJPQes63anqcDW2T8rBANzQsO72riN
	nEAk+KFtcgaVc4xBUSN0XEJ6IyY5BD8N7qNj+/e5nn4gMd69OkkAWUH6Rf1lVhy0hg1W66XVrfKtx
	7Rv6P5zR/s4Wl6fH25Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npAjS-00CcI6-9f; Thu, 12 May 2022 15:28:02 +0000
Received: from relay11.mail.gandi.net ([2001:4b98:dc4:8::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npAjI-00Cc7v-E4
 for linux-mtd@lists.infradead.org; Thu, 12 May 2022 15:27:54 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D67E9100009;
 Thu, 12 May 2022 15:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652369269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bTo/5H4S2lfutSVjIFOtxPBKa00dzpI8fzGECTbektk=;
 b=aMsmRGb40cMjNgTpHK9UOyDX84s78UdssoaQX1PkEC+Upxlmnpw92Iujxww/AY3xQwVr07
 guLl1RlV4KHyGHnKTe6wS7jqzazkiWhl/e62oUjw7QHcDmULKa7T3xzX3zOLkefp5MZK5a
 HEIjOJ3CipcCXiou1eKSOanrkOWyWA1H4qDdQOXOrJUhZEBc3QE2YLQ+j3HqeFZS7HKv2O
 xS5rnfKjsKJVl4guSf/1bsPn/bfckpS4JSFYNAt+LAk9j17GWorKyK40jZdGomMD/UcwBU
 sNhlD27RMDxwZdTduVnJ1ga1kZN/8d+XL8G81wvZ3ID/iGs3bqyQeIR0hEr00A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: cgel.zte@gmail.com,
	miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Minghao Chi <chi.minghao@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>
Subject: Re: [PATCH] mtd: rawnand: cs553x: simplify the return expression of
 cs553x_write_ctrl_byte()
Date: Thu, 12 May 2022 17:27:47 +0200
Message-Id: <20220512152747.245142-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220505022354.61458-1-chi.minghao@zte.com.cn>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'c96f824af0e9f88299430db8360dfc9e6c40df36'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_082752_670790_9F76667C 
X-CRM114-Status: UNSURE (   4.75  )
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

On Thu, 2022-05-05 at 02:23:54 UTC, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> Simplify the return expression.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

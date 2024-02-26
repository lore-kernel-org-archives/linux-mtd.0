Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB206C54E49
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 12:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PZdW8ZBg1S4MAU3qjZMh+IqILs6v6m9PiKBse/6t3kQ=; b=3IeefOuYibLe1/
	IqDWxd7iIxJRQOs+UomGkxUz04cuPlxCUy6PbZVlmS++o31X7pCcuY+5umZKVrphVBQNqj6KzCSAN
	jGE6Me3TxeCjox1r46OB4WUuGGv9h60E3cmTrgMQQejdRTzzkNxjjNpAu29cWE9GWf3aDsn+vq632
	MR+VfEa/LVSF6ZKUpKQzuhzrFajeiyhWljT5BqpTWG9aHojJfs5yd/fJroH6BKXO0MFVZ0PsonIeA
	2TjKws2yHnZ5vhEDWKez+mTZcZ5P/HstHgC5rfuDMJ7JlYF+x3syYz2kuF0OJRgtX9nN7/yyaAwkS
	56vjoT/m+8kZx3Qn3w0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reZfX-00000000SeJ-28Xw;
	Mon, 26 Feb 2024 12:01:15 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYTU-000000009F8-1QWf
	for linux-mtd@lists.infradead.org;
	Mon, 26 Feb 2024 10:44:55 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 32E2D24000A;
	Mon, 26 Feb 2024 10:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708944282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f/jayUSRVjpybZD3WxWT1q4xekLKiFI7st5oYv5V+jg=;
	b=DDrCoXDe3eXuMjrtasnZepDNu5tAKDw6NduQOARdFQTp/RU2aOKzoJrkm5DDaOLzLYanzf
	uGtLN7yJtowil+EvApOjaxjqROfc9OKN7G8V3frxG2TeGjnvD0G1cY2h3jjN0XttEfcvXV
	jjlied8vSz68+prRMHlV2ep86a2sFFuAtDQ9CHIVM5A86YFyr64uYCGcrpBAIAZAzBlsR1
	PGpcFtLQs/Gy2jLp8vMfQRSmg0F5t5kpi5jMeNVfFkUs3zgeM8N+Yr/6sbho+3pSgi9SSC
	qYYO8cT6s1ThAvUOaRKdoG6Pnjp67LkLvU+JnFyLlbtccmRyc9phIUvcJsZMlA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@foss.st.com>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/3] mtd: rawnand: stm32_fmc2: add MP25 support
Date: Mon, 26 Feb 2024 11:44:41 +0100
Message-Id: <20240226104441.489887-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240219140505.85794-4-christophe.kerello@foss.st.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'0bfad3b3561d6f219b768d2a4265642ee9d31b1d'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_024444_686202_94B94B1E 
X-CRM114-Status: UNSURE (   6.43  )
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

On Mon, 2024-02-19 at 14:05:05 UTC, Christophe Kerello wrote:
> FMC2 IP supports up to 4 chip select. On MP1 SoC, only 2 of them are
> available when on MP25 SoC, the 4 chip select are available.
> 
> Let's use a platform data structure for parameters that will differ.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

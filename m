Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C149BCDB474
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Oct 2023 09:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WuhqSRO4jDam0lu/AeNKRVsW63jlobdFt2eq1rxIryY=; b=25F8lx2s7PJcmc
	RiOFR5HXftuq+8XhSqEO0DtPR2pWBLN2pWMGzO3wBU9HbD2Z+qWVACvMt6RAZXIHTYuBwU4i5ty8v
	1k98wqdX14Sn6cwAP6AH2cMOemrHeoVCm7xIEa/RzlRQfsKp1XpL2JnyLeTvgWhdVcX+CxfGgJExL
	paQUSLDH/I2c0tuqKuLdgNWR9jRHDzBWLEtW345C1548EUhpo6ryiYE4FH1/mvmHKl+Ctc6uBmQHK
	SJrQw6ltH0E8CJZ0Fqh6iENXQUlPEmbQOuh3AUv2McayjT1l7GpRSH+GzY+sIHdKVnW+xr/skKSRk
	6GTTTj97Kru9uvAFjxnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJu8-0090MO-20;
	Mon, 16 Oct 2023 09:28:52 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJty-0090FK-2f
	for linux-mtd@lists.infradead.org;
	Mon, 16 Oct 2023 09:28:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 63B2E2000A;
	Mon, 16 Oct 2023 09:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697448521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cB9YyJFPekauMqmT5IAfFQ+DrU/FcfXGDjW4V8YqQOQ=;
	b=ZmUG2+xx/8stKeIvalFYCjLGa0Vx4XxQo+/vbnIEaF4Nzqkq22FzfVZmpnt+OrwOkiV1QJ
	C24m9desM9hQpy+4l0VxMvxZjQFcmFO3tPOAQql+AOGWznNldzthNENtHf6aqUmn5lvTzl
	l/Z8sgAlWza+RiV5TaqDdAtp8wBUreQ9hfgmv2TTT5NHtN3ASy4TFuAKLgODrAuaTAhoz0
	eiStWnLxYCrGxKxyJ2HmbKNfA5UYOGLV+TxZ/40uWu+HtQLaiVBYtd5vR78BKpNkCGr4fI
	QuapSCnWa7Zh2GE85q1Gka7v0rLX3F8gYCxK+GDo2iPcwJXmnp4FvL8pAmUJDg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Simon Glass <sjg@chromium.org>,
	devicetree@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org,
	U-Boot Mailing List <u-boot@lists.denx.de>,
	Rob Herring <robh@kernel.org>,
	Tom Rini <trini@konsulko.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Nick Terrell <terrelln@fb.com>,
	=?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Richard Weinberger <richard@nod.at>,
	Rob Herring <robh+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] dt-bindings: mtd: fixed-partitions: Add compression property
Date: Mon, 16 Oct 2023 11:28:36 +0200
Message-Id: <20231016092836.288939-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230927180545.3522628-1-sjg@chromium.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'8baba8d52ff5081e8c3c383132af269ba8e2f458'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_022843_014787_55D8F3A5 
X-CRM114-Status: UNSURE (   6.08  )
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

On Wed, 2023-09-27 at 18:05:43 UTC, Simon Glass wrote:
> Sometimes the contents of a partition are compressed. Add a property to
> express this and define the algorithm used.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

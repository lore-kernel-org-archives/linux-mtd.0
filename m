Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E182C04FFE
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Apr 2024 10:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q65R4gbLBO1BWJ/2x3/a0tmMN2STjrP6bLDUxRU3E7o=; b=tQphL3BLExYX4d
	NKJSkfJZGbZ5bi8HDdU3Xnw5ajuUd6Yx+FZ0vBwxvazCYCR2TSpouSw7Q1GSnol1BDTl8mF4GhWTu
	1rWy7tTgZM3v0d3xTnImzipVA7tu9ZedSglsmqPYdINgn/afplm/wfXCirb5aTFwvgUqrtIFLN/n0
	OzRtQHF7QekajA2IfEPpdn7Fn3JhNfr3e1G5v9MvapvOgES2d3rQcevQ7EkLQnlCeyUceVsS07OVy
	4R4TnXVI5FRUb8sbhAFv33Bb11kBAUTzwH27gjothhRej2ngA+FxTwM1LqQNUMQLFk/iwCWV+KFy/
	kaN0NXkgWRFFJiOOfMQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwJF0-00000007oT8-0pPE;
	Mon, 15 Apr 2024 10:07:10 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwJEt-00000007oQ9-3hjT
	for linux-mtd@lists.infradead.org;
	Mon, 15 Apr 2024 10:07:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E93DFFF807;
	Mon, 15 Apr 2024 10:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713175620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V5QLmDLe7bTBJ0+9ot2S2z1GTRFgNDrJEqWQ4tSiw9M=;
	b=WdZH/YOIxbzPqd9V1i0OXiHiO+KJ3JLh/SY9hmxmROpoq4nqPlR0ecLlQqP4y17L6ppZfE
	J16t1EOO2ixBAFZp7QXfJBxDOoLyzoH1tptJVKNgpB/WeDwSJnsHTFfOShHcSLnxwlR6eD
	6neDQ32dxdiszoSx4zkvi7nyrvqY8czeyFhO3JiXArWNUvzeYLGSfTF4YwYiFdt4diB7bF
	x2bJ3MNu9VNsPQaOaYW5Uu5ISJNVjU5DFLeVz0ZMVSnSJB3eOZWIIFTYb2jvtMMOo+0KtM
	xxiGqj1fBQXP+9Pf97WBy/BUQgQODkM8kiseLNo6HUZ0WO9m3xuJGsBE0zfS9w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Simon Glass <sjg@chromium.org>,
	devicetree@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	U-Boot Mailing List <u-boot@lists.denx.de>,
	Michael Walle <mwalle@kernel.org>,
	Tom Rini <trini@konsulko.com>,
	linux-mtd@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 2/2] dt-bindings: mtd: fixed-partition: Add binman compatibles
Date: Mon, 15 Apr 2024 12:06:57 +0200
Message-Id: <20240415100657.32087-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240412153249.100787-2-sjg@chromium.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'f48d2d6ebd3bde515f4725a88e53953cd6eccc29'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_030704_092418_BE696561 
X-CRM114-Status: GOOD (  10.27  )
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

On Fri, 2024-04-12 at 15:32:49 UTC, Simon Glass wrote:
> Add two compatibles for binman entries, as a starting point for the
> schema.
> 
> Note that, after discussion on v2, we decided to keep the existing
> meaning of label so as not to require changes to existing userspace
> software when moving to use binman nodes to specify the firmware
> layout.
> 
> Note also that, after discussion on v6, we decided to use the same
> 'fixed-partition' schema for the binman features, so this version
> adds a new 'binman.yaml' file providing the new compatibles to the
> existing partition.yaml binding.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

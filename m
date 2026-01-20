Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9EB0D2ECF9
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Jan 2026 07:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZamDyEzkC1J5UzGWQ93tXRzEVNFMvacNUw7Ihcgv0sw=; b=Z1Snv7qqFLus71
	hVtesOvaLGabXgJx+ff0e3c0d85KVKafsYj/QGJVEAY6i84TmSzqCUrjXfKa1RrMR4J4mw0i4VNBv
	VDVkkuzRYFOOivcdOGlwsk//8zM2RwfeEZxJ7cyzK6cVkbnTtgibIY2dNxwcXOdDb6XD3av2hePHN
	spmkXd0dBbGXKsOOU3n6IqEYkUVPP+DhYO9A5Odo3BI2qSvD9OGsV4UU70qWmPbE2+lqdIqCfjY8m
	RsVqt5bnPERBbAUGYercoCebuiFnLQ2CzX5IifdqzyVpuSOXS0tRmqD1AJ2rADMLvjefWzipfQl/0
	gdmve/VAQv382NCsWpFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6Yg-00000003NVK-49UI;
	Tue, 20 Jan 2026 07:53:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6Yd-00000003NUm-2xZu
	for linux-mtd@lists.infradead.org;
	Tue, 20 Jan 2026 07:53:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 069CC406D9;
	Tue, 20 Jan 2026 07:53:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A5C8C16AAE;
	Tue, 20 Jan 2026 07:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768895626;
	bh=jawjcMTbSVmwJ2HxhLt+FZlyw8lPGMOhDCMkljwxaR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aspxxCVT3j09FEP1o7wk4VAcsVG6fm9kEh29DMYFoCJA8qZpehEtp0C5a6LUC9BrN
	 VpEf5P72UYKNeO9Ntnz4HX9AX8L+uqaRnjbp155D6UwknzaPO5qleSnZbCI+HmfIta
	 /y+CyjhMEqIYLTiSlGP6Y464a9dd4IPUdL65qo1+2l667nRoNAfAneNewa0+6mVpwo
	 CmNWKuaLizwjt09fSofv3Qcuk6Wos/qn6Vy2n/kcFjkDZsJsThpSQdoOwhEzG3u6HF
	 7FBU27HSBh+oHzRtywakgATLLRbPlFCilS95OMMij8K9JySy3SJgoXQ0aYccaHpfV+
	 U2ZtGiqaML6xQ==
Date: Tue, 20 Jan 2026 08:53:44 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Brian Norris <computersforpeace@gmail.com>, Kamal Dasu <kdasu.kdev@gmail.com>, 
	William Zhang <william.zhang@broadcom.com>, Nick Terrell <terrelln@fb.com>, David Sterba <dsterba@suse.com>, 
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Simon Glass <sjg@chromium.org>, 
	Linus Walleij <linusw@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Marcus Folkesson <marcus.folkesson@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Roger Quadros <rogerq@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org
Subject: Re: [PATCH v2 09/10] dt-bindings: mtd: partitions: Convert brcm,trx
 to DT schema
Message-ID: <20260120-meaty-carrot-koel-edb795@quoll>
References: <20260119-dt-mtd-partitions-v2-0-77ebb958a312@kernel.org>
 <20260119-dt-mtd-partitions-v2-9-77ebb958a312@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260119-dt-mtd-partitions-v2-9-77ebb958a312@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_235347_899671_6D7393CB 
X-CRM114-Status: GOOD (  10.53  )
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

On Mon, Jan 19, 2026 at 07:48:30PM -0600, Rob Herring (Arm) wrote:
> Convert the brcm,trx partition binding to DT schema format.
> 
> As the "linksys,ns-firmware" compatible also uses "brcm,trx" as a
> fallback, move it to the converted binding.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/mtd/partitions/brcm,trx.txt           | 42 --------------
>  .../bindings/mtd/partitions/brcm,trx.yaml          | 65 ++++++++++++++++++++++
>  .../mtd/partitions/linksys,ns-partitions.yaml      |  8 +--
>  3 files changed, 66 insertions(+), 49 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF7A8D3409E
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jan 2026 16:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3WPXBFy4ve4w4ToiGEGxemJ8M2GJs7B+qszxX/oLRm8=; b=N1pupi59krJKag
	Jp3hrT7fdmE6aS6KGzAn70cpsVIn4nYRxJsAuebgzVPMWsyyL3IEw5IgsJ4T+Ao/v53vYb90EDJzp
	KQ3ss5LKcs4ebjBbTk43Jx2YKjIZ9DELDbvD8cycYrWwbBKXDSamK+09tN0S2LmLP1Fl41mXXKFwS
	q+mn8dVc3/uFKO/qaZQpEylkTLEdyIGaahs42Z3rh30CEJAcBqL8GHdEhyJwq7gBCy6TOEBZHYuWn
	H/+jZahBr/T7bGvQxIpBcm6TNDzDT34Wfos8Tq5xGbKcQh/WA9L8tTNyujoMf8cIYW61ToGIU5pRP
	yl8OM1ojrdgzSOjJqqMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklmN-0000000Edsq-3fId;
	Tue, 27 Jan 2026 16:18:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklmK-0000000EdrE-1WR1
	for linux-mtd@lists.infradead.org;
	Tue, 27 Jan 2026 16:18:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E0E64005F;
	Tue, 27 Jan 2026 16:18:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3754DC116C6;
	Tue, 27 Jan 2026 16:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769530731;
	bh=cyt06RXJUBnyvd+rDscVy+C+X/eqB2fWQSj539VtPJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C+7uSikCiRnhCCypeIwP3zThpixogQdAMob/hrAgGC5aN3mFG3mo3K8bL9Gj4D5iJ
	 mlRIA/x9KX0iTeGZDEcP+u/Vri4Htd4P4oPAskQq9RLzdfA+ewSZnL5vMdWP6llvh+
	 1GYZY6ZCp24IZI8/J7wSbTX3gg2Rf0/px3XgNPRaw+gGzcpdIGPy8e16eGK/n3WvnF
	 Ca6e0GEolE2ajsV8HdNbXv1n3dDcg4TBtC4d4Xd5wSFLeJKKdD8c77fg9C5UsuuOJ9
	 ZffR5ckNFO/8+h8vLqyPLc0UIxOKXIhc5Cg4sZciTJAklnb7fWjYvULpWIOB9UdOr+
	 voPcT5RXeyB9Q==
Date: Tue, 27 Jan 2026 10:18:50 -0600
From: Rob Herring <robh@kernel.org>
To: Akhila YS <akhilayalmati@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: mxic,multi-itfc-v009-nand-controller:
 convert to DT schema
Message-ID: <20260127161850.GA1968054-robh@kernel.org>
References: <20260126-mxic-nand-v1-1-557df4a0dfa7@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260126-mxic-nand-v1-1-557df4a0dfa7@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_081856_417474_CA726F41 
X-CRM114-Status: GOOD (  15.09  )
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

On Mon, Jan 26, 2026 at 11:09:20AM +0000, Akhila YS wrote:
> Convert Macronix Raw NAND Controller Device Tree binding to DT Schema.
> 
> Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
> ---
>  .../mtd/mxic,multi-itfc-v009-nand-controller.yaml  | 79 ++++++++++++++++++++++
>  .../devicetree/bindings/mtd/mxic-nand.txt          | 36 ----------
>  2 files changed, 79 insertions(+), 36 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/mxic,multi-itfc-v009-nand-controller.yaml b/Documentation/devicetree/bindings/mtd/mxic,multi-itfc-v009-nand-controller.yaml
> new file mode 100644
> index 000000000000..97baac8b405a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/mxic,multi-itfc-v009-nand-controller.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/mxic,multi-itfc-v009-nand-controller.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Macronix Raw NAND Controller
> +
> +maintainers:
> +  - Miquel Raynal <miquel.raynal@bootlin.com>
> +  - Richard Weinberger <richard@nod.at>

Should be someone with the h/w. Perhaps the driver author Mason Yang 
<masonccyang@mxic.com.tw>.

Though the driver has zero driver specific changes since added in 2019 
and there are no .dts files using it. Maybe it is unused and should be 
dropped instead.

But otherwise, the schema looks good.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

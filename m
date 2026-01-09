Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07EBED232FC
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jan 2026 09:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e0guB1xrwZFcWWAjyX/ZGlPUWLtvhW5+Pz32SAXTOQw=; b=XTY8wNajki0PF/
	R5gcxtB6RxCAqdSZeHAAQXcBB6F7AfTYsltxsk3tiGCjnSOhxh7668jzJzES3v8I2uR4aShjU5Dfx
	6ZaAwwc59/P0P6+WfRT9+T5HEIaAf1XivXWJa4fmNsvNFdOwbnwbnImr7nFKIA5apilVbfBe8GQK4
	mXTdVZqoD5csWIpUt/HCAcZAO6kAsq155kR5TsoNdVja7wLykhGNI4cf3gqHfr2c0AklI7/3lhHGY
	MKllRNDcKn8HpAq+8pSGxgBYsyuZqw99xRcxQvB+CbqR/BLAgMnr3tWg2lMG0bCujVUlvXhYU6vk0
	jbFe2yjhBhhf7i4O8ruA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8lc-000000020kj-1zTg;
	Fri, 09 Jan 2026 09:26:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8lZ-000000020k2-3Pne
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jan 2026 09:26:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 055FF4341F;
	Fri,  9 Jan 2026 09:26:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5867AC4CEF1;
	Fri,  9 Jan 2026 09:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767950804;
	bh=MzYqxXAR0YnAQN8V09hkcDEqeFx8HQEr/YloebQ5JfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i/JbyQIJ7mBtds2VexrnqQjOeuPZV/cVXNT3q0k7EpWkV8tq3qEaB3vXo3afwlZUj
	 EPHWUZi1je0YEteTDgknSnVYHtur+xG74I4ZOXaYAE0aRowHKXDRmHue6xQvBhKlGS
	 IwKdtzTsPYKNyEFhP43lhXzhxHca5Kc0xZFNLRuEGaOgUhOsSxzTgUM46Xij6ahFhj
	 vwAtlzTBsiSJVLN3ZfJpNZpLsjeVQsX7pqy5nkCcbDSWpVV4uLJHCSRiBdzJdG7Two
	 7CbWc7HHG38repR4Z6wFWxFSc5dIxkNBLD905ev0U8uQd5EiLXEUSHgiw4com4qSXD
	 jyuFi2gzrzKXw==
Date: Fri, 9 Jan 2026 10:26:42 +0100
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
Subject: Re: [PATCH 04/10] dt-bindings: mtd: partitions: Allow "nvmem-layout"
 in generic partition nodes
Message-ID: <20260109-adorable-adaptable-bonobo-383d72@quoll>
References: <20260108-dt-mtd-partitions-v1-0-124a53ce6279@kernel.org>
 <20260108-dt-mtd-partitions-v1-4-124a53ce6279@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260108-dt-mtd-partitions-v1-4-124a53ce6279@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_012645_873117_3147B189 
X-CRM114-Status: UNSURE (   9.30  )
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

On Thu, Jan 08, 2026 at 11:53:13AM -0600, Rob Herring (Arm) wrote:
> An "nvmem-layout" node can be used in any partition node, so add it.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/mtd/partitions/partition.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

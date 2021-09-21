Return-Path: <SRS0=R+0z=OL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ADDEC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Sep 2021 15:26:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 317BA61186
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Sep 2021 15:26:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 317BA61186
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DeJhnr6fkKnmXEYKy0jAo9L1TIpBf5wcJ7rQKegohK0=; b=Z23ywHA0G2AgbX
	/IoeBTfdnjuqmuNDZIX8dp98Y01VqyysCGdE0xJ1FdjBZBB6TDN2BCsVU6oTgkeioxHAsexsMwap5
	8gXXtGC+7Y4a7X4+df+jaKzoRFHyhdQeRY4M8dw+lwcNU+hEvxTFeUIfnz5AZzlCRmuw1pTgxPxM1
	s1QPCTELF7XplyGLX3B9/iaZ7yWzft6Et8O3CDHQIdFCvcXTqe2z2gqoXYfM5J1guUiQdgocFshoa
	4+eCu/EiDY4v+uml7C6kMZvVkVYh6DWXZ+/acRl6snQVmm4GDamLrwvQOcaZQ+NF+tewv8YeoECXZ
	bww+Nz6leIKgc7APdJtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mShei-004u28-8y; Tue, 21 Sep 2021 15:26:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mShef-004u0b-BI
 for linux-mtd@lists.infradead.org; Tue, 21 Sep 2021 15:25:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1150661186;
 Tue, 21 Sep 2021 15:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632237956;
 bh=eyjTinIjeXPa0AJBKtnyfN91AZdFFxdTY14CTjIc1z4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AhrcU4h4aLg7A2EytJTjpJEM09a6pqMyRT8ED0GB6up/+6EATWA+8nVai4ssH4+BW
 kpVKSdI/4K4qd3SsPAibowc6tMgWg/aoJbX2rC8AAEoz/cvcfLnyrlrEHHjrujKmNg
 phgcbYmsbbdTa4QPO2UrDifELAm8bgunxIHpcuI/puDKuUInqh9GGq+KIlFGcAnzgB
 30OZU+RZqvy6DBHWLd1am79ZGWNvnqxffTaEPvb23fMlVsKimxfeJ4MrPpihJmsE2z
 BhhZ9YKDCvJC3ORqhXyyrASOapxUeTOV4kp8E+JBPpx0WBsyedUiinpNZPWhAIvJ+W
 ErXv+eq+mTlVQ==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org,
 Apurva Nandan <a-nandan@ti.com>, linux-spi@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: Mark Brown <broonie@kernel.org>,
	michael@walle.cc
Subject: Re: (subset) [PATCH v2 0/2] dt-bindings: mtd: spi-nand: Convert to DT
 schema
Date: Tue, 21 Sep 2021 16:25:07 +0100
Message-Id: <163223675481.32536.11593084094057981568.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210920142713.129295-1-a-nandan@ti.com>
References: <20210920142713.129295-1-a-nandan@ti.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_082557_458581_86D5FE10 
X-CRM114-Status: GOOD (  12.50  )
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

On Mon, 20 Sep 2021 19:57:11 +0530, Apurva Nandan wrote:
> Series to convert spi-nand.txt binding to YAML format and also fix up
> snps-dw-apb-ssi for related dt_schema errors.
> 
> Changes in v2:
> - Fixed dtschema erros in snps-dw-apb-ssi.
> - Improved additionalProperties, reg, and compatible fields in
>   spi-nand.yaml.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[2/2] dt-bindings: snps,dw-apb-ssi: Use 'flash' node name instead of 'spi-flash' in example
      commit: d7a48e27b38a94bf73c973c236461234610256d5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

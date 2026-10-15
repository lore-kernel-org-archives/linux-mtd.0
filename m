Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC22FCC6B36
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 01:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/LP2tegknuk7Vlob9A2uPxlrPbZ/gHMz3RiaeOQDghs=; b=mO4Agj8wR8YOJ6
	+haxP6z2lyTokg+W9QKrZFliNdz0O/+DhpYwUlczoe9CgMSpOpxypuhQxgs3jmV1VR1Bq1zcwoUse
	GvMAex8ByG7GSwxQ2/vWkLD/KPm7h0ff+BG83N77SvMJy8kqxUv4CChxxfJLpOkPGwliG8a1qMOlB
	/UGDw1ThkNPp9u62/9h6JZ8Azy6T7gbkQd/Wy6AsU3vnF4M7CrPZdarIHDIaWCjDHbxz/HnA0m8TJ
	E1sXE3wbnpeK2nWfdUF9DqKjwxqeemz03TMYNzXSFDpzqljiusMBwRt1cE9Hp4VxopQDdrIrHd0W/
	opcgsDlUGwhyRrU6l9hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHAMa-0000000GYNh-0UlF;
	Thu, 15 Oct 2026 01:34:32 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHAMU-0000000GYGI-2ZvF
	for linux-mtd@lists.infradead.org;
	Thu, 15 Oct 2026 01:34:28 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-48ed0b68895so2857787fac.1
        for <linux-mtd@lists.infradead.org>; Wed, 14 Oct 2026 18:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028065; x=1792632865; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W8HSeNHmGWx6gPVnRbfeK4ulo5XYre5+Djy0Qjqqgio=;
        b=cug/wCy8MZVqkwi4LnJhr6+LuDDCnbwUCUGT//wLsx9JUE96r8d8D8IoLnftESaSl8
         087uXwQdsGweK4e7eIKdGFEjvSDChc4AaC+0iiNkF2Jk4fSu3v4nZQI3mLbfvARniGfn
         y8joHkQ5HUUS92OIBdiMFYGoo2d7IEqJ7ZllgmnSXVErjMUudWEQKa3CExZVF++HAzkD
         6e8C4J9RN3CewNxR0rjf5sdmtpxSCjSB6/aUmuYrRsFNpSCZ4phIV2k0XhIjgIT7bVAz
         68Ga1sCAZ9juPN+1V4fdzbAHGLtaseKSUJp5t2TGSVVp/ns0c6SixH5HVfjV9Q1LskVo
         CRNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028065; x=1792632865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W8HSeNHmGWx6gPVnRbfeK4ulo5XYre5+Djy0Qjqqgio=;
        b=Q9DI19pOPS12zFINLHw5TUSdD+aKsaVUGOt2b1hfUDeetpiVZc36L0WVrHnaQcQSbZ
         xtbn6mlm7TWta3FEq/FDtm/CNLs4OrN8Xh/YlGvOHNNb7yIfY3mTDQvDxpEt0WcTiepx
         VM8/E9adzA0m02IUp2qAG/XXhxHHn8YlXTTCWZwat8uwsZeXYTCSKUVC0Qx5gwVVNGJs
         ah9IYem8FwJmXQWhbx8a3JRmMOfjxIIexdPJsviqM4IPWJJ02nc7mqHXkqe3CX2Uqy5y
         sQ3P639ZkgWLxIz40xfX00cxQd9nVawk/kdQqyDYO8L80JcXQs2tspch9PvTPNOGScAH
         molw==
X-Forwarded-Encrypted: i=1; AKwUvBz2ELE6R0ryZoKZBpRsMksWPSTEV5J7XL65F6bG1xOTDKpa021q+ygNLrp4h+3oNe/oSPgid8S4BIQ=@lists.infradead.org
X-Gm-Message-State: AFq9FYKluzvO3XfZ8TrIReDtu8k2W+VGKe2MwEEmnjRIBN/9D/OohQFQ
	iFymiDg5P41et8PszkT/n7avBaTnyJsNEHYnJ4C335/Cgf12GKifRHQd
X-Gm-Gg: AYBFou0MgGsEorA4HBW4Svg9C0YDKV4whdSq+taKBK6zaBQoR5+rXO0MaABkQCvccz8
	fe6PH4M3Lned0ESQaZBCIBwAHO/kGRLp2UHESJ3wxZ8QMyicVDYSx3tQBzCPvhGSpDvCOFMJdgs
	EKfQyaYDFMKSR3ZeUT7VongoCluzWegsStrSccfsoMMKl5CWhBmBC6aGwDemQXl8TvaIPwmTctO
	On/Hr0L+H623FmGXHpiHgnGTnpmKO0qrvvtdjXAhQmQhpUWgNjy7drSHOuJDLwzxYeGe8Q5sD1u
	JvZofXwULjCpCGQnODOuxL/SCFpqqdm63uyJVnkSZHp7hWFc8BaatlrjbSbyBvtZbGFfynz2rBM
	aKg0rNIfIlHH+OZfmaY+imHywndGufgS+UfCWzYJdtTWVkpO7eJO5zjMyDNolvOVEWzeipedmhz
	s/LljZaKLsVAXvd1KvzjeKpo6mGm8eIx68jqqophf7e1CL8Ct2/aORyrq4jF6CekuK9hTn/DCHa
	Htawous+4XpdX/IylEP5NTdnomBgLFlSrmKpxahUZxz0sxLtXlZXAY7Z3uFcOONt7m8+AfLFo0j
	c1Vbl5Y5IcyUawTOxE1e+QvT6NYVpByjFWUj65rq9fSKPd6H4v4YGqDxGQD8C2GPqljmKyx5x+B
	3bCZbTDPv7CGRl6Ty6Cy5
X-Received: by 2002:a05:6870:4066:b0:4a6:c1cc:e1 with SMTP id 586e51a60fabf-4a6c1cc0336mr6240528fac.5.1792028065404;
        Wed, 14 Oct 2026 18:34:25 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfb41452sm3428139fac.4.2026.10.14.18.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:34:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 Oct 2026 19:33:55 -0600
Subject: [PATCH v7 08/16] mtd: rawnand: sunxi: avoid a second program
 confirm for OOB writes
MIME-Version: 1.0
Message-Id: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-8-5d3fc6ad2da1@gmail.com>
References: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
In-Reply-To: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_183426_672157_FE7AA948 
X-CRM114-Status: GOOD (  13.96  )
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

The hardware-ECC OOB writer fills the main-data buffer with 0xff and
calls the selected page writer to program it together with the requested
OOB. Both the PIO and DMA page writers already finish with
nand_prog_page_end_op(), which sends PAGEPROG, waits and checks NAND
status. The OOB wrapper then calls that helper again, sending a second
program confirm without another setup or data transfer. A failure of
that extra command is returned even though the actual write has already
succeeded.

Return the page writer's result directly. It remains responsible for the
single program confirm and status check, including on the
bad-block-marker write path. Raw OOB writes use separate callbacks and
are unchanged.

Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index dfdd8d8aaa6f..6c4e1740a245 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1824,15 +1824,10 @@ static int sunxi_nfc_hw_ecc_write_oob(struct nand_chip *nand, int page)
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	u8 *buf = nand_get_data_buf(nand);
-	int ret;
 
 	memset(buf, 0xff, mtd->writesize);
-	ret = nand->ecc.write_page(nand, buf, 1, page);
-	if (ret)
-		return ret;
 
-	/* Send command to program the OOB data */
-	return nand_prog_page_end_op(nand);
+	return nand->ecc.write_page(nand, buf, 1, page);
 }
 
 static const struct sunxi_nfc_timings sun4i_a10_nfc_timings = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 941E6C61DC6
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Aug 2026 08:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=de0aHMQvWmmJA2B2Rr4EJbvIipmrlrgFB2p+qKYfsv4=; b=qcESV1fSuV2x1H
	G7rV9i/XJmiSw1ZVzJYYaE33RKOX6OydO9iM4OXu1DeSj1IZP95WJFomauH7OtmVUBlFAw2Pmvrs+
	7wLlEWKNFfufT+FfY3Aj7xJ8pF4peBy+7rYko5UJMuWu90NVElxciCv5ncgxRe/yZcltbksnLLBED
	a1/WOkJgqSpOk/zPCJVmNbOTqN4Ay88/J9Eu7MFk6Y6m27FOr6pwgyQbjapDN/UCXQvKjVKxDleOO
	b7opkUHT05wYH8OtWCQ8DI7nyTpMjHVHyjci5TSvk9tQXSxybp0wg05GaKp1NgNy4xnpP3rXIoDqL
	NSPs4tGUYdlFSDTtM6LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsLK-00000005MuX-1gao;
	Fri, 28 Aug 2026 08:53:46 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsLH-00000005Mss-3kWP
	for linux-mtd@lists.infradead.org;
	Fri, 28 Aug 2026 08:53:45 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4957eefd361so5187685e9.1
        for <linux-mtd@lists.infradead.org>; Fri, 28 Aug 2026 01:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787907222; x=1788512022; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KcNc5am4vIAyRl77N2rZ/loulQZc6aDcjgK7f0FqIlY=;
        b=HJjnV/xL3VXCziP5ovUxeib2YqHM7K7p9V66vwhnxcJX0wdnb/MPTTS0MdDTMWxzfQ
         p1PPx+uTE15mh8CZkZhZcVZvN0yzd8BeiPSZPaKwayxL921D3oliNRULex/qAwoXzJUm
         wbkO7kmwslJl1mhM2wveLahTqim/5LD1ZxHR51MjoT4jRP5w+QWVB4HtcLeQh0bhg+bR
         3zXNJehRrLS6+fX7rWVcJUE6P+xAjHvRd0v8D8bm9ggQ6noG125dPqYukHUPj+tjx8qV
         jxR6OU+bLaft7RV0WsqksSqY1izCZ3AAeymgLfDQt1HUP2AgnfsFMrtoRSI70S5BPHuS
         GhRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787907222; x=1788512022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KcNc5am4vIAyRl77N2rZ/loulQZc6aDcjgK7f0FqIlY=;
        b=CozviBgk6B/lUVshfm/ZehnFaz23mQ+jRUv5Cpivh6l+eJe8XnpkMm9QLy+5gkhk0U
         6gdxAyO4lSZr4jBgBoTCvPEvt8LCBNd/pvXtWphCSDpUjSu0yz3IO9ejMc3Y7zV3EbtG
         l1htnqZ7Tj9C0mqp3gH5BBTgpfVLNltNEaR+pGh9Eh+2IhopAnY1C1sM2RlKSvHpCve4
         ZD2MS9V5mI7e7RfofhKN5+vvONciyu/17OmFoS1ca9WyCqVJdfs19W71Dti4YKvTKxgj
         qdcgjW77/fV7WJ15J9xfeNSA9HS7xg2m987zAIcUAZ2OCbrf6QMoPbyZoJ0i12Wv05W0
         ernw==
X-Forwarded-Encrypted: i=1; AHgh+Rrib8e5w3GzaxqmWJoSMaWyvhiMLi9d7BP3TNnzUODPYVGb2DOvsNPz/x2+4yCjjSVXxs/6nyBYYwk=@lists.infradead.org
X-Gm-Message-State: AFuF++kcGWgt2WOSU4DOUgg9YUnfHkZqtjJLVJi/HHe0x5qeHyIwL+OK
	nk+dhgc5uQwHQA3NkB/zXG1tCoRmeqv1Qswf9xQT/4d3eR40K0fqL6pr
X-Gm-Gg: AR+sD11JOwSlCeEeBtYkFsolYR0cwqk3oajnNemPKoN+GvGUOfE54GFniz51K9IOGrf
	UuN1yRorizL7UZkg1cLNpYYEf10Eo1VRQsoK/ejTzHQZV6iu7bHzuN/KiKgxaYhnUmkxRC3u1m0
	HHITFTJKMNevlUYiEB2zX/xiOHWrjX2omqShT56DnIFAOEoyt/sk4KaDH053tZX5b98c6cnAx7c
	As0D01eoW2z29Y3l8XkqYu06UkERCO1cizvbHGGhSz7QbFIXdlyHfFI6OZNJvHYVkqnGZRFpUao
	2HQgtb7c5rXWgkTZCDYUqkFGBVpQ+zssJsy/MW4CnRKlVlnzMLFsaEV68rDWqHJ3dBRUVB6esSi
	OgHPKKVR1yD2ATcuAsadjWU76Ut5QcOrBaPN7LIg+Hazs7TpEUMfyy/H0Y1dnIDD9hfccfRtntr
	zKg/I007UCUOCSEL1MuXPGYkWXdWdrMACWcF96aDeXqi1XypIsWnthPGGpZ/lieaFwyco=
X-Received: by 2002:a05:600d:8449:b0:49b:96a0:5c00 with SMTP id 5b1f17b1804b1-49b96a05caemr33087215e9.13.1787907221828;
        Fri, 28 Aug 2026 01:53:41 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b926874fdsm43155175e9.4.2026.08.28.01.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:53:41 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Stefan Agner <stefan@agner.ch>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Bill Pringlemeir <bpringlemeir@nbsps.com>,
	Brian Norris <computersforpeace@gmail.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] mtd: rawnand: vf610_nfc: fix the OOB of written pages and the command completion
Date: Fri, 28 Aug 2026 10:53:38 +0200
Message-ID: <20260828085340.3916239-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_015343_959383_9DF4418E 
X-CRM114-Status: UNSURE (   8.75  )
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

Two pre-existing issues found while checking the Sashiko report Miquel
pointed at on the large-OOB series [1]; they are independent of that
fix, so they come separately.

The first has been there since the ->exec_op() conversion: the ECC page
write transfers the spare area out of the controller SRAM but nothing
ever puts chip->oob_poi there, so every written page gets whatever the
previous transfer left behind as its OOB. The second is as old as the
driver: a command that timed out can still complete cmd_done from its
late interrupt, and the next command then returns before the hardware
is done.

Tested on a Colibri VF50 and a Colibri VF61 on top of the large-OOB v2
series: UBIFS write/read-back intact, clean ECC counters.

[1] https://lore.kernel.org/linux-mtd/20260818114208.2780311-1-mehmet.fide@gmail.com/


Mehmet Fide (2):
  mtd: rawnand: vf610_nfc: write the OOB bytes on page writes
  mtd: rawnand: vf610_nfc: rearm the completion before starting a
    command

 drivers/mtd/nand/raw/vf610_nfc.c | 6 ++++++
 1 file changed, 6 insertions(+)

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

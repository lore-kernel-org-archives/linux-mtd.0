Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE3BCF34D5
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2024 00:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GDCoECyHKv9SOyqtbw5fneL4wMrpxykl0zkchVhuQTQ=; b=nAtCc8G4pGDyg7
	V/RPPKmlT9I1GN7lFuvSBfT4g04p1wsCek0elAVZzAjSSXSG3WOWLdKYrIHmU8VxZKU2E2i7k8ahZ
	SafRtXyZYfMEzxwVJhoVIssWUdmcOpSRqSsLlJyibKNYwa7zNvbDyxa/0/iswsknS75LK6HUcgGk9
	n7Ju8pmoXh6+QEWY1TU0VrMNaEXrQZh3/Qglyujzuc/KiqbJ5m6IdKbtMkwDCsUBsaAAv54kFdsxJ
	7KUTKoAqfqcCLcp/Uaf+ufG/uUOh9sUWb9HU0uw+dlyx/0LeqluazUG91cSV75t0YC8TBxEKy+R2w
	bm7HUrc8P4o8Ik8+usOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swVp5-0000000AhlT-09FB;
	Fri, 04 Oct 2024 00:05:31 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swVkF-0000000AgTj-1nXb;
	Fri, 04 Oct 2024 00:00:33 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-71dd92e3718so1179303b3a.3;
        Thu, 03 Oct 2024 17:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728000030; x=1728604830; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3pFqfOh1/PbuJMZ1ovEQo0qGXsKUQzTf4DVIM+oOnHQ=;
        b=WByDlW75znar4lK4MFzDouDYsrzKkBmRb5fXvuqEEOwCsXm52tsEQhkUk9VtDtFTSA
         4geJfVnvPCdqhApmP4/EH7biCuEY021jnlliPzpbDEZ1U6JET9GfUwJs88JvJMKim1u9
         Ms7JKq/GWnn9igN6iiRRWyQjxkUklAsESY74QsuZebPZlSfK+Vvsg7J6iS+X6xXILCmC
         G0w18iGQAfxyRqGHGQ6DaWeeGTnN8FVtf1Mx7DOTkAV8BSOlu4MwjIg6lDabzeK6eu3k
         L3Pis/CEc9Ugq+Q6Fas0soRAfqdS45XdzEIdm32SbMV8W1zG2ZeAvzMbhP+SVwQo+RmL
         tjZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728000030; x=1728604830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3pFqfOh1/PbuJMZ1ovEQo0qGXsKUQzTf4DVIM+oOnHQ=;
        b=weZ831w9bbSrzF+NVEOsdjQoQzQMnsZSgCUB+7mP+YiR9DPNBIXrh8jgv4z1tlYno0
         r3PGgoRtyveq01zmf8h22F6UIV3aQK0wiTU4+nNPf/QYAkAJq48PVxI3ep4IHSnIxTSo
         kOAAYFlVuZq+eh9YUUSdLLB9VrL4zPUhCV7kbKzJ7lSotjFC+inAAVUP31m01zGSP4q/
         pHM0G7AL0gtHJ0kvn5muI9pYCeBGlgJwBUDzfVKm7OoQrKB/4b3ecqcEA5g5TD5pQzdO
         eD2x6HUXxts6iCbnaZML9D9pHhWGuE1iTB29Dzixbw03LlX1ID+H+kHf6f2yq0Vxc3a9
         OlIg==
X-Forwarded-Encrypted: i=1; AJvYcCWdjn6lRAKyLRgUk9DVtri8+JLtv7yL9E26kqxMzFlnoDV0pySENrVOnNv8rtpwulkEpFBMtUh+fnzQh++pxskm@lists.infradead.org, AJvYcCWpq9xfKTT3+zfs8s12OsYYevVczlOJ3HtIudjWkKuBuWPSaq+TPXOfS+YnjDHqP8lVZjPrlAdZelzAoaHwE0I=@lists.infradead.org, AJvYcCWqeBq6GRFGpSkY5w5OEOyiKf+/uR36qjk9m572pd0mcSfE7UYj0+1kCGNv66VVsoumcld4n/xiXOda@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5hU+UcSTUSrvgism6aV1mCe/kOwhSRw+aWNJOBG29G+9St0MF
	mcDjGMbLsvEdmcVbBgpqqN20BKRMJOctLi0+QrAFWWTjCMyBqQcr
X-Google-Smtp-Source: AGHT+IGQKNnEzQ8aL7h/Dh0IMEqkbtSWju+f0UHNIlA9oFQ5gkLCt2cqEgTO8XLsflQWB7i7x/N04A==
X-Received: by 2002:a05:6a20:db0a:b0:1ce:d9a2:66ed with SMTP id adf61e73a8af0-1d6dfaeef4fmr1477126637.48.1728000030448;
        Thu, 03 Oct 2024 17:00:30 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dd9cb0b28sm1983047b3a.0.2024.10.03.17.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 17:00:30 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rosen Penev <rosenp@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-mtd@lists.infradead.org (open list:MEMORY TECHNOLOGY DEVICES (MTD)),
	linux-kernel@vger.kernel.org (open list),
	netdev@vger.kernel.org (open list:NETWORKING DRIVERS),
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCMBCA ARM ARCHITECTURE),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCHv2 4/5] arm64: dts: mediatek: 7886cax: use nvmem-layout
Date: Thu,  3 Oct 2024 17:00:14 -0700
Message-ID: <20241004000015.544297-5-rosenp@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241004000015.544297-1-rosenp@gmail.com>
References: <20241004000015.544297-1-rosenp@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_170031_480385_1EF258A9 
X-CRM114-Status: UNSURE (   9.56  )
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

nvmem-layout is a more flexible replacement for nvmem-cells.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts b/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts
index 08b3b0827436..9a6625d8660f 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-acelink-ew-7886cax.dts
@@ -121,7 +121,6 @@ partition@100000 {
 			};
 
 			partition@180000 {
-				compatible = "nvmem-cells";
 				reg = <0x180000 0x200000>;
 				label = "factory";
 				read-only;
-- 
2.46.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498DFCEE355
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Oct 2024 21:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GDCoECyHKv9SOyqtbw5fneL4wMrpxykl0zkchVhuQTQ=; b=Ju7/MjjyVif4rL
	SWs/m/nZ7DrlXLzTizVHXTt4FtgHwZILgSl4ko+e5KIrKmH4zGg9ETrlNl0toXbli+a8xBZBeffMF
	bvYx9MQ4eXoTzrSH4Lw1fPwTpSfCf/VZlE4gf71gTdXakjXQmCSEQpasMfAGZpSUkBwIYGqJdREdY
	Bs/SaKpY4g+xBEDtphvYp5kkqj5EzEDCzou+kK8aNtKjEMAbwHTfuYSG7fC76a2kT1gltYIjvVxnB
	FPrHlx4fnscK8dklyIelplVStxNWLOW8w8szPGrcbzkh00SntNQr3ytgnsqb4sMIJ8IydpD3vblVd
	Dtdbmr3QwrVM3hYAvlCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syedT-0000000Ar9N-1oXT;
	Wed, 09 Oct 2024 21:54:23 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syeYK-0000000Aptv-2kLj;
	Wed, 09 Oct 2024 21:49:05 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-7ea07610762so182405a12.0;
        Wed, 09 Oct 2024 14:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728510543; x=1729115343; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3pFqfOh1/PbuJMZ1ovEQo0qGXsKUQzTf4DVIM+oOnHQ=;
        b=Ha5BbZor2h1VljuYKacNYiRbu11dAmGX5iHt2i6hghskDzgh+kiToBbdSZunWXeoz/
         c4UQuGooVSGkwyUehC3S5IoB1nQJ6WmA8oIdWExYaETFqqyfWmNgLTF9hg9RsHVuJJJL
         KvGrH8zbFqVT149KDvUJXAu19v6OjED8TiN7OMQlvPGTHxVBarJRsybufB33dDSyr4U3
         wTx3ZW+fBHBA4kZ6wnpctg2s7D7XH418LiHnqHS83k856Twn7gjSBwzuvQ+jn4m4FzyK
         vgqBtJFsBKrvGkXNM6bmLurGCvp9mo8JWR75E1twGF/r+aGeRzGqUWwDlhxfG52xLNT1
         00wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728510543; x=1729115343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3pFqfOh1/PbuJMZ1ovEQo0qGXsKUQzTf4DVIM+oOnHQ=;
        b=G2cSQSOSyEPpCJtZrAp+ogYmMssGGxT1UGk8EZ6owowluf8JDrcKaw9Rmh+TzcRyTV
         Bw5XtojTrXvEjCnvxAMEzOcnKHJw44nMbBY20ykK1oz1nIgQJIaPfmQl5Rj+G5gqVcCr
         nWNT7aOheMbehdil9tIcQWQACts6IYs5mMkedPc5yh2t4fKGCm/3EeMfk/Rdikavc9OL
         JAmSiRVBMgPmkI3YeziuKniKBaffgwtGnCLzHEsKjsMk6iyX4jM4IOFJnVdbGf0g2VAf
         dt5Ly/pMNzBc2v8iWxqleZz5Av+NOElrfrKpCGAf1I65iOQFdYR+U7y1BK52fTEY3rPI
         oz6w==
X-Forwarded-Encrypted: i=1; AJvYcCUZ6yPZ1PlhpWWN2eVAUsy6Jiasv901jA7TC/s4ErJjiNJpWIDeVAK8i5fTfFlHFjGgkG1GPyLdhZW4InpL5VEd@lists.infradead.org, AJvYcCUhij2GKV8T8eljaIPRwmnMN+StplMLXI8YdWVM3t0OByudZR8U2WAxs6PCFwS7j/lssnHW3nhrVdOv+nxUFkA=@lists.infradead.org, AJvYcCVvjPZLzMDIkgIXRStPS/0Wi2+vhxWRgPiqHA4i866ymTagyrE+E5nVEwzantbgJy9Z+x7HQtTnnyde@lists.infradead.org
X-Gm-Message-State: AOJu0YylgUJ1pP0uLPxOSAs6j6nmx7Yk84xSiTCtHsBnNfEmI5G04WpE
	+NNLwh4b8ezTO/EN4KGfhuKX6ymrFXa6F7d9xTdPyAnAVOH9MCt8
X-Google-Smtp-Source: AGHT+IGMs1YOfwcLXnyF3f5oAEJht16GdUiRrrh5sgEZq7TMWIylXPioMMZpPWgcLjjmm8ho3Ji8YA==
X-Received: by 2002:a17:90a:a410:b0:2e2:ac13:6f7 with SMTP id 98e67ed59e1d1-2e2ac130994mr3869737a91.4.1728510543308;
        Wed, 09 Oct 2024 14:49:03 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2a5707cacsm2250091a91.21.2024.10.09.14.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 14:49:03 -0700 (PDT)
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
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCMBCA ARM ARCHITECTURE),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCHv3 4/5] arm64: dts: mediatek: 7886cax: use nvmem-layout
Date: Wed,  9 Oct 2024 14:48:46 -0700
Message-ID: <20241009214847.67188-5-rosenp@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241009214847.67188-1-rosenp@gmail.com>
References: <20241009214847.67188-1-rosenp@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_144904_713789_8CA6299C 
X-CRM114-Status: UNSURE (   9.75  )
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

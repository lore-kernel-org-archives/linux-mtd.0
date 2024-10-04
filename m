Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7ED8CF34D5
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2024 00:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5eXm+LJNAQq3fs54u1s9S3TJGMNLORj8wEzf1XYkBEw=; b=AqlUZ9XIvmoOmh
	YDwfRyRKxTO9cWsMTXOvoBnSJYxB76+xmW2lOYUTw+sPeSRf86NnF60zHswb80jbuCNJYDt1sfWWi
	hwuP9VmgtXyNEGV/oiyxpn4ZBHTAL5zy8OQj2hoS2/SxCla0lz6XumrRoONjJ3X/eTz5cpGQq6UeQ
	ryRFkQNxn755XIkMzkmL+DdhpaZssN89D28gxPgruZ0hvqLI4t1MTMJCI++pQSoBsbGzL5WMh0Ame
	FVEmEJ47dMgbbmugA74eyTa7CRxTjQrh5+D4eAmPzpbfpsEFby3L7KRlhUhGvCb6QzHdRJMee+uMQ
	kKWVMPKvJETSUA2mS5Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swVk7-0000000AgRi-063J;
	Fri, 04 Oct 2024 00:00:23 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swVk4-0000000AgRA-0dj0;
	Fri, 04 Oct 2024 00:00:21 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-71971d2099cso1430045b3a.2;
        Thu, 03 Oct 2024 17:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728000019; x=1728604819; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uAFmVgHYoe23c3WiYdk8jnywuzLrHCt36wQKW4RQ8rg=;
        b=WH8EiKLzakhJsV46nvYu9wYoLTwEWIFA9SDLpIflBMXiHofn2aQgVHiNGTztrwpzzy
         zk0d910STkNvPBl7GgRvoDjh8VtnxTRL51ErIL1GhDwzFyuw0vKGkOc25ecpZeMHDPfA
         g4y06ufXMYZMaUJyRND1EljFmdKMjeCRRTG2noN1jrBE/Lq8c4rwEQF4bKlTnHjor+sH
         TsRxZXzmVxAMg4tWijQLgFljSCTNF6EMdTI4xvk0PEUSKZ6NEhAmXkGL/1XZec9bC8Kk
         XobDeGteU3sNb3cgs4WIgyF+rKUL4teAghGInX41Ehx5Kl9FdVmuC0W5fz0n0EKYuefF
         b73w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728000019; x=1728604819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uAFmVgHYoe23c3WiYdk8jnywuzLrHCt36wQKW4RQ8rg=;
        b=WSBqShWZyun+8iDIQqrZ1TlbNPlihYSIlk9FmhLBgdyNRfs0JvLMG06wVDsKKFeA/1
         MNSLA61PRrS6WAlyoDOtgvFyuub+ovBobLljRXOKiNPejbEJdGsvytCOnlp3bebjF9ZR
         pAWE0EO9PUfmPENDJrqoOJaCPar3veEzHSbyJtiV+fVq7Jf0fdVUPgDoUUSyTSEmGQmf
         RkBaCzMe8Ev4eMuBGWAPS2paqSDeQXBt+gBIycGVHU/XICpySib2/dKcZvxVsx/DVnqY
         oBSY55e0kwbaznYhX9/+1rqliLfXnQA8K4WM/2Szb6z71y4ouODMzSTD51Vl6h7vudVf
         jIfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYwKLb9nBo7bw8c2RZBKl79ZwEvlnId/fCJ3JOPKEhSYv7eECWldNGUMcT5/JnSVXcskE/CxZ+KOja2mvMRZzd@lists.infradead.org, AJvYcCWAa1Z3MxKAfw7HKMqv4xSuw1Mv2g/GzESjn/QymtWMcc/GjzwvRdnYl9NDtpeVjs3Vynl5GfA7bXqLsq9B/so=@lists.infradead.org, AJvYcCWwGlZeG1uDmbUR7wVFu8ZSiHVL9U8Lz2/E7/KVWl1R2eIzZs7z1og/tJD509OvuDoyZXaczAzCNjFH@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3RXc/rik4cwgxj1/T/bQpYBqYX5CTv5py6GtqwbmuzGOOqZmD
	fxviu7aJZ3ykg5aQo3OiOHxE4M+u/2wXjn7I0gYYOFCeM7bPWFfV
X-Google-Smtp-Source: AGHT+IHXFjoxUX0o59w38/yIlWlyO0Vt5ngI8BTtORwAbSNVnJQZVp2Nrs40lFDzCmSccWsHrVfYDw==
X-Received: by 2002:a05:6a00:190a:b0:706:74be:686e with SMTP id d2e1a72fcca58-71de2474d77mr1276637b3a.26.1728000019279;
        Thu, 03 Oct 2024 17:00:19 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dd9cb0b28sm1983047b3a.0.2024.10.03.17.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 17:00:18 -0700 (PDT)
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
Subject: [PATCHv2 0/5] devicetree: move nvmem-cells users to nvmem-layout
Date: Thu,  3 Oct 2024 17:00:10 -0700
Message-ID: <20241004000015.544297-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_170020_218198_CE5C4AFA 
X-CRM114-Status: UNSURE (   6.62  )
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

The former has been soft deprecated by the latter. Move all users to the
latter to avoid having nvmem-cells as an example.

v2: add missing semicolon to fix dt_binding_check

Rosen Penev (5):
  ARM: dts: qcom: ipq4019: use nvmem-layout
  arm64: dts: bcm4908: nvmem-layout conversion
  arm64: dts: armada-3720-gl-mv1000: use nvmem-layout
  arm64: dts: mediatek: 7886cax: use nvmem-layout
  documentation: use nvmem-layout in examples

 .../mtd/partitions/qcom,smem-part.yaml        | 19 +++++++-----
 .../bindings/net/marvell,aquantia.yaml        | 13 ++++----
 .../boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi | 19 +++++++-----
 .../bcmbca/bcm4906-netgear-r8000p.dts         | 14 +++++----
 .../dts/marvell/armada-3720-gl-mv1000.dts     | 30 +++++++++----------
 .../mediatek/mt7986a-acelink-ew-7886cax.dts   |  1 -
 6 files changed, 53 insertions(+), 43 deletions(-)

-- 
2.46.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

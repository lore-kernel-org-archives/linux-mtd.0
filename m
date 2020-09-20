Return-Path: <SRS0=3Hr+=C5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT,WEIRD_QUOTING autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AC75C43465
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Sep 2020 09:58:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D27D220866
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Sep 2020 09:58:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mvdQDpLE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ofx1D1Nq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D27D220866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=or2AJsjdJV5JsdfWrigTwmJ11pQPXt2IfMhC0ZO5fq0=; b=mvdQDpLEQUL8Kwo96i1lLWppIv
	i6K3oCvcIfT+pDQ1fEQla6F8Ns/z3uBy63QGuXx4TjtD32Mn60rzhNAQSoI7e4KnNLpyPxiRDCEJX
	equzflXoc6wf+TYMDPD1XDvo/p0IaOqi+JbmUYffBfVuDSQgn/B7NremK5+bQmgjCyrJ/ZhblQ8uG
	s4p8nlb6foX4cZiHfGDaS4EuCQCmbIhSUnHam36cghUvQVtZ+2BXBdaFeOXxTLgxrJQAso+SH9lp/
	n1NQdYlaHLce9gal16POrRcBr6vKNMOloiJRx3I8pm+L7UWLs51tlCXqfLJ48+CvZAr19ZbkHG020
	ZaVwFC/A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJw6K-0006mw-OP; Sun, 20 Sep 2020 09:57:44 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJw6D-0006mX-I9
 for linux-mtd@lists.infradead.org; Sun, 20 Sep 2020 09:57:38 +0000
Received: by mail-qt1-x842.google.com with SMTP id b2so9660816qtp.8
 for <linux-mtd@lists.infradead.org>; Sun, 20 Sep 2020 02:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uDVxCDw/mkuVh9Zb/S0gwKAdBr82bzOYeeKlHjwpmnI=;
 b=ofx1D1NqfH5dHW/dxhWg2l3xCNYBm6LiecHnTZc6vBJFnpQeWKX2clJOrlPHe7Ao00
 UT0RFEMsp51pob301SMzjdNLNa2paQDpaA16FUfCs5qUmp8g0i/epObbkH4bfte4T/St
 HXYJOjkV/RVEufB/ao2ntSqe6uB4z+pBTXH0ceHfk4RwtiGXov9TFxRoBZUrf8FtruzO
 b5lk5IADvtxrHkhWDtFRKry5EquXZY9yI0HtgcXXHrrI1crTb0OcXli8MOgA+4srkx1c
 otcCkpCWZenJ4WVl0JLln6AGVzgiWnelhAJuoBWRqznJ9i1MQrxYgaduAcGqkpyLljBI
 u/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uDVxCDw/mkuVh9Zb/S0gwKAdBr82bzOYeeKlHjwpmnI=;
 b=ahCjCggd8CYbqc45Y2EMWe79jJn3mb18RQq9BKq4SAfGVP2NtoHhj0yiVk0Ye51AIs
 dFFNY7P8OD4thDl2YQpFOfV9/GuiMDJ+rCH+x9QrV8SJjE+9othYAFQPOVRTP+U5A4Hl
 JNnhSKKklxEfrNF5WzT360JREv1sqLzV3Ej4wUcMFEwm8r4QdipHx1oLhk+dPZ17x5HY
 AT/7otNsFaLR84B8DHcbYHXLtJCPnw3S9TnMK7edzCmoZ3BWsze+OWr4XTn96oB4JSn4
 qpaHpfpm35d54KN+52OiePro8QHHxQZuUj7JM1XVb916TA3r8oGsKVG6KTY4UOx8JTLs
 A9XA==
X-Gm-Message-State: AOAM531Q0Ps+VcrHdbwi48+L7ydcDwzS4ayQw072bnhjUyUITkfDKVig
 carGNtnQNexig1VzOzrWtbk=
X-Google-Smtp-Source: ABdhPJzAMgo/CGiZ0Vsks0+7msEFUyUjYcOWlQTJtyjBuCh5bhXnmX0eMlVDb73ddJ8e6oyfhXVC6Q==
X-Received: by 2002:ac8:3848:: with SMTP id r8mr40698252qtb.205.1600595855672; 
 Sun, 20 Sep 2020 02:57:35 -0700 (PDT)
Received: from Ansuel-XPS.localdomain (93-39-149-95.ip76.fastwebnet.it.
 [93.39.149.95])
 by smtp.googlemail.com with ESMTPSA id w6sm6968323qti.63.2020.09.20.02.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2020 02:57:35 -0700 (PDT)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 0/4] Actually implement nvmem support for mtd
Date: Sun, 20 Sep 2020 11:57:18 +0200
Message-Id: <20200920095724.8251-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200920_055737_617088_B400AB04 
X-CRM114-Status: GOOD (  21.29  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Russell King <linux@armlinux.org.uk>, Ansuel Smith <ansuelsmth@gmail.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The mtd support for the nvmem api has been stalled from 2018 with a patch
half pushed hoping that a scheme is found for the mtd name later. This
pathset try to address this and add a very needed feature for the
mac-address.

My solution to the already discussed problem here [1] is to keep it simple.
A mtd subpartition can be set as a nvmem-provider with a specific tag and
each direct subnode is treat by the nvmem api as a nvmem-cell and gets
correctly registred. The mtd driver will treat a direct subnode of the
subpartition as a legacy subpartition of the subpartition using the
'fixed-partition' parser. To fix this every nvmem-cell has to have the
'nvmem-cell' tag and the fixed-partition parser will skip these node if 
this tag is detected. Simple as that. The subpartition with the tag 
'nvmem-provider' will then be set by the config to not skip the of
registration in the config and the nvmem-cells are correctly registred
and can be used to set mac-address of the devices on the system.

The last 2 patch try to address a problem in the embedded devices (mostly
routers) that have the mac-address saved in a dedicated partition and is
a ""master"" mac-address. Each device increment or decrement the extracted
mac-address based on the device number. The increment function is
implemented in the of_net function to get the mac-address that every net
driver should allready use if they don't have a trusty mac-address source.
(One example of this implementation are many ath10k device that gets the
mac-address from the art mtd partition assigned to the network driver and
increments it 1 for the wifi 2.4ghz and 2 for the wifi 5ghz).

I really hope my mtd nvmem implementation doesn't conflicts with others
and can be used, since this would remove many patch used to get mac-address
and other nvmem data.

[1] https://lore.kernel.org/patchwork/patch/765435/

Changes:
v3:
* Fix const discard warning in of_net.c
* Add some info about overflow/underflow of mac-increment
* Limit mac-increment-bytes to the last 3 bytes
v2:
* Fix compile error (missing mtd_node in mtdcore)

Ansuel Smith (4):
  mtd: Add nvmem support for mtd nvmem-providers
  dt-bindings: mtd: partition: Document use of nvmem-provider
  of_net: add mac-address-increment support
  dt-bindings: net: Document use of mac-address-increment

 .../devicetree/bindings/mtd/partition.txt     | 59 +++++++++++++++++++
 .../bindings/net/ethernet-controller.yaml     | 21 +++++++
 drivers/mtd/mtdcore.c                         |  3 +-
 drivers/mtd/parsers/ofpart.c                  |  8 +++
 drivers/of/of_net.c                           | 57 ++++++++++++++----
 5 files changed, 134 insertions(+), 14 deletions(-)

-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

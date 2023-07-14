Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF52AEB64DC
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Jul 2023 15:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B8Ib169J/hiqam12EtlHIubHIbSM2y4N/ar/FekbIDo=; b=DC48DV86kzxthJ
	jqgs5zD8wz7XNubl59LjOBq3Pj4VA1mvWfYVC763QJZgUaeP5oGCThyBGAdBh3asX9fHilc+aKueP
	LpI5cEiTOAJLPX72r7z/VUjrR5vUlH7KkbCvlRCJQxWEAHL61tVvb/zdrJsXmbVowf4buvB5W9+/R
	znmlvGokR62hT4rsFBZPZmMlJWoa1v9d9VA680TGeeVqlzU2xcj7a+HLuyMD/Acf2GzRboQ36PDgH
	1KISznDBJxdcaZdXepfDeV4T/Lv2F/LXhV2XX3D7y9cpdT33+x/9MJ+2PV6Gtrl/Xmrj8qrKFlBjp
	F6hI8kdcTcExD7+FJjGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKKaS-006VJo-11;
	Fri, 14 Jul 2023 15:20:04 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKKaP-006VI3-1j;
	Fri, 14 Jul 2023 15:20:03 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-99454855de1so57076766b.2;
        Fri, 14 Jul 2023 08:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689347993; x=1691939993;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uRxUFSZUV2W8ort0PSj9hJsHbd6feENt4NCd2S7baGM=;
        b=kzPYOVXNMgXeOi1lmP8BNT3aG05tx9JwNSA93oBI+KA2rcVXavNhT42Py82GFw/dVx
         xYzuz/L+jSOIt+EP6ZuhbjyNgs1QRfCBMk7Eda1ciaG0WdtjCZ7fXYOtove8c1qdWyc+
         AoFNG0bOWYs9VyaqlEt1l0c44lS+SIjlmi3vgSCrkjzIPUjH3MZp3TaEJyO/sTIAFxWs
         8DzSW+1LsfzQ8sHkVpVRpZwcirdnwz1ClyrnYUHte4ah1GPfHYo3B+T4KZ8xUXnGqPMs
         6okwA3JsDmHSR4jKrnPKfZBRKSwKqq2jrCjaB9Xn5FWKS8yULHMRp2wDn9w9+HOopza1
         8Pqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689347993; x=1691939993;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uRxUFSZUV2W8ort0PSj9hJsHbd6feENt4NCd2S7baGM=;
        b=hV51oPidSYYoqlgsjtTv+ydJaduCYlF4qITiDmoXkUVkXFNuQzAtcKNCaXGHrqjsXN
         KhVI8qj0wf8eeRG/Os7rNYDv44KjdnnfuhtHTDTJIVCYmyTLPZBR3wUb8M51dqo6YgrQ
         AiGfUItHrle6Cfuij0xpt2GSbSQ1UBG1H8ar6Ve8Zt8fofisocRDb1iYPTWRiKTfxUT+
         ClnQXSGyOL6jqfZizsQ/y7eB8OIFz3Yj7BUP45Epigobp2Euwim+7GpqyAh8wOTMIZTf
         d5ViSnCvw07kEDl/FfQJCsMyUnNPl60tDFcrbLnZyy44R3+RntaVvyEPZwQOE6q2zbW6
         wHAQ==
X-Gm-Message-State: ABy/qLZhMUl6pOuzJSLCl9q8ArjQwlMxuNc3r3qqebvaXcvx18wzF7Ci
	9EX+goJJA9m7u47VDXu24+I=
X-Google-Smtp-Source: APBJJlH/63xAD4d8jqV9NnNG5NHdtTn3OTwFVR/uDJ9N36uzE9gs//IK4CRQnYm5FFxhU/bq+faEQg==
X-Received: by 2002:a17:906:5194:b0:993:e9b8:90f5 with SMTP id y20-20020a170906519400b00993e9b890f5mr4483546ejk.8.1689347993197;
        Fri, 14 Jul 2023 08:19:53 -0700 (PDT)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id e10-20020a170906080a00b00992d122af63sm5472518ejd.89.2023.07.14.08.19.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jul 2023 08:19:52 -0700 (PDT)
Message-ID: <273ad871-9050-7851-9973-5545b88bf43b@gmail.com>
Date: Fri, 14 Jul 2023 17:19:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v5 0/2] Fixes for Rockchip NAND controller driver
To: miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, heiko@sntech.de,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 yifeng.zhao@rock-chips.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_082001_579716_2DD6D264 
X-CRM114-Status: UNSURE (   7.57  )
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

This serie contains various fixes for the Rockchip NAND controller
driver that showed up while testing boot block writing.

Fixed are:
  Always copy hwecc PA data to/from oob_poi buffer in order to be able
  to read/write the various boot block layouts.
  Add option to safely probe the driver on a NAND with unknown data layout.
  Fix oobfree layout.

Changed V5:
  Reword
  Remove skipbbt patch

Changed V4:
  Reduce subject size
  Add 'Fixes:' tag
  Reword

Changed V3:
  Change patch order, layout fixes first
  Change prefixes
  Reword
  State that patches break all existing jffs2 users

Changed V2:
  Add tag
  Add manufacturer ops
  Reword

Johan Jonker (2):
  mtd: rawnand: rockchip: fix oobfree offset and description
  mtd: rawnand: rockchip: Align hwecc vs. raw page helper layouts

 .../mtd/nand/raw/rockchip-nand-controller.c   | 45 ++++++++++---------
 1 file changed, 25 insertions(+), 20 deletions(-)

--
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

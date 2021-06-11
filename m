Return-Path: <SRS0=BpRd=LF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1469EC48BE0
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jun 2021 15:11:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A242261263
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jun 2021 15:11:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A242261263
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PWeg6bGBdbVhtgz+XUAEBI1xEUCQLAnRUasxCIstOSA=; b=2K5Ac8VDUcRg48
	EbwAfr4egEWeHQcHZ/k+Uqtew7NksR9f7lW0L22nP7ZE86Ugmj0Db1or4VEtibnlvb7iSvEU1X830
	YLEPyvjLF5Pan67WquBXqlA2srIumQvTA7jcojwx3KJaBiK1wlI5KKsj6JR4fD3yIRl8j16i4JrXk
	0joPA2MaQ1FDA/z9a+R5KO78en1cFZjZ00ZbhhDbYqhnfpZwK5DkMwGAA02Q9Hy4+oEDP/pjDnl3D
	JPLbEGGjTkpq5vGyz3Y1n0bps36+8cjA7pwOcpFrh9NE076qNEbD80mdjQ8WGxzM9Zd59+PqoH43F
	B1wcfYk7rsJTFqd2JeEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrioE-005liC-6y; Fri, 11 Jun 2021 15:10:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrinz-005lgY-Sv; Fri, 11 Jun 2021 15:10:45 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 316E6613F3;
 Fri, 11 Jun 2021 15:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623424243;
 bh=LZfgzzsTu933LnZjW4x5plMccVdr3NZnLwOajYTc730=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ngpIrNwE9eVhUURwkE0MQnklMFYTyS53F+u0w47Mjq2QxHZgz2eB6ANerfh6cnQ/A
 4O9lSmDjw0tAPBNZOZBr9HZj95hUFEeUv3hzMtJt6HzJCqnSOdMg5qxElTAbtUil1V
 CDYHnPy/vRjI+pVRngbvqCjqrA+DNdwsC8TWns0diJghBTj/wGxSHK40iVe9GoRytA
 loRSjstl6oB5JhJ50e6AC8dhZeS/50Ff46qfbJjPDr+ASqwX0BEs1Mngl0ER6UG6yc
 yhu6pE6sLTtJyjr3b7yVJOb/mdV1zvJhp6whFi5O51m3jJNdjwQbzRMd4EYFTM6qdy
 F7ua+UrlwDbrw==
Received: by mail-ej1-f42.google.com with SMTP id og14so5073487ejc.5;
 Fri, 11 Jun 2021 08:10:43 -0700 (PDT)
X-Gm-Message-State: AOAM533bLvryPUrZgHsKhi2J9eZpDk9khpejGzgotgThr1YYa7vFFwVG
 QDMo37R5P8jkb92/0drtBotVNzpZs63a1LDRiQ==
X-Google-Smtp-Source: ABdhPJzd6nI+cA/IXS5U2ZgR7cJpYamZW2F3GH6iGy+6sXnJ2UNJch3RshlFKHnquPg3K3x20s08q7AmOjQ9XJjps+M=
X-Received: by 2002:a17:906:394:: with SMTP id
 b20mr4109992eja.108.1623424241774; 
 Fri, 11 Jun 2021 08:10:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210611053533.16701-1-vigneshr@ti.com>
 <20210611053533.16701-2-vigneshr@ti.com>
In-Reply-To: <20210611053533.16701-2-vigneshr@ti.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 11 Jun 2021 09:10:30 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+DgeH40x0H-ny_Ot_VVkr5tu=yE4aRcBgSNmrm5woJLQ@mail.gmail.com>
Message-ID: <CAL_Jsq+DgeH40x0H-ny_Ot_VVkr5tu=yE4aRcBgSNmrm5woJLQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: mtd: Convert cypress,
 hyperflash to YAML schema
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, 
 MTD Maling List <linux-mtd@lists.infradead.org>, devicetree@vger.kernel.org, 
 Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_081043_979179_7F61CA93 
X-CRM114-Status: UNSURE (   8.33  )
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

On Thu, Jun 10, 2021 at 11:35 PM Vignesh Raghavendra <vigneshr@ti.com> wrote:
>
> Convert cypress,hyperflash bindings to YAML schema
>
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
>  .../bindings/mtd/cypress,hyperflash.yaml      | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/cypress,hyperflash.yaml

This isn't needed[1].

Rob

[1] https://lore.kernel.org/linux-devicetree/20210607193500.3085920-1-robh@kernel.org/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

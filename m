Return-Path: <SRS0=NuEk=IZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F854C433DB
	for <linux-mtd@archiver.kernel.org>; Sat, 27 Mar 2021 17:05:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D844619A3
	for <linux-mtd@archiver.kernel.org>; Sat, 27 Mar 2021 17:05:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D844619A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kw1jgUNZzRUIIEG6SAVH/gccpcQ4/R5K/J0t6LTy18k=; b=fBpVLL4AEHl3DhDwf6PNpDCf+
	D+7CN9WgGYcOZJL8HWN5VfXE9GJbqahTLwE7yfgEaW/EJ/wlSrhQe6qCs1i53+s4zQtnJslU/2Hik
	i4gmetBX1krkiEUPjRMVQK45iH6G+lUlKTaIjtR/P3G/OO1XEfcMpZYI7bNShWNwugkcaPKtNwFZN
	W6+o3dzb+CGDt+wqFgRX0cwYTRoY7vvif5m4U5kNFgb3T/rv7QPEZsIDXQ0ssYbPgUaTOjLQbKoPZ
	VOdQJLzZeiym8bwjzqmvPxdQOUFsNAxHDAzfptkiLRS8Ecax2MBMRDm4bpnQt9TqolTGHdDr38bRi
	rUMVSxWiw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQCMK-005KDX-7l; Sat, 27 Mar 2021 17:04:24 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQCME-005KDB-63
 for linux-mtd@lists.infradead.org; Sat, 27 Mar 2021 17:04:19 +0000
Received: by mail-ot1-f52.google.com with SMTP id
 68-20020a9d0f4a0000b02901b663e6258dso8204605ott.13
 for <linux-mtd@lists.infradead.org>; Sat, 27 Mar 2021 10:04:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5QMzMCD0TfleB/wF3Fq0kYULJqD6sNthBOgcL7cz5zI=;
 b=kbojBxlRZ0lcy0btHfIE9OEwTQbZvSWWuprqT3KKxXwjsG5f2UclFk3CcoWopgZIc+
 51KRP46wm9X282MW5x2dlxCmwcT1oowLGG8mY84Qc1+M6/FnFWkDGVYhP5oPYhVI95TW
 Yirpt7WDqZt6HXcLtRNbDxCl5Fa+uOvBWvyXKAsulGAAWB8WkR5oQDjGztXZ5/TcbOMx
 P65zbr9F4F4yzIfnGqGFxvgnU1YkdJMQQRY/Mvy7ichJQosn2XvkPH+jQQX7UDFe6ENB
 DXwiiTjBygYXi02STs3qQdqDvB7vKS6rkqlcg+H3KZHkqSuzp10sf5VMLOeX4P/86w+e
 40iw==
X-Gm-Message-State: AOAM533a6tTKyFgj+LAnKWLUXy+ogUUPayveHPxFizsuZyhPgOhIJlGe
 uACoeSoFMdFdaefxwNEa0g==
X-Google-Smtp-Source: ABdhPJx89xF40rCPZdk+uFfBNPZfmZp4Lxp9fKzlVfPyAeBfideUde4GPIVUtdo4G9vJsPphbpX/+w==
X-Received: by 2002:a9d:5e94:: with SMTP id f20mr9756895otl.150.1616864656986; 
 Sat, 27 Mar 2021 10:04:16 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.107.88])
 by smtp.gmail.com with ESMTPSA id a15sm2711590otd.57.2021.03.27.10.04.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Mar 2021 10:04:15 -0700 (PDT)
Received: (nullmailer pid 249165 invoked by uid 1000);
 Sat, 27 Mar 2021 17:04:13 -0000
Date: Sat, 27 Mar 2021 11:04:13 -0600
From: Rob Herring <robh@kernel.org>
To: Michael Walle <michael@walle.cc>
Cc: devicetree@vger.kernel.org,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 2/4] dt-bindings: mtd: add YAML schema for the
 generic MTD bindings
Message-ID: <20210327170413.GA249072@robh.at.kernel.org>
References: <20210322181949.2805-1-michael@walle.cc>
 <20210322181949.2805-3-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210322181949.2805-3-michael@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210327_170418_363270_1941F5AD 
X-CRM114-Status: GOOD (  11.43  )
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

On Mon, 22 Mar 2021 19:19:47 +0100, Michael Walle wrote:
> Convert MTD's common.txt to mtd.yaml.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
> Btw, I've asked Miquel if I can add it as the maintainer.
> 
>  .../devicetree/bindings/mtd/common.txt        | 16 +-------
>  .../devicetree/bindings/mtd/mtd.yaml          | 39 +++++++++++++++++++
>  2 files changed, 40 insertions(+), 15 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/mtd.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

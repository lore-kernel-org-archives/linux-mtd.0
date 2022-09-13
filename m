Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40950C54EE9
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Sep 2022 14:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5TQJBWGg/+ohjadFnATb/jnhw8HPsik5chBhJrK4zgU=; b=JimgRpLqJY3h+bBQ1Yv3KWPA6X
	9m02XgXhsuQJbMRiS5qjkRPyThejIgY84N/UZk113rfY+RaQ0CNSJPW6Ee3FUQ73AawmPuQl0UncC
	VfkOxtzw/dWJZNf0A8frXtqWjizfh8QWOo2hcu1LaN+/s8jyudAC4dJd0es48FRk9KKO4GfddkZ6i
	dgjp6Y4IfMRRr7ygHsd5RbWc7obOcA4qvH8cyoF8mhi5W4DnKVobUM668XqytrBn7iMMe4w5Rc2fg
	LSkdl2pHC9zYYIzIn6xFdvvMlKB/kxPMVDC2Uk95Wh0aROE3rBm9DnQJ/v4Rw+sR7PS/FVr0CEsKH
	lmG4DM8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY6ue-00BcXm-6q; Tue, 13 Sep 2022 14:29:20 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY6n4-00BV9S-SQ; Tue, 13 Sep 2022 14:21:32 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 6F18422D1;
	Tue, 13 Sep 2022 16:21:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1663078884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g0cz2RuwebJaTXH0eI4H1to3O9WXEkI2yKThc7wO9xs=;
	b=puA9H+i874EBUSaakIlALbTcIJMrhgUsmPKYhLqpOWbQ20JTJ5fVFwUB/0xL7PdtjoZNkn
	/LWHDZkmGolvwMHG6otGJgppi6NYVWn1e5Ux4UEQyg2OKcHnC8BjRHgY4iRIDnUIA0VNxN
	vg3s0PSonX5qKSLbx8UH7z7jRGR0Ho6oGhpbNamn+d0EvSIIe8CAUJz8rb1sIHY2YcBAQa
	FHTIxbnc7cadTKVIabma6BXzUJvc6zdu3MqM6ROQLiPvX7ninN5VJayFW6Cm5xOIThjlkf
	QjyP+ll1YRpedOOB89zlAk8nwDlU11gfigOL3zR2wAExzfa+yweYJabWn+5d6Q==
MIME-Version: 1.0
Date: Tue, 13 Sep 2022 16:21:24 +0200
From: Michael Walle <michael@walle.cc>
To: Rob Herring <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Li Yang
 <leoyang.li@nxp.com>, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?=
 <rafal@milecki.pl>, Frank Rowand <frowand.list@gmail.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ahmad
 Fatoum <a.fatoum@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2 15/20] dt-bindings: nvmem: add YAML schema for the sl28
 vpd layout
In-Reply-To: <20220912192038.GA1661550-robh@kernel.org>
References: <20220901221857.2600340-1-michael@walle.cc>
 <20220901221857.2600340-16-michael@walle.cc>
 <20220912192038.GA1661550-robh@kernel.org>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <aa53a858e362ae747a2cbd28caa3fa78@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_072131_171738_C1B5382D 
X-CRM114-Status: GOOD (  14.40  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2022-09-12 21:20, schrieb Rob Herring:

>> +  base-mac-address:
>> +    type: object
>> +    description:
>> +      Base MAC address for all on-module network interfaces. The 
>> first
>> +      argument of the phandle will be treated as an offset.
>> +
>> +    properties:
>> +      "#nvmem-cell-cells":
> 
> You can't just add a new #.*-cells buried in a device binding. I'm fine
> with the concept though having more than 1 user would be nice.

I was under the impression the tooling will handle it, but as you
pointed out below, this isn't the case for a missing default. The
statement above should only be to validate that there is one
additional argument if the base-mac-address node is used in a
phandle.

> Any case that doesn't match foos->#foo-cells or has a default # of
> cells if missing (as this does) has to be added to dtschema to decode 
> it
> properly. It won't really matter until there's a user with 2 or more
> entries. I'm happy to do update the dtschema part, but I'd prefer to 
> see
> the schema in dtschema rather than the kernel.

Ok, but I'm not sure I understand you correctly here. You will
update the dtschema tooling (I guess it's about fixup_phandles() in
dtb.py) and which schema should be in dtschema? nvmem.yaml
and/or nvmem-consumer.yaml? The entire schema or only a
subset of it?

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

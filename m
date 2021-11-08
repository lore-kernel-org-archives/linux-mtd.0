Return-Path: <SRS0=0QAq=P3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27B2EC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Nov 2021 18:22:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA06360184
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Nov 2021 18:22:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA06360184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UUbl2J4KgsbkVm9w8dmfED1Czi5p6pXUWMmgpfqTkyA=; b=a671zr53lbQDvb
	Tpgxkqkcl3pPx/dCKsIBWohgR1tWEX4VZTMJb4b1knP96sD47tqSuIEJO6Jbuxy3Dvruf821ukex1
	CYPJKPPzM3WV//sZ7/T4wnC57kFSWbENKjtzUhPH5/kai8nv1E+A5AYVxVDTIKq5QMi/QOervwsVj
	2+7k8lwwtqSihvZNu4woXTHlqk8BC7/qSCaXk1xBqBOrwoAqRvJ6OXB7D7BO3BCjFd1yKf1Pgf769
	STmF9gVcmB113NuRE0iD2EwlZfuf1FzsXHzjV32pgdY7NmOJJgp1XkAnWibrfB8H7InAmVANJouGe
	68c/Cmyc4cITlTD7mUlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mk9Gv-00H9Hv-U7; Mon, 08 Nov 2021 18:21:33 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mk9Gs-00H9HG-Gl
 for linux-mtd@lists.infradead.org; Mon, 08 Nov 2021 18:21:31 +0000
Received: by mail-ot1-f44.google.com with SMTP id
 q33-20020a056830442100b0055abeab1e9aso26927966otv.7
 for <linux-mtd@lists.infradead.org>; Mon, 08 Nov 2021 10:21:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rCISeuysZKbDMgJjuEiNIJE7YuKQ2TJrqtX7kNAW6+k=;
 b=UYgmx/wGDF9CniHGsyZ6MJHvQe7kAiZZPnhfc+yk0G7B75E9jOs5geSHFbQKnnjK7y
 m9aPsbI/3f3Kv6RKg/cpotYVtilIQc3hLEtQEf7wxjSfo5LVxpMS5kzgx+gKsTFw93dR
 aAJnHMTc159LFHN8iGP2gD4OKPRhh9VilO9jJ6FkeGMYn/JAsYKwBLzJ8qwfcJvO6nCZ
 u23HAEJlSm0ZBedIO3V6YGayIm8LcwgeDXm3hbUmVZg6U3tUIYHiZhafe3s3XOStdKrY
 wpQ3v1/n0vhk29FG8nkf658jKLUwRqpHlLgRnwKPi49gXB+HmqRHmhhXNmuvWKcfJBrp
 zjFA==
X-Gm-Message-State: AOAM531YboYGyHnPyyFsaSqE1hhTJDLwWxqNX0ERlO7meC+HvPaxk+NO
 w4iIMRI47NUT6brJv75vYA==
X-Google-Smtp-Source: ABdhPJy3zcQSwD3T164usGwB1k3ii5fGInofXXVdg+wtGM5mrZAOChqIQOn0tJZy8lyRAtiuoMCJAA==
X-Received: by 2002:a05:6830:1014:: with SMTP id
 a20mr836094otp.63.1636395689139; 
 Mon, 08 Nov 2021 10:21:29 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id c8sm3671908ooq.43.2021.11.08.10.21.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 10:21:28 -0800 (PST)
Received: (nullmailer pid 3969396 invoked by uid 1000);
 Mon, 08 Nov 2021 18:21:27 -0000
Date: Mon, 8 Nov 2021 12:21:27 -0600
From: Rob Herring <robh@kernel.org>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Mark Brown <broonie@kernel.org>, Nishanth Menon <nm@ti.com>,
 Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org
Subject: Re: [PATCH v2 1/3] spi: dt-bindings: add schema listing
 slave-specific properties
Message-ID: <YYlqp7+vYd4X0Kyi@robh.at.kernel.org>
References: <20211028124518.17370-1-p.yadav@ti.com>
 <20211028124518.17370-2-p.yadav@ti.com>
 <YYlmx3QyI9zxuO9N@robh.at.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YYlmx3QyI9zxuO9N@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_102130_603348_320906A7 
X-CRM114-Status: UNSURE (   9.80  )
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

On Mon, Nov 08, 2021 at 12:04:55PM -0600, Rob Herring wrote:
> On Thu, Oct 28, 2021 at 06:15:16PM +0530, Pratyush Yadav wrote:
> > Many SPI controllers need to add properties to slave devices. This could
> 
> Probably should replace 'slave' with 'peripheral' throughout[1]. 

Forgot the link:

https://www.oshwa.org/a-resolution-to-redefine-spi-signal-names/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

Return-Path: <SRS0=BLSt=JR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26F60C433ED
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Apr 2021 18:57:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB32F613CD
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Apr 2021 18:57:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB32F613CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zp6Oy1dSFsXlbFWEfslWNER6r9CEznRn587b/Nr7tDo=; b=YqzTPPz5Pevgn4NiNZdLh6Cf+
	RS4Q+7i2ieBWxJEYgm9Plc6/WI/zhN5+P50tS3WBnhRBCz+4pT9iE10yw+hCuyGbZ+ADacSjiBnjL
	DIYQMcoFyf0W+mjn+kUB6lt5RfsN0WJcZytEmyxTdp7ZNct7Gpg1znVRlU2UV+R1LKRHaIvXhqzAM
	QdaZpjDflTnIERkYZzECRa2AW3yEXR2NrrNm3xwKIZ68tPArY+jRLynyKygUGzMf60KMbtw/HqVHx
	UYQotYeGisgYU7ZMX9D/R/XoY8wZ0Z39/xdPkLKxyct6nz2ONbpEDvDlA+cD2ODmubj8cT5e93KYJ
	LbQ0yYNVQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYvYR-00Ctj7-1d; Tue, 20 Apr 2021 18:56:59 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYvYO-00Ctiy-UB
 for linux-mtd@desiato.infradead.org; Tue, 20 Apr 2021 18:56:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=kfEdsP7VJ9uETA9reqQ+u/WnsOOL4stsZUCK1ENhc+s=; b=O2fwWOd6w5fxkKiP0R6qxqyxJB
 UuxhOPNbbhkMBJtq9ZqnpSpat629/8XRCq6DzqnXAs2h2wVDnbHbA3NzzhI3ss9xjwOmiuaATXNi1
 p/IwwpKgOO9YiNa76Mu28ty5bGG7Im3gX5rYsYGn1ulKb4NP/sbH+Xi3a2965D5nuoAlUbbwnNZSd
 Whba+sOrUT5lY+FdptnwdUObrWsaTtEW7M8Rg8zyNPEnmfhk/RQvW9aPB25mt+ItxARJGKoJ0qsTa
 oXOb7+hT2wcf1OpSDj3wgWF2gT011HBHIWRQ7GuPYJ5t+4I4/XHL6TxeIk4+ZTqBQqwWQqN5chykt
 imM/5/cg==;
Received: from mail-oi1-f169.google.com ([209.85.167.169])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYvYJ-00CMXj-3g
 for linux-mtd@lists.infradead.org; Tue, 20 Apr 2021 18:56:55 +0000
Received: by mail-oi1-f169.google.com with SMTP id n140so39953190oig.9
 for <linux-mtd@lists.infradead.org>; Tue, 20 Apr 2021 11:56:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kfEdsP7VJ9uETA9reqQ+u/WnsOOL4stsZUCK1ENhc+s=;
 b=NFEN9e0oTItL4QMUXdi/393ERcwzX2BfMSv8t7T3HoBkmKJysrB/xVfe26oIJmulvJ
 P8MIpLuaIkh179cTQLelRfM7/j49VMvdZ+zierqIFyrGffzRJIGGD6ghg94Nrby5ud50
 or+1jIhFK5myz/YFi8sEzwO9o5CQ1rpVZ7BzSU4nmQHMIBjPZi3BIUVo6Bqwzu8bO4aO
 UfHfKXWHkxnZLLcsxw//xexcfvVJ8KQoul6YIAWQBc/rOj2w4SWi922JPCiazWo2KYFh
 HJ9bmisi+GUzrgLQJB3qfHukDPNyI5bvd17MnVJ5xnnkNBEFF/G+rQuvLeH+7bS2+FJj
 awCw==
X-Gm-Message-State: AOAM532rvhYewwG3ZXs5xamYG5Llbrk3JqL8r0QuEqhRO6X3dhOe6rgv
 6i/cnDKUmvpy99LMa3nDZg==
X-Google-Smtp-Source: ABdhPJyhge0joJ+/Co2f/SMQv2Pu0c6B1SYJblXNbNcObWdvq+mSApSjCf3j1/wJ0zfhLy5YAv4GqQ==
X-Received: by 2002:a05:6808:9a7:: with SMTP id
 e7mr3926558oig.105.1618945007542; 
 Tue, 20 Apr 2021 11:56:47 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 2sm396426ooy.22.2021.04.20.11.56.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 11:56:46 -0700 (PDT)
Received: (nullmailer pid 3632453 invoked by uid 1000);
 Tue, 20 Apr 2021 18:56:45 -0000
Date: Tue, 20 Apr 2021 13:56:45 -0500
From: Rob Herring <robh@kernel.org>
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: miquel.raynal@bootlin.com, rafal@milecki.pl, vigneshr@ti.com,
 devicetree@vger.kernel.org, musashino.open@gmail.com, richard@nod.at,
 linux-mtd@lists.infradead.org, robh+dt@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: mtd: brcm,trx: Add brcm,trx-magic
Message-ID: <20210420185645.GA3632403@robh.at.kernel.org>
References: <20210418214616.239574-1-hauke@hauke-m.de>
 <20210418214616.239574-2-hauke@hauke-m.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210418214616.239574-2-hauke@hauke-m.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_115651_174966_22C25F3D 
X-CRM114-Status: GOOD (  11.22  )
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

On Sun, 18 Apr 2021 23:46:14 +0200, Hauke Mehrtens wrote:
> This adds the description of an additional property which allows to
> specify a custom partition parser magic to detect a trx partition.
> Buffalo has multiple device which are using the trx format, but with
> different magic values.
> 
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> ---
>  .../devicetree/bindings/mtd/partitions/brcm,trx.txt          | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

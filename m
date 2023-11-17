Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF2E2C072A2
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Nov 2023 10:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nJMYbCqcOfEensEr6chc3BWmslf0fkgxK6+Lx1aCN3k=; b=AVG/bjdzCIJ8dY
	rUuq/sv19rB7sfPjzgVCoLjOZE/GY+noZFnULRsUCftC721LUYgjMmGEpOXFa7M4v99KacrT8BweY
	Bnj5rmG+AMJJcRnniQlJhscLx7RO/HB5HSK6X/IjUdI+Mphcn4i+AFGgJh1PvqxJS1QIf/lK4TheH
	QVAhsttbqRLm1XRqBtB9MwnBuHe5epx1tug6HGh/5xaZe7mUm0loK4SqF3W96uwqp5nrNyW/c9C3O
	zUy/3ICchYQR2w6/YNk3iBFjgGcarXmeVyMT05v4275vHrmlGHRd6TtKpqwSQuaJ10EapVSJ1X+Gd
	N+Lc67Pb9mhZV9MPvuYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3vmq-006BkK-0T;
	Fri, 17 Nov 2023 10:09:20 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3vmn-006Bju-0T
	for linux-mtd@lists.infradead.org;
	Fri, 17 Nov 2023 10:09:18 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-27ff83feb29so1537420a91.3
        for <linux-mtd@lists.infradead.org>; Fri, 17 Nov 2023 02:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700215754; x=1700820554; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nrQOPhXwAED/Elan1U7bEuK09YRKCNs4qEiAb3gg5iM=;
        b=naPHO7immfer/14z5ovf51kHL9fcYKbhL3CmFCGL/YMga1grvkJTofR8695WGw/Rcn
         Z6IPFS10L9lBNgb2qz3O8pgPcEhOY8QicDoHkHV/jbWAGbmguWmcnQPytJIr8rdYBWBU
         YZy/+K9644DklGgFg1s2Nw9DZ1TXw3R6vsUL/XeB/DXfWHx0ICQpcatTCrA5d2+GZGYP
         3QXcd0E/sdKOFPYeUudfYsrtY//r9t3cVc+A24VKb8LyP6FynbEg3JLoT0mH4oNcS47C
         MiCudIhxDxIwlKfpjTZYzloQsWTcnnix8GBDUQd8nZEcHgvGRB5a8iAXtNMtxfTLUNdZ
         7Iog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700215754; x=1700820554;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nrQOPhXwAED/Elan1U7bEuK09YRKCNs4qEiAb3gg5iM=;
        b=aYa5hf0YNKGVcHotnLZta61DVLRN9ofxxB51jE3zzrIFyMWLpUALFNKKw4BhyWxmTe
         OHI7gUZacKOxF0UqOzp+CZPEroTR0Z3oUAK+nRFsIjHxoJAa/dzrkUbNd/j7y/70cFNS
         msLUm1oXEnTkyoreoSR4pWfE+J4aOd7vXEpmcRcEii7vPz5kY/IEKmSgO75ZG1e8NvKU
         MR5BeAfgfVpXRjb7u+/0oGtfNJrF5iJDwTgyUmp0EPakUTV1ezrlXymm2bc83qQ1rcUU
         ejnp9ijvNeTUJBFKxOALpTIcU++29gNd2UTdqZNy9zz3blYW4zU9i0Qjdkk8FcizHoxk
         x9yQ==
X-Gm-Message-State: AOJu0YyfiiCme71ef6tTE7+7S0CR+d3Wl+O2GaTX54nO7AlInHQu66K0
	NfNSelCWFcjFIlkgpMHSFZOQ4LotfPvRWwnddRw=
X-Google-Smtp-Source: AGHT+IEIRjhOPZB2RniSNrnhzaoSNbIXbuaMyG0iO3L0HozyBreooQsHZSqTe8/ON2QNtlIpt0vXKobz/WBLtzFDzvs=
X-Received: by 2002:a17:90b:1d01:b0:26b:4a9e:3c7e with SMTP id
 on1-20020a17090b1d0100b0026b4a9e3c7emr20001288pjb.4.1700215754438; Fri, 17
 Nov 2023 02:09:14 -0800 (PST)
MIME-Version: 1.0
References: <20231117083853.33329-1-jaimeliao.tw@gmail.com> <bdcaa357da0d1d3861831761b428dee9@walle.cc>
In-Reply-To: <bdcaa357da0d1d3861831761b428dee9@walle.cc>
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Fri, 17 Nov 2023 18:09:01 +0800
Message-ID: <CAAQoYRkMjq6R+6ZpyW0upDz0ScBQQd00gCx=BcS-_K9nypnUCQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] Add octal DTR support for Macronix flash
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org, 
	pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw, 
	jaimeliao@mxic.com.tw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_020917_183016_3972E9B6 
X-CRM114-Status: GOOD (  12.85  )
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

Hi Michael


>
> Hi Jaime,
>
> > Add method for Macronix Octal DTR Eable/Disable.
> > Merge Tudor's patch "Allow specifying the byte order in DTR mode"
> > Add support for Macronix flash
>
> I skimmed over the patches and they look good, but where is the
> controller part of this? I.e. which driver is using the dtr_swab16
> bit?
> There should be a working setup.
I think controller should info dtr_swab16 support in spi_controller_mem_caps.
8d-8d-8d will not be enable if the flash swap bytes and controller
driver not support
dtr_swab16.

>
> -michael

Thanks
Jaime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

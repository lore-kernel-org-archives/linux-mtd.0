Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A849EB64DA
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jul 2023 07:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pqZylVULAWq2Fiwk3CHOHqf9bQbN7/Xv9v/MF3HgX2Y=; b=mO3fAVNk1MJWsV
	r/ojc7m8unrtWtZOE5cy7ScQex9luFQXXbJltzGhwg9uNDTaVFFqVB5rVPIuh4MCXZKrLDVU1r89t
	9R/hQsG4bQSwbNfszLW9vvmqwBxgSja13iYNE37XkaisoqkUxfgYwrQFsPl4Sim7JyE7aqwWmUhAG
	gTFvzmg7bC5c3xbXBHiV5X2RDiiAuYHVw30utas7hkG7OQYFt0Cjms6Inntr7UC+dyNCBOmhG9mW7
	gXwIb9C1od7SuOhwYkS9mRyTrX04NFvg9PjNZrplyizn+BFx05b4RCIrEVSUD2eL2wtUKBOnLD/P4
	TcaLJma2j69ekPveX5tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMNi4-00A2mr-0R;
	Thu, 20 Jul 2023 07:04:24 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMNi0-00A2m3-1u
	for linux-mtd@lists.infradead.org;
	Thu, 20 Jul 2023 07:04:22 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fc0aecf107so3031675e9.2
        for <linux-mtd@lists.infradead.org>; Thu, 20 Jul 2023 00:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689836657; x=1690441457;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9AlU95qM4t9xHPBYL7DWAvT1cUkDalZV3dRJmbFdb9U=;
        b=dU+ORkJC8RNWsmM5SVA/u5VDWKga3el11dXhQWod28uKQxqV27WsfA/tglMuF8ytal
         oR9rHhg8Ffr8qjFOlQqJ2TP9mDjnM8aHh1J5JZ0M85wyO4MFq/InWjdqlvlmOCXT18oi
         QjpSMQRBEYEVQB6VKcMyoKiOj/fWRc9bltCj1as7WQq4ikJK1y9pA9lypkyLy0PS/V31
         fqTMXHOhDDccm9U/ddyDmuiSNegiYxGBV02zlmpbfcFhi+ia8+CoZbqjukiyT21EcZhf
         bHGNBBO2nLGsAxMvkqHDWb8OMWWqLsO9IvKBYvV6AmrR7RC1LKD/Z8ux8r9zTLpiZhoR
         IGrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689836657; x=1690441457;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9AlU95qM4t9xHPBYL7DWAvT1cUkDalZV3dRJmbFdb9U=;
        b=IEIVrb92J77mQS2siEvo9/GkZ5c4wn5/+fkWfAlN8LDA6yTASwreMx0+bgDkYBJnRd
         5oZKXZbY8WKsGvClfjLLEA/arL4ODivqg4cjTlgD/zzFNKcJVTcXL/T5VpbCbHl893h+
         +MgGJcs5h4Dq2PGuNqUIkkWdPmL4CZ6LA7VbMrHqPMi8Xn98AKFmFH0MoK5SQ7tpZKBe
         uilOUoZjIjb07/s4o8Dj1M6fwg+HYXDZtvdCCeQBrG/qq4Av+wYtFOn2pOyZO65zH1Fa
         ZPAYFar2myOqYL+XaNyie+fbjLsOmL3nib9kkgH8q1D1arQof3ns3NHk/e8bQndfln1X
         JkhA==
X-Gm-Message-State: ABy/qLbVCq/Fcg8ohceoB7htneMzzy8m1Fo73aQYP3j9pK2ODPAYMgN3
	T+Jx52PrUSDDAcdnHr/nlSq1fw==
X-Google-Smtp-Source: APBJJlETKoi7x80wxBFFAxwsjGt5k10dYMeMuHD3TbDxOf+1dqUg2RtWoOiart0Ss3Mt2QyTH5e1AA==
X-Received: by 2002:a7b:c390:0:b0:3fc:62c:8447 with SMTP id s16-20020a7bc390000000b003fc062c8447mr1061669wmj.9.1689836657174;
        Thu, 20 Jul 2023 00:04:17 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id a5-20020a05600c224500b003fbc9b9699dsm419216wmm.45.2023.07.20.00.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 00:04:15 -0700 (PDT)
Date: Thu, 20 Jul 2023 10:04:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: rawnand: fsl_upm: Fix an off-by one test in
 fun_exec_op()
Message-ID: <6f3c9139-cf68-4761-af06-462a72bda978@kadam.mountain>
References: <cd01cba1c7eda58bdabaae174c78c067325803d2.1689803636.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cd01cba1c7eda58bdabaae174c78c067325803d2.1689803636.git.christophe.jaillet@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_000420_705679_9976BAD9 
X-CRM114-Status: GOOD (  11.80  )
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

On Wed, Jul 19, 2023 at 11:55:01PM +0200, Christophe JAILLET wrote:
> 'op-cs' is copied in 'fun->mchip_number' which is used to access the
> 'mchip_offsets' and the 'rnb_gpio' arrays.
> These arrays have NAND_MAX_CHIPS elements, so the index must be below this
> limit.
> 
> Fix the sanity check in order to avoid the NAND_MAX_CHIPS value. This
> would lead to out-of-bound accesses.
> 
> Fixes: 54309d657767 ("mtd: rawnand: fsl_upm: Implement exec_op()")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

Good eye.  I'm assuming you did something like this:

#!/bin/bash

FILE=$1
WORDS=$(cat $FILE | perl -ne 'if ($_ =~ /\[([\w_]+)\];/) { print "$1\n" }' | sort -u)
for i in $WORDS ; do
    grep -Hn " > $i" $FILE
done

regards,
dan carpenter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

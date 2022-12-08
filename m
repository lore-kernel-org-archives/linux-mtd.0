Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59027C4332F
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Dec 2022 11:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qkANJr5fs7zgn+kdC1ZhHMz/QG3/3sAaV7jo2dG6ys8=; b=xsJ5QyqFQKlEKY
	b1+lsbc/MSrmqWZ8Xr2QIiMl787TTxQdFj43hu7RpzpPZqccVCdepvvLbUwllXhqh3GjaiiQKAGAr
	bGIWFhoVnhvhNHDqOTUmg5Dy4v7XKVZ9hSLRu5S2Oj8Z3qebyOQXBbDOzv7uUiuRfpizPYFz0Rpse
	Th6BBLO3GGVzsp6MQrSsuAp2erjFpjTNlzxdcsXzviD4BxRLrjuMUeqA/15HYU+fKNWZyoQQ59vY5
	kXJ8+M6HIYNeMJ2yjCSxDXbr5KXzI8uP+AK86x7laBl7q2fj61jZDcJ8z0eTvCw8PI2M9KDBEhpQQ
	o25qvJx9X2wb0JEWhbmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3FEL-00FVvo-FC; Thu, 08 Dec 2022 11:38:21 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3FEJ-00FVk3-Kc
	for linux-mtd@lists.infradead.org; Thu, 08 Dec 2022 11:38:20 +0000
Received: by mail-wm1-x335.google.com with SMTP id h8-20020a1c2108000000b003d1efd60b65so3169981wmh.0
        for <linux-mtd@lists.infradead.org>; Thu, 08 Dec 2022 03:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3aNHttgq7Rbv78ZxqkIzqvwZiBRWQxsM0iSeBLBh1IU=;
        b=TW1fJTHFQYRLHhhKvaafby+rUupRen6+WEtSkdB5qKrryQJwcghN/Odjcz/EdB506C
         XTqvcwCyzU+l7ETV6VE4RcskK3L5O1uyP021LB45Ok4vYifj0Kt7DRiNPdqG59y6A0NC
         ZsPcxsSpefPSkqDOg6HrugxRZnxKDSZ/X9qRpdqBmdhmbxw15QMu6Ev/HVirjZy5lsn3
         om5ZCKCjvFRwa9A5AGrj6E1mMXic7zzLpIOq0CQ3aSAoMl2NMEcPZfKKdgxYcoWGB3zq
         1XYFUsFWwgTo+611SQKcbZJGiZlGDp2zLi5Qd7f+edamsucdpB3wWel6FmI8D0bF6Q2J
         rtRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3aNHttgq7Rbv78ZxqkIzqvwZiBRWQxsM0iSeBLBh1IU=;
        b=DMM3TYbsi9EoYSso7ieuNHOlZW1A1Dw+uHEO2AF/4GQP6FS15KQhb32X9hbMDNtYAe
         t/DPkjwlsCdmjagpn/5cElvLmF7eMd/hpN5w1gOerNpLM6qAs07/hawLgGgEkVJUy8/2
         fgN7eziCMgtulK2vAsKlDxS+x/CWFY0QW/Wr+oGS662F/VESqUSKKXOZ4SvIotyJ8rG7
         6WMWiSIqdfxhOuiu72YHySAfk5WdYaNEOSmnGcbZx5sUrH+Bpvn+qGCt6V9Yff05NQou
         bCIO+ftpZuj8mMt/iDTY5IjF4uXIoLVAS3ZHhBafywHqrm3QCiRu5ysIbe1eopxILbN1
         ZjHQ==
X-Gm-Message-State: ANoB5pl89JN0Xpst2vZEIGWNNp8a6gCRH384v4McRPpQDb54sBBJIU9T
	fJ/l1L2pcAiqm9eCyTzgBCc=
X-Google-Smtp-Source: AA0mqf7JPOG88a1BiA5w5C+EdfzysR+DGPEpXSI1SlOexXDiR0Zj6rBlkurfAy8brogDpwfMMPeLyQ==
X-Received: by 2002:a05:600c:3b97:b0:3d0:8a2f:27e7 with SMTP id n23-20020a05600c3b9700b003d08a2f27e7mr17472224wms.42.1670499497518;
        Thu, 08 Dec 2022 03:38:17 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n10-20020adffe0a000000b00241bd7a7165sm21284892wrr.82.2022.12.08.03.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 03:38:16 -0800 (PST)
Date: Thu, 8 Dec 2022 14:38:13 +0300
From: Dan Carpenter <error27@gmail.com>
To: Yuan Can <yuancan@huawei.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	rafal@milecki.pl, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2] mtd: parsers: Fix potential memory leak in
 mtd_parser_tplink_safeloader_parse()
Message-ID: <Y5HMpa4bjiN37Dor@kadam>
References: <20221208113253.77120-1-yuancan@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221208113253.77120-1-yuancan@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_033819_696487_FCC5C875 
X-CRM114-Status: UNSURE (   8.67  )
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

On Thu, Dec 08, 2022 at 11:32:53AM +0000, Yuan Can wrote:
> The parts needs to be freed with all its elements, otherwise it will be
> leaked.
> 
> Fixes: 00a3588084be ("mtd: parsers: add TP-Link SafeLoader partitions table parser")
> Signed-off-by: Yuan Can <yuancan@huawei.com>

Thanks!

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

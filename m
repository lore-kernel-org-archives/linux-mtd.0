Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81985C4345F
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Apr 2024 06:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XprB/9Aw2T2CLZ6KcXJIaeIMIyJDP8wEgb2t/bXjRWM=; b=uKSXDkYILh/TRw
	B33nvG52kLcW6e3m7dUp7ssGY4c5fWGB+nZg0KqbsZRIwM6plztgFk6+orztiENPERjHG1ulfOhHt
	wZwqEAzw6IcV4B/vr+6HRu6g2BZW0Hm9DZUen32eQy4jaRjdfu4RXdzVUhWjsceD8c84BL5yfTzmn
	CZN9VpVyRejFcuFwY4j1nLec9RNx7dy1d6JnOAsLFnbHYxYhUIgLETzQJW7TF596xE4lA+xu9/X1u
	Y5J7EWvibtF2ke83+5zrBEZbGv6Q3JjhzdORKVpKnlpcIeM0HdhwA9qbqgfz5a4xRWiIkvobT/VhH
	yT47F7L2I+ZmPSby0RBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwFuG-00000007A33-3Ol2;
	Mon, 15 Apr 2024 06:33:32 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwFuD-00000007A2T-0jOU
	for linux-mtd@lists.infradead.org;
	Mon, 15 Apr 2024 06:33:31 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-56e69888a36so3748024a12.3
        for <linux-mtd@lists.infradead.org>; Sun, 14 Apr 2024 23:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713162807; x=1713767607; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kcK6IuttindIK0ibbk1Eks/0diZZJiqcDdWxbvTVosU=;
        b=BTR087scbGnGvX4avanI3ndg+FAHcAgp6vhEP2a6PYl7bZXWNrRyAwhCHEExOPw0+4
         i3UmMIL/kqsHSN11lYiJpqwfpPUmI8eG76HOHsxaivIKyLcmLNqEFJDCcSMK+b53DQu4
         T0Yk58VvuvZrQRRCBFT9wxFnNPKPFo+VC322WQQxtqJcOmvPkpTnvj1GxzbdW+uj8gq2
         LDbJDhCVCGk8jmH0jtDEqitzUYiDm+5RLCew2UfZMPiPzzgB0nA9GtaAYqXiHt8G5RgY
         9XhWK+bkuLzQ+JUMH4PECUgf9k3v4STQf977qu9o8cAB7VA6/YzKcQj7AsdGhgXm/Yjl
         tanA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713162807; x=1713767607;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kcK6IuttindIK0ibbk1Eks/0diZZJiqcDdWxbvTVosU=;
        b=A5Ed5C9qQ+fWXyh49JAtJ9JHOgcCz6hj9hfvsNyKVr9P2M5PnrajwGdcX3IB45Tz1o
         UoGbgVbnL6xPo7b+lQEaYx47c5UcqvMaBRHJotwp7XjACHoEMlGQ71KXruh14IjpxFh1
         wGjZ9TUA2uNC1kOt5xy3lXjcBR6STvIKpuTsHShYZ2F8grPNrzIcJ1D7y6+Dtxw6yAeE
         G7BZZ8R9S6klNA1MuB6Z1werH7Wb7ni1nyt4qeJPEn0P4pCvU3IbazH5+8RDV4vt1YtZ
         +QSo0we1jaK8Vx3s1PMFhcv8P7zGbY4cUTIl/yjouigG4bykmD6guZsBhAYby/E3Ikqd
         k01A==
X-Forwarded-Encrypted: i=1; AJvYcCVAqy2+waKa+SSU27fziQgtev9lKgFo7xqIs5h3cZtWQJyE4mHpSZtY7Ww+GihW95UM3yTfCgH/s3UskwZcNwnEKXKDT22+nio6HDnh1Q==
X-Gm-Message-State: AOJu0Yyl++DXq2EOc1UzZln3U/MvZ3jbnLtyiawgj52LlUVH3yHqXWWE
	oYt0TnDzKoklgvoiJbp/kWfmCZNhjPEeQr7aHlsSoIHciLhcbgm6eV8eY6yYPmI=
X-Google-Smtp-Source: AGHT+IGvpMtw3rMInVwgGIn+k3i/tzXT0C81uzRme6mL6qXm7+7PCc3jMvdKuafc3RxvzZ5W19cVzQ==
X-Received: by 2002:a50:8acf:0:b0:56b:fd17:3522 with SMTP id k15-20020a508acf000000b0056bfd173522mr5621220edk.14.1713162806745;
        Sun, 14 Apr 2024 23:33:26 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id u5-20020aa7d985000000b0057000a2cb5bsm3225234eds.18.2024.04.14.23.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Apr 2024 23:33:26 -0700 (PDT)
Date: Mon, 15 Apr 2024 09:33:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: linan666@huaweicloud.com
Cc: richard@nod.at, miquel.raynal@bootlin.com, vigneshr@ti.com,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	linan122@huawei.com, yukuai3@huawei.com, yi.zhang@huawei.com,
	houtao1@huawei.com, yangerkun@huawei.com
Subject: Re: [PATCH v2] ubi: block: fix memleak in ubiblock_create()
Message-ID: <79703e8b-ce3a-4407-9750-05f9202039d4@moroto.mountain>
References: <20231208074629.1656356-1-linan666@huaweicloud.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231208074629.1656356-1-linan666@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240414_233329_361514_8935688C 
X-CRM114-Status: UNSURE (   9.53  )
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

On Fri, Dec 08, 2023 at 03:46:29PM +0800, linan666@huaweicloud.com wrote:
> From: Li Nan <linan122@huawei.com>
> 
> If idr_alloc() fails, dev->gd will be put after goto out_cleanup_disk in
> ubiblock_create(), but dev->gd has not been assigned yet at this time, and
> 'gd' will not be put anymore. Fix it by putting 'gd' directly.
> 

There is another invalid reference to dev->gd if blk_mq_alloc_tag_set()
fails.

	dev_err(disk_to_dev(dev->gd), "blk_mq_alloc_tag_set failed");
                            ^^^^^^^

regards,
dan carpenter


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D1F8C43334
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 18:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H9s7CyiBECgbOxnGald2C7kYHVlFqsh3m2+PVfNMUMY=; b=ieba8eU21UF3Jl
	GZX20jIwzyBPEjc8epZyoWWOY/1YRFN+3xd2tVQVj6nn0qmeKA/0G0CAN0aQUO5YYgIX+KAyE9GHc
	W1zugoHtOvW0/ZmtGTM32zZlHOCqJIN0/2kHUD99frx2TDgZy7XwdNE57By/4/TXJqiN7LBynxW24
	4sU7KvUjrMuAoB0l7sYS7PloIePI+UfXX4/vhEaQSbrxsWhJGcwdFFCApp1ZX9l0ERYWP9NsrJi/o
	8j/7KM/PyWeXA/DwE5IdyPBJVTGx+IbVBi31cwrSsONtaN08c2pcQA0YB12H35xucFlhPaOlIxai+
	du7GJt0LYtX8XvQhyWoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzMyk-003cVG-Qc; Thu, 09 Jun 2022 18:33:58 +0000
Received: from mail-il1-f174.google.com ([209.85.166.174])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzMyi-003cTW-0H
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2022 18:33:57 +0000
Received: by mail-il1-f174.google.com with SMTP id y17so19361443ilj.11
        for <linux-mtd@lists.infradead.org>; Thu, 09 Jun 2022 11:33:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yjLp36AHdSqY0OzW26Jz18S5rMmSenhLhsO9ff9VDN0=;
        b=hDoCP9JS8oC5rr2ZrLeqIMu8l6azDAlIi03//UE36u5Tf2u1HDe3BtIeHvD0gmZdQ3
         yY0x7uk0sRgEqyQ0NFoOlxQT7HL4DLL3YJtPy824AY8h2aSZhG02kIPMzMxgYHHBMdU+
         0pPWzKqn6Qt69lSXVtPVdsOsmWGS11KkMtA6xhb5CC1ClZGLv3nq+6gZX+QayeuxNwSy
         5/y/wt5BWpAx9Zoe0rCw/tnrb79ug20mYPl+87PufPvIQ7H3ve/fJ52p2dVZhipikniu
         zQQhqaKJHRQtKBIU9FSh0IfGqE9VYngpRzY7GTkAr6Eh+s823DOCvY4mHo+eWeqiQvGs
         4MHA==
X-Gm-Message-State: AOAM533ZtX4yrdppOxytkCqXR+my6uArWlTUxsAI7Tb5XcsLe5pYxnE8
	BjieTSSMkj/k6Xu/Zty4WQ==
X-Google-Smtp-Source: ABdhPJw5uhY5WYkLXPaUEKy4FK6Ff3jLXV7VjuZ37mMIdftbI88KntHhJABZm5VboUtyoRtKqshWNA==
X-Received: by 2002:a05:6e02:1ba6:b0:2d1:b582:a9db with SMTP id n6-20020a056e021ba600b002d1b582a9dbmr22860477ili.90.1654799633880;
        Thu, 09 Jun 2022 11:33:53 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id x4-20020a023404000000b00331f63a3dfasm1973963jae.122.2022.06.09.11.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 11:33:53 -0700 (PDT)
Received: (nullmailer pid 4083400 invoked by uid 1000);
	Thu, 09 Jun 2022 18:33:51 -0000
Date: Thu, 9 Jun 2022 12:33:51 -0600
From: Rob Herring <robh@kernel.org>
To: Ansuel Smith <ansuelsmth@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, Manivannan Sadhasivam <mani@kernel.org>, Jens Axboe <axboe@kernel.dk>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, =?utf-8?B?77+9ZWNraQ==?= <rafal@milecki.pl>
Subject: Re: [PATCH v5 2/3] dt-bindings: mtd: partitions: add additional
 example for qcom,smem-part
Message-ID: <20220609183351.GA4083315-robh@kernel.org>
References: <20220606151417.19227-1-ansuelsmth@gmail.com>
 <20220606151417.19227-3-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220606151417.19227-3-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_113356_082803_6D31801B 
X-CRM114-Status: GOOD (  11.02  )
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

On Mon, 06 Jun 2022 17:14:16 +0200, Ansuel Smith wrote:
> Add additional example for qcom,smem-part to declare a dynamic
> partition to provide NVMEM cells for the commonly ART partition
> provided by this parser.
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>  .../mtd/partitions/qcom,smem-part.yaml        | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

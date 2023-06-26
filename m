Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE51EB64D9
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Jun 2023 17:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SV1kSYsEgNUYBhn5UzCkYI+YvlU6dMwpFDz8t6WY3u0=; b=f41ieiHBGhVp2O
	FF9Tk8u0hAtrD+WpB2QhadbsY/ReSCw3QJ9gz52OOgUMV6nc2nWRyepZjtx0xv6YwE/dhkaUkaN/y
	DOgUKOAh5KGIUcstxwHGbT34O0IkoqMJ2Chy8aXdbB80z65d11ihQScef0Nx9hBcaXo6but1WzFYa
	b5h50vT5Mw9tueoMCf3z0yrbJGHT+lof6zL5IBe8FH7mUbp9HPhnDCWbjZ6BzdSmqsraP7lBB9+Ls
	s0jKlHUo4isRt4igjtfj6cUil638gztwoKB2iPeV80A6wF6d8I80ukqqr3Y8VhLhRB9+AM40fveU1
	utbgN1UJ4NtWpq7uOeSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDq7p-00AljE-1h;
	Mon, 26 Jun 2023 17:35:41 +0000
Received: from mail-io1-f45.google.com ([209.85.166.45])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDq7m-00AlhW-33
	for linux-mtd@lists.infradead.org;
	Mon, 26 Jun 2023 17:35:40 +0000
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-77e3267477cso189241539f.2
        for <linux-mtd@lists.infradead.org>; Mon, 26 Jun 2023 10:35:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687800936; x=1690392936;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0oU7mb2qfcl9XqvNdYw43GkY7hT4T15jxtCNIJsOfk=;
        b=bCQ0hAwWmcIvRwULmkR5IJTO4jUb7v2NLSBjT2ut6NGI8+xdxPYfDJV+fs5jQET2Vy
         Z2Wf/v8NYs5t9+Olcmi5nGwfoXm0vObsj8VBGKRwxLSqc1jR2VIq+9vbXjlORicYqtUO
         3lFAg7EjtDmhD6/jnnxILG8wYrmviyK7cN2sb4RmCRqpGQtYQrGP8A9Zm4JhvSiKKYJD
         xU4P3JHJ6rbTkHQ3TI/QrDhMlnTCgTh4nVdI5KrKbB3LtlqlFOg6IC4JEUzlLGScoaKe
         soqVIE+FvGKmuRFWOFSIuYUyiLuhUdiXXNdviAtKmDIjJIeH4EVI5HnJNQ9eePi+xdNE
         CQ9A==
X-Gm-Message-State: AC+VfDywIHldydTRnFUt9V7ZH6IpfRG+VOhWTHfPTXsqH9siCWwqn7KR
	agrgOrHqeV0NquRbSdv5Og==
X-Google-Smtp-Source: ACHHUZ5nJIU69luq91v3w8PM05iYwzu4yi0b9NIo5hK5Isqeqj4QG468oM6Vph/L0U0gO8PuG1cP0Q==
X-Received: by 2002:a05:6602:19:b0:783:6526:a1a0 with SMTP id b25-20020a056602001900b007836526a1a0mr1713914ioa.15.1687800935788;
        Mon, 26 Jun 2023 10:35:35 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id r9-20020a6b6009000000b007748f491918sm2321521iog.40.2023.06.26.10.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 10:35:35 -0700 (PDT)
Received: (nullmailer pid 3434595 invoked by uid 1000);
	Mon, 26 Jun 2023 17:35:33 -0000
Date: Mon, 26 Jun 2023 11:35:33 -0600
From: Rob Herring <robh@kernel.org>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: amitrkcian2002@gmail.com, git@amd.com, devicetree@vger.kernel.org, vigneshr@ti.com, conor+dt@kernel.org, pratyush@kernel.org, tudor.ambarus@linaro.org, richard@nod.at, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, miquel.raynal@bootlin.com, michael@walle.cc, krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: mtd: jedec, spi-nor: Add DT property
 to avoid setting SRWD bit in status register
Message-ID: <168780093273.3434534.11377624965513902271.robh@kernel.org>
References: <20230625100251.31589-1-amit.kumar-mahapatra@amd.com>
 <20230625100251.31589-2-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230625100251.31589-2-amit.kumar-mahapatra@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_103539_008998_FA0229CC 
X-CRM114-Status: GOOD (  14.25  )
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


On Sun, 25 Jun 2023 15:32:50 +0530, Amit Kumar Mahapatra wrote:
> If the WP# signal of the flash device is either not connected or is wrongly
> tied to GND (that includes internal pull-downs), and the software sets the
> status register write disable (SRWD) bit in the status register then the
> status register permanently becomes read-only. To avoid this added a new
> boolean DT property "no-wp". If this property is set in the DT then the
> software avoids setting the SRWD during status register write operation.
> 
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
> ---
> As the DT property name has changed so, removed Reviewed-by tag.
> @Cornor if possible, could you please review this updated patch.
> ---
>  .../devicetree/bindings/mtd/jedec,spi-nor.yaml    | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

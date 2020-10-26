Return-Path: <SRS0=RTUQ=EB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20FD9C388F9
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Oct 2020 08:41:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F4A3223FD
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Oct 2020 08:41:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yVQMHfRf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F4A3223FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9gcUHjG3sqXSd7fc0WwpUMPUcCsiwRVYmSMaTFpcYIs=; b=yVQMHfRfoJBA1ksTyPRfnpxyN
	YMZ11Gi99ZbvKVrxdLPPqHblPHw+xfZJqgxXS6tuGM+Y4clDglh80hssnDbtSqWKjvCfwkbkJAtFe
	UPWvdd1xi0tAC22tFulDrxey7rY8CnhZR9Mj/ESjmM4MGCc93b9/EL6/Df2xUjuWO+hIpyOKbq+NN
	gYUTo0I4AsCw/O5/h5nJAtZRccdToOoDC4anmdpLBK6cpFcyafkubm8L1azanB5VDxSvvKPHs+ToW
	41ofY1rUxN005gqG2NF3q2kBgDcgwmurW1QpCzhr/tz2ebec0YM35DhwDhIaiP8ChTdK9M8R3j6sC
	7BquBybzg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kWy3l-0002DG-2R; Mon, 26 Oct 2020 08:40:57 +0000
Received: from mail-ed1-f65.google.com ([209.85.208.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kWy3S-00022c-VS; Mon, 26 Oct 2020 08:40:41 +0000
Received: by mail-ed1-f65.google.com with SMTP id dn5so8375927edb.10;
 Mon, 26 Oct 2020 01:40:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fPY3YUMaHx0SYLGgmZyNAyMNlSCq8nr0Au+mUxZwASo=;
 b=N2Aj9wo5S5JRKK0wTsfo8R8f+CyWXqZ2P78qTvrPPZvik3ZEXoaNgb1lH/ovYZr2OJ
 MVlKvDOhWIXqsT0WnrXyDR+tNtU+J6JelAFu5bvQJisU+TPJ4kDBAI119JJ7VjYKfuuA
 tKhr15nuNTSrfdqhRJzrUHEaH3FVWs/norf2WR90duVwlchKJxQHhpH7GbmDfZieQ6Sw
 ZpfkvSE5Fx9u7yeXkygnpBGkjOgin3kf1AaHK+aKuNND+jXzvXGnmVIhXr8HnNWsGauv
 3jMOZnyi5+Hig+Jx0M2pMEHRi+CTUjY65CXaBgiJ1liQ31JlviHSiJp0F8XEuqJqUk27
 S6KQ==
X-Gm-Message-State: AOAM532t+1a3N+YHw5Pd+u/BYM7ZsHj4L4q+v5JTp1BM2yMBXJYpkszr
 HFQjE7NtWjnEwAqL3jPX6sU=
X-Google-Smtp-Source: ABdhPJzMNFAPm/G/FPe2T5GfoWx+hZWCWuIsNulsXqm9QWpIwDSzI0aXCpKKCmaS2zzfu6KxDgxn0A==
X-Received: by 2002:a50:8f61:: with SMTP id 88mr14969192edy.175.1603701634845; 
 Mon, 26 Oct 2020 01:40:34 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
 by smtp.googlemail.com with ESMTPSA id u10sm5306057ejh.54.2020.10.26.01.40.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 01:40:33 -0700 (PDT)
Date: Mon, 26 Oct 2020 09:40:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: More whitespace clean-ups in schema files
Message-ID: <20201026084031.GA7466@kozik-lap>
References: <20201023192258.3126047-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201023192258.3126047-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_044039_203393_4417B938 
X-CRM114-Status: GOOD (  11.55  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-pm@vger.kernel.org, linux-iio@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Oct 23, 2020 at 02:22:58PM -0500, Rob Herring wrote:
> Clean-up incorrect indentation, extra spaces, and missing EOF newline in
> schema files. Most of the clean-ups are for list indentation which
> should always be 2 spaces more than the preceding keyword.
> 
> Found with yamllint (now integrated into the checks).
> 
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-i2c@vger.kernel.org
> Cc: linux-iio@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Cc: linux-mmc@vger.kernel.org
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-serial@vger.kernel.org
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

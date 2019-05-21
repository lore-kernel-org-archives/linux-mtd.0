Return-Path: <SRS0=joji=TV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D37D3C04E87
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 09:02:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A985E21479
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 09:02:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RgvTQiLk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aXbZOCmd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A985E21479
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NvtAfC8N0d9dQtu9drIvvNLxvnBuJBodaZbZ/Ulx1pM=; b=RgvTQiLkkiAwn3g8w80X8FFSt
	KX6rcpgf1NIp9kgtpZvGbAeXQPb9EbnzUJhwY0rxeRMDN0dhrutSWWR3zNuG6M6G+eDwIpHoYKZyO
	dJqPpidtTDKlk3N2DXkr+MJ/lIAEGTK8Bp9IviZJK/iGRJ4WkG5lnMehbVSv7wASqsBbyw6rkLBe2
	KXPZa+QfDuKKewzQvcONz8YKTRa2CjH0YShhf7ym0bEBuCD5LrWfiZmiv7FFFbgqiREGqAkOnz3L1
	kl8FACkRyujC2NswOkcDyMyHLec9C3gEVKXp7SUtVOvEqWyDPMTeFhHVgJ1f+YD4EQLoH6SDLR83U
	EPZQnUudA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hT0fP-0007jT-1O; Tue, 21 May 2019 09:02:39 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hT0fM-0007ie-2b
 for linux-mtd@lists.infradead.org; Tue, 21 May 2019 09:02:37 +0000
Received: by mail-wr1-x42b.google.com with SMTP id g12so17343810wro.8
 for <linux-mtd@lists.infradead.org>; Tue, 21 May 2019 02:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6vXRpcR8hUy/z236jHDc62nRnBJfz6oPwUw/X75saOc=;
 b=aXbZOCmdi0RuzZZYueJKuRuzHc9qm6+e8qV7RidheapqjMsHvZ+WEt2p5bqrquTIVh
 iF7mj9TJ1vHbYR9Iy8zIfIcroqjGd+yWWiuXOi8A/tvDh7EMByRwz4RWNQU8uucMtkTm
 91DeVuszQAd9D7JpcEQETJC6205zorp0zrito0Mn7RYRggKVuVRXZi7POCFm1CrdD2Jz
 BztcP0cTLDmN9hWJokghJizBOXif4kCobFcHHsli8dn3VDQQl78IaIycZql0hMj9avW9
 oOJALNTgfkX4+xiad4VNprAjvJyF7s5+pObDUfEANfYGqKg8IbD6RD1p+8dLXEQjVoD0
 3YCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6vXRpcR8hUy/z236jHDc62nRnBJfz6oPwUw/X75saOc=;
 b=o5gh67FGrEGguwYlkl8H4it0Fo+a5eQuz3EVTVKXnd5DLj8UdmvxGfVH8sOgUfp/ys
 M29wV8DHWjG022eJ+WtaioOIdQuHA+629jftwW3DNZtoOL9AeBoWJIAIBkR8te94rk0x
 s5rVhsF3+Sdgp1n4+WqQ/XGEa5Ez7MlVnsU7DExwCxgFSpZmjkWVf/f4H0gjWaursyW0
 OVqwTTWQ2WxI7dOGeyvRDI2N9wTY0Iz/++lcuqqk+dZv0xlMxp+lFfBp2+qDu78TnXLw
 y1o7RZptwQ9bbcDF0TrNEkAbs+cw3khe9UlIjpWd0TcFHVhGtEY2OR3/anQBe8ptmWIG
 EySA==
X-Gm-Message-State: APjAAAUs4Es47OdeTnrYxoyRUismgtgPkPDJ8lmry+PPs9DHE/IvHWTG
 5T3A857upEzr1u5gNpIiAtyqktGo0vE=
X-Google-Smtp-Source: APXvYqwHbKy6XrNMrf0bXWw/znNxyjKmOYV/fT85nkOTssBGYNlZ75SwruRwpJ6LEmr0CwrFTNRKEg==
X-Received: by 2002:a5d:4a44:: with SMTP id v4mr4275934wrs.84.1558429354138;
 Tue, 21 May 2019 02:02:34 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id 20sm3143604wmj.36.2019.05.21.02.02.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 May 2019 02:02:33 -0700 (PDT)
Subject: Re: nvmem creates multiple devices with the same name
To: Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org
References: <20190521085641.i6g5aijwa5zbolah@pengutronix.de>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <a9ccac90-7b2f-41da-2ca9-ca3bba52781b@linaro.org>
Date: Tue, 21 May 2019 10:02:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190521085641.i6g5aijwa5zbolah@pengutronix.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_020236_126241_6B5CDAC9 
X-CRM114-Status: GOOD (  10.75  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, kernel@pengutronix.de
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 21/05/2019 09:56, Sascha Hauer wrote:
> . Are there any suggestions how to register the nvmem devices
> with a different name?

struct nvmem_config provides id field for this purpose, this will be 
used by nvmem to set the device name space along with name field.

--srini

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

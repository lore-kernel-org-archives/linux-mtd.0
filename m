Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A6CCDB474
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Oct 2023 07:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oQnM1aQN0VNC8149+AdioIBbaLSiDKJ536ps+21KlLA=; b=IgjSqOAKU8D50H
	B3j8nOWegJQMhB33WBOKTEgFSflXASlguFvpUiAhpBJLY4SmV6qv+GNvesmRZRKZmUL+sU2HOg+Mi
	pRwWMGn3GXTZe4sMmwDgHFSX7FfxfZyyX1BAz9CRUjOTaFibJUV58qHnYnUUWtd+eEtwcGfPe6HYT
	ipJZlZKfNYZ+k6nU0KvLVaTURwwlJT2sAMKK2TvjhcwCc5YKfqTg0oyCCMxKS3JyDeGaji5TOHAL5
	bwx3PPQ4y33icspxUb6Rz05VLqQ9q3TC0VEciPwgDL7d7KEB6dqhTiYvD83dHGXXCvZuxqXpf0fF3
	1Xx6cbdN2b3PUKeZa9/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsetK-00Bbgi-27;
	Tue, 17 Oct 2023 07:53:26 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsetI-00BbgI-00
	for linux-mtd@lists.infradead.org;
	Tue, 17 Oct 2023 07:53:25 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-53e70b0a218so4544231a12.2
        for <linux-mtd@lists.infradead.org>; Tue, 17 Oct 2023 00:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697529202; x=1698134002; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hlgpw+L9LnX18jEvUn1qVQk3D6pVTwN3aQ8ouOWfzN4=;
        b=VpUjQGoFWt0M/Se6OBsTnJqe2IHd9MYYJ+87oeAYJgP/pOxhsC69wKwRhqIqx05JGw
         Fh+8DVuhbfrs7TeE9yz5TKWI9e0gq3fCN39RD026BGYu+P2kw4nUHMNKLLTXFbpFcKyJ
         /M1/15Jmc0RwG6SZgNgQKu4u8bNPuRrZjUep+qtHqGKIcTncFtU1VkIfX7clePqd7z12
         BH20n8dm9I2LYVFK6iS2iGer7U7YyBDi2V7jcFWQN74hh1qexnOm7DMt055HVC8MunJI
         I4JKBOoT6qOulm6R+2Qv6Wbh0buEOHMD1O/+m3wWjqTXEwcTk52+7K1LWlxSwr/qIrY7
         qgIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697529202; x=1698134002;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hlgpw+L9LnX18jEvUn1qVQk3D6pVTwN3aQ8ouOWfzN4=;
        b=ZCdu8648T3dLIRn0vqr/G/FtB+KgErbdAfNeQkHdYkPIU21bOzCpe+6fOnRYqNAYaK
         +o6GrBNNf/OQEUDRQyKtNo2xPdChPCDPYzULRU9RoZEneSRkvyY0FrxVxGlgAxnSLBax
         hDOR2iY8wHFHc13WXwXdqx9+uNYKcW80d5Qm7TM893btzvXvAA4CeZutiQBT6OoAzDX9
         NfWJp3YtgCaXwIgXNavdOqFU30i9YrfVAJs7zgw363ImL5VnbeYcGgUW2iSgBBm2Ft07
         waDb8vUXeAOYi4zUwaQY+O577vmLrD7hxZJ3zjjZMZGtqeKZE31vr4/rHS2TEnDUXGdz
         Pj5A==
X-Gm-Message-State: AOJu0YzQXiQ/lU/zJhlceXXOLRuBhPVZVsM+yvCiKf7j6pTogBSDiwXS
	0K7cgSFOsOBOl9HbJeO/uzDjHA==
X-Google-Smtp-Source: AGHT+IECmWy+rb4TCclYHjf+L6Ub5W2G/aphVU/dH8jOzcsB0h3R87eoDggRzvLGB1UVpAT4fB2W1Q==
X-Received: by 2002:a05:6402:26d4:b0:51d:f5bd:5a88 with SMTP id x20-20020a05640226d400b0051df5bd5a88mr1310383edd.38.1697529201829;
        Tue, 17 Oct 2023 00:53:21 -0700 (PDT)
Received: from [172.20.10.8] ([213.233.104.181])
        by smtp.gmail.com with ESMTPSA id em6-20020a056402364600b0053e37d13f4fsm706539edb.52.2023.10.17.00.53.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 00:53:20 -0700 (PDT)
Message-ID: <5a488a21-596d-48f4-bfdc-28b206542563@linaro.org>
Date: Tue, 17 Oct 2023 10:53:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: micron-st: enable lock/unlock for mt25qu512a
Content-Language: en-US
To: SHUKLA Mamta Ramendra <mamta.shukla@leica-geosystems.com>,
 "pratyush@kernel.org" <pratyush@kernel.org>,
 "michael@walle.cc" <michael@walle.cc>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: GEO-CHHER-bsp-development <bsp-development.geo@leica-geosystems.com>
References: <20230705154942.3936658-1-mamta.shukla@leica-geosystems.com>
 <19800e51-a871-be9f-9eb5-5829237e2613@linaro.org>
 <a8271289-0611-4e37-cf37-0be19a85656b@leica-geosystems.com>
 <084ed945-7674-280f-5866-9238473a294d@leica-geosystems.com>
 <17989610-d069-40e2-9b4d-7ca6bdf2497e@linaro.org>
 <a24d7b3b-4077-9dbe-49ae-96f595b42223@leica-geosystems.com>
 <2d7271b3-dd60-44bb-9700-f6a5295ea873@linaro.org>
 <372046cb-9135-9a6c-fdb7-307a42f55b30@leica-geosystems.com>
 <a86b93c4-a507-47c7-bdce-4aed8dfcf929@linaro.org>
 <eb2a9138-a76e-4b1e-e001-315149c4dabd@leica-geosystems.com>
 <f0a7acb3-00b5-433d-af5c-724a509fb816@linaro.org>
 <bc76767e-00c1-47ca-9a27-2aa7d2a262f6@linaro.org>
 <b9b7bb93-fe23-34dd-6a30-b1b0d792861f@leica-geosystems.com>
 <2e3ce75d-7e2d-4e62-8660-48a41074c20c@linaro.org>
 <fd6b5e43-7e90-b98d-79be-0c65840ec433@leica-geosystems.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <fd6b5e43-7e90-b98d-79be-0c65840ec433@leica-geosystems.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_005324_065434_E6256624 
X-CRM114-Status: UNSURE (   6.27  )
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

Hi, Shukla,


On 16.10.2023 12:39, SHUKLA Mamta Ramendra wrote:
> v3:
> https://patchwork.ozlabs.org/project/linux-mtd/patch/6b89ae4e4d7a381050746458cb000cd3c60f7a42.1696849423.git.mamta.shukla@leica-geosystems.com/

I've just sent v4 on your behalf to speed up the process. Please check
what I did and if it looks good to you let me know.

https://lore.kernel.org/linux-mtd/20231017074711.12167-1-tudor.ambarus@linaro.org/T/#t

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

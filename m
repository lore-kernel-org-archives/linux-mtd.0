Return-Path: <SRS0=xunr=65=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62B67C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 15 May 2020 20:17:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2ECD4205CB
	for <linux-mtd@archiver.kernel.org>; Fri, 15 May 2020 20:17:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LaJEKK1t";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="rasFNY6K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2ECD4205CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jL+SnfW3S1RlUEQ7K+46v+4MEV4/YJx/QhIlGqff4SU=; b=LaJEKK1tD6K/fG
	mnZQ1sAcKJT+PQX8wnq3lX8hezEQwctTFjj2q9hAjMZSufzZFoB7vihLNBZRyoobLZTndnbVK3Upd
	9hNndF562pMoS93yQE0ipmHavcaUmfMgTZJx3DnXJld1Yf5DF2qQHoEgxB32b4P/aBNouioTM2swA
	eCpLHzlmDe1hEfgga2xnPjXAhnQij+LmGqH/0JKLi0HM+CwfdIH6BY4uyhJgcpbaSj1XHxcvqIYRS
	L5/SiPlvrZPLA5wroqPW7ZG3H5fGZzvgZJoolralEbSt22lQS7TBU/6XEoC5VglOlcAqkipMxkWEy
	Z8J/k8X9z/SR7vmyYWSQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZglR-0003qo-UW; Fri, 15 May 2020 20:17:01 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZglL-0003qG-4g
 for linux-mtd@lists.infradead.org; Fri, 15 May 2020 20:16:59 +0000
Received: by mail-lj1-x243.google.com with SMTP id d21so3572440ljg.9
 for <linux-mtd@lists.infradead.org>; Fri, 15 May 2020 13:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=43o0FGN5Fq1n1m6Sdyu6XN/2q9oPen95HONzGtG8NaI=;
 b=rasFNY6KlPGGakeCYqdBKvuVpmFObIfbsTH8PsjJcVvMBa5zhm9K6BTFVJAtb7awk+
 3yqX0uRkv+T5zsLqojPUDnycXDh5+NvsVRpHqVoJeRIA6t+6atb1t2vCeFzX7cY7ifny
 du2XgSm2pOqgHhxIJP4+L0TYBoppN2GZl5fj+foJRbx4ykI/5TY6HRrwh2Dapx19hHbK
 6SQdy9bl7cbOxhwtWYvDI+YlVQO3+S+9HunxTJULpJ726fcG1indWvBCE/g+C0dNbxsU
 QMBwmrB7yMIBlIzQ7GjE84PsuhgAwwDUsn1iG4rbhTLp6qDe7CzSoyUaU9nLpP2YaROi
 QJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=43o0FGN5Fq1n1m6Sdyu6XN/2q9oPen95HONzGtG8NaI=;
 b=ev6FREZs8p2c/QeYprutbDpLV7+4WWTddKs/s5oQLC1WXcOnE2QeuyV9bjcqSnlGTX
 jULrKeEqiT/WOHU63ZxLwes9TQYBE1CH2ub6EcUdQ2dIJx6stumuPKLRiGP6e/vu7TRj
 Q9WOrt1xheOvK8o7hgQxhBXyKf6/BwFRptsOxGiLkYnoDEMzAGd/i0ZTby+B0LD4y+ER
 IDS0WEoiDvNK4ff+jDD/UJe4oO1YYArHP7z0fwoehiCXz34XsIVIS8R9CX0z+JSjqcYk
 PLxHaTVGjEnu9T5ZVuMX8Ieqn6YMbVwj209uTBUwuXuA+r9DME+ZM1bZojncUtucTU4V
 3cGw==
X-Gm-Message-State: AOAM532PUeE6P0gfbmqYiGbuNJA8YQrkeM7MAAPvnyazFyPoRmz4MBk1
 TSXekoFS5JPaVazV2yddWvO0c4Y7yyg=
X-Google-Smtp-Source: ABdhPJzJ0CcrmFTRJgrtQI0QnbyoaIej/mpNW+aorlA8gD+MJtby/F88yLom1QmTf+JS/p+fTH8xog==
X-Received: by 2002:a2e:8807:: with SMTP id x7mr3331329ljh.173.1589573812303; 
 Fri, 15 May 2020 13:16:52 -0700 (PDT)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:42eb:aebe:5652:2324:c9fa:fb8])
 by smtp.gmail.com with ESMTPSA id o18sm1623971ljc.73.2020.05.15.13.16.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 15 May 2020 13:16:51 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] dt-bindings: memory: document Renesas RPC-IF
 bindings
To: Rob Herring <robh@kernel.org>
References: <812e6e58-d13f-3f44-5f55-22266b690c57@cogentembedded.com>
 <116683d1-d402-4d7f-3357-1c8cde807076@cogentembedded.com>
 <20200501211945.GA15294@bogus>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <52ffabcd-048f-9ba8-a65f-4a22e60866bb@cogentembedded.com>
Date: Fri, 15 May 2020 23:16:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20200501211945.GA15294@bogus>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200515_131655_336273_28591459 
X-CRM114-Status: GOOD (  17.87  )
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
Cc: devicetree@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 05/02/2020 12:19 AM, Rob Herring wrote:

>> Renesas Reduced Pin Count Interface (RPC-IF) allows a SPI flash or
>> HyperFlash connected to the SoC to be accessed via the external address
>> space read mode or the manual mode.
>>
>> Document the device tree bindings for the Renesas RPC-IF found in the R-Car
>> gen3 SoCs.
>>
>> Based on the original patch by Mason Yang <masonccyang@mxic.com.tw>.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> ---
>> Changes in version 2:
>> - rewrote the bindings in YAML.
>>
>>  Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml |   88 ++++++++++
>>  1 file changed, 88 insertions(+)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml:  while scanning a simple key
>   in "<unicode string>", line 29, column 9
> could not find expected ':'
>   in "<unicode string>", line 30, column 1
> Documentation/devicetree/bindings/Makefile:11: recipe for target 'Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.example.dts' failed
> make[1]: *** [Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.example.dts] Error 1
> make[1]: *** Waiting for unfinished jobs....
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml: ignoring, error parsing file
> warning: no schema found in file: Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml: ignoring, error parsing file
> warning: no schema found in file: Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
> Makefile:1300: recipe for target 'dt_binding_check' failed
> make: *** [dt_binding_check] Error 2
> 
> See https://patchwork.ozlabs.org/patch/1280942
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure dt-schema is up to date:
> 
> pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
> 
> Please check and re-submit.

   As I've said on IRC, I have troubles installing from dt-schema.git:

[headless@wasted renesas-devel]$ pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade 
Collecting git+https://github.com/devicetree-org/dt-schema.git@master
  Cloning https://github.com/devicetree-org/dt-schema.git (to master) to /tmp/pip-4f91j8zd-build
Collecting ruamel.yaml>0.15.69 (from dtschema==2020.6.dev4+g6a941d4)
  Using cached https://files.pythonhosted.org/packages/a6/92/59af3e38227b9cc14520bf1e59516d99ceca53e3b8448094248171e9432b/ruamel.yaml-0.16.10-py2.py3-none-any.whl
Collecting jsonschema>=3.0.1 (from dtschema==2020.6.dev4+g6a941d4)
  Using cached https://files.pythonhosted.org/packages/c5/8f/51e89ce52a085483359217bc72cdbf6e75ee595d5b1d4b5ade40c7e018b8/jsonschema-3.2.0-py2.py3-none-any.whl
Collecting rfc3987 (from dtschema==2020.6.dev4+g6a941d4)
  Using cached https://files.pythonhosted.org/packages/65/d4/f7407c3d15d5ac779c3dd34fbbc6ea2090f77bd7dd12f207ccf881551208/rfc3987-1.3.8-py2.py3-none-any.whl
Collecting ruamel.yaml.clib>=0.1.2 (from ruamel.yaml>0.15.69->dtschema==2020.6.dev4+g6a941d4)
  Using cached https://files.pythonhosted.org/packages/92/28/612085de3fae9f82d62d80255d9f4cf05b1b341db1e180adcf28c1bf748d/ruamel.yaml.clib-0.2.0.tar.gz
No files/directories in /tmp/pip-build-fwtgubpx/ruamel.yaml.clib/pip-egg-info (from PKG-INFO)
You are using pip version 8.0.2, however version 20.1 is available.
You should consider upgrading via the 'pip install --upgrade pip' command.

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

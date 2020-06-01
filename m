Return-Path: <SRS0=+yQj=7O=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49E69C433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2020 19:18:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1770A2073B
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2020 19:18:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WYw9o74+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="iwHH84UO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1770A2073B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RmPSi3Ox+EjItSHnO+xaqByVMcfyNx3qmIpzriSOt7w=; b=WYw9o74+2G2h8v
	Rxh3J0vVFNhZ5n4QFRm9Wc2U29n2EOS+TqMFP80B+g4HkMRsmI29isVNf45xEN/rrPSRCQ2nJm27q
	1KCsGhg/51dUsJ/xjkXRPecn4BGz3OyQJMCEvubh5jlErZHHu5yV44Q4fLEN0sziH+o/OjqA+nORk
	cVAh99PT6NvReRX9Uu9pDqNpHh9gCi+a0qKifCGr69c+dg8qnUGx6jtXtUBvvVDPLggQYi3RK0zkB
	Dcdv+uMw+c8dlUMpjjVGvjIvP0nZocEgyEqcLbey1YDqvqyyF7Hvvx0CHl+8CjGKfx+jozuw0cO5s
	POoMhH9stsC6zsFXLqJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfpxA-0001re-5v; Mon, 01 Jun 2020 19:18:32 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfpx7-0001rH-SG
 for linux-mtd@lists.infradead.org; Mon, 01 Jun 2020 19:18:31 +0000
Received: by mail-lj1-x242.google.com with SMTP id c17so3821944lji.11
 for <linux-mtd@lists.infradead.org>; Mon, 01 Jun 2020 12:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/B/vJSdZ4H+DclQbmiiPRhS99BSxRaLniCcxhXNQdaA=;
 b=iwHH84UOoC537MGk6E7us+S+9Zdopz5u3Mz9r49FApyoOZsxNbMpSYkDpYz+aYUmIa
 gtYJ4Nu2LvDhSS9BFKk/dXVwM+V+xJdfWYttpRfsGqdl+mfJLbnevBNm+6jq/a3qu6CS
 79cIP/nF1F5EzENa3hIe43wwl8d/B/SzpYMrgV+aDEoXxYeViLETePnqL6+klDaawcpX
 9Q+NOyq2LouzXifA0UFaf9jIAdeXnxvtv9zoddLb2ACAVvgArDVoDnSfzqzGD6APHcu8
 RWbhRoiDb2muv9dDnZFBL/MccbVhteizvEX7iahC7D4K1DHIFyVP4Ro83iNhRQPi/oNz
 WSsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=/B/vJSdZ4H+DclQbmiiPRhS99BSxRaLniCcxhXNQdaA=;
 b=na/MysHlPB5/4e+GnC7s7KvggwycFFkfrfe+eIPEmvldFa934UzRrJmffbi4TKtf6r
 jw738Pr1MNsTaiP1vPRZPuVTBhMZUPJTahFtpzSG40B4zyz8TtQ882Yw3afrLtvn4caT
 il509kTKYfCTCkfa4dghLvmeLUHVWjgqk43ExH4QxqrYvpunGfYYZCELrkVU5f9fk6ep
 Yvt5/so2xkAfXDAqPn2pXxlyhpGRuuAX2xREjWq4im9VAF6hH9YNchyWoE2TjXCFtMz9
 9hLiDG2/pACX4vyBVelGWX5XGVJQgNWur2D3p+wuGArNgG6fjKSyr8SmTpXXh3bFmBe/
 6FHQ==
X-Gm-Message-State: AOAM53000XLhcUD055663BJ4o94kxn/AkFzoj0zeoUC/bGD9LnMQqwFY
 P1EM0y8YZy0ssyuqNFqwUZjA8bKkjC8=
X-Google-Smtp-Source: ABdhPJy3cN4yLGJe+/Z+8B7cDMmCco1eIsfE3RnyFphuEUNzt9DcbvqKy/QmOpfmfS39sSO6wln/8A==
X-Received: by 2002:a2e:970c:: with SMTP id r12mr11288156lji.145.1591039106548; 
 Mon, 01 Jun 2020 12:18:26 -0700 (PDT)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:42cb:40f3:c0fd:7859:f21:5d63])
 by smtp.gmail.com with ESMTPSA id f12sm118393lfp.8.2020.06.01.12.18.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Jun 2020 12:18:25 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] dt-bindings: memory: document Renesas RPC-IF
 bindings
To: Rob Herring <robh@kernel.org>
References: <812e6e58-d13f-3f44-5f55-22266b690c57@cogentembedded.com>
 <116683d1-d402-4d7f-3357-1c8cde807076@cogentembedded.com>
 <20200501212547.GB15294@bogus>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <85e1ebd0-4b27-5382-c591-59d63d5b73de@cogentembedded.com>
Date: Mon, 1 Jun 2020 22:18:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20200501212547.GB15294@bogus>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200601_121829_912432_BA8E0E1B 
X-CRM114-Status: GOOD (  14.67  )
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

On 05/02/2020 12:25 AM, Rob Herring wrote:

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
[...]
>> Index: linux/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
>> ===================================================================
>> --- /dev/null
>> +++ linux/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
>> @@ -0,0 +1,88 @@
[...]
>> +patternProperties:
>> +  "^.*@[0-9a-f]+$":
> 
> ^flash@... if you're that restrictive.
> 
>> +    type: object
>> +    properties:
>> +      compatible:
>> +        oneOf:
>> +          - const: cfi-flash
>> +          - const: jedec,spi-nor
> 
> enum is better than oneOf+const.

        - enum:
          - cfi-flash
          - jedec,spi-nor

causes the build error you encountered while trying to merge the last time.
What was I doing wrong?

[...]

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C2BAC433E6
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 14:08:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B3C064EC3
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 14:08:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B3C064EC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MnNOZMubIhFADraXnMrKeYtumWmXYuOeuSfc94buYdA=; b=QqeuqQWjqp7FJBohK0ZXdu8Gb
	L3f62G/MFL/T3m5gg8gJo98tVVQu2x2xU28UYguKy8r3r878Vzgftcx5KX8x5eoQCpmg82sROlFns
	kdOrAe3fpJBOrU3ogY9ahk4Bske8NgPTCWPT0SVtBRlfBHJuqUniYPTxTJxjkbwnGCrNuVs4SiuEs
	9j+vi1ODi+arzpMaW7orOXaFR0WPl43N0FJhIkSc15fqNx+x0DcpmKJwKlIWR2PqidTbZQuQUsPbU
	O+biraBVWk1kHmXZQFw3cGmuBxGciqTQBnq8AuiaRmbBqae5IOyUhrCq4oGgi8wfmemV85C4crrGw
	L2NexIFAA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHSA4-0053qL-DS; Wed, 03 Mar 2021 14:07:36 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHS4y-00524w-6y
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 14:02:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=R4yEHlzB6XakeQQlTZxRAo9qsHcvOqzKmknFOqHVxhg=; b=KTMwchT+PHoEJisX0kvb1fFldl
 2+b1GhisRyKrQI/n6jU5QtNGSJYZs+HJBPMUA9onJHpcrPc2qjythAhRDqCaSr1sou8pRQb7QKRhz
 hOVRHQHMGZuE9tbW2bT/jiUf4ZnHR93WFv0BRQqfwpIwX03/JyTl3FVd02NHmXxT+S44J0PewiZLu
 g/C49W1glnAmjLJik44lANNidpNNrsWL0DWDS8nxiH5T/uB205B+Ak8SsUAycbUhwAZLrnPBEFsqY
 AKk20SXyWqZNMFto7RcnTL3JgUhqVmtVQxFZ0OgIlCT64tqvPs/CE7g278TC35GHWpdQg3ZeBfFUC
 hAYamFow==;
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHOLM-0027Au-5N
 for linux-mtd@lists.infradead.org; Wed, 03 Mar 2021 10:03:01 +0000
Received: by mail-lj1-x231.google.com with SMTP id m11so26991011lji.10
 for <linux-mtd@lists.infradead.org>; Wed, 03 Mar 2021 02:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=R4yEHlzB6XakeQQlTZxRAo9qsHcvOqzKmknFOqHVxhg=;
 b=WM5bTyUWPgFDTCMoyzsX+KfFqy5aBZ38DajaFdPzPPACOQ9o5BhXM8Jq/hmMj43zrg
 JFz9SivTYI3Bjwpvmtsaj2/baGwYPHbv9+29nDnmbEEgESo0JhChSE3jEawx4k0zgGBY
 Jm66x9cMJSF5V7zz4bg5ZAJhOx859qwAa0jp5lnwXbwhVsR5TXKT5469R6UlXGN5fsk4
 36l9wF/G4OD1DZPG62737/Pzj35ZXTFyfdrag3yYZeM5g66Y+LHf+2Paq04a5BnWxrX8
 GFDhzchNg2JS+9nQsbIQyFKSJcx+z9LAhA8ajN7GwUYNZHi3dUac/eD6jPybKc9mLUKr
 ywMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R4yEHlzB6XakeQQlTZxRAo9qsHcvOqzKmknFOqHVxhg=;
 b=hahqwEsSNTPQg9FWmOTrEkqyMEQF5YBURiygMxFqlQAqdXYGx9BDjqbimDeo1FrpNd
 22dC+CoHrhgX3tiWR7NmyUtsmyovpIw2eoA0lohxtJDogSFiIg8REx4c+MBQPPfU43ol
 6obYIc04o41EcplPODNTJt/9G5VUhaUH1NOzprTU0KAF0LjdMk8Y/jP+qo/gLoVcW5kz
 sBENrAhVZOPtFwOTh5iVNY/hvRVcdueeflJ0J4XhASZy8Kk4xy+hj749DwX793zr4ubC
 Y3yRM7MKMJIwuL84X9PX/x1Da52YgEarXz4+ZNylLLHb6WCazpqkyyMdg9mPNhhF+IMB
 vMdg==
X-Gm-Message-State: AOAM5306MutCmFswqEeBosah+ErLh7iBFoQZxGu33Pr33eek0a27fRNN
 gbXyxW5l4GOmV6T+IgmaRbg=
X-Google-Smtp-Source: ABdhPJxqQtEaXE3/ZVnzSGme5zK+ZqPP28+Lj7UKmvdAihdZ9pYMgPUc58nF2LXueOWSWp1NfRz1qQ==
X-Received: by 2002:a2e:b8c5:: with SMTP id s5mr14271804ljp.335.1614765718140; 
 Wed, 03 Mar 2021 02:01:58 -0800 (PST)
Received: from localhost.localdomain
 (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
 by smtp.googlemail.com with ESMTPSA id z7sm742814ljn.93.2021.03.03.02.01.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 02:01:57 -0800 (PST)
Subject: Re: [PATCH v2 3/3] dt-bindings: mtd: Document use of nvmem-partitions
 compatible
To: Ansuel Smith <ansuelsmth@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Richard Weinberger <richard@nod.at>
Cc: devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
References: <20210216212638.28382-1-ansuelsmth@gmail.com>
 <20210216212638.28382-4-ansuelsmth@gmail.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Message-ID: <1cf374f1-09d5-9fa9-9b0d-d8079f2f6fbc@gmail.com>
Date: Wed, 3 Mar 2021 11:01:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210216212638.28382-4-ansuelsmth@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210303_100301_636117_A752283F 
X-CRM114-Status: GOOD (  11.78  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

[Rob: please advise]

On 16.02.2021 22:26, Ansuel Smith wrote:
> Document nvmem-partitions compatible used to treat mtd partitions as a
> nvmem provider.

Until now we were using "compatible" string in partition node only for
parsers (looking for subpartitions). We need to think if this change can
break anything from DT / Linux perspective.

Compatible strings should be unique, so there is no risk of conflict
between NVMEM and parsers.

Now: can we ever need mtd partition to:
1. Contain subpartitions
2. Provide NVMEM
at the same time?

Let's say:

partition@0 {
	compatible = "vendor,dynamic-firmware-partitions", "nvmem-partitions";
	label = "firmware";
	reg = <0x0 0x100000>;
	#address-cells = <1>;
	#size-cells = <1>;
	ranges = <0 0x0 0x100000>;

	firmware-version@10 {
		reg = <0x10 0x4>;
	};

	firmware-date@10 {
		reg = <0x20 0x4>;
	};
};

Is that allowed to respect both "compatible" strings and have:
1. Linux parser parse "firmware" for subpartitions
2. Linux MTD register "firmware" as NVMEM device
?

If not, what other options do we have? Is that allowed to have a
dangling MTD NVMEM node with phandle to MTD partition?

firmware: partition@0 {
	compatible = "vendor,dynamic-firmware-partitions";
	label = "firmware";
	reg = <0x0 0x100000>;
};

(...)

firmware-version@10 {
	compatible = "mtd-nvmem";
	reg = <0x10 0x4>;
	mtd = <&firmware>;
};

firmware-date@10 {
	compatible = "mtd-nvmem";
	reg = <0x20 0x4>;
	mtd = <&firmware>;
};


Rob: I'd really appreciate your input & help here.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

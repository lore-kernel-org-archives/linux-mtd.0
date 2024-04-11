Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42EB0C4345F
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Apr 2024 13:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CIy0ifJfHRFMrZyoo4rn8fOWn2EKUeIagcaIAsYEnTc=; b=ExOwMWPYO01wc5
	j4Iy03xsEhynD1mOg530nRylER61aRZhbpE8pcVcAoS3CLVcPorsJ1YXiu6IrdW4+yckX3CJAW9Je
	nudb6ICKfso2mvRTk+E+q++i5lQM57JfxrLs4rPJ6WgqU3g6inmb7s9zBk+iFkat2uwPmSrVQPqel
	e0y+fyWmAMontTA+kHOjeUNWA8xJCAoLzkSiQKeOBUNNd1BDmWtDUbWXQUeDj8EwwDg/nT8NxeZ0L
	1mI2kT/+kWDx1hrXFFTp6KyVlW1EvKeDTpjrLidvEdEVNplHgHaxjisJb0bG7+aEAIacDYVI+Q/oW
	zQj/CACQ8YhX65wpfxQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruuq2-0000000CHcC-1YZh;
	Thu, 11 Apr 2024 13:51:38 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruupy-0000000CHaf-0rhc
	for linux-mtd@lists.infradead.org;
	Thu, 11 Apr 2024 13:51:36 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-55a179f5fa1so8809066a12.0
        for <linux-mtd@lists.infradead.org>; Thu, 11 Apr 2024 06:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712843492; x=1713448292; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/ceYBNt1x1X4kDPGPt+R9La4odFrSwH75HY7VRzNvNk=;
        b=IMPOwY+fh839mPNnSCnRLWoPzJC7c8bTXklKcXmGKuvbEqBwCUVD3naZjZdD0ay/PM
         5iyJGHROA5Ph133GmtBY4df3+zREevotEt38BQB+j1D9sPFarAlpBJEuZ0uWilLkY/As
         huagzyYcnK2eIDjJ87F/6T4CRztUj9G7JVPzAO6B5AngDIfHr7api3wrQTEpVKnnheG7
         7L/GWh1olD4/IJZhFyj9RjQLclDKpZ0AhUhf3jxzI+BtjCFIBNrrDRtt5TN9FtiQNvEb
         tHqBkU+MJytmqk2tjKnhhHKsHa8UeIjHUlAMdATl2VudXRcuYyOrKh+k46IxmsD3+NHx
         CziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712843492; x=1713448292;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ceYBNt1x1X4kDPGPt+R9La4odFrSwH75HY7VRzNvNk=;
        b=uJXb6xn6KmjPUh/Pkcsw++GoxdVooIOf/O65b5zxa9sSXed5hnzFvhkLMULbTKU8PO
         WMI6MdlqiP4/eNwDzmdJVTC9GScoPrBmHAXWSBdC0If9iomg/cNLbWVcm1UnYGhZdi86
         H1Pf41YqV9n/tIdx2sIpC+Vjeq+8ugSfKTpE37vsN1OG60mcrk8OxqmSyQ/EAsoBJoNX
         nh2V2hl90g4xalGWAQPeV5fqe0MlDfxfxMMa7OSEcPzqbtVDgfNijeMXkeM2Run51Ut7
         goZjCaTxm0xQvvTOtDVByZ5KnYaKhcz7b9ak7T3cyhI657JhJrD/q9BKTh5q+vBJnO1E
         mESg==
X-Forwarded-Encrypted: i=1; AJvYcCUlO7D9NLBvg0EKcwBrZnxlCwNnV/RK6fsOqxk21i4sM7sLQ5KC3+Orb+LvKMlCjjWRIO79cn4e9jRWLx5NkONf/p5Uu7fkJwuNeUwo6g==
X-Gm-Message-State: AOJu0YyYOMfwY6lQb5y51G2NdugImEHyVMAqqX4kbY3u/iykduEkSAE3
	4TXG1rD+3hOEpb7kUZajbh7asC9iuO9bAdFwm5JaeJtsac7dVUvYX6rt7Ox7l/g=
X-Google-Smtp-Source: AGHT+IFB1CVkqAgj5WBPToJlIqZpMQcJ0UR0kbOgk5psWe/KtvTXg6ZmcEpOmsr616Ka+jcDTgTXGQ==
X-Received: by 2002:a50:9b58:0:b0:56e:2181:da0d with SMTP id a24-20020a509b58000000b0056e2181da0dmr4417333edj.29.1712843491621;
        Thu, 11 Apr 2024 06:51:31 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id b24-20020a056402139800b0056fd89cd52dsm708721edv.85.2024.04.11.06.51.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Apr 2024 06:51:31 -0700 (PDT)
Message-ID: <bc0663a5-49ec-4c1c-a2c4-d1c017b6760e@linaro.org>
Date: Thu, 11 Apr 2024 15:51:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/13] spi: add auxiliary device for intel dg spi
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Cc: "Lubart, Vitaly" <vitaly.lubart@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20240328122236.1718111-1-alexander.usyskin@intel.com>
 <20240328122236.1718111-2-alexander.usyskin@intel.com>
 <3f26157d-d79e-43a4-b61c-5da5aed9adcf@linaro.org>
 <CY5PR11MB6366D8B056F50DC6D7B31867ED052@CY5PR11MB6366.namprd11.prod.outlook.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CY5PR11MB6366D8B056F50DC6D7B31867ED052@CY5PR11MB6366.namprd11.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_065134_306975_3B43A630 
X-CRM114-Status: GOOD (  13.46  )
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

On 11/04/2024 15:43, Usyskin, Alexander wrote:
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Friday, March 29, 2024 15:47
>> To: Usyskin, Alexander <alexander.usyskin@intel.com>; Miquel Raynal
>> <miquel.raynal@bootlin.com>; Richard Weinberger <richard@nod.at>; Vignesh
>> Raghavendra <vigneshr@ti.com>; Jani Nikula <jani.nikula@linux.intel.com>;
>> Joonas Lahtinen <joonas.lahtinen@linux.intel.com>; Vivi, Rodrigo
>> <rodrigo.vivi@intel.com>
>> Cc: Lubart, Vitaly <vitaly.lubart@intel.com>; linux-mtd@lists.infradead.org; intel-
>> gfx@lists.freedesktop.org
>> Subject: Re: [PATCH 01/13] spi: add auxiliary device for intel dg spi
>>
>> On 28/03/2024 13:22, Alexander Usyskin wrote:
>>> Add auxilary bus device structure for
>>> Intel Discrete Graphics SPI device.
>>>
>>> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
>>> ---
>>>  include/linux/intel_dg_spi_aux.h | 27 +++++++++++++++++++++++++++
>>
>> There is no user of this header. Please add it in the patch which uses it.
>>
> This header describes auxiliary device that bridges between
> i915 or Xe driver with spi-intel-dg driver.

There is no driver here, just simple header.

> This header included in both drivers; this is the reason this header
> has its own patch.

Does it mean your patchset is going through different trees?

> 
>> It will also justify why you use this or other subject prefix. Now, it
>> looks just wrong: it's not a patch for spi.
>>
> Can you suggest what subject prefix to use?
> Like: "auxiliary:"? Something else?

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching.

> 

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

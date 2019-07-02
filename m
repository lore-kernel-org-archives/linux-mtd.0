Return-Path: <SRS0=szGg=U7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A54C06510
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jul 2019 16:55:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BABD520B1F
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jul 2019 16:55:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KeUAlSZV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eoMSY239"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BABD520B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jDWKphMCdd6IcH7wCwezPmDV/Cs1qFKIdKhpzK6u/9M=; b=KeUAlSZVNdgYU/F6lV8aVvaqJ
	0+Td9qpd0XUWxN6KXXUua3ZAJl0WExe3N0xkHPCDGgh8PU0dboxivqqIeWdeTiHbegua/uQD1bCmQ
	yynYCtgxggzeAOlTWu4L1+qRHJpdxppwLCyqB4Y/Fdo3grD9vzQVB6ra6QvLkULfkqLqI2dU4FKnR
	uTZmA4xlZY4teVqEa7RBajx+2USQDPDvdd0QoSTzm30WLF2uPmQgBbt51QNZiRNFrmTEWKPLGwVnR
	gxHN0EAOtTS461VkKx/sypaQAomDO+ykoDIuNWg9nw+FsWHvdpTonvfjbEMPmb55dfx0orglx4LgJ
	cK25NI4ag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hiM3b-0001Xd-1I; Tue, 02 Jul 2019 16:55:03 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hiM3W-0001Vg-RV
 for linux-mtd@lists.infradead.org; Tue, 02 Jul 2019 16:55:00 +0000
Received: by mail-wm1-x336.google.com with SMTP id s15so1798458wmj.3
 for <linux-mtd@lists.infradead.org>; Tue, 02 Jul 2019 09:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CimDCDGoDfxfHpl+rKhISumqp5NNRWpGlcfKsYJsg90=;
 b=eoMSY2395eqnBmzs60/mrSzr+W9p/RaS1h6zhNKCXI9HsqXF5vyNS923QFIAS0RjxX
 kpe4CRg43qJufKYPk6K1oNG4MLeKupRXl6/vzeGYK/0DekR0fAeaSgOY0MIatqEw2Ezi
 glHEcP/F2J4vJOFcMSZp2RW76PAiaJZ3WtSDPeO6FH3sYpxNsuwGsZ+s4KKTwcR0dlPa
 6lYzpot2hHny8J286wqn5XbmsSsWYiVhI6CFWI2KRYKSq+5JFwjMOtixnMCMtjYvUACv
 Hm/Gadim5oSfo8WMwGMeSJgnyCNOrTM+Ylv6P2hyPYUZ9ziT2RqMSh5dUb6GvJ9OMV/V
 Gaqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CimDCDGoDfxfHpl+rKhISumqp5NNRWpGlcfKsYJsg90=;
 b=sHsJGpEhTgt/gffmmwFHpxrpZpNmFMAGX0Zn+sODLu7MY0x7HNfo9hfWSDnvph6M1p
 5h/dYzclsjasNZQRD+6JtwzGTnHKGUU/6J8FLupVXeB5ZhIvLyy+bv9HNKvGjUS+GOZY
 rRDFEjN579rjCyfr++u2PXLFTewmnuSdBdlw9E9Pe8BWzZ7UA4bf4IcuxldIeRnpJjBg
 +MG7TGg7wKl2UjyePWqj8qonkHkFUgH3aAg+vV4YLdArJajjfK3FxlFVmsovUW4jmdUP
 G7wFt7DmXaj6ZO61lKv7SHuZBWrnBCTZZwikLP21k44f0V5xjwHDpHqFOOlBlKCvnKFS
 CiHQ==
X-Gm-Message-State: APjAAAWXP+ibSNMFpFa6XDmadyrIxV2wk38LYcGyoXqaYWmgC69pF69T
 n5Sv4Qig0RScY2dp+qRk3gHTtg==
X-Google-Smtp-Source: APXvYqzorO0l43WUW0HU+l8DROk7HfESLlwuN0S38IG5WqRioa3y9qGboUPucd/0wLqFrSB2htFA0A==
X-Received: by 2002:a7b:c313:: with SMTP id k19mr3931340wmj.2.1562086496818;
 Tue, 02 Jul 2019 09:54:56 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id h84sm3426757wmf.43.2019.07.02.09.54.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Jul 2019 09:54:55 -0700 (PDT)
Subject: Re: nvmem creates multiple devices with the same name
To: Sascha Hauer <s.hauer@pengutronix.de>
References: <20190521085641.i6g5aijwa5zbolah@pengutronix.de>
 <a9ccac90-7b2f-41da-2ca9-ca3bba52781b@linaro.org>
 <20190521092107.zpdkkhaanzruhqui@pengutronix.de>
 <20190701080642.4oxmw7c3rmwrt5ee@pengutronix.de>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <45d0cfaf-2511-4b1e-f4da-b67fa9f9e867@linaro.org>
Date: Tue, 2 Jul 2019 17:54:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190701080642.4oxmw7c3rmwrt5ee@pengutronix.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190702_095458_954206_3053226A 
X-CRM114-Status: GOOD (  21.27  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Sascha,

On 01/07/2019 09:06, Sascha Hauer wrote:
> Hi Srinivas,
> 
> On Tue, May 21, 2019 at 11:21:07AM +0200, Sascha Hauer wrote:
>> On Tue, May 21, 2019 at 10:02:32AM +0100, Srinivas Kandagatla wrote:
>>>
>>>
>>> On 21/05/2019 09:56, Sascha Hauer wrote:
>>>> . Are there any suggestions how to register the nvmem devices
>>>> with a different name?
>>>
>>> struct nvmem_config provides id field for this purpose, this will be used by
>>> nvmem to set the device name space along with name field.
>>
>> There's no way for a caller to know a unique name/id combination.
>> The mtd layer could initialize the id field with the mtd number, but
>> that would still not guarantee that another caller, like an EEPROM
>> driver or such, doesn't use the same name/id combination.
> 
> This is still an unresolved issue. Do you have any input how we could
> proceed here?

Sorry for the delay!
I think simplest solution would be to check if there is already an nvmem 
provider with the same name before assigning name to the device and then 
append the id in case it exists.

Let me know if below patch helps the situation so that I can take this 
in next cycle!

----------------------------------->cut<----------------------------
     nvmem: core: Check nvmem device name before adding the same one

     In some usecases where nvmem names are directly derived from
     partition names, its likely that different devices might have
     same partition name.
     This will be an issue as we will be creating two different
     nvmem devices with same name and sysfs will not be very happy with 
that.

     Simple solution is to check the existance of the nvmem provider with
     same name and append an id if it exists before creating the device 
name.

     Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index f24008b66826..cf70a405023c 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -641,7 +641,11 @@ struct nvmem_device *nvmem_register(const struct 
nvmem_config *config)
                 nvmem->dev.of_node = config->dev->of_node;

         if (config->id == -1 && config->name) {
-               dev_set_name(&nvmem->dev, "%s", config->name);
+               if (nvmem_find(config->name))
+                       dev_set_name(&nvmem->dev, "%s%d", config->name,
+                                    nvmem->id);
+               else
+                       dev_set_name(&nvmem->dev, "%s", config->name);
         } else {
                 dev_set_name(&nvmem->dev, "%s%d",
                              config->name ? : "nvmem",
----------------------------------->cut<----------------------------
> 
> Thanks
>   Sascha
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

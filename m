Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5F5C43334
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jun 2022 14:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Amz/Ag3JXX8et4gN2nHpZwThUxeWRUgVUTpFEgrl3o=; b=O0RuP5mHNIPO9S
	sSU8CdlG8C5NmpmqkB7BeTk+NFQjcSe2ysec2p8icfGQBK3SbDlwZQ1ouJ+Pfe73Exnm93NV6nFQ1
	gVv0LY/qzjEO5OMTqf3HaLdMtelUI3+QI/dsXjw1v8x0IEYTZKVwAFQN0ajmSUBdEoe0twAY9v7cp
	5V4+eHtLQqEgHnBdJ6z80QPl3vd9Li9nww4XzgHOLjoNRpJlLEitutfhTnLL/rgwYvJFGwR7TJTPg
	MXmK8jHy2YTNAxWtMDLw7MKIPW7YOueXNs1RT7vJQmxXP38ovxcVAiJHhNCubligF+7Mpe6XHlM0A
	PO93R+Zg6YvS8g0I342w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0krB-00495R-E9; Mon, 13 Jun 2022 14:15:53 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0kqx-004908-8I; Mon, 13 Jun 2022 14:15:40 +0000
Received: by mail-ej1-x62d.google.com with SMTP id gl15so11479704ejb.4;
        Mon, 13 Jun 2022 07:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=WkY6YC/lq+OgUkV6SbT7L02is3iwBHoji0O6PsezbEM=;
        b=A/CxupUz2JYW2TKhVixeYcs9exwjKCwCOqMjHjgSygAeb5arPOL/UsaLIkfXyyovsp
         DwMJlxVOrxmGv5S4qlkbRZKZPhW+tWHMoYiiqdcdVHf3/Iovay5N/IKd16o5RTSaKGoo
         Jkmgkg83Ib1+rQzR30SbUSo8EM4zP76tKI/Vefzn/qEBnkpxhW2ftInhjS3qi+Jsn48Z
         G9Dik31zGIIv8/EdAT1DHCAsNkFONfchVE1E59nr+t4rdqcd+dSCiJncQ+Eg149nppRi
         xTrAxURHbN0O3rzw6CK8TSlhTCHbrvUnsm8AM1ZbNDpQr0jsxqCyaQgrB25m97RdirSK
         wrHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=WkY6YC/lq+OgUkV6SbT7L02is3iwBHoji0O6PsezbEM=;
        b=PF1wkVbLUUzyeQcrL+zLWBLQt+hPPvFtpRDULXthvMYiq6SOPP144LYRsm54Iq01wT
         9yPXQWYyT9uZxs7qbXJ/AEPMOXDwKSqjlAiBM7fpFX2lsLhrjRmHZBSmhy1wweUQkHJe
         szSqGqpRYu4+lkx/m3M2VIQaVU6vwLUAmRIc2+YXpQ64qcYhQbFudsIH6iOdJTmjX5ym
         uBpcZV9c2FFPDE2c5wybGmT4RCDxTLRJLYCMtgezZWBXvCj0o9ttXL33iE3bN8jnoZeT
         SZ+ZvLpkRb0y1YNaf6HuekQJ3LN7jYAd2BTlwKsPBQJWVGhTIJo24GbDAGteLPS5/FYS
         PoAA==
X-Gm-Message-State: AOAM53009mF2Qu6q6HYbpEWAzXPb7UTRuU2fOQRZLxubpu+JO3w7qpey
	i8J5Tiy/TfrzrypM64CaefM=
X-Google-Smtp-Source: ABdhPJwWib14oqzfqvcsAH0wLXOfpeOSyAk0CLRuFBAN3USZ/7s60hA59eOGyM6r1Dtydm6AzGpTbQ==
X-Received: by 2002:a17:906:730f:b0:711:db1a:fdb0 with SMTP id di15-20020a170906730f00b00711db1afdb0mr115357ejc.54.1655129736364;
        Mon, 13 Jun 2022 07:15:36 -0700 (PDT)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id jt18-20020a170906ca1200b00711edab7622sm3896839ejb.40.2022.06.13.07.15.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jun 2022 07:15:35 -0700 (PDT)
Message-ID: <ad084c13-55fc-8506-f768-49a0c6ae4f7f@gmail.com>
Date: Mon, 13 Jun 2022 16:15:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH V3 1/2] mtd: allow getting MTD device associated with a
 specific DT node
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tom Rini <trini@konsulko.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, u-boot@lists.denx.de,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <20220611204651.19947-1-zajec5@gmail.com>
 <20220613160411.48b07515@xps-13>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20220613160411.48b07515@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_071539_346739_D5EB058F 
X-CRM114-Status: GOOD (  12.56  )
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

On 13.06.2022 16:04, Miquel Raynal wrote:
>> @@ -1154,6 +1154,34 @@ int __get_mtd_device(struct mtd_info *mtd)
>>   }
>>   EXPORT_SYMBOL_GPL(__get_mtd_device);
>>   
>> +/**
>> + * of_get_mtd_device_by_node - obtain an MTD device associated with a given node
>> + *
>> + * @np: device tree node
>> + */
>> +struct mtd_info *of_get_mtd_device_by_node(struct device_node *np)
> 
> Shall we try to use a more of-agnostic syntax or is it too complex here?

I need some extra hint, please. This is how many similar functions look
like:

$ grep -E -r "(get|find).*_by_node" ./include/*
./include/drm/drm_mipi_dsi.h:struct mipi_dsi_host *of_find_mipi_dsi_host_by_node(struct device_node *node);
./include/drm/drm_mipi_dsi.h:struct mipi_dsi_device *of_find_mipi_dsi_device_by_node(struct device_node *np);
./include/linux/usb/phy.h:extern struct usb_phy *devm_usb_get_phy_by_node(struct device *dev,
./include/linux/usb/phy.h:static inline struct usb_phy *devm_usb_get_phy_by_node(struct device *dev,
./include/linux/extcon.h:struct extcon_dev *extcon_find_edev_by_node(struct device_node *node);
./include/linux/extcon.h:static inline struct extcon_dev *extcon_find_edev_by_node(struct device_node *node)
./include/linux/of_net.h:extern struct net_device *of_find_net_device_by_node(struct device_node *np);
./include/linux/of_net.h:static inline struct net_device *of_find_net_device_by_node(struct device_node *np)
./include/linux/devfreq.h:struct devfreq *devfreq_get_devfreq_by_node(struct device_node *node);
./include/linux/devfreq.h:static inline struct devfreq *devfreq_get_devfreq_by_node(struct device_node *node)
./include/linux/of_platform.h:extern struct platform_device *of_find_device_by_node(struct device_node *np);
./include/linux/of_platform.h:static inline struct platform_device *of_find_device_by_node(struct device_node *np)
./include/linux/backlight.h:struct backlight_device *of_find_backlight_by_node(struct device_node *node);
./include/linux/backlight.h:of_find_backlight_by_node(struct device_node *node)
./include/linux/i2c.h:struct i2c_client *of_find_i2c_device_by_node(struct device_node *node);
./include/linux/i2c.h:struct i2c_adapter *of_find_i2c_adapter_by_node(struct device_node *node);
./include/linux/i2c.h:struct i2c_adapter *of_get_i2c_adapter_by_node(struct device_node *node);
./include/linux/i2c.h:static inline struct i2c_client *of_find_i2c_device_by_node(struct device_node *node)
./include/linux/i2c.h:static inline struct i2c_adapter *of_find_i2c_adapter_by_node(struct device_node *node)
./include/linux/i2c.h:static inline struct i2c_adapter *of_get_i2c_adapter_by_node(struct device_node *node)


>> +{
>> +	struct mtd_info *mtd = NULL;
>> +	struct mtd_info *tmp;
>> +	int err;
>> +
>> +	mutex_lock(&mtd_table_mutex);
>> +
>> +	err = -ENODEV;
>> +	mtd_for_each_device(tmp) {
>> +		if (mtd_get_of_node(tmp) == np) {
>> +			mtd = tmp;
>> +			err = __get_mtd_device(mtd);
>> +			break;
>> +		}
>> +	}
>> +
>> +	mutex_unlock(&mtd_table_mutex);
>> +
>> +	return err ? ERR_PTR(err) : mtd;
>> +}
>> +EXPORT_SYMBOL_GPL(of_get_mtd_device_by_node);
>> +
>>   /**
>>    *	get_mtd_device_nm - obtain a validated handle for an MTD device by
>>    *	device name


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

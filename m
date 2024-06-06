Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CE4C27C52
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jun 2024 10:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9zTIv6qsKpxklYdGyWpPxqp+kq2j1Yrlloa94Q5DiQc=; b=vg4vHZxARWjMrK
	H6dCb29U71l7WqhuXHAURZJ7Htds/wsH6nXP6zlImY/Wy6ZsiRXlHNHl3F/zpmvh/kD/XSIc29fIu
	JE0GwtyYSV8iEV+WpQfE3pa39Cn2N9JR93tB9W9phur5khxkjz/rNxivupMO38szEf4XGcy80KuHx
	INCoF0LCnT/9TMDtYyvAS4QsM2puHilqQGEHdWK5K0Cy0puOWT8mq598MAWMrim3/oCjLHhH+ISkS
	EXvbxFV2bmkANnuzu0dza5RIcaxPIHoWWjjo8FrPgLdPZaMxMadstz5Iqp0xsvMV7OFF9KwNQmQQK
	eysdNNN3gwM1oKaNoZDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFA5O-00000009Kro-3Il8;
	Thu, 06 Jun 2024 10:11:10 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFA5K-00000009KpT-0MQA
	for linux-mtd@lists.infradead.org;
	Thu, 06 Jun 2024 10:11:08 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a68c8b90c85so95518066b.2
        for <linux-mtd@lists.infradead.org>; Thu, 06 Jun 2024 03:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717668664; x=1718273464; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aSSVkWNzaMpCFwtFKNictH+j9mKED2uTD+OcWRnyLEc=;
        b=b/Y5w7Z5WqhZb8+F6AogwYHtpwrIHSw12/j1NWKKKHW9PYI2oxMIBCx8ychQxjvEim
         loJhTwoXlIIifKA+Ne7tfmqDvUfc7G49tPUApsAPLQ/qSRHOpHi0R/8FBX5A+3Bstj7t
         QdI5p3UfIgLnI5xS/3eoaXiZDPTbqPbUNoh6MyugZ1Ijiat2RCvRcVvEBbf4hWal3WbU
         hlQiQCBcJ2589jIdsM3ONyvhap4oKyyl2v2FwwForpIEofMXnlfjwHZJVVQqRqF2tQrf
         TtdYAfL4SdamiVQsX+He87dEwE4FzetZCIRfmakR9L10bFk7KpDFftNqBKlquEE9hHBr
         qyhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717668664; x=1718273464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aSSVkWNzaMpCFwtFKNictH+j9mKED2uTD+OcWRnyLEc=;
        b=Eod8z8ISV5zgUnh/98KqMkvETfGLmSJtQOrclLrGNCwlJ3HJ1uOQ126YufiasLqW/S
         OaaO1/mjmN44e9sfwyv9g9OtH5Car4W0s/JFVGBN50ADXmF7mibhH/5l17nxMkSBXxwe
         D+RqG4N6yGO88CKsg/Cf/JpvMnnLPSdZ98TXZa9cj3e+jFuVc8AWGgwDl9fUZmF7F89X
         taSTBd+hsC7is0tjkb6/9eYQWFOVXPHQ4ZigLIiXlmHde7ocKjsp4m0NYMC5SGP87S5T
         2i9EY2mheSiCtMAw4KzJ1OZk95rvkzoP7uD9NtPsb6lJdHTKOKLSCMgPNBHSSKiLq6WO
         tzNA==
X-Forwarded-Encrypted: i=1; AJvYcCVikTuk2x/pur8apPkGLBDzDPSfSgag2myKJUlwJSSuWQ+l4m/1NW98v8gdInqfCABg3LV9cx3tNLyBZnyiNB2jeCZXaGqUW3YVUbH5UA==
X-Gm-Message-State: AOJu0YyqSCFpDWgiTZl75zEaRCsag7ARrD5ZdfvYcCkSfWRtwEOENmLV
	zMV3W2qTSnCP5vXpWDti4ZChUfvPFAu35dlET0iEbNsxVJwqKIuPWFgMztOx0qs=
X-Google-Smtp-Source: AGHT+IHgvRJe1RUkX2wfx8nHAOigl0CQ6MgWP7QQ3TJu55eCj7i7cFlbxalhn3Ifzf+AU3sxSjybWA==
X-Received: by 2002:a17:906:3544:b0:a6c:71d2:3311 with SMTP id a640c23a62f3a-a6c71d23352mr224386166b.65.1717668664006;
        Thu, 06 Jun 2024 03:11:04 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c84aa8351sm49462166b.142.2024.06.06.03.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 03:11:03 -0700 (PDT)
Date: Thu, 6 Jun 2024 13:10:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Joy Chakraborty <joychakr@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
	manugautam@google.com
Subject: Re: [PATCH v1 07/17] misc: eeprom: at25: Change nvmem reg_read/write
 return type
Message-ID: <2b979aa4-3a63-4010-9670-294ce7624e18@moroto.mountain>
References: <20240605175953.2613260-1-joychakr@google.com>
 <20240605175953.2613260-8-joychakr@google.com>
 <f98a1d8f-e936-4798-8447-c642e8fe11d5@moroto.mountain>
 <CAOSNQF0Qj2CnRDWAGM8Y1wyEdgWP04RDJx1TKO-Ge4nUH=qxoQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOSNQF0Qj2CnRDWAGM8Y1wyEdgWP04RDJx1TKO-Ge4nUH=qxoQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_031106_187778_3AE4F73F 
X-CRM114-Status: GOOD (  33.09  )
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

On Thu, Jun 06, 2024 at 03:12:03PM +0530, Joy Chakraborty wrote:
> > These functions are used internally and exported to the user through
> > sysfs via bin_attr_nvmem_read/write().  For internal users partial reads
> > should be treated as failure.  What are we supposed to do with a partial
> > read?  I don't think anyone has asked for partial reads to be supported
> > from sysfs either except Greg was wondering about it while reading the
> > code.
> >
> > Currently, a lot of drivers return -EINVAL for partial read/writes but
> > some return success.  It is a bit messy.  But this patchset doesn't
> > really improve anything.  In at24_read() we check if it's going to be a
> > partial read and return -EINVAL.  Below we report a partial read as a
> > full read.  It's just a more complicated way of doing exactly what we
> > were doing before.
> 
> Currently what drivers return is up to their interpretation of int
> return type, there are a few drivers which also return the number of
> bytes written/read already like
> drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c .

Returning non-zero is a bug.  It won't break bin_attr_nvmem_read/write()
but it will break other places like nvmem_access_with_keepouts(),
__nvmem_cell_read() and nvmem_cell_prepare_write_buffer() where all
non-zero returns from nvmem_reg_read() are treated as an error.

> The objective of the patch was to handle partial reads and errors at
> the nvmem core and instead of leaving it up to each nvmem provider by
> providing a better return value to nvmem providers.
> 
> Regarding drivers/misc/eeprom/at25.c which you pointed below, that is
> a problem in my code change. I missed that count was modified later on
> and should initialize bytes_written to the new value of count, will
> fix that when I come up with the new patch.
> 
> I agree that it does not improve anything for a lot of nvmem providers
> for example the ones which call into other reg_map_read/write apis
> which do not return the number of bytes read/written but it does help
> us do better error handling at the nvmem core layer for nvmem
> providers who can return the valid number of bytes read/written.

If we're going to support partial writes, then it needs to be done all
the way.  We need to audit functions like at24_read() and remove the
-EINVAL lines.

   440          if (off + count > at24->byte_len)
   441                  return -EINVAL;

It should be:

	if (off + count > at24->byte_len)
		count = at24->byte_len - off;

Some drivers handle writing zero bytes as -EINVAL and some return 0.
Those changes could be done before we change the API.

You updated nvmem_access_with_keepouts() to handle negative returns but
not zero returns so it could lead to a forever loop.

regards,
dan carpenter


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

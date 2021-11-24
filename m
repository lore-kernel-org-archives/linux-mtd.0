Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B30FAC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Nov 2021 17:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qiXUphVmZYwd7Plfgf99H5UDu10shgCAEMSnTb7Keqg=; b=Vgmsir9RdYi3qSnkasEW2zjOsx
	Vmz4OJMh6o2TxBZkc0/YyJI4JH2t2NXfkMtH+yTfwSEQRFGXiF5xQMKqoz7PeIutbi+5sBCqTMDtO
	Q5G9FL5X2l9OF1P0b/K6CkNxxcdXUHY9NSUVDQl3LVenoKf3/H30X1PYwjyk//3Ycd6LT3ig/ydoS
	qRdXRAXH9LYTm8HM1XUt4hyoKvgH8MD480RSPb9egYZW42vBL5ww9ZfcctJ2a0Zv6zsMHu/6/ZRr6
	xObV+U5SLo9Qqf+2UTDVZaiMzKLAkfqLJDjJprHmkheCDqvOHT+xy2WtM7PYxHTlsLfTpr4E8IO4R
	D/KhfAiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpwCc-005PVd-D7; Wed, 24 Nov 2021 17:37:02 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpwCY-005PUv-Vk; Wed, 24 Nov 2021 17:37:00 +0000
Received: by mail-lf1-x135.google.com with SMTP id bi37so9253831lfb.5;
 Wed, 24 Nov 2021 09:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZIcn+RRc9Rps+7b0T+IyJm79uMUpyF3YvcCN2OC7l9Y=;
 b=FLBSX0+olXTOAlp7C+knSf/7drnIn7H/UX7TDK9AoSp4PkuSj60LVuYkKMnjcC9YY3
 ikWuFdLfD1kbuzClK7j2r8uE52m0ciCo0F41wb7XU00orL14Q13pQk+6d+pyM7vdO2QK
 LYUIqSIXIslxr1QmFi4Bl0ADQeiZ5m+/BOBB6vDflgHIEMsk0Q88DdJUo3wVEYI8Pr5Z
 sXvAtuyUfl3+J0677+KUwo73hWKLP5dVAe3qav01Qm9WaXlqZU7Qi87kYoIB9qdRIWxe
 kKTxqqpAJ0WWNVIjLM+Cf5/IG4PS+Rx6faWvmZ4/OGrH5fC0tZn54q+Z8fHjDwt1vOnd
 kYzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZIcn+RRc9Rps+7b0T+IyJm79uMUpyF3YvcCN2OC7l9Y=;
 b=Bd7KnqaSREbd4JtTY86b98oymgntgASvNy10Y+tY9orqiCo+B4Rz04OixIWkkDgJfd
 0dhMuPCSityFdqR6E37Krfy/zyJnFSV4lYa8Rg4S9Cer3g/TFzGm8N6297RxIIYipd9Q
 iezeJgOdaLl6YLRLcx2PsnR4Lg6lYrrggCECrF8n0UEr7+OUnr4wL20Q3nhACRAQwJDx
 XI6FmgpXmYsrGA+4y8jSFCMGOzDENbV0aL2nJN/XNWQFyKHpZqXGMMUkz3QCLweBarqf
 PUrlWRhJvWluM8Ahk2qLzdr8aRPIBB4lyyLsUcptLFkPLlWiOLcFRfqL3+su73C2ZpgR
 W39A==
X-Gm-Message-State: AOAM533pcOCjXawJ2uvn0je3GAVX3zqtZJZX9w87V9bmNs0kOJ34zcZX
 EGzyIQb6q3Kki1/xvnFnKPg=
X-Google-Smtp-Source: ABdhPJxrgNz+71paDdUUv/N7my06bflGW6cF8iV2RywOAz26KaDrmDsPh/ZBuabbAUbFBAGdMU59uQ==
X-Received: by 2002:a05:6512:2341:: with SMTP id
 p1mr16884188lfu.204.1637775417014; 
 Wed, 24 Nov 2021 09:36:57 -0800 (PST)
Received: from [192.168.2.145] (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
 by smtp.googlemail.com with ESMTPSA id e14sm42342ljn.78.2021.11.24.09.36.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 09:36:56 -0800 (PST)
Subject: Re: [PATCH v2 01/11] ASoC: tegra20-spdif: stop setting slave_id
To: Arnd Bergmann <arnd@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Andy Gross <agross@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Baolin Wang <baolin.wang7@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hyun Kwon <hyun.kwon@xilinx.com>, Jaroslav Kysela <perex@perex.cz>,
 Jon Hunter <jonathanh@nvidia.com>, Lars-Peter Clausen <lars@metafoo.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Laxman Dewangan <ldewangan@nvidia.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Mark Brown <broonie@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Orson Zhai
 <orsonzhai@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Scott Branden <sbranden@broadcom.com>, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 dmaengine@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, linux-staging@lists.linux.dev,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
References: <20211122222203.4103644-1-arnd@kernel.org>
 <20211122222203.4103644-2-arnd@kernel.org>
 <1dbe0c9f-e209-49e1-f05c-765d9f9b91eb@gmail.com>
 <CAK8P3a0ojMBib+6UGGxO1GyQ4a22RM3yn79Uv=ixQ2KFUCfGrw@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e455d008-9389-b15b-b2d1-b2193cbd77c7@gmail.com>
Date: Wed, 24 Nov 2021 20:36:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a0ojMBib+6UGGxO1GyQ4a22RM3yn79Uv=ixQ2KFUCfGrw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211124_093659_066490_9DA05D30 
X-CRM114-Status: GOOD (  20.70  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

MjQuMTEuMjAyMSAxOTo0NywgQXJuZCBCZXJnbWFubiDQv9C40YjQtdGCOgo+IE9uIFdlZCwgTm92
IDI0LCAyMDIxIGF0IDU6MzIgUE0gRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPiB3
cm90ZToKPj4gMjMuMTEuMjAyMSAwMToyMSwgQXJuZCBCZXJnbWFubiDQv9C40YjQtdGCOgo+Pgo+
PiBUaGUgY29tbWl0IG1lc3NhZ2UgaXMgY29ycmVjdCwgaG93ZXZlciB5b3UgY291bGQgcmVtb3Zl
IGV2ZW4gbW9yZSBjb2RlCj4+IGhlcmUuIEJ1dCB0aGVyZSBpcyBubyBuZWVkIHRvIG1ha2UgYSB2
MyBqdXN0IGJlY2F1c2UgdGhpcyBwYXRjaCBiZWNhdXNlCj4+IEkgYWxyZWFkeSBwcmVwYXJlZCBw
YXRjaHNldCB0aGF0IHJldml2ZXMgdGhpcyBTL1BESUYgZHJpdmVyIGFuZCBlbmFibGVzCj4+IEhE
TUkgYXVkaW8gb24gVGVncmEyMC4gSSdsbCB0YWtlIGNhcmUgb2YgY2xlYW5pbmcgdXAgdGhlIHdo
b2xlIGNvZGUgb2YKPj4gdGhpcyBkcml2ZXIuCj4gCj4gT2ssIHBlcmZlY3QsIHRoYW5rcyBmb3Ig
dGFraW5nIGEgY2xvc2VyIGxvb2sgYXMgd2VsbC4KPiAKPj4KPj4gLSAgICAgICBkbWFyZXEgPSBw
bGF0Zm9ybV9nZXRfcmVzb3VyY2UocGRldiwgSU9SRVNPVVJDRV9ETUEsIDApOwo+PiAtICAgICAg
IGlmICghZG1hcmVxKSB7Cj4+IC0gICAgICAgICAgICAgICBkZXZfZXJyKCZwZGV2LT5kZXYsICJO
byBETUEgcmVzb3VyY2VcbiIpOwo+PiAtICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7Cj4+
IC0gICAgICAgfQo+PiAtCj4gCj4gUmlnaHQsIEkgdGhpbmsgSSBjb25zaWRlcmVkIGRvaW5nIHRo
aXMgYXQgc29tZSBwb2ludCBhcyB3ZWxsLCBub3Qgc3VyZQo+IHdoeSBJIGxlZnQgaXQgaW4gZm9y
IHRoZSB2ZXJzaW9uIEkgcG9zdGVkLiBQYXNzaW5nIHRoZSBJT1JFU09VUkNFX0RNQQo+IHZhbHVl
cyBpcyBjbGVhcmx5IHdyb25nIGJ5IGl0c2VsZiBhbmQgbmVlZHMgdG8gYmUgcmVtb3ZlZCwgdGhv
dWdoCj4gaXQncyBub3Qgb2J2aW91cyB3aGF0IHRoZSBjb3JyZWN0IHdheSBvZiByZXF1ZXN0aW5n
IHRoZSBETUEgY2hhbm5lbAo+IGlzIGZvciB0aGlzIGRyaXZlciBlaXRoZXIsIHdpdGhvdXQgYSBE
VCBiaW5kaW5nIG9yIHVzZXJzLgoKWWVzLCBpdCdzIGluZGVlZCBub3Qgb2J2aW91cy4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==

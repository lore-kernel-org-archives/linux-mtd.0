Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F53CC5321D
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Aug 2024 19:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1pplVC7ie5pV2kDf+kMktntPXUf/OYaFGnf/iSjkg2Q=; b=4DYV+M4D/6BSHl
	s9zw4c13jRiabBQCQ6pfm0BG6GCliWRCWzAoIAryxckqjFIJ+APA+mHQujjG3uwMBDQcj8TT3KGSN
	PevTNueO11Mg7MA9dUsSaxP+AAVhoOdMen3C945Ms5sb4Si9D+2UJ4DOJCrB9nerVvlFd3RlAnQl2
	wwYI4UsNTiG89Tt3z23iqcnhokAZ0QSlEpxitcZgZLBEwfEI6H+FqCKu2NM963lW1fsWScn1P7mR/
	KVO0uAZiVC+65aIGa3qFHCdZua/lJabufwwli0ZiMkkzSlp56GdVpWpyaaN8dVd8a1FALMlRGFWW8
	ku3M1HZ/ZDBxv/9/xvag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfP8V-0000000FfWt-0IAd;
	Sat, 17 Aug 2024 19:30:51 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfP8S-0000000FfWM-3Nt5
	for linux-mtd@lists.infradead.org;
	Sat, 17 Aug 2024 19:30:50 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a77ec5d3b0dso344239866b.0
        for <linux-mtd@lists.infradead.org>; Sat, 17 Aug 2024 12:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723923046; x=1724527846; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZJC795JTs2Ekt9gDVD2gEbeCAt29WPxzke9UPmqpJtU=;
        b=O/Q3HEbU+/bTvO5fpj9jrR8GhnxUmfdh0vX6wks44TePpJnnWdaeI36wdTquAX9Ive
         NL3ZaOu2oDFXfN2Jhf6jT3N4o4cmI2bYW/bhspX5hxxHcsHPD8yfR061K2NxyRHanEqo
         wJY05j2cp5NrNuMuDePMgJZVkaNKSBTq6hUVswr0vhnrdF5vWrrccoBwEBT7tuz5sPCM
         zjEenDokBfeDSxY/VjY+6uqMEEXWNmHaZeigIFSTVFf5j0vsy4oSS4oeSka7mk3lAleR
         ITj/rHRDr/uXkqIzcHhnhxjKC4cTb7p+IgssQEXJ0jZRxcbeauR/nHRdbsEh7JfXdOde
         0M3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723923046; x=1724527846;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZJC795JTs2Ekt9gDVD2gEbeCAt29WPxzke9UPmqpJtU=;
        b=HWFFmyzimuehpRRDOr4iUOofNv25Zrm8zAn3lIK9lcHO9FrZ1v0g0gtC+037RDmGuK
         GW2lyYdFWpjQmOsxqtVy23iEZKra/h32FVSDF9Dv4qyvXjexHNvRCjrkzGzZZz/jwYtj
         AokICriRuIgDYvI2ukwg7zq3+gJ/p+NZbTql39b2/zyWFVh5MVRvsN5Q4itbFGulnzEA
         IUIkQMSpqFLJwK6lcEBAymcyhb3V9REaGtAVkrYguVE7OBCfA9FgIBO18AHzVosQpOqu
         X8dWlcp/vUxw/TrlpO3CJlMosq0plcitvAZW40v/ihSs/t8hr16HMgpLyNJsyksSX8Qz
         v9WQ==
X-Gm-Message-State: AOJu0YzrH5weIJoere1KWgfhvc4qUh/z83CCRXl4qMlxHL66i33EPZZc
	dZ+K+D3Dvzhv03Cpt65jQSPbJN3g9BpAMTtX4z6AnSV2F3V+yM+9FKX7Sm8iHKPnYlH8tb4wPVS
	DnShtnoM7KzXgZuWc1dkGDO9naw==
X-Google-Smtp-Source: AGHT+IFbUR16kAsVyKpURPOC69k6sALRGq1kb8PlxvVjzFANtYa6tdmHkwMpCTolk7kRmB7moSOMuF6h0epC6JVlrkY=
X-Received: by 2002:a17:906:d265:b0:a7d:3a85:7a3e with SMTP id
 a640c23a62f3a-a8392a494a3mr425085466b.59.1723923045436; Sat, 17 Aug 2024
 12:30:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240817124140.800637-1-erezgeva@nwtime.org>
In-Reply-To: <20240817124140.800637-1-erezgeva@nwtime.org>
From: Erez <erezgeva2@gmail.com>
Date: Sat, 17 Aug 2024 21:30:08 +0200
Message-ID: <CANeKEMO+8=fVx9EXpPoXaLPen79W=7kBTghw3L+9dLwOFOWWoQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Add support for SPI-NOR Macronix OTP
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Rob Herring <robh@kernel.org>
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, linux-kernel@vger.kernel.org, 
	Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240817_123048_871659_1F4CF691 
X-CRM114-Status: GOOD (  22.27  )
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

Hi,

Looking in Documentation/devicetree/bindings/mtd/mtd.yaml

I see you are defining OTP in a different way, as partitions.
Each partition is an OTP region which can be user or factory mode
(since many chips do not define or enforce it).

While I try to define the OTP parameters.

I wonder what you think?
Should the parameter be in the partitions?
Do we wish to support asymmetric OTP?
I only found asymmetric OTP (OTP with different region sizes) with old
chips. But perhaps I missed it.

Erez


diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
index 6e3afb42926e..5fde51309b93 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
@@ -90,6 +90,47 @@ properties:
       the SRWD bit while writing the status register. WP# signal hard
strapped to GND
       can be a valid use case.

+  opt_n_regions:
+    type: u32
+    description:
+      Some flash devices need OTP parameters in the device tree.
+      As we can not deduce the parameters based on JEDEC ID,
+       or SFDP.
+      This parameter indicates the number of OTP regions.
+      The value must be larger than 1 and mandatory for OTP.
+
+  otp_len:
+    type: u32
+    description:
+      Some flash devices need OTP parameters in the device tree.
+      As we can not deduce the parameters based on JEDEC ID,
+       or SFDP.
+      This parameter indicates the size (length) in bytes of an OTP region.
+      Currently the driver supports symmetric OTP,
+       which means all regions must use the same size.
+      The value must be positive and mandatory for OTP.
+
+  otp_offset:
+    type: u32
+    description:
+      Some flash devices need OTP parameters in the device tree.
+      As we can not deduce the parameters based on JEDEC ID,
+       or SFDP.
+      This parameter indicates the offset in bytes of
+       an OTP region relative to its previous.
+      User can omit it if the offset equals the length.
+      Or in case we have a single OTP region.
+
+  otp_base:
+    type: u32
+    description:
+      Some flash devices need OTP parameters in the device tree.
+      As we can not deduce the parameters based on JEDEC ID,
+       or SFDP.
+      This parameter indicates the base in bytes of the first OTP region.
+      User can omit it if the base is zero.
+      I.e. the address of the first OTP region starts from 0.
+
   reset-gpios:
     description:
       A GPIO line connected to the RESET (active low) signal of the device.



On Sat, 17 Aug 2024 at 14:42, Erez Geva <erezgeva@nwtime.org> wrote:
>
> From: Erez Geva <ErezGeva2@gmail.com>
>
> Add support for SPI-NOR Macronix OTP.
> And add MX25L12833F with OTP.
>
> TODO:
> - Test OTP with 'flash_otp_write' and 'flash_otp_lock'
> - Question: Do we need documentation on new DT OTP parameters?
>
> v2:
> Improve description of mx25l12833f.
> Add note about mx25l12833f using the same JEDEC ID as mx25l12805d.
>
> v3:
> Improve description.
> Rename _nor_send_cmd() to spi_nor_send_cmd_internal()
> Remove MX25L12833F specific changes.
> Add reading SFDP to all Macronix chips.
> Add support of reading OTP parameters from device tree.
> Reorgenize patches to 2 SPI-NOR patches and 2 Macronix patches
> Testing with MX25L3233F using BeagleBone Black.
> Test results are in "mtd: spi-nor: macronix: add manufacturer flags" patch
>
> Erez Geva (4):
>   mtd: spi-nor: core: add manufacturer flags
>   mtd: spi-nor: core: add generic functions
>   mtd: spi-nor: macronix: add support for OTP
>   mtd: spi-nor: macronix: add manufacturer flags
>
>  drivers/mtd/spi-nor/core.c     | 166 ++++++++++++++++++++++-------
>  drivers/mtd/spi-nor/core.h     |  34 ++----
>  drivers/mtd/spi-nor/macronix.c | 186 +++++++++++++++++++++++++++++++++
>  drivers/mtd/spi-nor/otp.c      |   6 +-
>  drivers/mtd/spi-nor/winbond.c  |   2 +-
>  include/linux/mtd/spi-nor.h    |  10 ++
>  6 files changed, 336 insertions(+), 68 deletions(-)
>
> --
> 2.39.2
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

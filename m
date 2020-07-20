Return-Path: <SRS0=lrxf=A7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA86C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 18:14:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EDA122B4E
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 18:14:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aoZ4ZkEF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=pensando.io header.i=@pensando.io header.b="Sv1UpUeB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EDA122B4E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pensando.io
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bdTlydlZV4HVPmic39gijFMgMwZbahVw/O+UmbvN3bo=; b=aoZ4ZkEFo3Xi773cXZwW9sEIMg
	3MDRAl03hYEM5Iwc8cEgUvj6eUcbz+tYEdciX3+GyewQbcXU6/wIv6J7SSxudgScdqQrW53rpTDQm
	YS+35Brk1aohl7KHg4fxheIwSV31esTsKMrZP4N5UFTLUrIqf/FLTmR3EWyGJrQETEerOP0M6WCzf
	udCgB+kM63FKlNS7wPWTAiFxj8UqSbHCCT7WJF6qQWRPQhdoKWbqqN3Mc1SUbr/9fibq6sU8eb9nC
	m9LekXe1SSPA/d8oBmxvyTOAU+/pYu+9aXHBP/X99uCDHWz5+dPw8/ZOsKY8ABonl1UIG6kTCcnUT
	8gCgz6xA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxaII-00080D-Fe; Mon, 20 Jul 2020 18:13:42 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxaIG-0007zm-GR
 for linux-mtd@lists.infradead.org; Mon, 20 Jul 2020 18:13:41 +0000
Received: by mail-wr1-x42d.google.com with SMTP id q5so18765135wru.6
 for <linux-mtd@lists.infradead.org>; Mon, 20 Jul 2020 11:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pensando.io; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=OTx3gUpeCileo5YzCAI6W0r/900C1dG2QEZ3QHzoJ1w=;
 b=Sv1UpUeBKN5kRqEaGCR7JQ7Kcyk0ynfYl/PA4vywnpzZBWEz1BCukCmT7fH2EKkcXx
 VO5hAzkxXDDf2qsu8UztG288Uoms2li57KdEPnOHSbJDk7CzW75KX+Uv32zjoHPYj7WQ
 BmvKjNvk6O2o3LqyCwR5xNP6GV9pluBl/dzE3FnpGqpU2pw8XCSmPoDht1A78iweB41G
 bKbZ+tupmPTpVL6ijSevcT2mIYvz9yWU06JabOos+rOP7A7R4dViu6C8Tq+arKE551Ov
 ygcN/rdW6+qkAOWVR8www274L4pgV8MxpBBvL8sHn+w+3S8VjsIIQzuJSc1/hwcVhbwI
 mj2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=OTx3gUpeCileo5YzCAI6W0r/900C1dG2QEZ3QHzoJ1w=;
 b=j1u6ntKUaGgEam4KFGFYNKPNS1gVYBrysLq3kSeoHGnOxLzGZ50/tzolBRogYhHaNd
 Cm4AK+PaNGQEdEqqczYOVwtBC7Avmmx1HCDSpcOftPVNzbzzslApKq4i3KLrH6istJA8
 jERlZPYKZ/mYgW2squo6BMcJ/GQCClFx8U4nXAYEFkp5ZZfcCte8yZ8VMc9qrVuGPvbs
 rm8y/2lgm3Nf+TDfr/2NdCEwL7FKPeCrZZ4M5mAkzl4k4rJW54R2ab5LHGIYfDqDhOuA
 oqTDjHK4WbdetRdFeKYtvWjHmDvzJIsEKU5iyKeUNIFUoNZ+gIbArI95f4Nth22pWT90
 8Acw==
X-Gm-Message-State: AOAM533o+6r4UBkRX4nsRqfXobaLg4OrwlL9Ep0ExAeC/dn8z009DGur
 6Iv8MDSRDjnqEDj6snvRebUL+VL8mLFH9TgHEEQFj1b85J8=
X-Google-Smtp-Source: ABdhPJyRZZ5qg8H5/Et04dALMYFZ5QsuHXgQO/HWWjCkwjwAbqo3dBhXXk6u60tAmZKsqy0wKosgMcUWQxED2+ODPDs=
X-Received: by 2002:adf:fc06:: with SMTP id i6mr5048590wrr.79.1595268817464;
 Mon, 20 Jul 2020 11:13:37 -0700 (PDT)
MIME-Version: 1.0
From: David Clear <dac2@pensando.io>
Date: Mon, 20 Jul 2020 11:13:26 -0700
Message-ID: <CA+nMikGSSc5NA80Z89fz4GCh+6Ux2Pr6UyjB5n+qoBkiOqAh=Q@mail.gmail.com>
Subject: [BUG]: spi-nor: spi_nor_init() fails when SR locked
To: tudor.ambarus@microchip.com, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_141340_843817_4D176E23 
X-CRM114-Status: UNSURE (   7.85  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Tudor,

I'm seeing a change of behavior in spi-nor/next vs. my older 4.14
kernel w.r.t. how SR lock is working.

In my system with a Micron mt25qu02g, I'm using the hardware WP# to
lock the SR.  When hardware write-protect is on, at the next reboot
the kernel rejects the flash as it cannot unlock the whole device.

I traced the problem to spi_nor_write_sr1_and_check(), which is
writing to the SR and reading back a different value (as the locked SR
bits are immutable).

Call trace:
 spi_nor_write_sr1_and_check+0x68/0x70
 spi_nor_write_sr_and_check+0x34/0xd0
 spi_nor_sr_unlock+0x108/0x230
 spi_nor_unlock+0x54/0x80  (via spi_nor_unlock_all())
 spi_nor_init+0x94/0x100

spi_nor_write_sr1_and_check() is returning -EIO here:
        if (nor->bouncebuf[0] != sr1) {
                dev_dbg(nor->dev, "SR1: read back test failed\n");
                BUG();
                return -EIO;
        }

In my specific case Linux doesn't have (and cannot be given, for
product security reasons) control over the WP#.  In any case, I don't
think a write-protected flash should be rejected here.

Can you suggest how we might proceed?  The way WP# is used is
board-specific so perhaps a device-tree property of some sort in the
flash device node can inform the code to do or not do the
spi_nor_unlock_all()?

I can take a look at putting a patch together if you suggest an
acceptable mechanism.

Regards,
David.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

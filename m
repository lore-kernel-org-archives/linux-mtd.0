Return-Path: <SRS0=norF=OG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_ALL,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0014FC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Sep 2021 19:39:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C52661130
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Sep 2021 19:39:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4C52661130
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=3e8.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:Subject:From:References:Cc:To:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=H/SokR5aWjhg0nU4x60TrIgFeTePEABPnGQngHowFxg=; b=nGY5+BQKTw+YjVYw/15GxJC7P3
	AbA4xsw1L3um0F9Fs/brNGlSPadxyw8MJvr6Lr86vgHRoNZvFDB5DADduxvNasm0eiytxA4XqhFOE
	Dt9dYJSEuJisreU7hT8cKdUPg2YW/0b+CS/XU/1jaQabkKF0OEksLDWuCvgJvZNHJ4hENCIUXVRy7
	GhiwRklM7VxCR6wp3VkOJT8jUGsrKR7SArsMhEwOn5kqEOMqeNjIrK17fe8U1/Bl2dPfqX1YeSX7P
	K1LsqF+nBQYxtbZRD7NDpgK80rXALSwRbNwG8fU01XHFfWRzIG3+NXr5IgJlO3PWeJQTHV3y2np8R
	61hGjYzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQxDh-00CGdv-CK; Thu, 16 Sep 2021 19:38:53 +0000
Received: from srv4.3e8.eu ([2001:67c:12a0:200::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQxDZ-00CGcm-PG
 for linux-mtd@lists.infradead.org; Thu, 16 Sep 2021 19:38:49 +0000
Received: from [IPv6:2003:c6:cf12:5a0:9abc:9583:6f0a:c734]
 (p200300c6cf1205a09abc95836f0ac734.dip0.t-ipconnect.de
 [IPv6:2003:c6:cf12:5a0:9abc:9583:6f0a:c734])
 (using TLSv1.3 with cipher TLS_CHACHA20_POLY1305_SHA256 (256/256 bits))
 (No client certificate requested)
 by srv4.3e8.eu (Postfix) with ESMTPSA id 55F66600A9;
 Thu, 16 Sep 2021 21:38:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=3e8.eu;
 s=mail20170724; t=1631821108;
 bh=a33GpWWnFT3v41eI/sIwgek55Y5I8bXRNKTeri1tpmE=;
 h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
 b=pi9e29V+QW+sGLIt+qY+Buh/nSOq+Iz9Nx2eZ08Wi/YBSgkw9NqITMl8jZFRIDnJ3
 +HtfAbhOxK6IAwBTdl1Xa9gO/Zdp6pmJsurSjkbMgOuSiXMUF6mvwj1Ukc7CuNMBSV
 AHuo3JJsjqygK5LwgTmljN0GRnGk1YuHXOnvNgQBSHEmv8ziKqxgi5pOcYnLAyvruh
 KY5cAEmY9o2a+duv70z0Lcs+jIijTM8PoUem8+hF8z5SMYjBTMQQEuffPp5xRNytID
 +G0czFuVrEOpHGf5W2Kp5ps6UDG0wMxCiejUqa2bCjr9iQ0J9WAUjGB3rc10CMb4ik
 PSD4LQukH/vYg==
To: Daniel Kestrel <kestrelseventyfour@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210808072643.GA5084@ubuntu>
From: Jan Hoffmann <jan@3e8.eu>
Subject: Re: [PATCH v2] mtd: rawnand: xway: No hardcoded ECC engine, use
 device tree setting
Message-ID: <51f2ebf4-6df1-eba5-99f1-1ec88e475d20@3e8.eu>
Date: Thu, 16 Sep 2021 21:38:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210808072643.GA5084@ubuntu>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210916_123846_161981_EBF6752B 
X-CRM114-Status: GOOD (  18.48  )
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

Hello,

Configuration of the ECC engine type using device tree has actually
worked before. I am using OpenWrt on a Fritzbox 7362 SL, which has a
Micron 29F1G08ABADA flash chip. The bootloader of the device uses on-die
ECC, so that has to be used for Linux as well. It is configured in DTS
using "nand-ecc-mode = "on-die";". This worked fine with kernel 5.4.
However, after switching to kernel 5.10 it is ignored and software ECC
is used instead.

If I understand this correctly, the situation is as follows:

Originally, xway-nand did set defaults for ECC mode and algorithm, but
different values could be configured using device tree.

Commit d7157ff49a5b ("mtd: rawnand: Use the ECC framework user input
parsing bits") broke these default values, as the ECC algorithm is now
unconditionally set from the user configuration in rawnand_dt_init.
Previously, the default value was only overwritten if the device tree
actually contained a value.

This is fixed in d525914b5bd8 ("mtd: rawnand: xway: Move the ECC
initialization to ->attach_chip()"). However, this makes it impossible
to configure the ECC engine type in the device tree, as it is now
overwritten by the default value in xway_attach_chip.

I am not sure if this patch is the best approach for fixing this, as it
would again cause breakage for anyone who relies on the existing
default value. And this kind of breakage seems to have been the reason
for moving the default values to attach_chip in the first place (see
https://lore.kernel.org/lkml/20201105084939.72ea6bfd@xps13/ ).

As similar changes were applied to other NAND drivers, the same issue
probably also exists there. Maybe it makes sense to add a proper fix
for all of them?

Thanks,
Jan

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

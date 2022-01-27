Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D869EC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jan 2022 03:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zrGwJmGZnFX32yDTnPwK/bNEfaj7eOBSpqnM1JypfCw=; b=EUKgcvdIn9/b5R
	tVLMZIGgdqZMBVN5eqt60o87szLEr9rbCXZZGXYzWv/OIfv6aFFNz30Vk8i991x0ZZ07dOutFKn6p
	M3lAzMeBUBWSmGFW8nam3Mc9Iu3AK7ao3B3DNtUFC6z5GUAfAGkNPgdhvGtKVVqAEfhrmN9Zx6Afc
	dcMRVj/K40zVsVda2R96EVtdEmoZ+iknHxc33ISv/q3W8RoVsUVzwSsBHu7rJGdvEtZxsYGVTrNIq
	Bt/Xe1ULx41NDoS5IFZyhBhLIFVMTC2awFMOAumUB8wESRd18JtioULX0hv/l/Wvo8VJwDaQf9I8i
	YfMEVb7bafnkfJ+hsOeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCvVg-00EEvl-7m; Thu, 27 Jan 2022 03:31:44 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCvVd-00EEuZ-Of
 for linux-mtd@lists.infradead.org; Thu, 27 Jan 2022 03:31:43 +0000
Received: by mail-pl1-x635.google.com with SMTP id j16so1370624plx.4
 for <linux-mtd@lists.infradead.org>; Wed, 26 Jan 2022 19:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hRMJPfL0SdlUA7JGQQjBSw0AH6s07oqCQEUd/TBpC3w=;
 b=ERgk+by2NOrioElQxrR9n30LSsNqLx1xgpdw6eLUwxZ4cxVwTTZ85jCKJY1Rjfdmn9
 f2jlNkWWQZyCA2Pak8xGNdy8WYx8DYnxmg5mQx4btafQJ+X013Uo1W9Nlh17wcH3Wmy0
 ZUN+aBEFmWlzvF6qzEdL+ITtOPlLO9hg0UUxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hRMJPfL0SdlUA7JGQQjBSw0AH6s07oqCQEUd/TBpC3w=;
 b=mfJg/CdnZizusRpBaItAEznykccIaHn1/M2V/Cpqz4DdRTlI8p0tSW5sJacLokha32
 k+k63kFesNaVRBrX4i+5JDLldFuuVTlosD49CbEAJg07RiIunIIHcSX2dI8qeyOY3TAQ
 jQp1GaM9eHs6LoOgX1Eufzgq5ilMakHUOAsJ3HjUl5zD5L1FpTMzOUyyjdQ/K3DI+ygG
 rFiKowDOMMLY6VRnOY3sJY9yCxKubMLjcnr+1rsR/kca+GgpRUUSOcKIv3HktzmdSApH
 2Nzg7LPvoaCxXWi7oLJC9a5Gp6o/+sbKnzHQhSfwvvoIwJep6ILWzmrrUtaxiRojHa5b
 a/Cw==
X-Gm-Message-State: AOAM530xZEqfTQHx+ZX4gNGSk+g5YMaBDR3GZSrIra+vakH9tZ7Xx9Ha
 bvMrfrtXyzfdwuKnSUPN0lIHN+sljgN6VkRTB6tevQ==
X-Google-Smtp-Source: ABdhPJxKRT2Knduyi+0+xZ9ujyEdfjCOAaHqxADPRSFHYd5hkOGOPM7Zls/S+pQZS45I+0LR+gB0/NoLEta49bMzqb0=
X-Received: by 2002:a17:902:d512:: with SMTP id
 b18mr2205929plg.24.1643254301062; 
 Wed, 26 Jan 2022 19:31:41 -0800 (PST)
MIME-Version: 1.0
References: <20220126073227.3401275-1-chentsung@chromium.org>
 <8625876c695685fc5409997403130194@walle.cc>
In-Reply-To: <8625876c695685fc5409997403130194@walle.cc>
From: Chen-Tsung Hsieh <chentsung@chromium.org>
Date: Thu, 27 Jan 2022 11:31:30 +0800
Message-ID: <CAMu4cy5onQ2JNKhoLVmR4Nb7Cqv2L59SoE=2Q9CK8bhfPvvHTQ@mail.gmail.com>
Subject: Re: [RESEND PATCH] mtd: spi-nor: core: Check written SR value in
 spi_nor_write_16bit_sr_and_check()
To: Michael Walle <michael@walle.cc>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_193141_842837_CA35730C 
X-CRM114-Status: UNSURE (   6.84  )
X-CRM114-Notice: Please train this message.
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

On Thu, Jan 27, 2022 at 6:38 AM Michael Walle <michael@walle.cc> wrote:
> Out of curiosity, on what flash did you discover this?

It's Winbond W25Q64JWZPIM
https://www.winbond.com/hq/product/code-storage-flash-memory/serial-nor-flash/?__locale=en&partNo=W25Q64JW

We are verifying the write protection on W25Q64JWZPIM and run into an
issue that spi_nor_sr_unlock() always return success even if HW & SW
write protection are both enabled.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

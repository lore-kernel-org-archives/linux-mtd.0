Return-Path: <SRS0=LIjS=HR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92B57C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Feb 2021 21:54:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C3C764DEB
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Feb 2021 21:54:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C3C764DEB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0APfASsMCdHbC2h7ik5S0BbL8J+6u3XKWKOvCwETbIo=; b=hH98V3ZYza3Yi+zCwJ12sgJ9OH
	mMga0BeQNKLa0/FVEyio8Gyn+LF24Xq+X347ZS/1/R7/i78Cf51HB5UHXi9oPO2spSdgQDxM6aGAf
	5xrv3GJTvIUlb3m48pfcB8txmmNby1TxfQjcYca82L+4Dj2oCLT9f/QW4nJYxxFDHpddqcblh9HIp
	J7KcP4wp1eQr2uEREpNe3mI34Sz68JjSf9obvCCkk11bvmtV1juK1PAZxru+23rwqUwxgvpxbXkQ3
	Qx9mM1xlhgQT8jxYAnQvW1LMUabRxaQ/35WQtSw6dHoMSCb7DFv1rNS8F0hCfYeK6j06hWjDdlogL
	nN/AWt5A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lBloe-0005Ld-Ui; Mon, 15 Feb 2021 21:54:00 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lBloX-0005LD-TA
 for linux-mtd@lists.infradead.org; Mon, 15 Feb 2021 21:53:55 +0000
Received: by mail-il1-x134.google.com with SMTP id p15so6681552ilq.8
 for <linux-mtd@lists.infradead.org>; Mon, 15 Feb 2021 13:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=G7aYhk1dlWAIhbPQVOtjpC1Huryk5nNL6FaE1qWjBdE=;
 b=birm0tjBL5LR9fIpAYuQ8aA//UyB07yYz7RMUhDuLH+ITz9Ibku2TpL4s4ahEF2Fh+
 jG+LPv567p+B2cllv0GispfwvBhVvpRw2EtBogAkJOydRFay9WROE5Q9d1ZldJBSFEWZ
 yML7qvqRF+jCj2oLXQcicw+3XEfLqTe0g4/ZQkPyc9ALDz5LoL6UXabs0JcJE0JIZiQV
 M0WGmKthKwXUUebdJgZMVCvVMuK91mbe0foVg/bGHn+K4d1Fnx1PgGBN1oKKzddFf0IV
 rPWzLRqz6ZMR/41ECcFqgUWUCRFUQXapjnPjhN1hPz5UmGJAmW+0Db4kzZo5ln33rV9V
 FrGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=G7aYhk1dlWAIhbPQVOtjpC1Huryk5nNL6FaE1qWjBdE=;
 b=Xx2PrGP1jsbsjvfNIpOWNdAPtEkL7pN//uPTyZHkG3Rilz8ltuf+Yi0EBkimunQ/fn
 wys5MKozJAgN+ywYJ2vPrT+ey28eKSKpw02zDgMOraXa0+nL2fdNSzJANzdu6SAlpZgr
 tSvHiH2OKMcS9wtUUfos+nG/kqO5c/Vk2T12bboQO8raLqvlocsiZ4d54vAWAwmpLfc+
 m/igQzvj9yMlGo63frJ4tdToHGYCKB6XVbWZrOLWj2uzHAy8hiMr5KoUpxIf8XWJlCd9
 i6XXo40E5IZ4+KSH+E0LpmA/3CEBP6j/xBwCBFf3ghv3VKv7Kw5Kfc5KcOhUqy2l6avx
 F5Aw==
X-Gm-Message-State: AOAM532ue5/9R/Dv3JmZ/ICD/jb1zSu6JUrjad6PBrkvcJSCId8VtFNw
 q5y6M7GHwKvwRPz/dhRvMKCrmxcxHP8NYqg6VE3OVXHJNajkTQ==
X-Google-Smtp-Source: ABdhPJwJO/fxTjM1a8BMRfMhEZFs+NHugUiMxtDVNdVv9BqhyZyBnWj2dRdX1n6RWCG0kXBLZjjL2E/NZ3yqjxrqqwQ=
X-Received: by 2002:a05:6e02:48d:: with SMTP id
 b13mr4567270ils.98.1613426030503; 
 Mon, 15 Feb 2021 13:53:50 -0800 (PST)
MIME-Version: 1.0
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 15 Feb 2021 22:53:39 +0100
Message-ID: <CAEyMn7ZEp9f1SuE6umRDWkr8bVT5hdRi-4F3+G-GP9anuGG1Bw@mail.gmail.com>
Subject: spi-nor: maxronix MX25L12835F support
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210215_165353_986726_83E99021 
X-CRM114-Status: UNSURE (   8.29  )
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
Cc: Michael Walle <michael@walle.cc>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi all,

I faced an issue with a SPI flash on our board. We use a macronix
MX25L12835F [1]. Unfortunately this flash has the same JEDEC ID like
the MX25L12805D [2].

The newer MX25L12835F has support for dual/quad read mode and RDSFDP
while the older doesn't.

I thought that I could do a fixup with a device specific
post_bfpt_fixups() call but by now this seems not possible. The older
MX25L12805D has no flags set that allows a call to
spi_nor_sfdp_init_params() and implements the fixup.

Has anyone an idea how to solve this?


[1] https://www.macronix.com/Lists/Datasheet/Attachments/7397/MX25L12835F,%203V,%20128Mb,%20v1.6.pdf
[2] https://www.mxic.com.tw/Lists/Datasheet/Attachments/7321/MX25L12805D,%203V,%20128Mb,%20v1.2.pdf

Thanks

-- 
Heiko

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

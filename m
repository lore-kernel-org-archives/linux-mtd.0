Return-Path: <SRS0=1wRa=2N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,PDS_TONAME_EQ_TOLOCAL_SHORT,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9777C2D0C0
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Dec 2019 23:38:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94F6B2053B
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Dec 2019 23:38:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DtWj1lCK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pffHQygZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94F6B2053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Ko3CGsELXsKQP8aNqyMV1UucMJbWgWLN5ZRq7I14gZQ=; b=DtW
	j1lCKmcwin80yr4S5+460oMkoB7zs5zz//J/7FAmtJUTPw/YLIN8AqJ8J+/OYsTvso3BIP0Y0Is9S
	R/WpSGOi5dIZ2JTMSFRPSyfzt3G5n8armEq9gKnEy/YMk8BZ8OILftc8QFQoNuhCs4gvrKt0Xt/5u
	DdNt+OHiKN5gA4IebLD/u5KXdBCAIBcZR0SC4V3g5AgnmTBDmrBtsMksYnVDVcn2/7C4WdVissRHs
	OJ6y3usHzYZIk0dSrthKjvPv5JFy/84hVh5MxzpmeQWTZv9390hd2eFoMfcgUpD9HYHkaG893WqUQ
	vDXNZ5bEzwBTKXvS5l/jC8uDmhogQlQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ijXHP-0002vp-Hm; Mon, 23 Dec 2019 23:38:27 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ijXHM-0002vY-7R
 for linux-mtd@lists.infradead.org; Mon, 23 Dec 2019 23:38:25 +0000
Received: by mail-io1-xd33.google.com with SMTP id z8so17660640ioh.0
 for <linux-mtd@lists.infradead.org>; Mon, 23 Dec 2019 15:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=ziPC4Nnj42sXKm1I6RIXQtDtIv8zQ8kB3i76ZzXIOCU=;
 b=pffHQygZ9vAyGJ2l7soMVnQVdCLV0TP8Jqp29aTwcd/0W+PGaYH3GOCVWeXh7C5hql
 K2C5GW0uKkx4D9LHQzOEjYjVFErbq0yxsiAuF8+XIQHeLHh7SBjpMmSAADppdCN67iYN
 J9b5Rq5yVfWnK342w8fPFbPh0QJ/+s4msUzDHpFs9awY0iygu2ds9sel9Qp8t2RLKvWW
 SpCVDVTJZp2lQXXptZel88OXSJwLDdftA7EE9qASZi94hvvNWxmvmybL+4QmnivUxf1d
 ALCvvQ7ShMcIwP42qNxZ7uRz3KKX2t3gMPMBWnIQPE/MEHDP/f/IqNQkK/sdKvzrAcsZ
 lxeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ziPC4Nnj42sXKm1I6RIXQtDtIv8zQ8kB3i76ZzXIOCU=;
 b=cCUrwHNZffOxhewBTR7NVFPHy0qwrs+DGiLDbuHyiWAydfWJxwrLriKGxtcjKwcMa3
 jsd0VaTaxgeyFuHJ4QqvHFM6/nyDRNfZykzLlZph+hpU5fBX8IonCVphwEzVh10r4HBl
 ewJ7ct8fBlH9G2KaotOrJgg1Yn6fLJLbet1Uc1cN2C5KkHMqxm5Iaw8231jahIzXGMwt
 k02KVsi51nG+IUNWqCnV5kYh8z84rizqL/hOokajeMuZR4b7Epo3sw77aMmLNUkiELF6
 4Ta0YUZmh3jmzpd6udPDQ2/IRfx/i9je617p9G3Lest6Uo7ijl9WX3IoHhhQeA2h7Zuc
 paSA==
X-Gm-Message-State: APjAAAV2eSiTajs3/LnOPFDII6hvwusrqxYuycETcZFSvYH+F0KM3YIr
 /n05Hzjugof39R+d+oXyEl+TBBz/Ih8TnmmfjiUovw==
X-Google-Smtp-Source: APXvYqy6wjUOGwpRBMc3CdHArifzljfn9F6AzeQuDkU1uvyHuTxf8HlpmIYgcAoQ9ul5tP5UJi0j7vz2l5YHSpJra8Q=
X-Received: by 2002:a02:2a8e:: with SMTP id w136mr6488258jaw.117.1577144301454; 
 Mon, 23 Dec 2019 15:38:21 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ac0:aafc:0:0:0:0:0 with HTTP; Mon, 23 Dec 2019 15:38:20
 -0800 (PST)
From: JH <jupiter.hce@gmail.com>
Date: Tue, 24 Dec 2019 10:38:20 +1100
Message-ID: <CAA=hcWSZHUuqaEbMUUdP5XHmMHVs958vnZT7Jn92zJMDOjKjmw@mail.gmail.com>
Subject: Can UBIFS volume partition kernel /boot be created inside rootfs "/"?
To: linux-mtd <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191223_153824_267618_79F586A7 
X-CRM114-Status: UNSURE (   3.77  )
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

Hi,

For using ext4 file system in my laptop, I can create root partition
in "/", then boot (kernel) /boot or other partitions such as
/storage/, /data/ under root partition "/", does that work in UBIFS
volume partitions as well for my iMX6 device with NAND?

Thank you.

Kind regards,

- jh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

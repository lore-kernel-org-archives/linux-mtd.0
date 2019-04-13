Return-Path: <SRS0=Ld/O=SP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E453C10F11
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Apr 2019 15:36:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26871214D8
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Apr 2019 15:36:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Epdxbyyp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mail.com header.i=@mail.com header.b="oIN8gLRQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26871214D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:To:From:Message-ID:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=LolBgDy7bDY5GmZ8EaIE7yZBZvhzcp1QZXUDArBH8/0=; b=Epd
	xbyyp8oga0ZHD8RVQizBwMXpgTVqq8uMUZ1AI5RGYMPVz1s3NTEq98mvXrHzJudAmjaQVpULQajjm
	AaPrkJf/adxbnmsJwpqe0wGfrMjbgecAq49Xhs7Q9gGRHKhxsmzt6Nu5qOIdVB5B/xwdq85/2ukxs
	l2INNmAT9ihTDesQIYLs903AOLqZStwz7t5jYILymQwGBiipyClhIAeS3XeHCiCpI6te3SHTbNBPm
	EGsLJegJfuk2RwnnZnVGRzoojeA3pJIubd5dFZBP8dHlxeXpaEJPwW5Ip5upNL+BeHQUOQRaGP+6C
	a1jw+4+wK3BPIX09+qGXzV6b6uwRNNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFKhG-00087b-AQ; Sat, 13 Apr 2019 15:36:02 +0000
Received: from mout.gmx.com ([74.208.4.201])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFKhB-000873-5l
 for linux-mtd@lists.infradead.org; Sat, 13 Apr 2019 15:35:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.com;
 s=dbd5af2cbaf7; t=1555169751;
 bh=GyzfJasrPCcoCcFNN5tou+SDjF2ZFZN2OFIoPMxnxbQ=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=oIN8gLRQtgT5WiE+JNFGlt08kXBFus9gU6ItI1Yi8RGUeOK6UDCJU/j0IjZXzOxQ6
 zwgCYuddaFFTfiPmba2FxOmdt5KhX4C5BN+dGgKbBf8o24pv+3FWm6uEjdNGPDmnWl
 0OgVICQuc9gFyiSnLJYMkJsG8iNH8uewuHetyDYE=
X-UI-Sender-Class: 214d933f-fd2f-45c7-a636-f5d79ae31a79
Received: from [91.188.62.81] ([91.188.62.81]) by web-mail.mail.com
 (3c-app-mailcom-lxa02.server.lan [10.76.45.3]) (via HTTP); Sat, 13 Apr 2019
 17:35:51 +0200
MIME-Version: 1.0
Message-ID: <trinity-5c9b9190-9eab-4324-be77-989be8846f42-1555169751470@3c-app-mailcom-lxa02>
From: Vesta <laguna-mc@mail.com>
To: linux-mtd@lists.infradead.org
Subject: Arguments when nanddump mtd partitions
Date: Sat, 13 Apr 2019 17:35:51 +0200
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:Hvbl7IPKzJXS2qmEwiZlIbdb5D3RJULOuRI/kebqwx4zaCAsn4bQxd5xLoYS2OBhlBXbe
 y+qZ/SBiN5f89QRq50GOnDTMBuCv1s4cwDBX6yvGhrKZqlCwb9z4aXj1qKwH0hQLkdy/x/VdSQ3Z
 HN+FqAE585/K6DuWq+cVPryPBGNekVx4j7e3ddl58nO758Y1tjgd6t6e4vBVDH8PMio1Anqz7qQH
 GyAEHqKGIsy4m6vggfU88s0HcbSso24cHx4ep+F/1cROa+fnWegQZgPTG/MyYXoXe4isD2Rwyu23
 P4=
X-UI-Out-Filterresults: notjunk:1;V03:K0:tA0Rd9cq4bw=:QyavlJ7DEbf/jEzCcLswaG
 i2EDkU03ZqO/92zngtGijvUpjSciFnedbYEkcOZgPCitxg7nK/Y5FVvJH8x5phlGZ8JMPIiPn
 DXuF2VZGMQSbVN6wHh7H6h9v/1tn8ThfwV1KnLxl1K6qxBTsHpRKv0e/i2oIEeW9KYkTCf/qD
 lfnuA7xX3qg+Zmspt1KLUhbuWA9wSV33/6pXIpP1Kxo9HNZXEkL1dSEt6CaOz/bTolXU6u/lM
 oJh576UyZuc5y51GqSD4CM1MPRYIc1gYQ8gUKAWLKiubfe8RpYPDydZJvzX+fxm2xdV+sWMBl
 8yvLFPSSvw4S5Q7wSKg8xjRfSm6J0miqMj4c605oDnVkdoTcxxvTsbORBtB3Lsrr/WUt4r8Nz
 aX1aAY6cxzUGTl5s7m1XGix3MlcPlj3ACRNEa8XuSlZx/rA0MTQOs8Xd6TmL4sFm5NFq93vZQ
 zpzfipt5mXt5oGDfr41bijXRHta5A6wmdSI3CTVkgAcNXm4SL+MMyocLJBy1bOQGDzMqieC62
 eSKc5Se7iSRvq7mUFoWTjyVlDvRIzPpcSarytK3A+AFvFRB/65AWPq3i3taRT+s8X+FY92as5
 j/R1RxRBhkBZk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190413_083557_328480_C5EA22BF 
X-CRM114-Status: UNSURE (   1.55  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
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

what should be the proper arguments when make backup of mtd partitions?

nanddump -f /tmp/mtd0 /dev/mtd0
or
nanddump --noecc --omitoob -f /tmp/mtd0 /dev/mtd0


# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00060000 00004000 "u-boot"
mtd1: 00020000 00004000 "u-bootenv"
mtd2: 013e0000 00004000 "ROMIMAGE"
mtd3: 00700000 00004000 "HALFIMAGE"
mtd4: 01260000 00004000 "LINUX_ROOTFS"
mtd5: 00200000 00004000 "HS_FW"
...

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

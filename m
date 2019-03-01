Return-Path: <SRS0=kP5e=RE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2076C43381
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Mar 2019 17:39:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B49FA206BA
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Mar 2019 17:39:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jB1Mdokb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="BXthCjy5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B49FA206BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S4xtuLJEhvuQUnHTxYuRQQ+5nBUpPQDs/04evJKrEa0=; b=jB1MdokbnbLjQc
	XLYZKz8vFaFxI0fkhPTU8wf7P5EZA70sxUaVW42+dmvIUSIN6dtl4UDroiVCdM/G3jSd4O5qm0xXX
	TSb5wK+G8rJsoS74UN+cfSKP8ZfggvMobQzkvW1dTPc+W31Z8k0K0+B/wHk4/St6kjRgbd/c4qfU7
	xtKiN67qJjsv4An1FW0Uy//RUZ2yK+7GM6peVYlkTR0b7nS5lWwTDNJHcx0oUd8Zcex9MPuir+cA2
	iZr0o6vfBezsE0ToKuYwQ3fEQUBiRtB4u43N9CCcjKm812IeQhie4LpJhYaJ18kqYCUHS9+MIBdHh
	C4hSahHq0lkMFMJupirQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzm7f-0004cO-M4; Fri, 01 Mar 2019 17:38:59 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzm7c-0004az-3F; Fri, 01 Mar 2019 17:38:57 +0000
Received: by mail-wr1-x442.google.com with SMTP id n2so26747959wrw.8;
 Fri, 01 Mar 2019 09:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xpFbWZjb8R6pbiLHLaaQoaYVFWfx50E2CHn4tXQQCBE=;
 b=BXthCjy5jN1VAcuPVkWE/qu1WqbDAS5UUUcC0kqy14N93Gq8CA9KXDxMgddLqSfsmQ
 E026msUYesDxtWjrd0B2vBffAhTa7vDNUjwoJlgYs85y/8XRBM+V+bqpunlfUablLxrr
 uux0CCdoVLgDAZceGwWR9mApjSV2NMAsFbjlc3v+8+DAXO71l1d00HRNdeSXsk42ot6T
 /Ed8jjTxXKedNtcrDttu2WBukQPopuByaKfhQUDvTJNFAAM+ZHSvISSPu3EghdUN+Eo9
 HY+Ava/J3tDN9XHsorOs4MOv2gBaVsHEAjeEXIRtM1/pM5ESKaVDqJiLjiCyG1aMEeDe
 6fCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xpFbWZjb8R6pbiLHLaaQoaYVFWfx50E2CHn4tXQQCBE=;
 b=VvOYvKd6WA0y7aPk+uHgS7v5NxqfqSqTWlsv+AwBZe0I1YtbjcXkSUCN/WFK/sOZ98
 uNXfnShXFmdpl9OW+xUINSfIO9hKwVsfJyzsZYQyTY1QuobGQUwhHdoAyXDlXaEMMUww
 Qi8ESmvTSAgQqzjub+PH9Ar81HUUScqyNU6rg7Z/QARIxxVTQm/RoGRNu+Y8gR2C9g9a
 IGXxJcnjXEQHc4c/ynOH8L8D5b1EdElWj/I7Z8tyEw+DC9D45XDVSGrTEaOxAj1tFe+S
 IL0STsOk3Wmiin7ORsV1cMJI3wFAZgoy13j+PQyaW6qgBcTfCXkwT0AKTqWRLtU+/KAb
 zP8g==
X-Gm-Message-State: APjAAAVwTqvkL6H+vI6CaGaeBL9FD8HZBB/bZgVnWHs0Nx2BmKrgT+6q
 wKcQw/S41jQhoGAR8S/Amfu9EBDZ
X-Google-Smtp-Source: APXvYqwpRmC3py2dyI4jDeNTDLpLOmh+UhMVhBwfhi7Gr0xFHo5UABkpV1n98clqbiymRmwhs4p8KA==
X-Received: by 2002:adf:fdcd:: with SMTP id i13mr4028827wrs.212.1551461933870; 
 Fri, 01 Mar 2019 09:38:53 -0800 (PST)
Received: from blackbox.darklights.net
 (p200300DCD7109200428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:dc:d710:9200:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id y5sm48577069wrd.97.2019.03.01.09.38.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 01 Mar 2019 09:38:53 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, linux-mtd@lists.infradead.org,
 liang.yang@amlogic.com
Subject: [PATCH 0/2] meson-nand: two small memory related fixes
Date: Fri,  1 Mar 2019 18:38:18 +0100
Message-Id: <20190301173820.30776-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190301_093856_138664_448602FD 
X-CRM114-Status: UNSURE (   8.68  )
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
Cc: jianxin.pan@amlogic.com, bbrezillon@kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, richard@nod.at,
 linux-kernel@vger.kernel.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

While trying to add support for older Meson SoCs to the meson-nand
driver I was experiencing a crash in meson_nfc_read_buf(). While trying
to find out why that happened I inspected the code in that function and
found that there's:
- a missing check on the return value of a kzalloc() call
- a potential memory leak in it

Both fixes have nothing to do with my original crash (for which I'll
open a separate thread).


Martin Blumenstingl (2):
  mtd: rawnand: meson: add missing ENOMEM check in meson_nfc_read_buf()
  mtd: rawnand: meson: fix a potential memory leak in meson_nfc_read_buf

 drivers/mtd/nand/raw/meson_nand.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

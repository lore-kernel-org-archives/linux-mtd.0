Return-Path: <SRS0=k7nY=OK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEC31C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 12:43:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B48A61040
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 12:43:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7B48A61040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ct3FJMokl8V6Gw2F1q2pQKFJGT5t8LjpfBWB1xm6s1A=; b=XPqeRJ03Ku4sJo
	7jBnXbT0iz5VNLtzttFwLkMjhNugC1vj/pzbgowF6OPXhlJ0Zsmu2vEGu3F2dYatKPdg8a+g0QbW8
	N4JOs0fmPBbH0nGTLbxDAO5XanDzBsPFzSjjp7ji5GAlTYb3xqNUd3wqeFrBD+Yk4rQZ5kBggUTib
	U7p4L8jA/VL8MW+g7ZFTBxWJ5EBDzH77YnZwvkrK/y9UVrPMSsxjBlkvA1xl8DV2nZFAHp/wmZ8cx
	mTEGYgp5kDmanchh1sDAf6s7f4kyAVMPCSnE/t16qjLtcJWB8PgOR2zcL5KAcygCU1jyCMTJ+P5Y5
	SixVN63yfyaw0fwVpXWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSIdD-001cMV-3S; Mon, 20 Sep 2021 12:42:47 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSIcb-001cCM-7U
 for linux-mtd@lists.infradead.org; Mon, 20 Sep 2021 12:42:10 +0000
Received: by mail-lf1-x133.google.com with SMTP id z24so40974652lfu.13
 for <linux-mtd@lists.infradead.org>; Mon, 20 Sep 2021 05:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hr7++l5WuIJ3QbTb1muJLIYeQhycvVCwIfK8xwCK0lk=;
 b=nDLfjWYlYoJdQDKQVkel8PQOrJt2sQoW4MYJA3uqAsNj59p9NbFuwlUokwasgQHucu
 7VEjc4T0sqUhLEubj8xk5UHvL+XYRKgmCRaHjAM19BwHP/2fdqokZeTfQwslqKWoUEsV
 i/J0hdUos3p3PEQ84D2/iJ0VMrK5lm8I3sR66ovnlB6NZTjvch6Thb0K53KbPVEryUbb
 85gGt3QdgXVtAaF0e2wtR3HAg0XKdUJsEXkv5Z+JmETfWN1wtWCadYtAtsrqtvHey4BU
 uHiehJK1sg9Eb1puxisTNfq3wEnNDb7cbWNVUix+Z7RFZRZXwEAJEXEzDITXj/OaINZ/
 4FQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hr7++l5WuIJ3QbTb1muJLIYeQhycvVCwIfK8xwCK0lk=;
 b=vUSQIuM2GewX81IkHu18fc27Y0PMVVV5EpAkb/moXrqW4Rckjs6AjJmxLyK0v4jbJG
 Y9jCChhRGhw4lF+OqccJnbru6xuk9RdP5mVeal7Q2xIE/Nm8APrIlv6iXR8+b20sxywe
 4ZSMhFn5uCfU6pnjwALHP9zroKvwVv8hk7vIFjsToooSomQxGBDvr05qbUGnRnvYBs/o
 ywxpQQLHyN3wttDTynmtxUdfAegedFMM9jGKrJLrp58XsZdcm70D8QuHLXCkVi5NJFgw
 mcqEU4vlJBfF95rfmX/Aub5zpgIDLlscBu3Lbx5VzcarRl2Yz8DZwZj0PzE+t+bwUASW
 aMJQ==
X-Gm-Message-State: AOAM532xkcNGz/hMxLJYTWewFpOtasLmjkwNEfphoTlH5jcTl6ZDkW/x
 dgIC/tZEJCy6H0eFDjYEYlKgug==
X-Google-Smtp-Source: ABdhPJwoadCgb7r/qWWgGsAlmHH0LQz9izuJ5mTYhJpd9dpLOLSNCUkppvO6+7N7MNxy+hsNTWCTeQ==
X-Received: by 2002:ac2:4e98:: with SMTP id o24mr18180477lfr.295.1632141727145; 
 Mon, 20 Sep 2021 05:42:07 -0700 (PDT)
Received: from grasshopper.googchameleon.semihalf.net ([83.142.187.85])
 by smtp.gmail.com with ESMTPSA id v1sm630944lfo.308.2021.09.20.05.42.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 05:42:06 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, arnd@arndb.de, olof@lixom.net, soc@kernel.org,
 dinguyen@kernel.org, p.zabel@pengutronix.de
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 tn@semihalf.com, ka@semihalf.com, jam@semihalf.com,
 =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Subject: [PATCH 1/3] dt-bindings: mtd: spi-nor: add n25q00 schema
Date: Mon, 20 Sep 2021 14:41:39 +0200
Message-Id: <20210920124141.1166544-2-pan@semihalf.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210920124141.1166544-1-pan@semihalf.com>
References: <20210920124141.1166544-1-pan@semihalf.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_054209_283319_CCAA7999 
X-CRM114-Status: GOOD (  11.57  )
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

QWRkIHNjaGVtYSBmb3IgdGhlIG4yNXEwMCBOT1IgZmxhc2ggbWVtb3J5LgoKU2lnbmVkLW9mZi1i
eTogUGF3ZcWCIEFuaWtpZWwgPHBhbkBzZW1paGFsZi5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9qZWRlYyxzcGktbm9yLnlhbWwgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2plZGVjLHNwaS1ub3IueWFtbCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvamVkZWMsc3BpLW5vci55YW1sCmlu
ZGV4IGVkNTkwZDdjNmUzNy4uZWZiM2M1ZTA1YzVhIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2plZGVjLHNwaS1ub3IueWFtbAorKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2plZGVjLHNwaS1ub3IueWFtbApAQCAtMTgs
NyArMTgsNyBAQCBwcm9wZXJ0aWVzOgogICAgICAgLSBpdGVtczoKICAgICAgICAgICAtIHBhdHRl
cm46ICJeKCgoKG1pY3JvbnxzcGFuc2lvbnxzdCksKT9cCiAgICAgICAgICAgICAgIChtMjVwKDQw
fDgwfDE2fDMyfDY0fDEyOCl8XAotICAgICAgICAgICAgICBuMjVxKDMyYnwwNjR8MTI4YTExfDEy
OGExM3wyNTZhfDUxMmF8MTY0aykpKXxcCisgICAgICAgICAgICAgIG4yNXEoMDB8MzJifDA2NHwx
MjhhMTF8MTI4YTEzfDI1NmF8NTEyYXwxNjRrKSkpfFwKICAgICAgICAgICAgICAgYXRtZWwsYXQy
NWRmKDMyMWF8NjQxfDA4MWEpfFwKICAgICAgICAgICAgICAgZXZlcnNwaW4sbXIyNWgoMTB8NDB8
MTI4fDI1Nil8XAogICAgICAgICAgICAgICAobXhpY3l8bWFjcm9uaXgpLG14MjVsKDQwMDVhfDE2
MDZlfDY0MDVkfDgwMDV8MTI4MDVkfDI1NjM1ZSl8XAotLSAKMi4yNS4xCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K

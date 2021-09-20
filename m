Return-Path: <SRS0=k7nY=OK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7FAAC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 12:44:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5CAD60F43
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 12:44:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A5CAD60F43
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0HhBinkNjYHw2/AapZQ/+yYCWtWr1gJH+ufiF6wATa8=; b=H/ORDf0PJGyP8p
	WDyfPIK4yC5UAeZcj+f4GcDj8StjBKV2zmavDILimmF/Y6WZm5hSv4ufiK2prsqEptZNXHe204t4j
	qvwCbNYkurYDgrsCGh4LvAH73mRBqyCs+rLhgBGTzBHdnOS1qq1QUFKSQ4uHmf9xHh47ofFbGWBoy
	ltUG4E8WzedGv6xHpfZ/ufcuN1In5LI62nctvoIIcQN2QJkZV/gFL/huiZypmiBG4eWsy/rdPvtVq
	fsc7MQA8gY8VZ8WjbhDK7e5lOvY+OKAQz8ZmhjdQjSUWtg8DcHNXFu1B6W7ITJMBzyyqYdaxAU3rE
	kO+SYfBBf7am/L+/xE2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSIee-001cuS-Sg; Mon, 20 Sep 2021 12:44:17 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSIcf-001cEL-BK
 for linux-mtd@lists.infradead.org; Mon, 20 Sep 2021 12:42:14 +0000
Received: by mail-lf1-x12b.google.com with SMTP id u8so15952942lff.9
 for <linux-mtd@lists.infradead.org>; Mon, 20 Sep 2021 05:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aD0ZimcpDdMwxxDkok8INnwAF4L8JkxKG7hlNjJNuc4=;
 b=ROkKUP5Wti0ZceJVkqlAW1hw9pw2rtGO+UYdzPbSZg0ZsAEcFmWUy5DNCnc2MIrx4b
 BYp0RUGvkHwf934xqPgpQ6UUwcdgw6xDoe22pz4EAJzNIkulRo31v++TUs9ymGhu5K5u
 tFmeYg86tBZ7B0TP8fKKkgwBNWF29JNbAnbvAilubZMvvjqh33+omk3tgv1z+6L1bSvw
 FCli+M02Sz/IhIHZXabClzluGQtQlRj9xfOIJWpPK6WGTy5EPC3C9NjyvqDaeSeKSJCU
 Vakycw1Ed8PiorDWqI1+IUXUUnKX7kJZHW55ViIYHRIy6ZFT8OOia60WSN3/sQxWirf6
 jpSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aD0ZimcpDdMwxxDkok8INnwAF4L8JkxKG7hlNjJNuc4=;
 b=Z2gb3IgZ33ZFbWPnfWRHXjs4liu8NSPgu9ZQoyKo9ijRGWegt2lzrwkNNijB7m+ho2
 Mp6cdCl6eQTScSMMp2t+Emi8cxiQUZKvYAGmRCbXnQyV2zTFpIzK52bqwShT6VeUi8IE
 Gk47YJ9EnSTwuITTGDUckjbYX5FccbNIFIFEvDScEF9dBLzpZMz1QlnmSPkaayq2hzlR
 0giEATZ4uLqo5mrzslWSkaX1sXypZxrMWLFzLG9tZbqOKyEWeRsuo80qxbUS8U8jx9Zp
 a4LhMPA/olIA2yWm5VOW8TdyMJNSbbYK84ah33d/18xIxg89FoAEZjd4BJRBClTB2Clk
 sM6g==
X-Gm-Message-State: AOAM532ukqFN2EuI+wgA8mPLTP3hYBiR9byNd5wiUxTB27j0nR3utTuj
 A2+9j3x3oLwtOIwOz7FTPASJ7Q==
X-Google-Smtp-Source: ABdhPJzdjJvEESBsRijWxynJclTM1jLd3jz584eIX1nzT8MgbP4/OcLKY9ulXqJbDoTj+2jHr5+kVA==
X-Received: by 2002:a2e:9a07:: with SMTP id o7mr6991825lji.125.1632141730817; 
 Mon, 20 Sep 2021 05:42:10 -0700 (PDT)
Received: from grasshopper.googchameleon.semihalf.net ([83.142.187.85])
 by smtp.gmail.com with ESMTPSA id v1sm630944lfo.308.2021.09.20.05.42.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 05:42:10 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, arnd@arndb.de, olof@lixom.net, soc@kernel.org,
 dinguyen@kernel.org, p.zabel@pengutronix.de
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 tn@semihalf.com, ka@semihalf.com, jam@semihalf.com,
 =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Subject: [PATCH 3/3] reset: socfpga: add empty driver allowing consumers to
 probe
Date: Mon, 20 Sep 2021 14:41:41 +0200
Message-Id: <20210920124141.1166544-4-pan@semihalf.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210920124141.1166544-1-pan@semihalf.com>
References: <20210920124141.1166544-1-pan@semihalf.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_054213_423004_EF55710E 
X-CRM114-Status: GOOD (  14.51  )
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

VGhlIGVhcmx5IHJlc2V0IGRyaXZlciBkb2Vzbid0IGV2ZXIgcHJvYmUsIHdoaWNoIGNhdXNlcyBj
b25zdW1pbmcKZGV2aWNlcyB0byBiZSB1bmFibGUgdG8gcHJvYmUuIEFkZCBhbiBlbXB0eSBkcml2
ZXIgdG8gc2V0IHRoaXMgZGV2aWNlCmFzIGF2YWlsYWJsZSwgYWxsb3dpbmcgY29uc3VtZXJzIHRv
IHByb2JlLgoKU2lnbmVkLW9mZi1ieTogUGF3ZcWCIEFuaWtpZWwgPHBhbkBzZW1paGFsZi5jb20+
Ci0tLQogZHJpdmVycy9yZXNldC9yZXNldC1zb2NmcGdhLmMgfCAyNiArKysrKysrKysrKysrKysr
KysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL3Jlc2V0L3Jlc2V0LXNvY2ZwZ2EuYyBiL2RyaXZlcnMvcmVzZXQvcmVzZXQtc29j
ZnBnYS5jCmluZGV4IDJhNzJmODYxZjc5OC4uOGM2NDkyZTU2OTNjIDEwMDY0NAotLS0gYS9kcml2
ZXJzL3Jlc2V0L3Jlc2V0LXNvY2ZwZ2EuYworKysgYi9kcml2ZXJzL3Jlc2V0L3Jlc2V0LXNvY2Zw
Z2EuYwpAQCAtOTIsMyArOTIsMjkgQEAgdm9pZCBfX2luaXQgc29jZnBnYV9yZXNldF9pbml0KHZv
aWQpCiAJZm9yX2VhY2hfbWF0Y2hpbmdfbm9kZShucCwgc29jZnBnYV9lYXJseV9yZXNldF9kdF9p
ZHMpCiAJCWExMF9yZXNldF9pbml0KG5wKTsKIH0KKworLyoKKyAqIFRoZSBlYXJseSBkcml2ZXIg
aXMgcHJvYmxlbWF0aWMsIGJlY2F1c2UgaXQgZG9lc24ndCByZWdpc3RlcgorICogaXRzZWxmIGFz
IGEgZHJpdmVyLiBUaGlzIGNhdXNlcyBjZXJ0YWluIGRldmljZSBsaW5rcyB0byBwcmV2ZW50Cisg
KiBjb25zdW1lciBkZXZpY2VzIGZyb20gcHJvYmluZy4gVGhlIGhhY2t5IHNvbHV0aW9uIGlzIHRv
IHJlZ2lzdGVyCisgKiBhbiBlbXB0eSBkcml2ZXIsIHdob3NlIG9ubHkgam9iIGlzIHRvIGF0dGFj
aCBpdHNlbGYgdG8gdGhlIHJlc2V0CisgKiBtYW5hZ2VyIGFuZCBjYWxsIHByb2JlLgorICovCitz
dGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBzb2NmcGdhX3Jlc2V0X2R0X2lkc1tdID0g
eworCXsgLmNvbXBhdGlibGUgPSAiYWx0cixyc3QtbWdyIiwgfSwKKwl7IC8qIHNlbnRpbmVsICov
IH0sCit9OworCitzdGF0aWMgaW50IHJlc2V0X3NpbXBsZV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQoreworCXJldHVybiAwOworfQorCitzdGF0aWMgc3RydWN0IHBsYXRmb3Jt
X2RyaXZlciByZXNldF9zb2NmcGdhX2RyaXZlciA9IHsKKwkucHJvYmUJPSByZXNldF9zaW1wbGVf
cHJvYmUsCisJLmRyaXZlciA9IHsKKwkJLm5hbWUJCT0gInNvY2ZwZ2EtcmVzZXQiLAorCQkub2Zf
bWF0Y2hfdGFibGUJPSBzb2NmcGdhX3Jlc2V0X2R0X2lkcywKKwl9LAorfTsKK2J1aWx0aW5fcGxh
dGZvcm1fZHJpdmVyKHJlc2V0X3NvY2ZwZ2FfZHJpdmVyKTsKLS0gCjIuMjUuMQoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==

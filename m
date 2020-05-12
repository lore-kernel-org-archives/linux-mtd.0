Return-Path: <SRS0=zmx6=62=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0369CC54E4B
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 07:34:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CADCE2082E
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 07:34:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yd+/W7s/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AaC+PLz4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CADCE2082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PN0tA3SABP2W0tEKFSewJZbi+3MKV97jQ36YjCUQQNE=; b=Yd+/W7s/PZz4E/
	NeO6Lyp7/0IRCIrHf8QplBHx1n1M/KJHlw+5qjsjvgFRL5Sw7ez3uXEoEysOjXtxA+sP8TYP1FnbO
	b0+M5hz1iEVjKKwZBK+9UvOR4GhptJIEYsW4vO+PF+6qgu+jCa7TdywmwXhLRP1Bcu1TWiWPlaEWm
	Y+kPI7nHzV3Ekp52oY1dMKezxHvlUwTE401y1vkq/eNxuZEbv6LgHw5IpZHD1qcMFtHBS/4fQTgJV
	PECrPU76L8aSVMqo0eP0wIAv1IRJ8LzgIloMyVBRcotHXZHz2NreV1aeyjX12i8tkQ972Go2YniYm
	Kx0eFQ/UCZpvar0Jr1lQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYPQw-0005dW-Vn; Tue, 12 May 2020 07:34:34 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYPQ4-0004gL-7b
 for linux-mtd@lists.infradead.org; Tue, 12 May 2020 07:33:41 +0000
Received: by mail-wm1-x331.google.com with SMTP id e26so20562519wmk.5
 for <linux-mtd@lists.infradead.org>; Tue, 12 May 2020 00:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wKq0OblocqgUWBq4FWdZOwAZXIyc1/tnZx0SSOmf9GY=;
 b=AaC+PLz40PrYk1QteaLXTxbS33yMEGk2kdK9ESxDU17sZXwVCgmJ/MhsfJT+PDC0GP
 OJ90A9e3bNFgSaTkyjgkoJU50p/FofrEmIqAsMqPgyxEG4/Qp/SbxmFR7DNxs3OKZuUC
 Bp4L78a8pijD3F7VtK4VzCKTo4DQn4Sd3v9gPX/Yf8gygv8nUtuSCxtvQzgwvf5PJ7Hx
 dET4SQmz8nm7aUAiB+/Xr7XscRQ9F4JRD6ILitJAz7yUw+HSA7i4XruGCMHt+R+mxyio
 JaGFxlHQbm0hGE8FINJl9W5pkPbB6nVLur3SYeefLaGZHkjQwLTSFcPp59Gp/3ufUvIO
 ulFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wKq0OblocqgUWBq4FWdZOwAZXIyc1/tnZx0SSOmf9GY=;
 b=PR9L2TR1kMUwqAnQ7QyHunOPwgoVN9Q1XwcYIU+XplE2P4sYi3o5sihx6pMhhGZ7cg
 aXwkIc1joaBU6r0KuaOLZ54CPWgFjST7zRgN7BK4fneRAtCTMbaw68ERdQrmN9VFLCUj
 Bxoof64iwWhxWM6hYQMCKgUgMZZiX+HIbY3oYNoyCI7wYUsOtQkq1mhxLdvreYTsj7Xa
 iY5kCYYKwtl/qEtcJWmIY/OpuuRUqZIW5r60dr+lkJYwcGiXU+itwERubyxh15xSa4NM
 FYxn+RroApEuyYEBGy4Njf/lKuISgxkxBiVmNlt/LAfTQ65HMDMctgr12Vk84EvkFJ9s
 N5hQ==
X-Gm-Message-State: AGi0PuYka2beRSoMJI7+wbRwQ9u+NqadGO9ODnym38l6/FDTDdesgYH+
 mLz7X+zKFqwPMjgsy97qfAg=
X-Google-Smtp-Source: APiQypKpQU+sRBnu4YugVLYHjTcTRmLyX7V4CIuyHUXUHwnJzx9zFlbWQdFPuVC8uZJ2zsgvyvFG2w==
X-Received: by 2002:a1c:108:: with SMTP id 8mr13028297wmb.148.1589268818521;
 Tue, 12 May 2020 00:33:38 -0700 (PDT)
Received: from skynet.lan (198.red-83-49-57.dynamicip.rima-tde.net.
 [83.49.57.198])
 by smtp.gmail.com with ESMTPSA id d9sm5961197wmd.10.2020.05.12.00.33.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 00:33:38 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v2 4/5] dt: bindings: brcmnand: add v2.1 and v2.2 support
Date: Tue, 12 May 2020 09:33:28 +0200
Message-Id: <20200512073329.742893-5-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512073329.742893-1-noltari@gmail.com>
References: <20200510151406.2527856-1-noltari@gmail.com>
 <20200512073329.742893-1-noltari@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_003340_284022_291F1193 
X-CRM114-Status: UNSURE (   8.92  )
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
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QWRkZWQgYnJjbSxicmNtbmFuZC12Mi4xIGFuZCBicmNtLGJyY21uYW5kLXYyLjIgYXMgcG9zc2li
bGUgY29tcGF0aWJsZQpzdHJpbmdzIHRvIHN1cHBvcnQgYnJjbW5hbmQgY29udHJvbGxlcnMgdjIu
MSBhbmQgdjIuMi4KClNpZ25lZC1vZmYtYnk6IMOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9s
dGFyaUBnbWFpbC5jb20+Ci0tLQogdjI6IGFkZCBuZXcgcGF0Y2gKCiBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbXRkL2JyY20sYnJjbW5hbmQudHh0IHwgMiArKwogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tdGQvYnJjbSxicmNtbmFuZC50eHQgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbXRkL2JyY20sYnJjbW5hbmQudHh0CmluZGV4IDA1NjUxYTY1NGM2Ni4u
NDQzMzVhNGY4YmZiIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbXRkL2JyY20sYnJjbW5hbmQudHh0CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tdGQvYnJjbSxicmNtbmFuZC50eHQKQEAgLTIwLDYgKzIwLDggQEAgUmVxdWlyZWQg
cHJvcGVydGllczoKICAgICAgICAgICAgICAgICAgICAgICJicmNtLGJyY21uYW5kIiBhbmQgYW4g
YXBwcm9wcmlhdGUgdmVyc2lvbiBjb21wYXRpYmlsaXR5CiAgICAgICAgICAgICAgICAgICAgICBz
dHJpbmcsIGxpa2UgImJyY20sYnJjbW5hbmQtdjcuMCIKICAgICAgICAgICAgICAgICAgICAgIFBv
c3NpYmxlIHZhbHVlczoKKyAgICAgICAgICAgICAgICAgICAgICAgICBicmNtLGJyY21uYW5kLXYy
LjEKKyAgICAgICAgICAgICAgICAgICAgICAgICBicmNtLGJyY21uYW5kLXYyLjIKICAgICAgICAg
ICAgICAgICAgICAgICAgICBicmNtLGJyY21uYW5kLXY0LjAKICAgICAgICAgICAgICAgICAgICAg
ICAgICBicmNtLGJyY21uYW5kLXY1LjAKICAgICAgICAgICAgICAgICAgICAgICAgICBicmNtLGJy
Y21uYW5kLXY2LjAKLS0gCjIuMjYuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==

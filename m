Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB491C48291
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Feb 2024 10:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9SgiQm0g/Ekzqi7mYSnC8z4Hv2VYxYuVIhqAUe87CtI=; b=CveMvodhAAsy/O
	uP9JHhIp0SL2gT+mt9+gSMCy2aopK6bFSu7QwRBGBCfbLXpDhDCq+d+02PSOMnP05jK2lTNpsYv0/
	idnoZpnepg5PK/T3GaqTCOgxdVIcWF5yg0FS0VaGDXKe/0TB4yXuqOxZItAPEcx2zVWdQezoEyNyF
	hcQNLzK5SWkbMTCSU35GwgTLNX32A0ZHsmtM09OEwUfpOZAouWz2xiCztPXoWho1VXcVh+iDYbCTJ
	IJsXMp0p/BKN/sKLoUguUiurbPqcWiFLB6pOSkvb0kE9860ujN4F2cRDh9DMkzebjavIy7tRQEeIY
	QIMdLTKaq7joyLFmSjoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWvvU-00000002kZi-1f6j;
	Mon, 05 Feb 2024 10:10:08 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWvvS-00000002kZ6-0KGD
	for linux-mtd@lists.infradead.org;
	Mon, 05 Feb 2024 10:10:07 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-337cc8e72f5so3131239f8f.1
        for <linux-mtd@lists.infradead.org>; Mon, 05 Feb 2024 02:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707127803; x=1707732603; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PM79ddFlM7URHKM92cg1UrBcIO6D7fI7h+zZ2IlfnwQ=;
        b=naQ+eY4gOa7zUppU6c0qAEEnsPh0cfEbEJR6iU4Xbb+7ZIslMeYKHe/EbwqkQBnmm3
         rTbrQY7vzOEw9THw3zRqtRc0uhQnRlKlpuA+jqHmCDBNmAeXfbz4oCJ7FR0mkYmKSX1s
         k8cPDRG84xFv7jROCu4jhSTFII1nZ6Pkdg2mMSTPTfhwp/K/4rlSKaE+Y4Z0C1zhj4d5
         WvfqDDbMcD5XIAqRVHXE2QGaBVEmjguzGYEIv3FwYz93gLzsSCZEG2zf38Wtv63L6LfE
         RtJiWEE9MseUzhSz73hlOQLBcFeSXNwAKGZyxVWnXmj8gq7+7YDD6yfV3h+rPr/rL3d7
         lQ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707127803; x=1707732603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PM79ddFlM7URHKM92cg1UrBcIO6D7fI7h+zZ2IlfnwQ=;
        b=LT1Pql8y4mBdUvbd/4xsEDOn2n7IOa+0wMBFNk8pNk8de8yzhWEBkgmtw9txLX52Bk
         aYeIA/SEpHUUYQwAQDFg2kkRePwKKP66C78a16Lh3wtWGFg5yVZJMS10pvYXpc2JuF8u
         mm56vsqOeO4Lcy7k3d1Ulp5/GNLWEKLaeQuVZacOpota61pO4fWrP+Dl1WvqDtgmJ9kv
         31uS/vwb7q488JS/KwjIcLPfLBg8VkD+OuXbtZkT5RkAh1KfIhdZZEvemom/fLt75w5N
         xfKoF97GNyiC3IbJ0EroVZHoqF97D/kGk3dJmVUBsMBTzZ++xsjHpcruDDQLVUFro3/9
         nspg==
X-Gm-Message-State: AOJu0YxCVSLk7n5eO/9pYrnJ2DK8HQwjhCIChuwTC0UHZbm/lJNb8e8l
	8C14wU7MWpsi4mH/ugnOn7pgeoHt5avkgQw8XFZIwcgpS5em1XAveprDrNl7esU=
X-Google-Smtp-Source: AGHT+IGgdKcnU5KmXqzxTG6IPmbKMzlO9O60tha1XABc6ryVGbd/dNZgL8d5b6WVkrriIAy7dazcuQ==
X-Received: by 2002:a05:6000:dd0:b0:33a:e6dc:2e98 with SMTP id dw16-20020a0560000dd000b0033ae6dc2e98mr8856744wrb.5.1707127802716;
        Mon, 05 Feb 2024 02:10:02 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCU6yDO2FBqezZlPU2JPGqbY4RTsKYQbF3YB8DM9gGdCdKm2bSUeD/4maLEXs2UxamIL7xdOQcolQWZ4yCw1xtCY4EdiNU7QeVQ5P7xya7yp5EEK6xZGwxdf7wru5wiNqd8IawTtUGfgbMH0+DV1JhVc3dY2gUCa0YQM+cadEOZGhG+p+vbID0Jpr3hzyGth9GkU5Qpk
Received: from 1.. ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id l10-20020a5d410a000000b0033af5716a7fsm7694395wrp.61.2024.02.05.02.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 02:10:02 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: miquel.raynal@bootlin.com,
	richard@nod.at
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Takahiro.Kuwano@infineon.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH] mtd: flashchip: explicitly include <linux/wait.h>
Date: Mon,  5 Feb 2024 12:09:55 +0200
Message-Id: <20240205100955.149755-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1152; i=tudor.ambarus@linaro.org; h=from:subject; bh=e3w9hSsDT3FO8WPZhRfhMoOpgMXCC+pRKpqGj74t4+0=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBlwLPz5xUk93u1ufsUid6bQ6qowIDwkHv5Mnolp 8Eknq+ko1CJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZcCz8wAKCRBLVU9HpY0U 6fxXB/95862mGGMlEovpodPY5k8h7gH4fQQXhXtYxFEQ/axPd02kxgryzHrF7JJ/KTk8NpJHTqJ XK3E2cgoMxNkdTuLd6tsvl5m3hiQY4jqZyJhrM2ia1PFnlDr9SBC/U8FSVDAz4dJDBtJb3FXc/V CVkxRyDtYkMU/iYuuZ/B9V3/uG2gIoW8qk94wKBSScf1GVmOHT/rzlnzLcOzUAyYXB/l6mKv71U oYxGNDy0YYXcJ1MYrYtBgaVC4ZrKrdWPydsDmBgz6T04RzS1i0GPN1REJqYrzI83GVT7Exb5nxm ku3qO4W4xukOHrbTc8Bk2bhhCnOShdRBpctIrhejwSw/fOo2
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_021006_145699_90F8619F 
X-CRM114-Status: UNSURE (   9.52  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

V2hpbGUgcmV2aWV3aW5nIHRoZSBoeXBlcmJ1cyBzZmRwIHByb3Bvc2FsIHRoZSBmb2xsb3dpbmcg
cHJvYmxlbSB3YXMKbm90aWNlZDoKCkluIGZpbGUgaW5jbHVkZWQgZnJvbSAuL2luY2x1ZGUvbGlu
dXgvbXRkL2dlbl9wcm9iZS5oOjEwLAogICAgICAgICAgICAgICAgIGZyb20gZHJpdmVycy9tdGQv
aHlwZXJidXMvaHlwZXJidXMtc2ZkcC5jOjY6Ci4vaW5jbHVkZS9saW51eC9tdGQvZmxhc2hjaGlw
Lmg6Nzc6OTogZXJyb3I6IHVua25vd24gdHlwZSBuYW1lIOKAmHdhaXRfcXVldWVfaGVhZF904oCZ
CiAgIDc3IHwgICAgICAgICB3YWl0X3F1ZXVlX2hlYWRfdCB3cTsgLyogV2FpdCBvbiBoZXJlIHdo
ZW4gd2UncmUgd2FpdGluZyBmb3IgdGhlIGNoaXAKICAgICAgfCAgICAgICAgIF5+fn5+fn5+fn5+
fn5+fn5+CgpJdCBpcyBnb29kIHByYWN0aWNlIHRvIGRpcmVjdGx5IGluY2x1ZGUgYWxsIGhlYWRl
cnMgdXNlZCwgaXQgYXZvaWRzCmltcGxpY2l0IGRlcGVuZGVuY2llcyBhbmQgc3B1cmlvdXMgYnJl
YWthZ2UgaWYgc29tZW9uZSByZWFycmFuZ2VzCmhlYWRlcnMgYW5kIGNhdXNlcyB0aGUgaW1wbGlj
aXQgaW5jbHVkZSB0byB2YW5pc2guCgpFeHBsaWNpdGx5IGluY2x1ZGUgPGxpbnV4L3dhaXQuaD4g
aW4gaW5jbHVkZS9saW51eC9tdGQvZmxhc2hjaGlwLgoKU2lnbmVkLW9mZi1ieTogVHVkb3IgQW1i
YXJ1cyA8dHVkb3IuYW1iYXJ1c0BsaW5hcm8ub3JnPgotLS0KIGluY2x1ZGUvbGludXgvbXRkL2Zs
YXNoY2hpcC5oIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1n
aXQgYS9pbmNsdWRlL2xpbnV4L210ZC9mbGFzaGNoaXAuaCBiL2luY2x1ZGUvbGludXgvbXRkL2Zs
YXNoY2hpcC5oCmluZGV4IGMwNGY2OTA4NzFjYS4uOTc5OGMxYTFkM2I2IDEwMDY0NAotLS0gYS9p
bmNsdWRlL2xpbnV4L210ZC9mbGFzaGNoaXAuaAorKysgYi9pbmNsdWRlL2xpbnV4L210ZC9mbGFz
aGNoaXAuaApAQCAtMTMsNiArMTMsNyBAQAogICovCiAjaW5jbHVkZSA8bGludXgvc2NoZWQuaD4K
ICNpbmNsdWRlIDxsaW51eC9tdXRleC5oPgorI2luY2x1ZGUgPGxpbnV4L3dhaXQuaD4KIAogdHlw
ZWRlZiBlbnVtIHsKIAlGTF9SRUFEWSwKLS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==

Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2BC1CEACEF
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Nov 2025 22:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2wiL8Ko+D8PAUWMvbNbjK/Rt0d1Ay8ZFSz18G4DtAGw=; b=ffSSTMlFkIRVS1
	osfA6YzRpPbK0R4bn/6TYWV1MnosjHH4pMBq737IM1Xq+ywUFMNRNQUK3xW7GnzQaRVbzrPf12qEn
	GMUHLkTBobceGXs0rIS1q/ZYnG3Lch2TtePIdHzbEQr+i1TZElrVOpp8W7PeFNVLe6N6WeDu7nral
	978PM9fV92RXQaDpuii7t3pbeD4cOeNlc1uwNWeFIb9pLdLcZCwvDpkbmsgyoTxfPwOS1J2Rf5OVX
	+b/TAQoMuvl3VBcsGJe2sHU8vRyPKHB3kV/mX1olOpTNfqBMkpyLb5qNtL9yky1vif08ANve16Jtq
	jHau4LysjSRxYA4FWuQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL7zt-0000000Gy8g-2TOk;
	Mon, 17 Nov 2025 22:46:57 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL7zr-0000000Gy7m-1ToI
	for linux-mtd@lists.infradead.org;
	Mon, 17 Nov 2025 22:46:57 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-6418738efa0so8398623a12.1
        for <linux-mtd@lists.infradead.org>; Mon, 17 Nov 2025 14:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763419613; x=1764024413; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TqjVzwOXi9ucrAfreZQkaGIBXDLGjw4pTmj1sbX0vDU=;
        b=R15drZ66lAMoFhuswJfBHFU43tcFWfawDzwHN+20VZjpVj8TWzCMtzgKLDeQpi+0bG
         LhpOcjIaQVDfJrOTdy73GIOIhw53obyJyucpEGSmHTOTFsSaGSx9xWVPbVIxuX3UU7dW
         xPyW0GwLBgfQXLdlnK+TBxuM0et/r1iKpIGQxoXVvVpJOZOCjDLapkVamFpfo2W9CZQn
         1tQnBNqtQVOm6rSSP47+FpdnGSgV/eiFR5NTYJJd2I2N1xzeJsOxMTKflcjDq/DzN+g7
         oXPy3qdZfu4Y3gOo7Zk1qeDzPzKC7pPKYnubOTM0Py57FjcPxrg9tvXcQDnQ8BOviK7b
         0/UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763419613; x=1764024413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TqjVzwOXi9ucrAfreZQkaGIBXDLGjw4pTmj1sbX0vDU=;
        b=SJb8gTcCZ91iCNbbLs/CWFw3h0z2N2CPSDmYi7QLLpnPX8ReQz8fL4gbJxiqOlkH0L
         u5FCCvmTt4u/WIb7BMhM4PyQ2Ne+nBeuFwiaAR61DisRu9FCeU1iLqk7EncouJzQSp9N
         GHLPxyGQnMEkL0BYZu0BxivvWyvsUj3AUxInO0Sgg8FxFjSffZ6NgiJQYFGdfCVuaC4S
         entkfOq5eBjd6gvMpt4dNhAN4IkWQ+7vH10aEABqz3rL15pCBlJC0RmJx3en/DCaCo8a
         nl9MdP2Siw4ih+Fx6N9WkubgRgInIO7UOLbvogQJ735adi2dmm7MRqTcZl7JWSoZhwtx
         e6dA==
X-Forwarded-Encrypted: i=1; AJvYcCVGslT8GhYUZ0JCEyWl9bPyE747omtEJl6sAZkuagzhKGJFUOQJw+IP/n0Ys8RZIj9hUPBCHZ3ZCTM=@lists.infradead.org
X-Gm-Message-State: AOJu0YyHLufLAgXtUtGx2OX3Ksof+Rw2226aMtED7P9BHFWYMdI+/wYp
	51liON1xyjGE8JoXse9Cp38dDXx3NK4qd0ib7r8lL++5a6U+Ekf5Sy0=
X-Gm-Gg: ASbGncsTHYhsqgfeiidvxbnoEVVKkRghCW8xil1nbUmpOkWORuYAkLtp6VSKb3M+YO1
	IVH1O3f+H8RLoOFj23euu1Q8Qdw12U4ThVJ7gSsUkMiupa/aEfPc567oXVat/wVz1teEtUZQhJc
	mzA6l4i6TmddYiWIp3dQa9Ggy96dczgmYD0XQV4zXtbf6Ph1SnSNqRM64jpL2Kuyvz9oxSClzSj
	r6FQIbMZ/YDykWA+8Iey8khLCnAePmfn78+exp3igdc2+rmyM+bTLK6WYrcTGbAbHjhe96mpQ7z
	C9mjP+gDNgtliuj1UdYXUY0rV7BSlHhG2dq1l1WZvecjN/wSxrACkImSCLX+sEHokQw6JheXbAZ
	pzDB9I1FzWyrmMwvj/8tR529nU3c3xYML/As2N4Kbdu6c9ECkDX1FECaKCPahOutctczxvL7EP/
	QK8VzBV6LaLccno+q25MmzjaG2xQvySEuP5qOLe1Fk58ymCH5EnIH+blEdZikmVQ3gSfCM
X-Google-Smtp-Source: AGHT+IFChHkH3iNr7D3j5wYleR6fkrjGzcNRvIh5kZKRQIF53XrPXDvKUvIepBMOQl9Opng3Ft+0MA==
X-Received: by 2002:a05:6402:27d3:b0:640:fb13:6b8 with SMTP id 4fb4d7f45d1cf-64350e76054mr14056228a12.22.1763419613498;
        Mon, 17 Nov 2025 14:46:53 -0800 (PST)
Received: from localhost ([2a02:810d:4a94:b300:232f:6d66:f093:4e68])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-6433a497fc5sm11215357a12.22.2025.11.17.14.46.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 14:46:53 -0800 (PST)
From: Florian Fuchs <fuchsfl@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Cc: linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Florian Fuchs <fuchsfl@gmail.com>
Subject: [PATCH 1/3] sh: maple: Fix build error due to missing include of linux/device.h
Date: Mon, 17 Nov 2025 23:44:06 +0100
Message-ID: <20251117224408.498449-2-fuchsfl@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117224408.498449-1-fuchsfl@gmail.com>
References: <20251117224408.498449-1-fuchsfl@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_144655_393370_B3158A00 
X-CRM114-Status: GOOD (  10.89  )
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

Commit 313162d0b838 ("device.h: audit and cleanup users in main include
dir") removed the include of linux/device.h. Revert this, as
linux/maple.h embeds struct device via struct maple_device, which
requires the definition. Otherwise results in build error: field 'dev'
has incomplete type.

Fixes: 313162d0b838 ("device.h: audit and cleanup users in main include dir")
Signed-off-by: Florian Fuchs <fuchsfl@gmail.com>
---
 include/linux/maple.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/maple.h b/include/linux/maple.h
index 3be4e567473c..22f2930251ed 100644
--- a/include/linux/maple.h
+++ b/include/linux/maple.h
@@ -2,10 +2,9 @@
 #ifndef __LINUX_MAPLE_H
 #define __LINUX_MAPLE_H
 
+#include <linux/device.h>
 #include <mach/maple.h>
 
-struct device;
-
 /* Maple Bus command and response codes */
 enum maple_code {
 	MAPLE_RESPONSE_FILEERR =	-5,

base-commit: 97315e7c901a1de60e8ca9b11e0e96d0f9253e18
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

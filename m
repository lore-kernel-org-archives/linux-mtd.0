Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B2DCD13D3
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Apr 2026 16:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rdb0o+bAR1rwoPUkNwT7Lw2hss7OByGpapga35IO40g=; b=VbVGeXmoDEI6rW
	dLmRDKfd36BUyQ8H+DxggB198CIwYac2Oy1i/sOf3Uyi9vaQ4UOcIFOaYpnoSMSFL3d4jnpIi3ApV
	HKc4VcBc5e2oMTpsxe8p64H9BWq+psAX7fcMWJq01T8v4OmI3owbvrCBD6aUZDCaE2OY8dIqz2tbM
	Qgh4fZUD7hZvbHglks80Ak3lzkEDy33mnwjBfWjzfYF/43emsSWh3UXIyAXS28rWv1fjOk4rRZro4
	FNdyPBTMjZApzIcclyaFyD8+X6V8tgf0qiQQc4kwpBuANqaMvnAZon32PTfznQ8Gowugz3p4l30Ru
	KjFFwoctFjvXmAhqo3Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIU8K-00000005ixv-0wvO;
	Thu, 30 Apr 2026 16:21:01 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIU8F-00000005ixG-37g2
	for linux-mtd@lists.infradead.org;
	Thu, 30 Apr 2026 16:20:56 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-35da9c0c007so1165887a91.2
        for <linux-mtd@lists.infradead.org>; Thu, 30 Apr 2026 09:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777566054; x=1778170854; darn=lists.infradead.org;
        h=subject:to:from:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Gw064Q23J27DAP5y+Ta6YktUGKYfW6dQ9PUO0n7lsk=;
        b=ITrKmw5xdVXIjuDdSwY2TE4ZofByxbYVzhIdKaL35UupYdxRzDiSTJjxGnaP3UExlr
         0vGbqu5vKssN4QClpImRH50paUHb1Euhagu44CbZXrvzcne+Mu/GrERaPr684FxLEOPh
         L8P1cX+phIAwpE/qQZ0BDNbmKXj3tpdE9sNZc9NPIy5kSit86jX/lAV/IsjvUWhxgull
         y2VwOuO3B7U7b5hL2dOSguHeh+A9K4fSamTxfLj+I7FKKbkYqESwMdxmvk4HLVlWH2p/
         u79ETJRyUHqu9HM1bWlIwRgdsNX3grsYPzoOtSpVJkuXUkbg8cPWTvuJsd7cELhzI4Cj
         PewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777566054; x=1778170854;
        h=subject:to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4Gw064Q23J27DAP5y+Ta6YktUGKYfW6dQ9PUO0n7lsk=;
        b=BYC2bi+LQ46XWF4bMOIq/YDbKEBOklDjxzp5r0ADGuRxwgJZDVe9by+hboh3PBSIY5
         N6mLhU+hYbfU2yKirDiv1COLsm4G1JY+/66ft+WjXvSp5w9xVMR9j/3c1HCuxfG5g94M
         OUiIqE4fmFAMsBXOcR/S9XPWD2+LWLzTC8o7X4LtLosMDfjWdLEGU9zuWPIDI8sNdnza
         iYF9ed4/0XCFDfXW3FlaU/kk2d93cwc/3BRCzfVA0mmtBT0rSNwLooXncnLlpz5+rkfa
         6lMJ7AL9pRF20GJt/n7svfXcHNYlyehhkUlYnAbRrSDH32KdtaOGYrF4bC5MMXyzT/oo
         Jxhw==
X-Gm-Message-State: AOJu0YxDuMGiN20Kp8rqZjuxkhPxXpdKCwDzt2jNc1VaD3h92K5QqjCI
	cmpvkMHjXbVOMCU6BlQZCcrznUtovxh6bWbYYeMzIVfDRYfRlkqKNnYBYKFk3pUl
X-Gm-Gg: AeBDietV+N5Q9OPilhROiDJVRh0OPGGTowozeWjK+5nj1eaiEseecAZBg3AU4s7kG6Q
	7fwPfbV+u8Ua23SU8AD7iUu9x4i9WaUiVNrIvKQXQ0aQ14wil8/uBgDjC8kNXOy8djSEpMy+vsQ
	pgsS/nq7D9Vmvu2Qsht1TKoKHxtDq3VqRMR9qjIWD13aVXlV0m1+uFO0AA6hutJgGYhcO8vYBZ/
	KDsBR3CoWcboY1rDeNOuhNzqcEXch7foJiuV6NqZnng3T/I4fDDIUYpph10vWlc36AbSXlw6ssi
	2ZV2pFMaic9/w5zWTXTz1M6/UvEJu+Ob3UhxBVfw67QuqVdwlBGEASmgztc+d4Uo5xR47aw25rg
	yg1wnbMJZu1gWI8q9fa5++lb0aVPhv788B7N7fdeLPCc6UDxSUN1VVBIHir2tLS+xt/FB3VoGp4
	NjI3iPdhaHf5688FPZvai6+z/hTqCn4N37QIhaS1QdkWGjQgv6ujT1NqFfl7LVbsBMf2A+S7JBE
	fI2xERMEfpr6sDuYNIhTBATaQWHYkzbzSeXzsjNoV54WnM=
X-Received: by 2002:a17:902:c94d:b0:2b2:cfdf:10f2 with SMTP id d9443c01a7336-2b9a24b7250mr39666145ad.20.1777566053640;
        Thu, 30 Apr 2026 09:20:53 -0700 (PDT)
Received: from localhost (ec2-35-87-127-182.us-west-2.compute.amazonaws.com. [35.87.127.182])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2b9caa7e84asm1064765ad.17.2026.04.30.09.20.52
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 09:20:52 -0700 (PDT)
Message-ID: <69f38164.170a0220.2f0e88.894b@mx.google.com>
Date: Thu, 30 Apr 2026 09:20:52 -0700 (PDT)
From: rcshsmith1838@gmail.com
X-Google-Original-From: PayPal,Inc.
To: linux-mtd@lists.infradead.org
Subject: VIP Client Invoice #6974082 – Please Review
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_092055_798757_8FCB6C34 
X-CRM114-Status: UNSURE (   3.22  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Subject: Your PayPal,Inc. Renewal

Hi Platinum,

Thanks for being part of PayPal,Inc.! Your 1-year membership renewed automatically at our special anniversary rate.

Renewal Details:

Service: Digital Real Protection

Customer: Platinum user (ID: 13822-1675)

Amount: 497.85 USD

Need help? C_ontact u_s: +1 (802) 278 0978

Best,
PayPal,Inc.
+1 (802) 278 0978

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

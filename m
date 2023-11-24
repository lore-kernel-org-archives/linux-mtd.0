Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 540ABC61DF4
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Nov 2023 18:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XnN9VVJaHvAASFK3fG/yY8x+6vvm3JNjH6peqZEQa9c=; b=tksKfDKjKyDrnF
	5qz96TgsH5Px2oEC6EQjq28vNobCVPV7y13IWrn6RhQGWvQGZ+HFZOxyHuxkjmeIAXS2v7aJiDJ9n
	L8DiSff7yhBWSrWmsJ7W7MwLxwdLe9gHT2Pi/HUYls/D/o6Vw3FsWGC6zJyLaeEFsEu//M7E2EiHC
	9J5MF6IcWtsqMcDxEH3LEQ6BT6tCJ8A9G4M3uRdLzZGVv3I6BXiwRW6+T7dNdL4/TYZqoDK6mbtYn
	UMyj12sYaNUvpSDSM1qdYw6XQbS6tsJPHxUg1b+RCDYfmfRZTVlZ3xJg9TaaynzLlUQgOu35BXnsS
	EB2U9dv5NzdoiPeLTh1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6bEn-007twx-0G;
	Fri, 24 Nov 2023 18:49:13 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6bEk-007twb-32
	for linux-mtd@lists.infradead.org;
	Fri, 24 Nov 2023 18:49:12 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9fa45e75ed9so318042966b.1
        for <linux-mtd@lists.infradead.org>; Fri, 24 Nov 2023 10:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700851748; x=1701456548; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gBdjGgp5kspN/gTg/5L8/r1olrDflqhJ6eCRhlHgGxo=;
        b=eXaCbZ2ExQWr2otHLlw/GGR27LGmkXZW3Bc9KCvnXzWfY5s4ZsU0RfAqa35xwsVMjC
         DtuJHd6/OQpPukM3evlyDQ9h3DoU5O2hMRRSpzuUkwVo+jLBcNjb1IWavOyuV4wdxdVQ
         FYPNDvq0JTkcEmaXW+mHbsx70BwVXHyIgTYXFgKzcL3JUWGcU8ReGUczk1hqSFYCux1R
         jUDzLBcytBdZYrih8oB2KIpYRKsKzcTYqJOqpvTddgbYLsbyhdCZQ4Fck7WFfcAUYl7k
         BKRv6d1m1r5oocHk5FSCzIrWyeSnhK7PBeTn7f1eT6z/OI04w019IU5GFM16DxpnD8SA
         w6qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700851748; x=1701456548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gBdjGgp5kspN/gTg/5L8/r1olrDflqhJ6eCRhlHgGxo=;
        b=h4moVlRgNlUpTqRxz6hdIDjE7W1WtcqyEzxwEazYM3o5G9U3hgmX5ugIzxqjbiUNJR
         4W1AqNYFNj78f3PlUgHDPKwDpwWQ3bl5mE/cf51e/tDTeXYBJndexx6iY0ktXtWAOx/h
         DULhrH4kQUmWREXWLCdOy3srpM+B7am8v11Cp6bi2HyvwqxogF+86xLZW2bBrur0kFq6
         HMv/tSngnU7WLG3hRqf8QVb+ZBfIgGDarnfnpDdQHMhLGiDNujKBrZzP2wxX31kmFVKu
         mLCNuTxi2NNiGwMlqpDvsFoCbYsjz+YLJ3DMuXEs0Buh1sv4VvPsz+yvUqtLpEBQiJUB
         ynDg==
X-Gm-Message-State: AOJu0YzAyFI327jOq8ghyRen7uiKier4BKrAcYhy8L8qqGET54BeWfy/
	AzhSQrcrHreGpVgThDoxv5NHwnfLbPVgZH2Y0Lw=
X-Google-Smtp-Source: AGHT+IFtMayisNzoJBbemLuOPI7edYsKAeRO/+QbOkbbj3iWGPQpIpJx5J0Nrzut4lWJ2YFx0hTjfA==
X-Received: by 2002:a17:906:fcce:b0:9f8:2b44:7b7f with SMTP id qx14-20020a170906fcce00b009f82b447b7fmr3104870ejb.70.1700851748307;
        Fri, 24 Nov 2023 10:49:08 -0800 (PST)
Received: from 1.. ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id lb16-20020a170907785000b009fda665860csm2376405ejc.22.2023.11.24.10.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 10:49:07 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: pratyush@kernel.org,
	michael@walle.cc,
	bagasdotme@gmail.com
Cc: linux-mtd@lists.infradead.org,
	linux-doc@vger.kernel.org,
	corbet@lwn.net,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 0/2] docs: mtd: spi-nor: add sections about flash additions and testing
Date: Fri, 24 Nov 2023 20:49:00 +0200
Message-Id: <20231124184902.1194235-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=777; i=tudor.ambarus@linaro.org; h=from:subject; bh=b+NYwpA6daCzuWR90IFNBg+e5G7bQ/pnSbmqUOhVPYY=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBlYPAdzQe/vFEYJVzlCJZ5Y6GZNFvYonuk1Br2I 3hs//QOzWmJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZWDwHQAKCRBLVU9HpY0U 6djmB/9E21e/4XBmcLtfvMqdO7x8KNFcVK5kxA5xcfQ7dsFHXaDdRPXke74QAR46lH8IdMfNEcZ rgyrr86phHTvxE8KQlo5vy8OhXM/TW3isiiNa0mBLf053jM+BbAZDazxNeccZ5G45EWRyHUztmK drBffO/3eJNc8FiJ3mu8b9voX+umRDkWi+3SBkdEX5xvYuMdFmkN/x8BCdjrxJ1+/3TdjcHc2Hp UzF0IX3n7jIZ01cSlWHI2zxOpigalnIsdtXz8M0CShzDN5oNl0eEio+G5omgEi4yPpfbNYDKoG9 C7LM2jmuMHIVVNCgGCj4zfbRG8GbQm5+Ht2n2EQZHTp0kO1n
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_104910_994184_49C06816 
X-CRM114-Status: UNSURE (   8.66  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

v2:
- specify that we prefer to dump the SFDP data with ``xxd -p`` (Michael)
- update the mtd-utils tests (Pratyush)
- fix formatting (Bagas)

Introduce guide about when to propose a new flash addition and what are
the minimum testing requirements. Dropped the old documentation as it
no longer applies to the current SPI NOR framework state.

Generate the htmldoc by using ``make htmldocs`` and then find the
SPI NOR documentation at
``Documentation/output/driver-api/mtd/spi-nor.html``

Tudor Ambarus (2):
  docs: mtd: spi-nor: add sections about flash additions and testing
  docs: mtd: spi-nor: drop obsolete info

 Documentation/driver-api/mtd/spi-nor.rst | 247 +++++++++++++++++------
 1 file changed, 186 insertions(+), 61 deletions(-)

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F00C021A0
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Feb 2025 06:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6AqKVfNPvYVrmd8Nw3oSvb+cdTjWeiz6tAN6/pYfMHk=; b=i49oeNMFnJ/3qs
	cxpBOJCp39Ql7or66oHz9PjfHUNgMvp5EYpxXTHL4IeOalOR1aTuwsE7pDXtVEbHovD3YRV1KCbgO
	Tf2zkV1oXDFqUypu0fSCZ1bnzi4ATe3FD5MQbz/GyS/YJ3XDUpCjTrnyp6SpHgHaDiXGZcT8s5LjQ
	yvUmP++dxNKSxn/Iz+jDC6Rc+PZHstfXpAGVqKjnl/3dgjtMdZZZxFo8/ynn7JmE6+Fbwznsxokuq
	ubW2UynoJVUuCCJRY+9AgqiWXL6FAVfB3SEnLaFFvuTisoe8OuBN+GmnlSpge1TuzH2AGOOyN4CLC
	RCYocINigeeAuOwCnP+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thjsE-00000002iZm-3RMu;
	Tue, 11 Feb 2025 06:35:58 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thjr2-00000002iGN-0iXA
	for linux-mtd@lists.infradead.org;
	Tue, 11 Feb 2025 06:34:46 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-21f573ff39bso73972965ad.1
        for <linux-mtd@lists.infradead.org>; Mon, 10 Feb 2025 22:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739255683; x=1739860483; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XIGioHqjxPLbfQpIas3VjDLrxJe4mEXBZafVCBMRGrM=;
        b=V7wjqzu5yugQC2C2V/Ssx1omAjVsaoDmbSmc3IwH1A4phfroGg3kw/84i/G9v6+49Y
         zBFGGEtKVg2z2yt1wMUpf3ikmOV22rUDiU3qXrOosJOuWLNdDaPjUvPC8M9qfoCtkInr
         ut6XGlRHCOdxQb0roqdz1Mdp5bI5+inbWuzbpf8E+kuF2WL5a/5rCo/cyB91y9T26hg6
         GAJlVdUBE5cVJwaWQNLFFUKJdAtoTRt23ao93TLjs2v5b9DadKmQHfyMDwKleFeLnTrW
         OYY7gZnso/uv1NFYYXOwGKf/8MAIYinXcq+0En23xZGzhz4YJclHDkwzrp/wf0/BfY1f
         WaoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739255683; x=1739860483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XIGioHqjxPLbfQpIas3VjDLrxJe4mEXBZafVCBMRGrM=;
        b=CYOL8d9dVYw5g7f5cKMAgFHk6quOz+xccQUm7gsWQYWKzQAO3q/InAYm9mtbTzfXVO
         QIwpvkjoQr/vtO0wGE3lTNzDCKgoJFUAFta7bm+us54G2ljALLVXARjUSuCndTHaKoGm
         U+snyaBH9lxK9j2AvnRObaORKvKAtJGlmWw9fHLKw06gOob2EjWdTsky9F65H/7Byd8F
         qPfM24ckcaGzImbAAyvc+6LKFPLKMJMH664s4QIYsATsVXiK6SR1FlC2q2zG44qgqKTL
         BvKBjlCz6kLjaJkoYDG+D12LcmhjP3HsCT+JV6caDYhNC6FCfQK73pVau8frjfm3sOOm
         NTqQ==
X-Forwarded-Encrypted: i=1; AJvYcCURoRX51B4EnLg3R4h6eFPred0zkZGtW7TDw+BBoX5RqH2woSHDyH20bhiIWX/PGZqSm0CD0EwKX8w=@lists.infradead.org
X-Gm-Message-State: AOJu0YyaezG1wbcofDq3Yjx+HP7LBYXnqywOx7qkyT8SLRbgL4ooGyoT
	gfphZhvYm0P78gN25pNlR6ilG9gT87by2Nzk5FPZkOZofpboPvh0
X-Gm-Gg: ASbGnctvtFFiHIIhMzqtihBo3UNNFdtbv3/SmIvwiZK2oSNWeencZvv0QeWPw3Y7By9
	yyLKhctvs02dT74htIVA0NAAP6NyGilJ6mqCfTP6DqdyaK7XFwCq9jHOYC85jKuYQXGkotK2hgn
	7QsSR4RquNot8fUKjIPFf9Z7FL3TmmVYkHPIB4iIaIOZXElnHu8QAwYA3LqOp6WM8AgVLEnxrx9
	32vldfy/iRqRnrXWolgeJAGwKU7nprgZA9HQlsC1XfPL9gJDDvuq4mwRxRpYmwhLOfc96CgrQpG
	anAn5RqJra9V4APR9SXktSLGvjP3GD0CQG290DI=
X-Google-Smtp-Source: AGHT+IGhfPVRD1oybOavBoo0+ctgSXR//pe6eww4PZDoI4CrcFrWhXb7gEHYI+WFNgVRGuwAYIQknQ==
X-Received: by 2002:a17:902:e846:b0:21f:f02:413c with SMTP id d9443c01a7336-21f4e73efc7mr246438085ad.42.1739255683020;
        Mon, 10 Feb 2025 22:34:43 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f4cf07b85sm74268405ad.137.2025.02.10.22.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 22:34:42 -0800 (PST)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 03F088039C;
	Tue, 11 Feb 2025 14:45:12 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v2 0/2] Add support for Quad Input Page Program
Date: Tue, 11 Feb 2025 14:30:26 +0800
Message-Id: <20250211063028.382169-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_223444_215691_A1E6EDCE 
X-CRM114-Status: UNSURE (   7.75  )
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

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

Support for the Quad Input Page Program feature.

Some Macronix NOR flash support the Quad Input Page Program feature, but
the 4-Byte Address Instruction Table definition in the SFDP is incorrect.
To properly enable this feature, a post_sfdp fixups implementation is
introduced.

v2:
* Add a partname comment to easily identify flash entries

Cheng Ming Lin (2):
  mtd: spi-nor: macronix: Add post_sfdp fixups for Quad Input Page
    Program
  mtd: spi-nor: macronix: Add support for Macronix NOR Flash

 drivers/mtd/spi-nor/macronix.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

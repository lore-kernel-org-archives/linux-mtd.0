Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B856CCD193
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Oct 2025 07:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/XGesjjD3Z5i/7BYXptTguAx476cPpb6yLZfyAvKeBc=; b=dgXZ1l5yhMI+uw
	6NNbu+3R7OhQEjtsBMSYBM3MPxSPwpyTCOaThKC5GF9eE4ZZ2oryHMJhdjaPgrwUZdwciq73pO8xW
	6w9YXzlPm9Z+yoeqLVEOXn/4hTlw5svxpzk+Gj1ZUxWISVvnaNraPNObA60glRC01kwkDBrYA/re7
	LJ5wLOJB1zIhAMihjDMEwRWJCMpAOgRYxi+D4i/5yZANqfF7pemxasfxPaKSwy3YjrVw1jicK0LD6
	NKb+sTYk+IrRudBlXD57tbTE8X5UFf5Qjt1KWq0IahxXTaDI7i+hhNQ9MpUT1iExs8269OHq/nTvz
	Jh5tpLCYmhBU2PLTszeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBpre-00000005OFH-2hci;
	Thu, 23 Oct 2025 07:36:02 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBprb-00000005ODL-0x9P
	for linux-mtd@lists.infradead.org;
	Thu, 23 Oct 2025 07:36:00 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4711b95226dso4821085e9.0
        for <linux-mtd@lists.infradead.org>; Thu, 23 Oct 2025 00:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761204957; x=1761809757; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nwJyJEU5maxkZelRR+G61NdovwyL4hcRCCkUlipo/Ak=;
        b=FmtPtx98LWx2iOCrpwsfqaUqCDgKjLmX8nfr5QtOeBKVHNXxpgXz0dmbEAPKfLWl1T
         sGoSfiD39plRuQpjrBG/sRV/VOj8wqqMwsl7U+cQ75ftCZVSqy6qBin9zh2rx2g7Nrk+
         IM6NNCGSZ9TO+qS2TIFWRyNHofBAtAWlRKUTZ5igtfVoTqESRjnDuVSkwUwPmK0FPR4+
         gh3lDoCEmR8Bv7qcf/BZreOqTS/lOTBDzmCI069srpB3dvGVS2f0/OxsmRBYgzts0716
         vtFpoJPD1IyYXrSVQFLeXEFTrs3BbhardidZpXQ7psVnVi1jwdm1nTZ6arIDlc8L0gom
         zGkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761204957; x=1761809757;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nwJyJEU5maxkZelRR+G61NdovwyL4hcRCCkUlipo/Ak=;
        b=FvZB84GA4k8HXqX3qHWPQcQ8iznHnK+E8RsqhSCcAlraUBIZBdpuCWBnv8cx2UQLqs
         bdHIOLGJpz8hHrOwZcqehMeyiKmT8AqGJX0wsHj1DS6v7ufkddtksTKk2ZDv8L5eRsuO
         O0dqBFb0d/89Y7aUgWZavtCCWflSIK1lPiEI38L8GVnDskS3luMAYn/jwYcPV3YtnnbP
         GBzcOo9DKidgnznPZ1ox+pQivg+y8oAGXz8RGH8TNPBsRm4CuNUDC2kdCs5kpzHZXPp9
         AIv5O+QNE8c3OnUomM3eL9vi1n6UWN8WynEoDle2ta3eY4p3Z/B+2tV+qeJesuUsEMfd
         VwbQ==
X-Gm-Message-State: AOJu0YzcWmOa3beNfODROxGOBsL7fctdoeIh7clwaiOSz2YAMTDe9t8s
	2dwEGZ4CSv5abDAYF8iyYZ6gZh6y2jwddbJCx300Jb8+DaHYlFQW0uGG3iIyiV0AtOLvQk9C7yb
	65GMU7rM=
X-Gm-Gg: ASbGncukvpOxdLQxR6OpjjJNo4GMn3W9mQjSgIl7EMMCI961wiu9rCSTwzuLH8+Rxsn
	tBSJNe6a26OTxhYuSi/HLpfjsRhZ2c7h2pygFYszJNELiDuEg+8kOz6aLxZGF7YEDbVq7W9UcWE
	g5sgYDI71RSpkSZogbdUZAko3I2Zd5c3lGpN5RgIUrTp1ZFZE9YZEFE/G+5onpiK4CQWnpl/6r5
	TwPbB74DeLSCgXCE0Ro3vJVR1UQHva+mZsivzDdL/BZ+qfiH8DuWsjDZw4sntoX0VdFxtFEe9Te
	6Apjzy5v34FyQtgNscUcgrbB1Ex15IeR/bzVYFQwlIClmTJNVJC0mOfPcArztbm7qzAHuUfZGfp
	4xUySy2g4M5O51JtXIbxu0DbtN0GsQOMT4Ut85/dJJRbMV4OcFKOMW1DDywmjfI9XX5Lsx9a6VV
	JOyFCpw3wY
X-Google-Smtp-Source: AGHT+IFK/1BB2uEat5p1r8woPESD/DsfHS90lenaxSW5z/swFxmF+0BESbOT8FwArT5vdTSsYQ4A0w==
X-Received: by 2002:a05:600c:621b:b0:46e:48fd:a1a9 with SMTP id 5b1f17b1804b1-4711791fbbbmr177250155e9.33.1761204957225;
        Thu, 23 Oct 2025 00:35:57 -0700 (PDT)
Received: from [10.11.12.107] ([79.115.63.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47494ae5510sm53341735e9.3.2025.10.23.00.35.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 00:35:56 -0700 (PDT)
Message-ID: <0972738d-0c64-4d9d-9867-895222a8f535@linaro.org>
Date: Thu, 23 Oct 2025 08:35:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] mtd: spi-nor: sfdp: introduce smpt_read_dummy fixup
 hook
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Takahiro Kuwano <tkuw584924@gmail.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <20251022-s25fs-s-smpt-fixup-v1-0-ce26d4084b2d@infineon.com>
 <20251022-s25fs-s-smpt-fixup-v1-1-ce26d4084b2d@infineon.com>
 <59c3d45b-13ff-4393-a87c-f0504f224acb@linaro.org>
Content-Language: en-US
In-Reply-To: <59c3d45b-13ff-4393-a87c-f0504f224acb@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_003559_275157_09CFD667 
X-CRM114-Status: UNSURE (   6.83  )
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



On 10/23/25 8:25 AM, Tudor Ambarus wrote:
> The patch looks okay to me.
with a bit of more context into the commit message, you can also add:
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

Return-Path: <SRS0=2QCa=5T=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 237DBC43331
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Apr 2020 20:39:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E570621655
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Apr 2020 20:39:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E+U++Ef2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="H3oRzUpR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E570621655
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:To:Subject
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=P95bthNqXungccPkzr2TWEDZdj7QRQ2GFOlFK4MHoLY=; b=E+U++Ef218SAgA
	vT1rX7uLDHDPqMYp5T0veGc8z1Zz38RhQKaRYE0kCAOQnaiHXIN1tVwDYxXcy2VDsaYlcuoiXYqe+
	ZncL3B9pCSyDVRf740ot1Pg7mrTdZPq3t0OTXlDTqb20cMAsw6ROyWFo2nSzKt1BHY9YLGSfCmOvw
	qaYCjDeJn4KtEwRD4WqxNjsKlewHuuFr5SXbBw5q2hE+q2FV6ZL6gJI9LWg+RqbUHHDPEPxjftF4G
	L/14kOjjikZs4LjCEqGjlatz4LK72cZufPwsutiIdTFCtfALF0+JiZJBFQYQN0D/uq/Di4hgdWjee
	oOWtskAxq0Ayf8ORoV7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKT6D-00045M-3N; Fri, 03 Apr 2020 20:39:33 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKT6A-00044Y-AZ
 for linux-mtd@lists.infradead.org; Fri, 03 Apr 2020 20:39:31 +0000
Received: by mail-lj1-x242.google.com with SMTP id n17so8330122lji.8
 for <linux-mtd@lists.infradead.org>; Fri, 03 Apr 2020 13:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=from:subject:to:cc:organization:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=exzC5jXiQxJVrmhVG3m03w2Rdrug/iMzQPqGGhf9jA0=;
 b=H3oRzUpRS8g0rPb7ZIr/wM12o2wIs00imfNjiDuBPas7/JvMG5Xdp8KLZFrMFYq4JW
 Qg/zm80LY6Wwc9IkpTePgV8tF4YC3oJIX+hhoBTj+G7x9pZiHwbgZSw7gOMD9OvYxQYh
 T7U4PMT6m/duB0lCC6wqvyLqxGeViKJBaX/g288KG+3594nMZ3Q1ertqdSS1xTtrPSjF
 jxse92GbNIykcTSYzg0jTvmvtSzzqteHv5QOtVtHLjRK3bnlPnRVBZawnkbC0lM/Qcri
 rPB3rCnyp6eg7eWtBssbH0yPC/nT6UFFBrtqonTIEM8wfJzU6FEA2tsUh6R4QOlWGTRq
 Mltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=exzC5jXiQxJVrmhVG3m03w2Rdrug/iMzQPqGGhf9jA0=;
 b=rlGLp7XkiSxoeQFyF3JyAFfz0BwMF1PbmfM+uDpqvgeLdu5oNEH6x65fQzfkFc9hxn
 ia8tuqfPwM8pFkJa3vNxC93chgsjqdmnyByf43FtzYX5E6deuE46JZwQzjQ4DrP+4vYo
 yb16qAMIYHDhjo0+9xzENnsTA0e4sHFA3Ag6hiOphYq33NhPcflKRFNIWwXqcndzunoB
 vtVldgw4D+npsv2p2ixJB+D50vx7SFL8JzxlaQRDLXz3kCQFWiOsCNCKgmL8PVIO37v3
 ODQg3mhZSf6gwJf/CHDUizbMXvlTCWIwIem3pU/COKup/r7SgYBRA8HX3C6LcHAnB+TW
 Aj9g==
X-Gm-Message-State: AGi0PuYa9cuAKMt4fkojv9XRY4azXDbv4Svatp0RflvEXMpV77yoc4Jg
 TzaEk86+RugyXuPva4HEtnpk6X3ACpk=
X-Google-Smtp-Source: APiQypJtf2oJROXfDfJxiqjp4IM82kv1cjYtLyHPte7orpMYuWrxjCWGV6Et55/p7g+cJJVUKm1jSQ==
X-Received: by 2002:a2e:8511:: with SMTP id j17mr5974564lji.292.1585946367435; 
 Fri, 03 Apr 2020 13:39:27 -0700 (PDT)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:41a:7e80:40ac:b40e:d552:2978])
 by smtp.gmail.com with ESMTPSA id r16sm5469339ljj.40.2020.04.03.13.39.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 Apr 2020 13:39:26 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 0/5] Fix kernel-doc comments for 'struct spi_nor'
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Organization: Cogent Embedded
Message-ID: <b82675c7-9c90-d0a5-f221-9f51f89e448e@cogentembedded.com>
Date: Fri, 3 Apr 2020 23:39:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200403_133930_567276_ED3A97DD 
X-CRM114-Status: UNSURE (   9.23  )
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
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello!

Here's a set of 5 patches against the 'spi-nor/next' branch of the MTD 'linux.git'
repo. I'm fixing a number of issues in the kernel-doc comment to 'struct spi_nor'
accumulated since its creation. Instead of a single patch, I'm fixing the kernel-doc
comment with several patches, each fixing its own broken commit -- this simplifies
porting to the stable kernels (if that ever happens). :-)

[1/5] mtd: spi-nor: fix kernel-doc for 'struct spi_nor'
[2/5] mtd: spi-nor: fix kernel-doc for spi_nor::mtd
[3/5] mtd: spi-nor: fix kernel-doc for spi_nor::reg_proto
[4/5] mtd: spi-nor: fix kernel-doc for spi_nor::info
[5/5] mtd: spi-nor: fix kernel-doc for spi_nor::spimem

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

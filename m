Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24FB5F99C60
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Apr 2026 19:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6iQsj6XMT6Mz9Bb6tqapf9KfTPFDBbIp1Qvr54rg6IY=; b=AmdlkdieYnCUi3
	eFgjeH1yw6udp6sqqc3dJyd4uJydbu4xmDG9kS8XKM04DPjjInf8nevniCpjVsONADrPZqjR/rAWQ
	bpqBFaQoPd+OJZJ26TLS6pz7hOslGysp/uF5IrbtCsKxT3l0lailhEAAuOm9eZA2FipjVmYoLQo5m
	tRhninj58GF4WN3/VBAzVEZxJjEiCj8tggBi591yl8FEgbFBhKkb+RxSNa6Z1wvZcLpmAvaRnmDsL
	eiTXny7zy3phdiVk7N2ZMc2RmDlDiQ87y+XU/ehW0Q94UbGTqll/vq4eKI1+og6O40GQXHxoBig9d
	AHOKkbyY0lpwEt3JPpvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDpJr-00000004Qo9-3Gfm;
	Fri, 17 Apr 2026 19:57:39 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDpJn-00000004QnN-3EcO
	for linux-mtd@lists.infradead.org;
	Fri, 17 Apr 2026 19:57:38 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AA1294E42A32;
	Fri, 17 Apr 2026 19:57:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 79A2160497;
	Fri, 17 Apr 2026 19:57:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 858B110460A90;
	Fri, 17 Apr 2026 21:57:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776455850; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oeBWVpKkQPjB6Je2Kmh8Ins+NVaHwwSJ/IDHFt/6er8=;
	b=zsGFKGy8bnxjFBgNzPtJB6YLoR+WYjsWTklJKzSdxZgZBVtdy7xyI0mOLMsA32MZ8ODYfG
	JGNT+MZlE2UuhLngp99Z4kOAPfuSDIRP+fiuFEtKmySpY7UL+j5qePDC/OLmUriuni7jaE
	FaEo89PX33oupsnc7H+Mb+2pgjNVEtQzIaWTrE/Qnt6F8flPhfEms8CZENmc+n/L5j4J0Z
	UEHcCikz/xoDO0c/O2gQQFV2H9uNW6pTZ1bUcCa1ZFqYueDKUpwR107TQjLXOXwIRLfuRJ
	Xw/tXDbUbUZPKXXx733qPoEuIN31dBPPIpjG3S3+WUKmDKaHhEtWS4dKawcZLg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: Tudor Ambarus <Tudor.Ambarus@linaro.org>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Frieder Schrempf <frieder.schrempf@kontron.de>,
  Michael Walle <michael@walle.cc>,  Pratyush Yadav <pratyush@kernel.org>,
  linux-mtd@lists.infradead.org
Subject: Re: [GIT PULL] mtd: nand: Changes for 7.1
In-Reply-To: <87y0il8v31.fsf@bootlin.com> (Miquel Raynal's message of "Fri, 17
	Apr 2026 17:28:34 +0200")
References: <87y0il8v31.fsf@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 17 Apr 2026 21:57:23 +0200
Message-ID: <87se8t8in0.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_125736_287727_5641012A 
X-CRM114-Status: UNSURE (   2.32  )
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

Cj4gVGhpcyBpcyB0aGUgTkFORCBQUiBmb3IgNy4xLgoKTWVyZ2VkIGludG8gbXRkL25leHQuCgpN
aXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=

Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C4CEDF17E
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Feb 2026 17:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S9wOyKGkaTQaW9dX1LquIkLx4SzMuCQLx83NMeuBAZ8=; b=tT68QIjVw1IEKK
	TBtlg17d+OZrBiQtFQkbWKiAc7HrPB+NFFkwOO7ElU5zZYNKsW9HbOQs4cRQT2T5179v+Q36aaklg
	8GYZayBlm9IZU1k3SJhXbZYaHk+I3WWBH14FTuReH8wikIHZKVXtAYzOCrulQBmsWbKlAKIys1Kt5
	L3AaI+sSHLWHKnmgdqtU9344KhANt8o9IGEe5ZvhEYl9iHqEt4e4T/qFPM2S2tA1IVuhixTLClhtY
	Bmmz7o2H3ZgP0OgU6+zsRM3sYDwSluIc+PJGYO7ZKqhLUUoP/sLCRiSr8PF+OmNbzasx8OicWt8qN
	juURS6/0gESG3V/T5DAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqws4-00000003jwB-0G5r;
	Fri, 13 Feb 2026 17:22:24 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqwry-00000003jva-2dqc
	for linux-mtd@lists.infradead.org;
	Fri, 13 Feb 2026 17:22:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 24FB44E40D3D;
	Fri, 13 Feb 2026 17:22:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D86AE606BE;
	Fri, 13 Feb 2026 17:22:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0E19710368C89;
	Fri, 13 Feb 2026 18:22:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771003334; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WNs1ivFMOA328bsHdPGWmZRittiSk2bnRutg0OXjPCo=;
	b=hqprDAH2mBgOFcXjakuG2SieHW3w7UutJUrXuPyn99w8h+yAuOpeYwuTjUGLpcaLi3v0F8
	ruy5oHSY7DkUZZLD4N9oHof6Ksu+qgVGg3WfCQJvzc6j5hbedpIR3TMoBqNmC4pxYNzP1Q
	NcRXgUs28NNdjJOxrFVh5ZE7FtYYTaJhggkc5c8E9H1d2FbdT7Z49YFqujnRGa8SMg0zU3
	F5zytsMkYqjgDabyVygWo9dOugOnFYrXx7/Ok0g6ZAT76h2yqyM93zSKknNXozbHqYvNhA
	YXNrUTQuyS+yvF0DsEVuIvgl1QM7GnbM4qvC/1NBVxVPhg6lwbfAtuUwKsTFZA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: Tudor Ambarus <Tudor.Ambarus@linaro.org>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Frieder Schrempf <frieder.schrempf@kontron.de>,
  Michael Walle <michael@walle.cc>,  Pratyush Yadav <pratyush@kernel.org>,
  linux-mtd@lists.infradead.org
Subject: Re: [GIT PULL] mtd: nand: Changes for 7.0
In-Reply-To: <87seb4x65y.fsf@bootlin.com> (Miquel Raynal's message of "Fri, 13
	Feb 2026 11:57:13 +0100")
References: <87seb4x65y.fsf@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 13 Feb 2026 18:22:10 +0100
Message-ID: <87bjhswocd.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_092218_801387_92A13CAD 
X-CRM114-Status: UNSURE (   4.06  )
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

Ck9uIDEzLzAyLzIwMjYgYXQgMTE6NTc6MTMgKzAxLCBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5
bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gSGVsbG8sCj4KPiBUaGlzIGlzIHRoZSBOQU5EIFBS
IGZvciA3LjAuCgpQdWxsZWQgaW4gbXRkL25leHQuCgpNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=

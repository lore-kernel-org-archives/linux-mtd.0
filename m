Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A185C4451C
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Jul 2026 12:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-ID:MIME-Version:To:Cc:
	Date:References:In-Reply-To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7x2OnJnxtsTPCNoF1MzOMg40oQKRwGCNNEVKretUcog=; b=07l0zJnV205LlT
	whDD9RIy8tuGVQdSYLpR85mERBRe72l8SVbhywK/q+TENU0k4s6Sj+vM3tN7y9Q8d6IJ6sOj8ujs8
	rl/m7MhAhp3PDD3+w5+7Gke0z4e7OIQcDIIFYTpZ4fDWVMJxup2Gp1YK1hqy66y9JO/iSohkxZuB1
	w3e/YTkCbVuY/9uw1jb7bD/oh/G6y2rp++lkaIQCBXEqSYkDAPTvmQz04k/mPQKnIGsals740zT67
	AJje9nETpkG1lm48wv0JTQhBVwLd2zm7Ay3r7GD11u8HcEXI336TAJsoxBFqFd04Umi1+VdETxoAP
	i032YJAEz23PnHUndi5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm9E8-00000009NKs-3MKY;
	Tue, 21 Jul 2026 12:05:36 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm9E6-00000009NKW-3rke
	for linux-mtd@lists.infradead.org;
	Tue, 21 Jul 2026 12:05:36 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id 0838D11A911;
	Tue, 21 Jul 2026 14:05:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1784635531;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ie+PxsGvwsrMUgSKTSuVdoLNUxND1G7QgEEtmFOatY0=;
	b=PGtXbJgHZCTjLZHBmKQoVVPctzrz8XDm7CNXfVKMFoI4SmSBgJIYdIlHDIkZm134EvMnjH
	KTY0lLJsgNkhzvWs7ZjHS89025GQTdG92i/Rjlj5AW1Y0B8hXq6L22DrdVJSdlmdLZ7aVk
	AwQUZbCUz5lloHo2R82za0HwxJ7xZLRF7WSLVGu+DZ8dHAfz4DmfYUqxLLvYXvuhd3rqEN
	3ETnl9GJ2Y1LbvCiSSFhQxzlwlCdOalJd5767ZmW9kNjxmVnId6NEHEI2eMSnNl/b1dq1p
	PiS2Wgmwx/uGgnd84733OdsHoMLDwvCh0q3Mp/6nbWvuANlGDJ3zxPKqANxmMw==
From: "Fabio Estevam" <festevam@nabladev.com>
In-Reply-To: <DK44A7A87AGB.U01P9983P29J@kernel.org>
References: <20260718213827.701787-1-festevam@gmail.com>
 <DK372KBK7E8X.383DA8L7J4JIX@kernel.org>
 <12de54ff-0f0f-a101-4f63-c0b72fd81cf4@nabladev.com> <DK44A7A87AGB.U01P9983P29J@kernel.org>
Date: Tue, 21 Jul 2026 14:05:28 +0200
Cc: "Fabio Estevam" <festevam@gmail.com>, pratyush@kernel.org, takahiro.kuwano@infineon.com, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, heiko@sntech.de, linux-mtd@lists.infradead.org
To: "Michael Walle" <mwalle@kernel.org>
MIME-Version: 1.0
Message-ID: <8556e9ee-763e-b909-7b6b-13372b309e8d@nabladev.com>
Subject: =?utf-8?q?Re=3A?= [PATCH] =?utf-8?q?mtd=3A?==?utf-8?q?_spi-nor=3A?=
 =?utf-8?q?_xmc=3A?= Add XM25QH128C identification
User-Agent: SOGoMail 5.12.9
X-Last-TLS-Session-Version: None
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_050535_112348_45C5C673 
X-CRM114-Status: UNSURE (   6.29  )
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

Hi Michael,

On Tuesday, July 21, 2026 05:47 -03, "Michael Walle" <mwalle@kernel.org> wrote:

> Yeah I get that, but since vendors tend to reuse their flash ids for
> different parts, the part name is useless (and probably wrong) most
> of the time. The idea was to just expose the id nowadays and if you
> really need the flash part name, it's the duty of an userspace
> application to figure that out.

This makes sense. Thanks for the explanation.

Let's ignore this patch then.

Thanks


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

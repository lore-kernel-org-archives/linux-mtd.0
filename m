Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D92C43458
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Jul 2026 02:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9PIVuFOELuarHQ3VFhJUuvPzYx4ierbdCQ0lNXQhLZg=; b=Qg3XmOr9zLw/AD
	jotND2b4APSAya4nBRKkpE9Hx31SdN8nPbYuGN8q32IxK18EtGmtV6PUfCWDC8fp+wMMfAzdXlyYN
	sedtSpKT9UUvWvXRosbGj05qedXnlRHDwUWzCmsPYh26fiwJMgPK6HOWzHOfa2wCVHIoZnieZX6Or
	TRr1UH546pdwOASA84rt5bBFO+Bcr77pVYDTvaNw6wxKC9C61dM4W3qDwRHjifVYNvFaZ1ZojNysL
	zvT+wVCu4c+yOishn5liiSoGxDkxKvoW8JgUnICjpvg4gQZTPqYisV9yvD9YSZJN8dOc6gq+K54rs
	8tnBrvoHZGBXxm8nKMdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wekOF-00000000Vfk-0Aj8;
	Wed, 01 Jul 2026 02:09:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wekOD-00000000VeD-15Vm
	for linux-mtd@bombadil.infradead.org;
	Wed, 01 Jul 2026 02:09:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=D3+fLSiQiypGc4qUS4DH9EcOOgwYXedkAwP2/fU5MD4=; b=S3vudzTHT2OmG1k6vosJYo582d
	b1DekGd+RHeKGASJNZOL2je4R04iabQQKsvBve1GPWhA0Lpxs9EQbPB0+/kTIz+5VlCrb00CLqG37
	46S/3nPa+if4dNZDXuaJDpc9E0a1h4n1LTEFqpSDWE8Ejz1jfGuQ8YAFh4ATkItq9B1gAJFVOkKpZ
	hQcCGbHUGMoSwD16MAe6ogUoLtQ9PHN+DJL2nqLTv486JSYmvvZNZbWApjQiBLeS4dm0euqISS1/E
	z9kt2jiELmTkPVKfiHsHvftvxECFuCVdCnvohXfabvV+FbJjHzKBySstRnwKobxHL6Kla+upjda16
	QFrLTrPg==;
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wekO7-00000002K8s-1O8g
	for linux-mtd@lists.infradead.org;
	Wed, 01 Jul 2026 02:09:23 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id D10192C044A;
	Wed,  1 Jul 2026 14:08:56 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1782871736;
	bh=D3+fLSiQiypGc4qUS4DH9EcOOgwYXedkAwP2/fU5MD4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nqTHjBXSeD+EKayUETNW9jZLbsg96pDPYbUtO18sEi6d/faVy0UITfhjDGZndn47G
	 wEFIUzh25ktYv7l59cpUw+3iomE+rM1ia5C520NtK4wn+h/+w2F6NHQzUU40yaeuGd
	 6I0oNA8yLEFyoEtLJvUhynmuBoWm0QTp5IX5frkVGb/1TbwSj1hqIjlf/JNS3/DZhX
	 KyiXKkSQNTciWLwGEBsMk0wekO479u/nwt6WhcKylbb5tWs59w/noH4CS7cmvDJt4I
	 jTrEe35vS33AHorbj8zDlzvty1ICpQ/+2hFCrrAiCmJLtY44sGhmDDPSzBKNypM8/3
	 R2kXoAQJqmY/Q==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6a4476b80000>; Wed, 01 Jul 2026 14:08:56 +1200
Received: from ronand-dl.ws.atlnz.lc (ronand-dl.ws.atlnz.lc [10.33.12.18])
	by pat.atlnz.lc (Postfix) with ESMTP id B4E1913EC4E;
	Wed,  1 Jul 2026 14:08:56 +1200 (NZST)
Received: by ronand-dl.ws.atlnz.lc (Postfix, from userid 1930)
	id B02ED4E2086; Wed,  1 Jul 2026 14:08:56 +1200 (NZST)
From: Ronan Dalton <ronan.dalton@alliedtelesis.co.nz>
To: takahiro.kuwano@infineon.com
Cc: Aryan.Srivastava@alliedtelesis.co.nz,
	Chris.Packham@alliedtelesis.co.nz,
	Ronan.Dalton@alliedtelesis.co.nz,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	mwalle@kernel.org,
	pratyush@kernel.org,
	richard@nod.at,
	vigneshr@ti.com
Subject: RE: [PATCH v2 1/3] Revert "mtd: spi-nor: remove Fujitsu MB85RS1MT support"
Date: Wed,  1 Jul 2026 14:08:56 +1200
Message-ID: <20260701020856.217664-1-ronan.dalton@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <2b8390c0aaae4203af318f9a5edbb0eb@infineon.com>
References: <2b8390c0aaae4203af318f9a5edbb0eb@infineon.com>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=TI3mSEla c=1 sm=1 tr=0 ts=6a4476b8 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=RAioF0-LDSMA:10 a=RkgXLpF5cQjgT6HMl8kA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_030921_260001_48675D21 
X-CRM114-Status: GOOD (  14.93  )
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

Hi Takahiro,

> We don't add any FRAM chips in SPI-NOR...

The SPI-NOR subsystem has support for the cy15x104q chips, which are
FRAM chips. There is also support for Everspin MRAM chips, which are
comparible to FRAM (and are also of small size).

Because of this, we thought there was precident to add support for this
chip. I was under the impression that the opcodes used to interact with
the chip had a greater significance than the underlying technology used,
and this chip fits in with the other spi-nor chips based on that. Feel
free to correct me if I'm wrong here.

> > The use is for a small amount of additional storage separate to the main
> > system NAND flash for some small "critical" files that we don't want to
> > lose. We've been using devices like the mchp23lcv1024 and mr25h40 on
> > other products for some time.
> > 
> For that use, how about using tmpfs with NVMEM backup?

Could you elaborate on this? I'm familiar with tmpfs but not with using
NVMEM as a backup for it. Is there some method of syncing a tmpfs to
NVMEM that the kernel provides?

Thanks,
Ronan.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

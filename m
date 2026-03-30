Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 680C2FF492F
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Mar 2026 07:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mGEiKDXxAIWxKNqaLtuzbl8I8584Kcptpp7I1tZhA64=; b=pNuXDLb2QIxNc/
	Cyj+o1Olhmb8ZWYujl062DZsI0wNacoqqHqEVNR+htw0EQ5sK21nvCFlXuvmniQFfjTSzr3r4ZuTZ
	wxinmvilZichEa1dn4Ik9EQOfJHugQaGUVt63y/Cf6TCF1CYXd/FVW/AzoBO24Kas7tIB+fOgx6V8
	L2SjW54LDH5fJOTdobnEGa+XYRroTQ4C864V3Nxx28ODaLx4T5PWRcFb7UgwgGla/1X+UB6z14Mwi
	HIkbi0fUbFlADSrZ7P2dD0YpjdetDKNPNmi1XeQajN84NlhbRVY0Tya1VFIiCSd1JPlnudFnj6YZ4
	3jeYENRl0ny6y1OTEo6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w776B-0000000Alyo-1FMk;
	Mon, 30 Mar 2026 07:31:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7768-0000000AlxF-3rgD
	for linux-mtd@bombadil.infradead.org;
	Mon, 30 Mar 2026 07:31:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=yBvn4M2fwZ/wUpBIpN5sR6P7GDJXzK0vo3gw3vBP+xw=; b=SZtM66IoQ+qby8aednce36TCuj
	GUcvjejGv1sc6B1j7FppIF+4ecJrMc3jg9IeeSbuH0yMhZ19k8JMX2ew+aV+wVVSogVRxiybeoLGC
	k+4apC04WwBxzZOQX8K2B3tcTlOAWl2A03VAJ+ataS8vE9Pq7Y613MMPSxELm/q2bIrrf+8Tr7S/6
	CsxAyeedvbob9WNBuhNXkOj3Foe9ocldow0GjQKNIZpDN9yL7CR5MeAVsAuoumgbKvuBmOYG1ftSH
	LVBcIOzftHguk9kZqYzi+bg8gRdMP+SmrBbU6pWkF13vhJLkS3u/3gEEv14/IEFllwnnRRd+wYp/o
	TV5u5mdw==;
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7766-0000000DDXC-0XpU
	for linux-mtd@lists.infradead.org;
	Mon, 30 Mar 2026 07:31:43 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-35d9f68d011so657508a91.2
        for <linux-mtd@lists.infradead.org>; Mon, 30 Mar 2026 00:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774855900; x=1775460700; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yBvn4M2fwZ/wUpBIpN5sR6P7GDJXzK0vo3gw3vBP+xw=;
        b=lPtOhmRKU3JiApzy5B3PyngRzcQFIHW2yzOA9W9yl6tfXVPRQ1xfmQXGWqOPexINS+
         IQYiuBSc9bp5KzST95d9PiG/1R5cHJOu6Ak4A0I+DXy6WaVzHD9oRSSCd5yiIyFRB6LU
         y2syh2kyLsL5hvvJS4Tx0P3mKubPoCbMTAUHPusqW2QtLdrZzJTa6ZjROOUpxc1Q7dHl
         gpFRm2Zg8CKFj4RhWvmpOeChKs/QMb+y7Y+TKLvgokyBwqhKiusjI79S8NAtdtOJBiVe
         vUBaDjTTiDZYZHeyru4cuEhlA9qzKxbUb0NlpPtOXG1dxJ9qfLFKQY+EqXUYmkMscaQ2
         FoiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774855900; x=1775460700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yBvn4M2fwZ/wUpBIpN5sR6P7GDJXzK0vo3gw3vBP+xw=;
        b=falS7ccIHYNtPz0kD9r0dg8i3QfbW3ZIYBIR1Gtlxbh8wfIfIrw+wGEgXtP5okq8Is
         6OnM4MfzqI4Mvwb1ZBWBr3BMrXDRcJapIRpCAliQ/YW4MIxPfKYse3UBd3UGGMGV2Hrk
         W7yYobD/uHZzt0HgEIorMDAdsdPdL2JQ5WvbUSwNafw9twNaLadiE1OCwiPTWAbFg12b
         XXYvEEdrTQsHw//tjUVLCZydwsnDgsPp1i46+rq3NYNU69VJ9NNl89hKEtDZ6K0iPLew
         A7P//qPdrw7cvGjtBdkLeUafifX0gRW7Tz2Z7guH85TXBuL33F2umAlN8SJolsuzNTbo
         HuDg==
X-Forwarded-Encrypted: i=1; AJvYcCU6SdHJfYBlcVskbG3IkoAgVvYVPS5VkL2LahAnys5iYwbK8mDB8mepGc8riWRnPWjDE8quw4GBY+M=@lists.infradead.org
X-Gm-Message-State: AOJu0YwwDy5Yyc54ZDEkXPnL058CIDO+0EdZv9ECbQQQYPFmVi+zU4+d
	SyO5yTznD3ZWN9w8oNyD2QM0tQ1zS744v9vTDcZTKG5vJEsPNp3QGSuM
X-Gm-Gg: ATEYQzzqp+MVzJZSDQo5p5pdwnZlwTpb2H7h6y7Jk91o/lnhjOiobN5SmFu3y5e4ssG
	9LvBglTcE90CjzV7GdAAbp++xmppWNbNF9AwsN0pD9Ro52vqCbZtQbOPjg2vHPyL/+4VGbFQWSZ
	R3R1wr8uI8mESBp6s5njkhs7YRQGO09TxAR6IOEjEC749rujtmlHquCPhEU51BIM6jmnvraGQdE
	Lp8sxc6aM1XupIE35lYXVap9nw1KhZ/jwh0CiPBN6w5yg8aY0PAlHoCiS3jry0BLYIMboruukb3
	KivqsuAVfZaJe7GrybzI1kdhLwJsyNr1au4cCnvvwEh8AXAv++YZmu7l8u10cW0alqdGm/Z6zQx
	rQHdZbZ6qZo0gSfu5vrsNxNgXvKQC9qUWbkwaj+ZJxJPXQzgsarNMLklyOdkE5mhOFLpPLGZ0ri
	u3eQabSlCIKACrTp51Q1KeepOmB3eVR1k=
X-Received: by 2002:a17:902:ce81:b0:2ae:c5fc:b2ea with SMTP id d9443c01a7336-2b0cdcb73edmr129302335ad.30.1774855899658;
        Mon, 30 Mar 2026 00:31:39 -0700 (PDT)
Received: from d14217fb1c18 ([115.245.213.202])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427c3a4esm87361935ad.78.2026.03.30.00.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 00:31:39 -0700 (PDT)
From: Sanjaikumar V S <sanjaikumarvs@gmail.com>
To: mwalle@kernel.org,
	pratyush@kernel.org
Cc: hd@os-cillation.de,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	sanjaikumar.vs@dicortech.com,
	sanjaikumarvs@gmail.com,
	stable@vger.kernel.org,
	tudor.ambarus@linaro.org,
	vigneshr@ti.com
Subject: Re: [PATCH v4 0/2] mtd: spi-nor: Fix SST AAI write mode
Date: Mon, 30 Mar 2026 07:31:29 +0000
Message-ID: <20260330073129.24-1-sanjaikumarvs@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260311103057.29-1-sanjaikumarvs@gmail.com>
References: <20260311103057.29-1-sanjaikumarvs@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_083142_296563_90F261B1 
X-CRM114-Status: UNSURE (   7.52  )
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

Hi,

I wanted to follow up on this patch series fixing SST AAI write mode
issues. It has received Tested-by and Reviewed-by tags from Hendrik
Donner.

Could you please let me know if any further changes or actions are
required for these patches to be considered for inclusion?

Thanks,
Sanjaikumar

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

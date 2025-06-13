Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7612DC71135
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Jun 2025 09:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Az4ElPXbi+bumlsdD9Wvkyhm/wvkCj3nFZz8P6mp/EE=; b=H1imvPaYJhFDkm
	j2LFvbnSc2cc0Ncv3dv5XCZ5XOsLvoC9wiBRYAX7qET4ZzTAD310nrz2z56jbX/0UA+IRPlMtkMWI
	4R6L/+ZQ6oabFfnFV9xGxe1ZVz9/YoNf3c4bIo2szCe/2pSIWW/+l4kQbcFmCXTYlf2IXJGVdHHzQ
	+VSfPz//I/RtC8ptvM0NPviFhNkFnkjanOB4e+unUq73vHCtZcoNJGI5HhwQZNJeXx4c2D74YYK5P
	yyyvNOpiDjJ/qBXAItQTILFwufi7SZC+hUSFVvtXgoztUPjaBo5InyIR2j7jJqJ4YbD5OG5VE73OU
	JNV4VDnVYztxp3bqqqJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ0Iz-0000000Fpu7-2LZl;
	Fri, 13 Jun 2025 09:02:33 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ0Iw-0000000FptV-35lc
	for linux-mtd@lists.infradead.org;
	Fri, 13 Jun 2025 09:02:32 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D7x6wD001805;
	Fri, 13 Jun 2025 11:02:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	dhCZHLOoz/DA9KLk72kzXl6//47HjrLiscmsJROqQU4=; b=TJC+HIwQFnR8RuRE
	wppUKNBTKL3/NwpFH9nE0ngb/rqF9Lu/ileLRgMIYn9UyLjZyEKItkKvekDrpNco
	CH2Ar921nY18Xdl/0P13yXdoS1ZBzpkgQY+25liPF5pVzK8R6E9CTtow/QLDHGU6
	yPdG0oZwXpqhwfLaDOymuGleYwO6An1dIpbs9rOSkv8i7GQoffy8c3UWJ+uMlfvM
	tauK1RzCWrm/luM7ZBmnYOHOabBLRh89Nw6WHyd9Vc/fcI6/JJ5bdV1tgLduLKaj
	fzoB7FPeV6Etip+hdlvBfqPA2PiZJrvr7H+x16QQsMmf1UpyJFlDeSmTAZ3RplPw
	qdJ18Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474ajaktns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Jun 2025 11:02:23 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8DF594005E;
	Fri, 13 Jun 2025 11:01:37 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DA3C7B9447F;
	Fri, 13 Jun 2025 11:01:04 +0200 (CEST)
Received: from [10.48.86.103] (10.48.86.103) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 11:01:04 +0200
Message-ID: <8f4c2f36-71af-4c84-bcee-2554cea991d0@foss.st.com>
Date: Fri, 13 Jun 2025 11:01:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fscrypt: don't use hardware offload Crypto API drivers
To: Eric Biggers <ebiggers@kernel.org>, <linux-fscrypt@vger.kernel.org>
CC: <linux-crypto@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>, <linux-ext4@vger.kernel.org>,
        <linux-f2fs-devel@lists.sourceforge.net>, <ceph-devel@vger.kernel.org>
References: <20250611205859.80819-1-ebiggers@kernel.org>
Content-Language: en-US
From: Maxime MERE <maxime.mere@foss.st.com>
In-Reply-To: <20250611205859.80819-1-ebiggers@kernel.org>
X-Originating-IP: [10.48.86.103]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_020231_278570_CCB03707 
X-CRM114-Status: GOOD (  10.06  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

On 6/11/25 22:58, Eric Biggers wrote:
> To protect users from these buggy and seemingly unhelpful drivers that I
> have no way of testing, let's make fscrypt not use them.  Unfortunately
> there is no direct support for doing so in the Crypto API, but we can
> achieve something very close to it by disallowing algorithms that have
> ASYNC, ALLOCATES_MEMORY, or KERN_DRIVER_ONLY set.

I agree that software drivers are more efficient and less prone to bugs 
than hardware drivers. However, I would like to highlight the fact that 
certain ST products (the STM32MP2x series) have features that allow the 
loading of a secret key via an internal bus from a Secure OS to the CRYP 
peripheral (usable by the kernel). This enables cryptographic operations 
to be delegated to the non-secure side (the kernel) without exposing the 
key.

If fscrypt no longer supports hardware drivers, then this type of 
functionality could not be used, which I find unfortunate because it is 
something that might interest users.


cheers,

Maxime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

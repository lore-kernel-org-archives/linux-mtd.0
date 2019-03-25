Return-Path: <SRS0=pM9p=R4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E52B8C43381
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2019 16:20:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC9DF20828
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2019 16:20:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mMhelBWf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC9DF20828
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bxlYrEaY11OvrZHCQy9P93CWYWSkmMmU7TFlB0MeTFY=; b=mMhelBWfaUmDRN9bQBEgK098J
	mqChCm9FI3VCf8IRBKFnn/PFqZzDaiaQcd4gUeP8hOc8a2vq5GoaVGCmmuLovGcQUvvXnft2VSuRv
	Y1RKUCjofG0suvx8sTogHFwMN+mi2GUJrHpkmJpM+fiPe71tTKIKXX9g6faZpCebzC3Azc2f1MqSJ
	avPUId9axQGEqoqriinshIAx/Tm4Tar6ltqKiQetii0qz4c4F8xFHgvZKygmbqpEndek8fIzdeYJz
	KKLSdswtEnzZChreBKHk1MU9tZa6WTDphGsPWzMNgxV3S7ptyEQa3ji0E5MNodOojvorMynoP/T2N
	XRClDXyLQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8SKQ-0004hu-Qa; Mon, 25 Mar 2019 16:20:02 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93]
 helo=mx07-00178001.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8SKI-0004hU-Gh; Mon, 25 Mar 2019 16:19:56 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x2PGGoBN032425; Mon, 25 Mar 2019 17:19:46 +0100
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2rddht4s2a-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 25 Mar 2019 17:19:46 +0100
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3776E3D;
 Mon, 25 Mar 2019 16:19:46 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0C2EEE93;
 Mon, 25 Mar 2019 16:19:46 +0000 (GMT)
Received: from [10.48.0.237] (10.75.127.45) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 25 Mar
 2019 17:19:45 +0100
Subject: Re: [PATCH 1/2] spi: stm32-qspi: add spi_master_put in release
 function
To: Mark Brown <broonie@kernel.org>
References: <1553265354-16433-1-git-send-email-ludovic.Barre@st.com>
 <1553265354-16433-2-git-send-email-ludovic.Barre@st.com>
 <20190325160313.GJ7284@sirena.org.uk>
From: Ludovic BARRE <ludovic.barre@st.com>
Message-ID: <7742cae8-3fcf-a3ba-2807-d5ed100cd8a4@st.com>
Date: Mon, 25 Mar 2019 17:19:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190325160313.GJ7284@sirena.org.uk>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-25_09:, , signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_091954_860075_97390D3E 
X-CRM114-Status: GOOD (  11.76  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

aGkgTWFyawoKT24gMy8yNS8xOSA1OjAzIFBNLCBNYXJrIEJyb3duIHdyb3RlOgo+IE9uIEZyaSwg
TWFyIDIyLCAyMDE5IGF0IDAzOjM1OjUzUE0gKzAxMDAsIEx1ZG92aWMgQmFycmUgd3JvdGU6Cj4+
IEZyb206IEx1ZG92aWMgQmFycmUgPGx1ZG92aWMuYmFycmVAc3QuY29tPgo+Pgo+PiBUaGlzIHBh
dGNoIGFkZHMgc3BpX21hc3Rlcl9wdXQgaW4gcmVsZWFzZSBmdW5jdGlvbgo+PiB0byBkcm9wIHRo
ZSBjb250cm9sbGVyJ3MgcmVmY291bnQuCj4gCj4gSSdtIGdldHRpbmcgYnVpbGQgZXJyb3JzIHdp
dGggdGhpczoKPiAKPiAgICBDQyAgICAgIGRyaXZlcnMvc3BpL3NwaS1zdG0zMi1xc3BpLm8KPiBk
cml2ZXJzL3NwaS9zcGktc3RtMzItcXNwaS5jOiBJbiBmdW5jdGlvbiDigJhzdG0zMl9xc3BpX3By
b2Jl4oCZOgo+IGRyaXZlcnMvc3BpL3NwaS1zdG0zMi1xc3BpLmM6NDMwOjg6IGVycm9yOiDigJhz
dHJ1Y3Qgc3RtMzJfcXNwaeKAmSBoYXMgbm8gbWVtYmVyIG5hbWVkIOKAmHBoeXNfYmFzZeKAmTsg
ZGlkIHlvdSBtZWFuIOKAmGlvX2Jhc2XigJk/Cj4gICAgcXNwaS0+cGh5c19iYXNlID0gcmVzLT5z
dGFydDsKPiAgICAgICAgICBefn5+fn5+fn4KPiAgICAgICAgICBpb19iYXNlCj4gCgpJIHdhcyBz
dXJlIEkgYnVpbHQgZWFjaCBwYXRjaCwgYnV0IHRoZSBmYWN0IGlzIHRoZXJlIGFuIGVycm9yIDot
KApJIHJlc2VuZCBhIHNlcmllIHdpdGggdGhpcyBsaW5lIGluIHRoZSBzZWNvbmQgcGF0Y2gKClJl
Z2FyZHMKTHVkbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K

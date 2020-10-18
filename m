Return-Path: <SRS0=OH0o=DZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAC1AC433DF
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Oct 2020 21:01:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 138A321D41
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Oct 2020 21:01:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jCYB/JDv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 138A321D41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sigma-star.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qwIYm1OUSZIHyBBmCSA8Q1x7aE8qdJSFvDEKI3grmiY=; b=jCYB/JDvaqgBNWLFPQqY+3cfy
	VHraB+7airb4Voiowe33GM0kyM90SaUGL5xbkeSXGPKjNVYFwWtGTAWW8JC0GupnEZMGyBKEwKs7p
	kL3NmS8VyYv15j1MlGDFtTyBhftvpYhjssRRePbplhVwG2+PX6005AOldusXeuG4zuPyuoyYsfWUn
	InhMpNwx6YfwOUiw+z3Cwu1kxFjEj227FNFcB2Hyrio8xqTod7A23+y6kH3VDvyvYAnGjQU79gqi0
	RVzoAj2K+9lCSTmpzm0tGHGTNg9v3cIIppEIWkCt/Ec/rvN2ehW0+B1OtYxN9t04EsY4G1+aurIrc
	s/Y2e4vVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUFmv-0004QX-Ix; Sun, 18 Oct 2020 21:00:21 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUFmt-0004QA-8O
 for linux-mtd@lists.infradead.org; Sun, 18 Oct 2020 21:00:19 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 0DB441816C713;
 Sun, 18 Oct 2020 23:00:18 +0200 (CEST)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id R-sVCC5vxAMn; Sun, 18 Oct 2020 23:00:17 +0200 (CEST)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id LiGel5-YT5zw; Sun, 18 Oct 2020 23:00:16 +0200 (CEST)
Subject: Re: Subject: [PATCH] Fix const definition without initialization
To: =?UTF-8?Q?Hans_Christian_L=c3=b8nstad?= <hcl@datarespons.no>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <AM6PR03MB416574D2D264C136BA63C4C5C4BF0@AM6PR03MB4165.eurprd03.prod.outlook.com>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Organization: sigma star gmbh
Message-ID: <4bc5a052-7a73-a99d-9e3b-12c7e981af8d@sigma-star.at>
Date: Sun, 18 Oct 2020 23:00:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <AM6PR03MB416574D2D264C136BA63C4C5C4BF0@AM6PR03MB4165.eurprd03.prod.outlook.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201018_170019_439735_CCB30026 
X-CRM114-Status: GOOD (  12.46  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgpzb3JyeSBmb3IgdGhlIGRlbGF5LiBJIG11c3QgaGF2ZSBtaXNzZWQgdGhpcyBvbmUgb24g
dGhlIE1MIGJ1dCBzdHVtYmxlZApvdmVyIGl0IHRvZGF5IHdoZW4gZ29pbmcgdGhyb3VnaCB0aGUg
cGF0Y2h3b3JrIGJhY2tsb2cuCgpQbGVhc2UgdXNlIGEgcHJlZml4IG9uIHRoZSBzdWJqZWN0IG5l
eHQgdGltZSB0byBoaWdobGlnaHQgdGhhdCB0aGlzIHBhdGNoCmlzIGZvciBtdGQtdXRpbHMuCgpB
bHNvLCBJIGhhZCB0byBmaXggc29tZSB3aGl0ZSBzcGFjZSBtYW5nbGluZyB0byBhcHBseSB0aGUg
cGF0Y2ggb24gbXkgZW5kLgoKT24gNS8xMy8yMCA5OjExIEFNLCBIYW5zIENocmlzdGlhbiBMw7hu
c3RhZCB3cm90ZToKPiBDb21waWxlIGVycm9yIHVzaW5nIGcrKyA5LjMuIFJlbW92ZSBjb25zdCBz
cGVjaWZpZXIgZ2l2ZW4gdGhlIHN0cnVjdHVyZSBpcyBmaWxsZWQgaW4gcnVuLXRpbWUuCgpXaGVy
ZSBkbyB5b3UgZ2V0IHRoZSBjb21waWxlIGVycm9yPyBDb3VsZCB5b3UgcGFzdGUgYW4gZXJyb3Ig
bWVzc2FnZT8KCkkgZGlkIGEgcXVpY2sgZ2l0LWdyZXAgYW5kIGl0IGFwcGVhcnMgdG8gbWUgdGhh
dCB0aGUgY29kZSB0aGF0IGluaXRpYWxpemVzCnRob3NlIGZpZWxkcyBleHBsaWNpdGx5IGNhc3Rz
IHRoZSBjb25zdCBhd2F5LgoKWW91IHdyb3RlIGcrKy4gRGlkIHlvdSBtZWFuIGdjYyBvciBhcmUg
eW91IHRyeWluZyB0byBmb3JjZSB0aGUgQyBjb2RlIHRocm91Z2gKYSBDKysgY29tcGlsZXI/CgpU
aGFua3MsCgpEYXZpZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K

Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2AD8CCF2C3
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2026 18:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gr298ecdizpG8D52nG868FIqpfo0hbTWVF+/T7TQMfU=; b=ce9vDjjlJYTOZR
	EV7nAKt55H37r5CoM7VyORxlSK+eJQirDslyMHNsmkcdIE8JevU1tEVoHglGbXcjPWQtKnx5Ilduo
	mZJqL/gmgSLmAe+w99L2QVI0MCwRdDV4jTLsQXcDES48D4cum0vQ4yvpaUQd4PW2Eatal1K2P1KbI
	l6jCYu41ZE3JfNKTIacxV9AAoQp5d/2Tf80tjMOXsWRr0Uu5f3U4Ro44+oKJsSAQde67Nfy2EhHBM
	5koA92LUsKrLPNzIGChasuwab7Y0zs5NekfhGADOTZ3CJ6WiE0RuZYW76ufzrMV8o1U+JUR6reWmn
	fhjw+41k7ZbPtoy8/vIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHn2r-00000003jQk-21xu;
	Fri, 16 Oct 2026 18:52:45 +0000
Received: from mx0a-00364e01.pphosted.com ([148.163.135.74])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHn2n-00000003jQB-2ShB
	for linux-mtd@lists.infradead.org;
	Fri, 16 Oct 2026 18:52:44 +0000
Received: from pps.filterd (m0167070.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GIc2K31127676
	for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2026 14:52:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=HLzc
	yOFA9B8jdMdzXfvMlEdd0KokvuoLnoCqr8l8IU8=; b=hdqcWmWotaXDPyTKxiHc
	aMTrp6nTieLLfPR/BF662ZzoXdrigD8AB6UXqjHbHI6dhuyYt+QK71wM31C1eCPa
	1k0tgrk3a/0rI99rRs9pzW4cxy8nRc6MPL5vJBItEzH5DNxTd8lwYMme+5mGPTjo
	hdRx5uY3aTEfBtpF2mCTEs0rhJBJeA7YJbfnibO0g697YTHNIJsADjda0HEzQJvd
	VwTKGatk8xMAx/MTFWJaqLLIVBeaM7akJfVV4xpCVldKkR4G0yxetLVZMoxfRx47
	5pHE9EENxilUozZmMi81rCqa4xdvwegcH/ceUNOWrUR3miyZ6q1hgwkc5SARa0hA
	iw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4hbq8f1c3j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2026 14:52:40 -0400 (EDT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-917a7fffbe0so5335926d6.1
        for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2026 11:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792176760; x=1792781560; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HLzcyOFA9B8jdMdzXfvMlEdd0KokvuoLnoCqr8l8IU8=;
        b=CRv2dPLxQwN51IYPrG5LMW7mO4V9PuUPNr6ZFnPhF3mZzaLTSvJpAQURyPmBo+EWZ/
         Zx3nvQhrm9X/Q2BZfXke67WZDHKEQBGHfJJpMjOAgVTOukIylOh3qAkZy7exUN0Jfbof
         rer3Xx3B8+ZZz2mle9gzuiI+cBJ6FeEsI/V0pwzk0lvEPIJKAgYipiXdLi/R0ByoKpiM
         hfc4mh9dXQCPHRDE+HGqnMIQKIlSicZNZDZb+rf10At6fCS18VcEyjIrNBV8HtFvo8V7
         AbmmotU+Ix9DZyS/tlV4Dhm7Htd2ayjCd/r/L3DabF3eARJUqPfCMxWqFxCuoJQulq76
         HuuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792176760; x=1792781560;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HLzcyOFA9B8jdMdzXfvMlEdd0KokvuoLnoCqr8l8IU8=;
        b=riS2m5/HiFuAPzF7BBTzVOY/SAACCJHS9JKo1FBHmlmIi2HgsXbYl0dj1P8SZzN6LC
         i7x4ZtnnMItla2qxDPZ6jpI1Rn5WeOBCS+9yG9p6WbNjLv5XbI7t11i5WA4bgvS/HbJc
         YN5pjq0yH+3HGytVwHPPbWMV5TrU53bBfxk16jWesc2ur1rzLEeg/vnBbIjdK4t6R5xH
         UujB0ayi7sp9/jg4IccBQGzhS58wKtCrNa51U/hUqDZrRyFCnYzcVTckfHUA0bAchgYO
         0k/PHaw6hVu5S/36y/5XqpFhYMg1/3nOyIGE+cp3eDXctUroaNOo3lSMnZ6hdBRPrTa6
         Uhtg==
X-Forwarded-Encrypted: i=1; AKwUvByJkRllkhDzd1n314YqezYPg8wE3Cx0vlbyl7MJvbwzP3uGjjQVsoFgu4gP7+6AFxO0lOcxuwdLDrQ=@lists.infradead.org
X-Gm-Message-State: AFq9FYKlr7aOAo7imrPlGeiGJeZVUymqoUagvKUM3MsPUmqUAIY4eZwl
	ryEDqy8pjgBcdvA0yS/CXh4VYxjG9CVdTvjeO//eE8nOqygBXV5OxeaCNkygYeloRF0Y/Pvh70X
	4stlR/KWFM2PYCOTeyG2bOxNXtV0Wa5ySBgT6U4NZ1vIth6G5g7AKfg5IKjIzA+g=
X-Gm-Gg: AYBFou2e+VZ+SDwTOzI0r+TX6iDUcWlLi1US8ag3GxXSLEdeYWoZuzlUKenvncjpQFv
	AbLF+gV2W23ZSWeu06tfw1k3vxc4WK5+9zrm5hFaniO35xARO1sP9zfGXChS3X2ilHK15FfceBL
	mk7ITawYzBLS1O4rLDYRJQ3lfiRgatPz6ZWAHRM8t6fYI7ttZ6BqpEdoSPx1F0v+eptkrFYlr4Y
	JuRlUKj+qWCM4ob52WF/3uYF7fogM1AerwZXklXML648GMDZfQgu0JecIRG7pk/q+3qeXzlW4HV
	hJ5HQHmxm3D69GKLoGpxF/XVs/A+ZEKfumtKCqzrLuJCyL0VQdFpeABCHKw7BNZqB+xbCnciIo3
	e0drUIfsC/2cQ7bTLzmQkDxrApTdq8Oiy0voVSfcp8bTQyVh6
X-Received: by 2002:a05:620a:4515:b0:93c:72d2:ccc0 with SMTP id af79cd13be357-93f29ceee70mr133495385a.17.1792176759715;
        Fri, 16 Oct 2026 11:52:39 -0700 (PDT)
X-Received: by 2002:a05:620a:4515:b0:93c:72d2:ccc0 with SMTP id af79cd13be357-93f29ceee70mr133492585a.17.1792176759158;
        Fri, 16 Oct 2026 11:52:39 -0700 (PDT)
Received: from [10.207.9.0] (nat-128-59-178-241.net.columbia.edu. [128.59.178.241])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a198853sm281236285a.28.2026.10.16.11.52.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 11:52:38 -0700 (PDT)
Message-ID: <9ca9dba7-ca5c-4920-a807-4c60b5f089b4@columbia.edu>
Date: Fri, 16 Oct 2026 14:52:38 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] mtd: block2mtd: convert to folios
To: =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@barelysecure.org>
Cc: Joern Engel <joern@lazybastard.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261014-block2mtd-folio-v1-0-19d24ae676ee@columbia.edu>
 <atEd1rbZ_TCXpqXd@cashel.logfs.org>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <atEd1rbZ_TCXpqXd@cashel.logfs.org>
X-Authority-Analysis: v=2.4 cv=TeADJhQh c=1 sm=1 tr=0 ts=6ad27278 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=4lNGE6/ihKpdiDSMgFMHRw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=svvvyxlR1OQQkelhaPoB:22
 a=1Hu-8JeRPXiKkjeNRBkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: Ydx4x_auOQbHKRgzuK0Zz0-_i7jyxI0E
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA3NSBTYWx0ZWRfX02t+82jpvEcH
 eaCBPfTTo0hX5kJAw5UQfzFVH+pS/56ktNxNNr2rrX8T+a8BtLMYYyY3pP7tpUiWOjQ9BQ3zLUh
 ut+KW9GCbFSv1csv+6zf0rtOizW9J43lJJU5WhPYHhGQZgnsF0Hj
X-Proofpoint-GUID: Ydx4x_auOQbHKRgzuK0Zz0-_i7jyxI0E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA3NSBTYWx0ZWRfX+BUv4mGoDiFy
 zAere0ikel9/+sqkV6cWIKqlaZcnWnTY99ku9DoqcFW7PYIeElLfVq9rJ2iJzGnwhtHl/hAd9rO
 uibOW3xQ8Sh1bfGMuYmrBjlgcNDu0LJTVSUGVZq2co9tU8cRYB2FKESp0l+xO/9f6/ksGaymYzn
 U93yUR/W3yAJ+XCWThXxvPSAoKltk8gZz9FA4Rrhq8tJrApBLdX5C05kUeFx8TEKRYJF3ZS2Yp+
 LFHua3FqwdnsgKrD6ffZa11A7YVcf8lOTQSGxAbXvLO9pOKG3ULEyy19X4ObL27WU92DSBUOnAB
 GHMIm7vkLmD/f4t1nZdOwVIoUxOxyrCHTSg0muX0iYD+LJtzw055DNSUpRvfXcbQahhqGloYcAr
 phNlR31J1Alwe9LhhabtlwMkoxImURed32MwXRwpzKd1cEKV1VRUA87Qx5215uapqItOvKwpoc4
 fUSWQ1WZByLb7KHw12Q==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11937
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=10 spamscore=0 impostorscore=10 bulkscore=10
 malwarescore=0 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_115241_632734_6151A45F 
X-CRM114-Status: GOOD (  17.59  )
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

T24gMTAvMTUvMjYgMjozOSBQTSwgSsO2cm4gRW5nZWwgd3JvdGU6Cj4gT24gV2VkLCBPY3QgMTQs
IDIwMjYgYXQgMTE6MzQ6NTNQTSAtMDQwMCwgVGFsIFp1c3NtYW4gd3JvdGU6Cj4+IAo+PiBUaGUg
bnVtYmVycyBiZWxvdyBhcmUgZnJvbSBtdGRfc3BlZWR0ZXN0LCBpbiBNaUIvcywgYnkgZm9saW8g
c2l6ZSwKPj4gZXhjZXB0IHRoZSBsYXN0IHJvdywgd2hpY2ggaXMgZnJvbSB0aGUgTUVNRVJBU0Ug
aW9jdGw6Cj4+IAo+PiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0rLS0t
LS0tLS0rLS0tLS0tLS0tKy0tLS0tLS0tLSsKPj4gfCBUZXN0ICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgRm9saW8gfCAgIEJhc2UgfCBQYXRjaGVkIHwgIENoYW5nZSB8Cj4+ICstLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLSstLS0tLS0tLSstLS0tLS0tLS0rLS0tLS0tLS0t
Kwo+PiB8IEVyYXNlYmxvY2sgcmVhZCAoMTI4IEtpQikgICAgfCAgIDRLICB8ICAxMjU0NSB8ICAg
MTI4NjMgfCAgICsyLjUlIHwKPj4gfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDE2
SyAgfCAgMTI5OTggfCAgIDE3MjI5IHwgICszMi42JSB8Cj4+IHwgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICA2NEsgIHwgIDEzMDA5IHwgICAxOTEzNSB8ICArNDcuMSUgfAo+PiArLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0rLS0tLS0tLS0rLS0tLS0tLS0tKy0t
LS0tLS0tLSsKPiAKPiBUaGFuayB5b3UhICBDb2RlIHNpemUgZ29lcyBkb3duLCBjb2RlIHNlZW1z
IHN1YmplY3RpdmVseSBlYXNpZXIgdG8gcmVhZAo+IGFuZCBwZXJmb3JtYW5jZSBnb2VzIHVwLiAg
R29vZCBzdHVmZiEKPiAKPiBUaGUgb25lIHBldCBjb21wbGFpbnQgSSBoYXZlIGlzIHRoYXQgYmVu
Y2htYXJrcyBzaG91bGQgbWVhc3VyZSBiYWRuZXNzLAo+IG5vdCBnb29kbmVzcy4gIEh1bWFucyB0
ZW5kIHRvIHByaW9yaXRpemUgdGhlIGJpZyBudW1iZXJzLiAgSWYgeW91Cj4gbWVhc3VyZSB0aGUg
YmFkIHRoaW5nICh0aW1lIGluIHRoaXMgY2FzZSksIHRoZXkgZm9jdXMgb24gdGhlIHdvcnN0IGFy
ZWFzCj4gd2hlcmUgbW9zdCB0aW1lIGlzIHNwZW50LiAgSWYgeW91IG1lYXN1cmUgdGhlIGdvb2Qg
dGhpbmcsIHRoZXkgdGVuZCB0bwo+IGltcHJvdmUgdGhpbmdzIHRoYXQgYXJlIGFscmVhZHkgdG9v
IGdvb2QgdG8gd29ycnkgYWJvdXQgZXZlbiBmdXJ0aGVyLgo+IAo+IE1heWJlIHlvdSBhcmUgaW1t
dW5lIHRvIHN1Y2ggcHN5Y2hvbG9naWNhbCBlZmZlY3RzLCBidXQgSSBhbSBub3QgYW5kCj4gbWVh
c3VyaW5nIHRpbWUgaW5zdGVhZCBvZiB0aHJvdWdocHV0IG1ha2VzIGEgZGlmZmVyZW5jZSB0byBt
eSBtaW5kLgpVbmRlcnN0YW5kYWJsZSA6KSBJIGp1c3QgdXNlZCB0aGUgb3V0cHV0IG9mIG10ZF9z
cGVlZHRlc3QsIHdoaWNoCmRvZXNuJ3QgZGlyZWN0bHkgcmVwb3J0IHRpbWUgYXQgdGhlIG1vbWVu
dCwgYnV0IHdpdGggc29tZSB0d2Vha3MuLi4KUmVzdWx0cyBhcmUgdGhlIHRpbWUgaW4gbXMgdGhh
dCBtdGRfc3BlZWR0ZXN0IHRha2VzIGZvciBvbmUgcGFzcyBvdmVyCmEgMjU2IE1pQiBkZXZpY2Uu
CgorLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0rLS0tLS0tLS0rLS0tLS0t
LS0tKy0tLS0tLS0tLSsKfCBUZXN0ICAgICAgICAgICAgICAgICAgICAgICAgIHwgRm9saW8gfCAg
IEJhc2UgfCBQYXRjaGVkIHwgIENoYW5nZSB8CistLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0rLS0tLS0tLSstLS0tLS0tLSstLS0tLS0tLS0rLS0tLS0tLS0tKwp8IEVyYXNlYmxvY2sgcmVh
ZCAoMTI4IEtpQikgICAgfCAgIDRLICB8ICAyMC4yNSB8ICAgMTkuNTUgfCAgIC0zLjQlIHwKfCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDE2SyAgfCAgMjAuMTkgfCAgIDE0LjU1IHwg
IC0yNy45JSB8CnwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA2NEsgIHwgIDIwLjIx
IHwgICAxMy4yNCB8ICAtMzQuNSUgfAorLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0t
LS0tLS0rLS0tLS0tLS0rLS0tLS0tLS0tKy0tLS0tLS0tLSsKfCBFcmFzZWJsb2NrIHdyaXRlICgx
MjggS2lCKSAgIHwgICA0SyAgfCAgMjYuMzcgfCAgIDI1LjAxIHwgICAtNS4xJSB8CnwgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAxNksgIHwgIDI2LjEwIHwgICAxNy42MiB8ICAtMzIu
NSUgfAp8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNjRLICB8ICAyNS42OSB8ICAg
MTUuNDUgfCAgLTM5LjglIHwKKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0t
Ky0tLS0tLS0tKy0tLS0tLS0tLSstLS0tLS0tLS0rCnwgUGFnZSByZWFkICg1MTIgQikgICAgICAg
ICAgICB8ICAgNEsgIHwgIDc1LjcwIHwgICA3Mi4wMiB8ICAgLTQuOSUgfAp8ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgMTZLICB8ICA3Ni41MCB8ICAgNzMuMDAgfCAgIC00LjYlIHwK
fCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDY0SyAgfCAgNzYuNDQgfCAgIDcyLjk2
IHwgICAtNC41JSB8CistLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLSstLS0t
LS0tLSstLS0tLS0tLS0rLS0tLS0tLS0tKwp8IFBhZ2Ugd3JpdGUgKDUxMiBCKSAgICAgICAgICAg
fCAgIDRLICB8IDExMy41NyB8ICAxMDkuNTkgfCAgIC0zLjUlIHwKfCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDE2SyAgfCAxMTQuNDIgfCAgMTA5LjczIHwgICAtNC4xJSB8CnwgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA2NEsgIHwgMTE0LjM5IHwgIDEwOS41NyB8ICAg
LTQuMiUgfAorLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0rLS0tLS0tLS0r
LS0tLS0tLS0tKy0tLS0tLS0tLSsKfCAyLXBhZ2UgcmVhZCAoMSBLaUIpICAgICAgICAgIHwgICA0
SyAgfCAgNDguNDIgfCAgIDQ2LjQwIHwgICAtNC4yJSB8CnwgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAxNksgIHwgIDQ4Ljk2IHwgICA0Ny4wNyB8ICAgLTMuOSUgfAp8ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgNjRLICB8ICA0OC41OSB8ICAgNDcuMDcgfCAgIC0zLjEl
IHwKKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tKy0tLS0tLS0tKy0tLS0t
LS0tLSstLS0tLS0tLS0rCnwgMi1wYWdlIHdyaXRlICgxIEtpQikgICAgICAgICB8ICAgNEsgIHwg
IDYzLjYxIHwgICA2MS4yOCB8ICAgLTMuNyUgfAp8ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMTZLICB8ICA2My45NiB8ICAgNjEuMjAgfCAgIC00LjMlIHwKfCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDY0SyAgfCAgNjMuODIgfCAgIDYwLjg1IHwgICAtNC42JSB8Cist
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLSstLS0tLS0tLSstLS0tLS0tLS0r
LS0tLS0tLS0tKwp8IEVyYXNlLCBibG9ja3MgaG9sZCBkYXRhICAgICAgfCAgIDRLICB8ICAxNS40
MCB8ICAgMTQuMTMgfCAgIC04LjMlIHwKfCAobXRkX3NwZWVkdGVzdCkgICAgICAgICAgICAgIHwg
IDE2SyAgfCAgMTUuMjggfCAgIDEwLjQ4IHwgIC0zMS40JSB8CnwgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICA2NEsgIHwgIDE1LjIyIHwgICAxMC4xMyB8ICAtMzMuNCUgfAorLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0rLS0tLS0tLS0rLS0tLS0tLS0tKy0tLS0t
LS0tLSsKfCBFcmFzZSwgYWxyZWFkeSBlcmFzZWQgICAgICAgIHwgICA0SyAgfCAgMjMuODYgfCAg
IDE1LjExIHwgIC0zNi43JSB8CnwgKDJ4IG11bHRpLWJsb2NrKSAgICAgICAgICAgICB8ICAxNksg
IHwgIDI0LjE0IHwgICAxMS40NiB8ICAtNTIuNSUgfAp8ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgNjRLICB8ICAyMy42MyB8ICAgMTAuNTMgfCAgLTU1LjUlIHwKKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tKy0tLS0tLS0tKy0tLS0tLS0tLSstLS0tLS0tLS0r
CgpUaGFua3MsClRhbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K

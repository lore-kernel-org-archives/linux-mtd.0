Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FCFC4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Dec 2023 08:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Juzl4cs/QftdV/vpovYp0AlFvFguQfVI4tb8AMMXSbA=; b=FXQSyj0B5aTyLM
	UyHApi42jJ3LdJpxGyI6H9R+CPFUSEk09DdvfcXmHpjcxYdKleROv0fVF31Ud8p+eGYJ04/Qpdgwf
	C9Ws+GhQCZ++fb3xdb4THibMs3LUCWt92am7i5ovhRL+8hxBeydyObgsedrB7/4Dh7kkIebwJZ6mD
	gFJvagMfMIWLp9l1KlI0FUq+u08E921hxncO1PPi5yrpjY1SOWyGZ6eiy456lRfENyvJBgL2dAqIs
	WuTB9neATA3HJ0PtS6jk62tdIKLWzbIzcb/ABjIT4fFj1XJPSvQxkx5266LY4Zy+hNX0dfCzkBjpT
	eN+gXv6VzoA++Gy3aI4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE3GX-002Plb-1Y;
	Fri, 15 Dec 2023 08:09:49 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE3GU-002PkP-2u
	for linux-mtd@lists.infradead.org;
	Fri, 15 Dec 2023 08:09:48 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40c41b43e1eso4584145e9.1
        for <linux-mtd@lists.infradead.org>; Fri, 15 Dec 2023 00:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702627784; x=1703232584; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cBzycuIkV/6Qoafe8eFD9FYCTvqPcbdmnZw+dYA9ldA=;
        b=W7/uuGGzPn7ySzpudXid1wjtnYQivsryIg2LT/rVRtji6ytO1gNWwy0AvM7fVC3nug
         wrj9gtV5gYuz+M7QUso7nKZjrfqzw5ElGnUP+hQNb3COsLFyWhxcmdB2R3ho8Na4lmf9
         y78XdP2gj66P492EcTt+Ev4LsytAf5KVjLs0ozNlb9ikaYZ95/SoowsO4yA77ahRG7Q7
         fYhfnqhGYLG0MV74FMije8PBqAOTFAhoDUlWRnECnZPSXT8oVKjBq8xlaBzcpWNhUGGx
         stty3+3qrnGvvcoZasBLWkEzj44jv72+uVCGybOCGfFa0KnvHLOzATWdwwrv/yNq4iVx
         8q9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702627784; x=1703232584;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cBzycuIkV/6Qoafe8eFD9FYCTvqPcbdmnZw+dYA9ldA=;
        b=sx+sTF5Hz8SGEHUsiVEOHdqHWl6jOASywuUYn3PGwz0MgTOSs+dtophq5QXTIMDErW
         UNIBkkzd2V8biXQ6qDg1UbWnaJN0XrLhS8zfI+F2xvkWObAo2vUdIyLN1zA6YzejMjjH
         1JKC2jZjxMiEKMVmsuNnIQTLnmov+ohII+K77tb3dOqGWklTZeJXl5noSSDJ9UtnUdRb
         fsNeSsmhxBWg6zmsbOqz7xd/ozEwNqy0HDMRxRL6DPa8feCCq6JH8HWIpDQa2RLZCJdj
         86gcgv/qFOBobrfdKflHh6svnDbd1y/xXaRqa4f6aFoES6IuYFIW3QKGvV4+YzBk7N38
         0LLA==
X-Gm-Message-State: AOJu0Yw8b5U915SmjQU90M0Rp/WE5z864b8zJOy6sTm34o40wgu93cAT
	fJHCXnpopwIedPyGsCZKcgZ6Zg==
X-Google-Smtp-Source: AGHT+IHXr2aiF67iw/MCg4WJKcEoWDnyX1a4J+sk1RcPb6DkmQzspdZfGa3WNYfB3GkmOcFIJZLRMQ==
X-Received: by 2002:a05:600c:1827:b0:40c:5c9:287 with SMTP id n39-20020a05600c182700b0040c05c90287mr5143077wmp.195.1702627784586;
        Fri, 15 Dec 2023 00:09:44 -0800 (PST)
Received: from [192.168.2.173] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id x15-20020a5d60cf000000b0033635ee4543sm7654960wrt.67.2023.12.15.00.09.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Dec 2023 00:09:44 -0800 (PST)
Message-ID: <b3d3c457-a43b-478a-85b3-52558227d139@linaro.org>
Date: Fri, 15 Dec 2023 10:09:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 07/10] mtd: spi-nor: Add stacked memories support in
 spi-nor
Content-Language: en-US
To: "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "pratyush@kernel.org" <pratyush@kernel.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "sbinding@opensource.cirrus.com" <sbinding@opensource.cirrus.com>,
 "lee@kernel.org" <lee@kernel.org>,
 "james.schulman@cirrus.com" <james.schulman@cirrus.com>,
 "david.rhodes@cirrus.com" <david.rhodes@cirrus.com>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
 "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>
Cc: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "michael@walle.cc" <michael@walle.cc>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "claudiu.beznea@tuxon.dev" <claudiu.beznea@tuxon.dev>,
 "Simek, Michal" <michal.simek@amd.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "git (AMD-Xilinx)" <git@amd.com>,
 "amitrkcian2002@gmail.com" <amitrkcian2002@gmail.com>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
 <20231125092137.2948-8-amit.kumar-mahapatra@amd.com>
 <e2305642-55f1-4893-bea3-b170ac0a5348@linaro.org>
 <BN7PR12MB2802BEDFB821A1748185794CDC8AA@BN7PR12MB2802.namprd12.prod.outlook.com>
 <f5a47024-514a-4846-bc16-08cf0f9af912@linaro.org>
 <BN7PR12MB2802BB3DA682D9C13EF7DE08DC8FA@BN7PR12MB2802.namprd12.prod.outlook.com>
 <5a6f6764-6779-42b0-b6c6-3f638b85ef78@linaro.org>
 <BN7PR12MB28029EB1A7D09882878499A2DC8FA@BN7PR12MB2802.namprd12.prod.outlook.com>
 <c3fa1e04-92ed-48ab-a509-98e43abd5cd6@linaro.org>
 <BN7PR12MB2802E87F1A6CD22D904CAEACDC93A@BN7PR12MB2802.namprd12.prod.outlook.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <BN7PR12MB2802E87F1A6CD22D904CAEACDC93A@BN7PR12MB2802.namprd12.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_000946_962019_B7F67CCA 
X-CRM114-Status: GOOD (  11.00  )
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

CgpPbiAxNS4xMi4yMDIzIDA5OjU1LCBNYWhhcGF0cmEsIEFtaXQgS3VtYXIgd3JvdGU6Cj4+IFRo
YW5rcyEgQ2FuIHlvdSBzaGFyZSB3aXRoIHVzIHdoYXQgZmxhc2hlcyB5b3UgdXNlZCBmb3IgdGVz
dGluZyBpbiB0aGUKPj4gc3RhY2tlZCBhbmQgcGFyYWxsZWwgY29uZmlndXJhdGlvbnM/Cj4gSSB1
c2VkIFNQSS1OT1IgUVNQSSBmbGFzaGVzIGZvciB0ZXN0aW5nIHN0YWNrZWQgYW5kIHBhcmFsbGVs
LgoKSSBnb3QgdGhhdCwgSSB3YW50ZWQgdGhlIGZsYXNoIG5hbWUgb3IgZGV2aWNlIElELgoKV2hh
dCBJJ20gaW50ZXJlc3RlZCBpcyBpZiBlYWNoIGZsYXNoIGlzIGluIGl0cyBvd24gcGFja2FnZS4g
QXJlIHRoZXk/Cgo+IAo+Pj4+IGNhbiBjb21iaW5lIGEgU1BJIE5PUiB3aXRoIGEgU1BJIE5BTkQg
aW4gc3RhY2tlZCBjb25maWd1cmF0aW9uPwo+Pj4gTm8sIFhpbGlueC9BTUQgUVNQSSBjb250cm9s
bGVycyBkb2Vzbid0IHN1cHBvcnQgdGhpcyBjb25maWd1cmF0aW9uLgo+Pj4KPj4gMiBTUEkgTkFO
RHMgc2hhbGwgd29yayB3aXRoIHRoZSBBTUQgY29udHJvbGxlciwgcmlnaHQ/Cj4gV2UgbmV2ZXIg
dGVzdGVkIDIgU1BJLU5BTkQgd2l0aCBBTUQgY29udHJvbGxlci4KCkkgd2FzIGFza2luZyBiZWNh
dXNlIEkgdGhpbmsgdGhlIHN0YWNrZWQgbGF5ZXIgc2hhbGwgYmUgU1BJIE1FTSBnZW5lcmljLAph
bmQgbm90IHBhcnRpY3VsYXIgdG8gU1BJIE5PUi4KCj4+IEkgc2tpbW1lZCBvdmVyIHRoZSBRU1BJ
IGNvbnRyb2xsZXIgZGF0YXNoZWV0IGFuZCB3b25kZXJlZCB3aHkgb25lIHdvdWxkCj4+IGdldCBj
b21wbGljYXRlZCB3aXRoIDIgUXVhZCBGbGFzaGVzIHdoZW4gd2UgaGF2ZSBPY3RhbC4gQnV0IHRo
ZW4gSSBzYXcgdGhhdAo+PiB0aGUgc2FtZSBTb0MgY2FuIGNvbmZpZ3VyZSBhbiBPY3RhbCBjb250
cm9sbGVyICh0aGUgT2N0YWwgYW5kIFF1YWQKPj4gY29udHJvbGxlcnMgc2VlbXMgbXV0dWFsIGV4
Y2x1c2l2ZSkgYW5kIHRoYXQgdGhlIE9jdGFsIG9uZSBjYW4gb3BlcmF0ZSAyCj4+IG9jdGFsIGZs
YXNoZXMgaW4gc3RhY2tlZCBtb2RlIPCfmYIuCj4gVGhhdHMgY29ycmVjdCAuCj4gCj4gUGxlYXNl
IGxldCBtZSBrbm93IGhvdyB5b3Ugd2FudCBtZSB0byBwcm9jZWVkIG9uIHRoaXMuCgpJIGdvdCB5
b3UuIFN0aWxsIG5lZWQgdG8gYWxsb2NhdGUgbW9yZSB0aW1lIG9uIHRoaXMuCgpDaGVlcnMsCnRh
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=

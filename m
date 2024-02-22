Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD70C48BEB
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Feb 2024 08:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NbKdgdjvibZgA5g/Llc2tIRUMhNBZsfkwHBjtWCGv54=; b=gffJPxdmgABdQei017lBGL9mV/
	0lWh0hy+b3Dwbz46Jjjcp1POGgIiW0OIperBMH7eCf+VlT0BegC6shluSL2nh9Pp05/oQNoz0UxVC
	75M3RuMwRFhovq/W4d0erNwydc/8AD+GgwopllY3dELdJZ5xc2A6SqS/M0ueUWMMNlXl3DqgY5dxD
	RzYzsbIkG9my1n06W+enJ/JHnjPCPY25ZVAVnrv7OWvxI5dCJyCZxLaH6UzedgZ05uRoYf33zVN69
	JJMuWCtWj04jSOMs1fQwECPp7ffpp1sBhmy4qYVu9v6Rv+7oE+i8FYGo9Y9/0RCaNCDX//2wuKgxF
	1wB6bhjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd4Qg-0000000412h-1OHG;
	Thu, 22 Feb 2024 08:27:42 +0000
Received: from 1.mo582.mail-out.ovh.net ([46.105.56.136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd4Qb-000000040x2-3npE
	for linux-mtd@lists.infradead.org;
	Thu, 22 Feb 2024 08:27:40 +0000
Received: from director4.ghost.mail-out.ovh.net (unknown [10.109.140.73])
	by mo582.mail-out.ovh.net (Postfix) with ESMTP id 4TgR8h3Kz4z176Q
	for <linux-mtd@lists.infradead.org>; Thu, 22 Feb 2024 08:27:32 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-62nvk (unknown [10.110.168.159])
	by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id BBB0C1FEA0;
	Thu, 22 Feb 2024 08:27:30 +0000 (UTC)
Received: from milecki.pl ([37.59.142.108])
	by ghost-submission-6684bf9d7b-62nvk with ESMTPSA
	id DFvxKHIF12Uj8g8AoXgo/A
	(envelope-from <rafal@milecki.pl>); Thu, 22 Feb 2024 08:27:30 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-108S00278859a77-0453-42f0-9082-a2d4777bd21b,
                    A5D7B7EF969FCE09FFB803620F60B84AE0971723) smtp.auth=rafal@milecki.pl
X-OVh-ClientIp: 178.33.236.78
MIME-Version: 1.0
Date: Thu, 22 Feb 2024 09:27:30 +0100
From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To: William Zhang <william.zhang@broadcom.com>
Cc: Linux MTD List <linux-mtd@lists.infradead.org>, Linux ARM List
 <linux-arm-kernel@lists.infradead.org>, Broadcom Kernel List
 <bcm-kernel-feedback-list@broadcom.com>, f.fainelli@gmail.com,
 kursad.oney@broadcom.com, joel.peshkin@broadcom.com,
 anand.gore@broadcom.com, dregan@mail.com, kamal.dasu@broadcom.com,
 tomer.yacoby@broadcom.com, dan.beygelman@broadcom.com, David Regan
 <dregan@broadcom.com>, devicetree@vger.kernel.org, Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>
Subject: Re: [PATCH v5 05/12] arm64: dts: broadcom: bcmbca: Add NAND
 controller node
In-Reply-To: <20240207202257.271784-6-william.zhang@broadcom.com>
References: <20240207202257.271784-1-william.zhang@broadcom.com>
 <20240207202257.271784-6-william.zhang@broadcom.com>
Message-ID: <cd32d304d740e3c1875e449d459c805a@milecki.pl>
X-Sender: rafal@milecki.pl
X-Originating-IP: 31.11.218.106
X-Webmail-UserID: rafal@milecki.pl
X-Ovh-Tracer-Id: 392939071277214476
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrfeefgdduudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggffhffvvefujghfkfigihgtgfesthekjhdttddtjeenucfhrhhomheptfgrfhgrlhcuofhilhgvtghkihcuoehrrghfrghlsehmihhlvggtkhhirdhplheqnecuggftrfgrthhtvghrnhepjeejkeekgeejtdffffevffeivedtueeifeeuffegkeehkeeliedugfelfedutdeunecukfhppeduvdejrddtrddtrddupdefuddruddurddvudekrddutdeipddujeekrdeffedrvdefiedrjeekpdefjedrheelrddugedvrddutdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehrrghfrghlsehmihhlvggtkhhirdhplhdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdfovfetjfhoshhtpehmohehkedvpdhmohguvgepshhmthhpohhuth
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_002738_262499_D45AC644 
X-CRM114-Status: GOOD (  10.53  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMjAyNC0wMi0wNyAyMToyMiwgV2lsbGlhbSBaaGFuZyB3cm90ZToKPiBkaWZmIC0tZ2l0IGEv
YXJjaC9hcm02NC9ib290L2R0cy9icm9hZGNvbS9iY21iY2EvYmNtNDkwOC5kdHNpCj4gYi9hcmNo
L2FybTY0L2Jvb3QvZHRzL2Jyb2FkY29tL2JjbWJjYS9iY200OTA4LmR0c2kKPiBpbmRleCAyZjEy
NGIwMjdiYmYuLjMzNjAxNmUzMzRkOSAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRz
L2Jyb2FkY29tL2JjbWJjYS9iY200OTA4LmR0c2kKPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRz
L2Jyb2FkY29tL2JjbWJjYS9iY200OTA4LmR0c2kKPiBAQCAtNTg5LDcgKzU4OSw3IEBAIGhzc3Bp
OiBzcGlAMTAwMCB7Cj4gIAkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gIAkJfTsKPiAKPiAtCQlu
YW5kLWNvbnRyb2xsZXJAMTgwMCB7Cj4gKwkJbmFuZF9jb250cm9sbGVyOiBuYW5kLWNvbnRyb2xs
ZXJAMTgwMCB7Cj4gIAkJCSNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ICAJCQkjc2l6ZS1jZWxscyA9
IDwwPjsKPiAgCQkJY29tcGF0aWJsZSA9ICJicmNtLG5hbmQtYmNtNjMxMzgiLCAiYnJjbSxicmNt
bmFuZC12Ny4xIiwgCj4gImJyY20sYnJjbW5hbmQiOwo+IEBAIC01OTcsNyArNTk3LDcgQEAgbmFu
ZC1jb250cm9sbGVyQDE4MDAgewo+ICAJCQlyZWctbmFtZXMgPSAibmFuZCIsICJuYW5kLWludC1i
YXNlIjsKPiAgCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDM3IElSUV9UWVBFX0xFVkVMX0hJR0g+
Owo+ICAJCQlpbnRlcnJ1cHQtbmFtZXMgPSAibmFuZF9jdGxyZHkiOwo+IC0JCQlzdGF0dXMgPSAi
b2theSI7Cj4gKwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gCj4gIAkJCW5hbmRjczogbmFuZEAw
IHsKPiAgCQkJCWNvbXBhdGlibGUgPSAiYnJjbSxuYW5kY3MiOwoKWW91IGRpc2FibGUgTkFORCBj
b250cm9sbGVyIGhlcmUgYnJlYWtpbmcgc3VwcG9ydCBmb3IgYWxsIGRlcGVuZGFudApkZXZpY2Vz
LgoKSSBzZWUgeW91IGZpeCBpdCBhZnRlcndhcmRzIGluIFBBVENIIDA2LzEyIGJ1dCBpdCdzIHN0
aWxsIGEgcG9vciB3YXkgb2YKaGFuZGxpbmcgc3VjaCBjaGFuZ2UgYW5kIHRoaXMgaXNzdWUgY2Fu
IGJlIGhpdCBlLmcuIGR1cmluZyBnaXQgYmlzZWN0LgoKQWxzbzogZ2l2ZW4gdGhhdCA5OSUgb2Yg
QkNNNDkwOCBkZXZpY2VzIHVzZSBOQU5EIGNvbnRyb2xsZXIgY2FuIHdlIGp1c3QKc2F2ZSBvdXJz
ZWx2ZXMgZWZmb3J0cyBhbmQga2VlcCBpdCBlbmFibGVkIGluIC5kdHNpPwoKLS0gClJhZmHFgiBN
acWCZWNraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K

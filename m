Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3529C54E58
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2024 13:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=alBHaUEfcNu1Y0eOsr6fF0E/KLQdDTTBuu+VfYeic3E=; b=sPtzRgAX3lsO+0
	jEYE0TDzIQi0YyMY3E4DtoA4dUFpnCXWx1fsql/aH0C6GcmuJtvsUlMDdNtSd122Sd3NUFohDWgZK
	8PodF2sp+a0AP+dgEa/3/OnQHyByBvCLdJY1h7eR5tI6CReml8VnKZeB4sDpXocdSTH46bs4Uc6aF
	ivPuE7ChwSjLZBNuLhei6SSDgzuzyCG1ICvW7bZNSogLf853p7ADfYZnliQSSV+2c78mal3GaSHzo
	Z/nGyX39ln53qDeupiSWsoJZoe59shMRjKjbfVcdk+D/jE9nSg3OspLDZ1qBQwLZ/eiFaBvhJPKeL
	19zc+2420WAewuhTzKBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkOpN-0000000AG2P-0Z6n;
	Wed, 13 Mar 2024 13:39:29 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkOpK-0000000AG0u-0KwT
	for linux-mtd@lists.infradead.org;
	Wed, 13 Mar 2024 13:39:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 73C92CE1B09;
	Wed, 13 Mar 2024 13:39:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CEDEC43394;
	Wed, 13 Mar 2024 13:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710337163;
	bh=Xhj8PeGA+xn3RlIFxAyzyjj2VoYDNowf7/GzR0mzkcI=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject:From;
	b=GYgcaqBQ3otWLI05Cxd8FbyYoePrktfKd0g+YxsNPY8VT57VOLfFEKRereujisEul
	 AdsarZigeT6DDq7KWx5jHtIgG1460AeYRrDh7WkzrwtwaZm/oQkSwVRi008XilA+LN
	 KZfdMOomVJlsXf2EOZ+gKhE1F3boucYUbnmGkEIPfyc9ckzcSPX+nt/JMoKw7uNwjz
	 tJ/vllKjYHMRg5i4HoSkwgUuK6jGIxIHGzPz/bkzfXLhfEjDCjgX40MaANvWGGg+am
	 IF1Q5N8t7BhRzJ3hgU1wIaNIVh26ZhhiUFILSRQ1NhsIRgHFYrtYsM7NSnbza1S8Rn
	 TI0YVlIJA8UwA==
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfauth.nyi.internal (Postfix) with ESMTP id 50DC9120006A;
	Wed, 13 Mar 2024 09:39:22 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 13 Mar 2024 09:39:22 -0400
X-ME-Sender: <xms:iazxZVjjBTP9gjRDwv5yMgdIsEgM9WQpwY9IO0jM1PczrBFbytnxPw>
    <xme:iazxZaD42DClgIDIfbfUopTidRGiisdd-avVz6omhLD_TcpZP61fMvTdk-zJE2T9i
    LqShiEbJigYyzM4LNk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrjeehgdehgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusehkvghrnhgvlhdrohhrgheqnecuggftrf
    grthhtvghrnhepvddttdffjeefgeeggfelfefggefhheeffefftefggfelgeduveevtefh
    feejveeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghrnhguodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduvdekhedujedt
    vdegqddvkeejtddtvdeigedqrghrnhgupeepkhgvrhhnvghlrdhorhhgsegrrhhnuggsrd
    guvg
X-ME-Proxy: <xmx:iazxZVH0oaZVp7GUugBinV1Qq5kQ5vD1wHyw-0dVDA0sRu-TzT3tFw>
    <xmx:iazxZaQ4BTI4BBQPJTJp3WaNB36yjaBtIo9kiZuifrtf0xtuSbyGdw>
    <xmx:iazxZSw6kKhhTEAu4420A52rgPsP3NZYuzFxWyAxBhT5YN_Eg2ZROQ>
    <xmx:iazxZQ7pIqN8hcyrOrVE-Ittl22kGRrJ6sf5_OH_Uhxs-mgSpconcg>
    <xmx:iqzxZdzq8bPaYCo2DJXhNoanwZ55mrNjLQQAU8JBrEmFYgf330-HfR7DFgk>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 47790B6008D; Wed, 13 Mar 2024 09:39:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-251-g8332da0bf6-fm-20240305.001-g8332da0b
MIME-Version: 1.0
Message-Id: <21cd0f32-c94b-4b2b-8fa6-ebe12756b0c4@app.fastmail.com>
In-Reply-To: <610231c3-c3ee-e543-1a8a-8e1098ee6a7c@huawei.com>
References: <20240313084707.3292300-1-arnd@kernel.org>
 <4f945f4a-ac29-3ef7-9e15-123962f2a0e9@huawei.com>
 <e0684202-6926-4bd1-86f6-2bb682524712@app.fastmail.com>
 <1a12c8ed-0cb5-5650-24a2-84b021c444c3@huawei.com>
 <b08aaae4-8c69-47eb-9658-5f3f5c8e4056@app.fastmail.com>
 <610231c3-c3ee-e543-1a8a-8e1098ee6a7c@huawei.com>
Date: Wed, 13 Mar 2024 14:39:01 +0100
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Zhihao Cheng" <chengzhihao1@huawei.com>, "Arnd Bergmann" <arnd@arndb.de>,
 "Richard Weinberger" <richard@nod.at>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Daniel Golle" <daniel@makrotopia.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: ubi: avoid expensive do_div() on 32-bit machines
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_063926_498420_A8D1E627 
X-CRM114-Status: GOOD (  12.19  )
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

T24gV2VkLCBNYXIgMTMsIDIwMjQsIGF0IDE0OjI5LCBaaGloYW8gQ2hlbmcgd3JvdGU6Cj4g5Zyo
IDIwMjQvMy8xMyAyMDoyMSwgQXJuZCBCZXJnbWFubiDlhpnpgZM6Cj4+IE9uIFdlZCwgTWFyIDEz
LCAyMDI0LCBhdCAxMzoxMCwgWmhpaGFvIENoZW5nIHdyb3RlOgo+Pj4g5ZyoIDIwMjQvMy8xMyAx
OTo1MywgQXJuZCBCZXJnbWFubiDlhpnpgZM6Cj4+Pj4gT24gV2VkLCBNYXIgMTMsIDIwMjQsIGF0
IDEyOjI5LCBaaGloYW8gQ2hlbmcgd3JvdGU6Cj4+Pj4KPj4+PiBUaGUgd2F5IGl0IHVzdWFsbHkg
Z29lcyBpcyB0aGF0IHNvbWVvbmUgYWRkcyBhbiBvcGVuLWNvZGVkCj4+Pj4gNjQtYml0IGRpdmlz
aW9uIHRoYXQgY2F1c2VzIGEgbGluayBmYWlsdXJlLCB3aGljaCBwcm9tcHRzCj4+PiBJJ20gYSBs
aXR0bGUgY29uZnVzZWQsIHdoYXQga2luZCBvZiBsaW5rIGZhaWx1cmU/IENvdWxkIHlvdSBzaG93
IGFuIGV4YW1wbGU/Cj4+IAo+PiBUaGUgb3Blbi1jb2RlZCA2NC1iaXQgZGl2aXNpb24gd2l0aG91
dCB1c2luZyBkb19kaXYoKSBzaG93cyB1cCBhcwo+PiAKPj4geDg2XzY0LWxpbnV4LWxkOiBkcml2
ZXJzL210ZC91YmkvbnZtZW0ubzogaW4gZnVuY3Rpb24gYHViaV9udm1lbV9yZWdfcmVhZCc6Cj4+
IG52bWVtLmM6KC50ZXh0KzB4MTBhKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgX191bW9kZGkz
Jwo+PiB4ODZfNjQtbGludXgtbGQ6IG52bWVtLmM6KC50ZXh0KzB4MTFmKTogdW5kZWZpbmVkIHJl
ZmVyZW5jZSB0byBgX191ZGl2ZGkzJwo+PiB4ODZfNjQtbGludXgtbGQ6IGRyaXZlcnMvbXRkL3Vi
aS9udm1lbS5vOiBpbiBmdW5jdGlvbiBgdWJpX252bWVtX3JlZ19yZWFkLmNvbGQnOgo+PiBudm1l
bS5jOigudGV4dC51bmxpa2VseSsweDJkKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgX191bW9k
ZGkzJwo+PiAgPiBUaGUgaWRlYSBpcyB0aGF0IGdjYyBleHBlY3RzIF9fdW1vZGRpMyB0byBiZSBw
cm92aWRlZCBieSBsaWJnY2MsCj4+IGJ1dCBMaW51eCBpbnRlbnRpb25hbGx5IGxlYXZlcyBpdCBv
dXQgaW4gb3JkZXIgdG8gY2F0Y2ggYWNjaWRlbnRhbAo+PiA2NC1iaXQgZGl2aXNpb25zLgo+PiAK
Pgo+IFRoYW5rcyBmb3IgZXhwbGFpbmF0aW9uLCB3aGljaCBtZWFucyB0aGF0IGRvX2RpdiBpcyB1
c2VkIGZvciA2NC1iaXQgCj4gZGl2aXNpb24gdG8gc29sdmUgdGhlIGxpbmsgZmFpbHVyZSBjYXVz
ZWQgYnkgbWlzc2VkIGxpYmdjYy4gU2luY2UgCj4gcGFyYW1ldGVyICdmcm9tJyBpcyB1MzIsIHRo
ZXJlIGlzIG5vIG5lZWQgdG8gaW52b2tlIGRvX2RpdiBvbiBhIDMyLWJpdCAKPiBwbGF0Zm9ybSwg
eW91IGp1c3Qgd2FudCB0byBzdG9wIHRoZSB3YXN0aW5nIGJlaGF2aW9yIG9uIGEgMzItYml0IAo+
IHBsYXRmb3JtLiBEbyBJIHVuZGVyc3RhbmQgcmlnaHQ/CgpZZXMsIGNvcnJlY3QuCgogICAgICBB
cm5kCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=

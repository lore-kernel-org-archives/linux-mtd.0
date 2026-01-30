Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F31E6BF2B
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Jan 2026 16:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KicnSmqJn5MnN9yHtltjj+hAbt7sn0f/3gXuqQOC86k=; b=3bi+4bb9ukzh8s
	hFh+BVSjJFiYA03yz99oHTYosRH0QB6mc5EaYfmFzhX/c55LLSAO2TbqfIRTOPnMMQOBKgC3DTrqG
	1QbRcepB64q0bVQ6L3FCD5AusNrCiYq2Dc5ss05oFTK0YVHGixn3aceBZlQ2M9Zyc1NWFdhLuJYIX
	Vyl5NAY+hzTR6NWh1lJcb/hzppWg0RNmswWTuT9tIf2mCFUALOjswj+bGVKI7Shx46+Tn3JBwyjs0
	tNhxqIORp9p9XEENPLMgSkReZwXLkgOWt/yC1F0KxYU2rP/6ZUlOxhqHB83XDoPU31FADmrMFzvYz
	QukoY/h/NXbEpFRTzEFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlrdQ-00000001jOk-0xpL;
	Fri, 30 Jan 2026 16:46:16 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlrdM-00000001jLH-24Uw
	for linux-mtd@lists.infradead.org;
	Fri, 30 Jan 2026 16:46:14 +0000
X-QQ-mid: esmtpsz10t1769791519ta032fb5c
X-QQ-Originating-IP: X8rQ7zIuL6jwO9hg/ZyaNKQURyN++V9+GWajqCSeL1w=
Received: from [192.168.0.109] ( [110.81.94.113])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 31 Jan 2026 00:45:17 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13173608927844398011
EX-QQ-RecipientCnt: 10
Message-ID: <8B3AF14A70DEB168+16bb085f-6930-45c2-ab70-83eef50624b5@radxa.com>
Date: Sat, 31 Jan 2026 00:45:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] mtd: devices: Qualcomm SCM storage support
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Xilin Wu <sophon@radxa.com>, Junhao Xie <bigfoot@radxa.com>
References: <20260126-scm-storage-v2-v2-0-fa045c7e7699@radxa.com>
 <x4sxekwxkrylw54rvtnvwjfyfruhd6bd2jlfe5nv4sehbosetn@sxf5wpb3nas2>
 <86F97239DB3D962C+98826904-6649-4c19-815d-73003c046c14@radxa.com>
 <87ecn7jin5.fsf@bootlin.com>
From: Junhao Xie <bigfoot@radxa.com>
In-Reply-To: <87ecn7jin5.fsf@bootlin.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:radxa.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: M3GnMu55RRKLNOFKaApShYkFPVvYV/bBChgIa8l1NjBUnU56PusqQrr/
	6KjSbwkpmzODdJz/pIWM8eeJ3ty+LoSy9hQI9aRLMrU82TfPAyz8zVGQXI9GX5HL7Nu+Mbx
	mA+suay7NljppU8zu0dswUqyapZS+DV6CO4dlor+tFXHOJsDpQLQIlyxKcHGJd4e2IXIbJV
	bd0wVYwssm0rKc2AfZKqs9mbPbpJiwQFXCAX8grVOlq5hTEWTkZLiu6ZQ9ZDuPxwEpIq4Sc
	iyd9f9pgyaw7KHQDm7OjTUUU3Au28ea2Hv/TkT1oOCVsghQ7ivN4MdYsJXY7Kjx6RsJqP/o
	rMsZN56A/EpyxY/EMYrarev3JT5QaG4ESfR+lXLUau0rqDLwBh+ZNFtV1rhz+MhzBalotgo
	44nMOLxs+gSlwMChgF39sRvm5oKpyvGWs7K77AiQCuJ4mK09gWsdZJTpoIFlWfCXzgB+VS4
	njfNTV+TWZNXHQGU5WXDNmk8uypUThthpc05qyCIgtE7tNmIkkb9mPH5H9JJAifBa9JY0dx
	Hl0FOEyxz3zsiNE790+qw/pL2Ko4VblvJZYwq1DIjkDPA24e4mh6ytTCEFp79vhd19NiY0N
	MmVYxBfcgbmMAQ/Zw0SjTNrVF6gEMUpIVi50+vxkGZ3e9/QtWCNAtw0o0eZC+40HaECU7E+
	Q6htaz6LtJ1x/68/7Pfz0d/mJnZbd0cqXxOqbu8xiZRGCN4SMSnzevgayWBA4h3v7fwbhXf
	fg6bUkjn2pY2oXmZ6d9pk2bX8EVrjMtvq3tGT1CHFdPp65OEUDPWMDbUvm6gqaY03GYkEeh
	/wgCbTDcNR6Jt/o160VmLNiJ0AvAxPx3lM5qdIUZLLzdzpmFLjlT7RfISUNf0crrZW0UINd
	Yq0WX9n/DncBotWBx6VeuOIIkBb3j0ShBfjAcLmXZ2CdZZbJuI8TlnPq366aWNLt9NSd81J
	NJiNgowpjxFvHqelJ9JsSKmWWWsPgpNxH2fxSGO2Ecqe+Sa/c4+NCLQaVnT5+0wW3cO7iZM
	G1+bE5MeD2UqxS3eDpHnlbUzcjeKfhCgcIz0UZh1CJE08yFE0AXqJ+2eLX8l7gzt5wn/J8b
	uVzMjp/nAvxm3krzzh3fSeYRQPUZdBvxN7XYLnxfl4BOiLm2OimiZbfLCEq6sYQ05oL4t/3
	uoxJ
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_084613_729941_1E067299 
X-CRM114-Status: GOOD (  15.26  )
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

T24gMjAyNi8xLzMwIDIyOjEwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpLAo+Cj4+PiBJIGRv
bid0IGJlbGlldmUgeW91IGFuc3dlcmVkIG15IHF1ZXN0aW9uIHJlZ2FyZGluZyBob3cgdG8gYWNj
ZXNzIHRoaXMKPj4+IGludGVyZmFjZSBmcm9tIHRoZSBrZXJuZWwuIE9uIG1hbnkgb2YgdGhlc2Ug
ZGV2aWNlcyB3ZSBjYW4gZmluZCB0aGUgTUFDCj4+PiBhZGRyZXNzZXMgb2YgdGhlIHN5c3RlbSBp
biB0aGUgIkRQUCIgcGFydGl0aW9uLiBEbyB5b3UgaGF2ZSBhbnkgaWRlYXMKPj4+IGFib3V0IGhv
dyB3ZSBjb3VsZCBhY2Nlc3MgdGhpcyBmcm9tIHdpdGhpbiB0aGUga2VybmVsPwo+Pj4KPj4+IFJl
Z2FyZHMsCj4+PiBCam9ybgo+PiBJIGFncmVlIHdpdGggeW91ciBwb2ludC4gSSB3aWxsIGFkZCBh
IG1vZHVsZSBwYXJhbSBpbiB2MyBmb3IgZGVmYXVsdAo+PiByZWFkLW9ubHkgbW9kZS4gZS5nLjog
L3N5cy9tb2R1bGUvcWNvbV9zY21fc3RvcmFnZS9wYXJhbWV0ZXJzL2FsbG93X3dyaXRlCj4+Cj4+
IEZvciBzb21ldGhpbmcgbGlrZSB0aGUgIkRQUCIgcGFydGl0aW9uLCBJIHRoaW5rIGl0J3MgYmV0
dGVyIHRvIGFjY2VzcyBpdAo+PiBmcm9tIHVzZXJzcGFjZSB0aGFuIGZyb20ga2VybmVsLgo+IElm
IGl0J3MgYSBNQUMgYWRkcmVzcyB0aGF0IHlvdSBhcmUgYWNjZXNzaW5nLCBkaXJlY3QgdXNlcnNw
YWNlIGRvZXMgbm90Cj4gc291bmQgbGlrZSBhIGdvb2QgZml0LiBJZiBJIG1heSwgTlZNRU0gY2Vs
bHMgYXJlIHRoZXJlIGV4YWN0bHkgZm9yIHRoaXMKPiBwdXJwb3NlOiBpZGVudGlmeWluZyB0aGUg
Y29udGVudCBvZiBhIHN1YnBhcnQgb2YgYSBzdG9yYWdlIGRldmljZSBpbiBhCj4gc3RvcmFnZSBh
Z25vc3RpYyB3YXkuIFRoZSBOVk1FTSBjZWxscyBhcmUgbWFkZSBhdmFpbGFibGUgdG8gaW4ta2Vy
bmVsCj4gZHJpdmVycyAoaWUuIG5ldHdvcmsgZGV2aWNlcyBoYXZlIGFsbCB0aGUgaW5mcmFzdHJ1
Y3R1cmUgdG8gZ2V0IHRoZSBNQUMKPiBhZGRyZXNzIGZyb20gdGhlcmUpIGFuZCB0aGVpciBjb250
ZW50IGlzIGFsc28gZXhwb3NlZCB0byB1c2Vyc3BhY2UKPiB0aHJvdWdoIHN5c2ZzIG5vdy4KClF1
YWxjb21tJ3MgU1BJLU5PUiBib290IGZpcm13YXJlIHVzZXMgYSBHUFQgcGFydGl0aW9uIHRhYmxl
LiBUaGUgIkRQUCIKcGFydGl0aW9uIGNvbnRhaW5zIGEgRkFUIGZpbGUgc3lzdGVtLCBhbmQgdGhl
IE1BQyBhZGRyZXNzIGlzIHN0b3JlZCBpbgpvbmUgb2YgdGhlc2UgZmlsZXMuCgpCZWNhdXNlIHRo
ZSBkYXRhIGlzIHN0b3JlZCBpbnNpZGUgYSBmaWxlc3lzdGVtIHJhdGhlciB0aGFuIGF0IGEgZml4
ZWQKb2Zmc2V0LCBpdCBkb2VzIG5vdCBmaXQgd2VsbCB3aXRoIHRoZSBOVk1FTSBtb2RlbCwgd2hp
Y2ggYXNzdW1lcyBzaW1wbGUKb2Zmc2V0LWJhc2VkIGFjY2Vzcy4KCkFjY2Vzc2luZyB0aGlzIHdv
dWxkIHJlcXVpcmUgdGhlIGtlcm5lbCB0byBkaXJlY3RseSByZWFkIGZpbGVzIGZyb20gYQpmaWxl
c3lzdGVtLCB3aGljaCBpcyBnZW5lcmFsbHkgbm90IGFwcHJvcHJpYXRlLCBzbyB0aGlzIHNob3Vs
ZCBwcm9iYWJseQpub3QgYmUgYWNjZXNzZWQgZnJvbSBrZXJuZWwuCgo+IFRoYW5rcywKPiBNaXF1
w6hsCgpCZXN0IHJlZ2FyZHMsCkp1bmhhbyBYaWUKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==

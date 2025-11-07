Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD55CCF9F8
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Nov 2025 19:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+360gBinQEv4nAUvvWYFGcmxICEytCbNjSI9COjH0Nc=; b=GFsnDjqS6k7zVTH+3MyzSFhabg
	+M0/QWBFneiIs4xDiVEZU9vIZilHMz3rEtDlwt3kKPHQwnF+XFJd5xl8Y/RkC1r1MYLOuyx4ZuaKG
	B8TVqAW8RGkjVHAhb6dHLYGuBBJNpE2z4yhUh3fWZbH8HCrzJ1Qip+56IhFV8vs9jkoDINwketIMk
	TGMG6T7uisBpLLyJ+9zpisrblihl+arvIUgHEZcQhHr/2RzconkbxQXdf8p/CAAxscoNf6C3gtk84
	BLZ4FvOiLE1CtqYJSxsbdCEOs29ifIMerOvKBlQH93YJW2MeFiD5G52wtKvX/ODz+TanaF3Lk0OX7
	g7M295/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHS3P-00000000i7p-2YkM;
	Fri, 07 Nov 2025 19:23:23 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHS3K-00000000i4H-1QlQ;
	Fri, 07 Nov 2025 19:23:21 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id EDA862CFC9B;
	Fri,  7 Nov 2025 20:23:14 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 2R6fOeHHtymO; Fri,  7 Nov 2025 20:23:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 813442CFC87;
	Fri,  7 Nov 2025 20:23:14 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id zqOd4E8HCNTp; Fri,  7 Nov 2025 20:23:14 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 4A11611C056;
	Fri,  7 Nov 2025 20:23:14 +0100 (CET)
Date: Fri, 7 Nov 2025 20:23:14 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linux-stm32 <linux-stm32@st-md-mailman.stormreply.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	alexandre torgue <alexandre.torgue@foss.st.com>, 
	mcoquelin stm32 <mcoquelin.stm32@gmail.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, wanqian10@huawei.com, 
	Yang Liu <young.liuyang@huawei.com>, 
	chengzhihao1 <chengzhihao1@huawei.com>, 
	Liyuan Pang <pangliyuan1@huawei.com>
Message-ID: <79797154.158914.1762543394141.JavaMail.zimbra@nod.at>
In-Reply-To: <14f5091f-b647-40c9-9c32-6a705c2d6c37@web.de>
References: <20251107100057.1091153-1-pangliyuan1@huawei.com> <7857ab09-7808-4abe-9df1-66235291436b@web.de> <DF8B15D4-4819-47E6-9BB0-268AD0204C86@nod.at> <14f5091f-b647-40c9-9c32-6a705c2d6c37@web.de>
Subject: Re: [v2] ubi: fastmap: fix ubi->fm memory leak
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF143 (Linux)/8.8.12_GA_3809)
Thread-Topic: fastmap: fix ubi->fm memory leak
Thread-Index: fBqM9AqfBycgbGob73i+cfkQqy6K6g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_112319_719956_6D3B10D1 
X-CRM114-Status: UNSURE (   9.26  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIk1hcmt1cyBFbGZyaW5nIiA8
TWFya3VzLkVsZnJpbmdAd2ViLmRlPgo+PiA+IFlvdSBtYXkgb2NjYXNpb25hbGx5IHB1dCBtb3Jl
IHRoYW4gNjAgY2hhcmFjdGVycyBpbnRvIHRleHQgbGluZXMKPj4gPiBvZiBzdWNoIGEgY2hhbmdl
IGRlc2NyaXB0aW9uLgo+PiA+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL0RvY3VtZW50YXRpb24vcHJvY2Vzcy9z
dWJtaXR0aW5nLXBhdGNoZXMucnN0P2g9djYuMTgtcmM0I242NTgKPiAKPj4gRmVlbCBmcmVlIHRv
IGlnbm9yZSBldmVyeXRoaW5nIE1hcmt1cyBzYXlzLgo+IAo+IERvZXMgeW91ciBmZWVkYmFjayBp
bmRpY2F0ZSB0aGVuIGFsc28gdGhhdCBMaW51eCBkZXZlbG9wbWVudCBwcm9jZXNzCj4gZG9jdW1l
bnRhdGlvbiBtYXkgYmUgb3Zlcmxvb2tlZCBhbnkgbW9yZT8KClRoZSBvbmx5IHJlYXNvbiB3aHkg
eW91IGFyZSBub3Qgb24gbXkga2lsbCBmaWxlIGlzIHRoYXQgSSBjYW4gcHJvdGVjdCBuZXdiaWVz
IGZyb20geW91LgoKVG8gcXVvdGUgR3JlZ0tIWzBdOgo+IE1hcmt1cywgeW91IHNlZW0gdG8gaGF2
ZSBzZW50IGEgbm9uc2Vuc2ljYWwgb3Igb3RoZXJ3aXNlIHBvaW50bGVzcwo+IHJldmlldyBjb21t
ZW50IHRvIGEgcGF0Y2ggc3VibWlzc2lvbiBvbiBhIExpbnV4IGtlcm5lbCBkZXZlbG9wZXIgbWFp
bGluZwo+IGxpc3QuICBJIHN0cm9uZ2x5IHN1Z2dlc3QgdGhhdCB5b3Ugbm90IGRvIHRoaXMgYW55
bW9yZS4gIFBsZWFzZSBkbyBub3QKPiBib3RoZXIgZGV2ZWxvcGVycyB3aG8gYXJlIGFjdGl2ZWx5
IHdvcmtpbmcgdG8gcHJvZHVjZSBwYXRjaGVzIGFuZAo+IGZlYXR1cmVzIHdpdGggY29tbWVudHMg
dGhhdCwgaW4gdGhlIGVuZCwgYXJlIGEgd2FzdGUgb2YgdGltZS4KCj4gUGF0Y2ggc3VibWl0dGVy
LCBwbGVhc2UgaWdub3JlIE1hcmt1cydzIHN1Z2dlc3Rpb247IHlvdSBkbyBub3QgbmVlZCB0bwo+
IGZvbGxvdyBpdCBhdCBhbGwuICBUaGUgcGVyc29uL2JvdC9BSSB0aGF0IHNlbnQgaXQgaXMgYmVp
bmcgaWdub3JlZCBieQo+IGFsbW9zdCBhbGwgTGludXgga2VybmVsIG1haW50YWluZXJzIGZvciBo
YXZpbmcgYSBwZXJzaXN0ZW50IHBhdHRlcm4gb2YKPiBiZWhhdmlvciBvZiBwcm9kdWNpbmcgZGlz
dHJhY3RpbmcgYW5kIHBvaW50bGVzcyBjb21tZW50YXJ5LCBhbmQKPiBpbmFiaWxpdHkgdG8gYWRh
cHQgdG8gZmVlZGJhY2suICBQbGVhc2UgZmVlbCBmcmVlIHRvIGFsc28gaWdub3JlIGVtYWlscwo+
IGZyb20gdGhlbS4KClRoYW5rcywKLy9yaWNoYXJkCgpbMF0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGttbC8yMDI1MTEwNTE2LWN1YmljYWwtZHJvd3NpbHktN2FjZEBncmVna2gvCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=

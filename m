Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5690FC3DA6E
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jan 2024 12:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=dtN3GOhcHPthAbsVa5ZeXPiH2Znsm6X5puqYxFaCboQ=; b=oqPz68J55oDGugJ7DlxliM7zQN
	/OdA03QWpuUKIK85qitREHu05wg81Fj7lEeHNVbNKH09xJwtYjVFqOXU3OHbGHrMcuIDrhbcCEf9Q
	jUnQpEhkxr2mmNcV07wlqHWLUXVsI76uyp42L5HE3lwg7F4YrlCuNQmr4sJBj5g1Yz+Gn6SoQfrTF
	BpeAsQugEjjLL43qePbAbVUcD+DYWjUfMVFjw0n5gfekngI0+TscaoLMWeaozoGQxhW2huEnVRtM/
	gl9WrWfyPIFc5Yba39YAGVYeMW1q+8OhI/4ybVeJIJYH9xa4dB0SAwQG75S6easrTrCplqTlcBcmY
	tV6EyMXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL0md-00ArlL-36;
	Wed, 03 Jan 2024 12:55:43 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL0ma-00ArjE-0p
	for linux-mtd@lists.infradead.org;
	Wed, 03 Jan 2024 12:55:42 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 28528626FB0A;
	Wed,  3 Jan 2024 13:55:35 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 7xvMlIEQrAr9; Wed,  3 Jan 2024 13:55:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 897A9626FB0F;
	Wed,  3 Jan 2024 13:55:34 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id feRsaCc2sddh; Wed,  3 Jan 2024 13:55:34 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 630CD622F598;
	Wed,  3 Jan 2024 13:55:34 +0100 (CET)
Date: Wed, 3 Jan 2024 13:55:34 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: chengzhihao1 <chengzhihao1@huawei.com>
Cc: david oberhollenzer <david.oberhollenzer@sigma-star.at>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, 
	Tudor Ambarus <Tudor.Ambarus@linaro.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <939427292.194880.1704286534231.JavaMail.zimbra@nod.at>
In-Reply-To: <cc6e93a3-3d3c-6bae-51d9-d8cdd8ca0e4c@huawei.com>
References: <20231228014112.2836317-1-chengzhihao1@huawei.com> <1145531757.175508.1703844362355.JavaMail.zimbra@nod.at> <13b259ca-b32f-a8d6-5e11-8bb38df72f5c@huawei.com> <642239519.177270.1703884138999.JavaMail.zimbra@nod.at> <a145fc68-9b0a-9794-48d2-b7ad79116833@huawei.com> <535616666.192239.1704228332389.JavaMail.zimbra@nod.at> <460eb02e-8937-282c-62c5-6ea606324b0e@huawei.com> <cc6e93a3-3d3c-6bae-51d9-d8cdd8ca0e4c@huawei.com>
Subject: Re: [PATCH RFC 00/17] ubifs: Add filesystem repair support
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: Add filesystem repair support
Thread-Index: BXUjUihmAOjaNq4Zv4hi8fz+n/56vw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_045540_442146_D0BE5C57 
X-CRM114-Status: UNSURE (   5.59  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImNoZW5nemhpaGFvMSIgPGNo
ZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IEhvdyBhYm91dCBtZXJnaW5nIDMoYSkgYW5kIDMoYikg
YXMgb25lIG1vZGUoZGFuZ2Vyb3VzIG1vZGUpPyBJZiBmc2NrIGNhbgo+IGdldCBhIGdvb2QgVE5D
KGFsbCBub24tbGVhZiBpbmRleCBub2RlcyBhcmUgdmFsaWQpLCBmc2NrIGV4ZWN1dGVzIGFzCj4g
MyhhKSBkZXNjcmliZXMuIElmIGZzY2sgY2Fubm90IGZpbmQgYSBnb29kIFROQywgZnNjayBleGVj
dXRlcyBhcyAzKGIpCj4gYW5kIHJlbWluZHMgdXNlciB0aGF0ICJUTkMgaXMgZGFtYWdlZCwgbm9k
ZXMgZHJvcHBpbmcgaXMgbm90IGF3YXJlZCIuCgpXZWxsLCB5b3UgY2FuIG1ha2UgYWxsIG1vZGVz
IGNvbWJpbmFibGUuClJpZ2h0IG5vdyBJIGRvbid0IGNhcmUgbXVjaCBhYm91dCB0aGUgdXNlciBp
bnRlcmZhY2UuCkJ1dCBvZmZlcmluZyBtdWNoIGZsZXhpYmlsaXR5IGlzIGEgd29ydGh3aGlsZSBn
b2FsLgoKQXQgdGhlIGVuZCBpdCBzaG91bGQgYmUgY3J5c3RhbCBjbGVhciB0byB0aGUgdXNlciBv
ZiBmc2NrLnViaWZzIHdoZXRoZXIKaXQgZml4ZWQgdGhlIGZpbGUgc3lzdGVtIGJ5IGFwcGx5aW5n
IGRhbmdlcm91cyBtZXRob2RzIG9yIG5vdC4KCldhbnQgSSB3YW50IHRvIGF2b2lkIGJ5IGFsbCBt
ZWFucyBpcyBhIHRvb2wgd2hpY2ggYmxpbmRseSBhbHRlcnMKdGhlIGZpbGVzeXN0ZW0ganVzdCB0
byBzdG9wIFVCSUZTIGNvbXBsYWluaW5nIGFib3V0IGl0LgoKVGhhbmtzLAovL3JpY2hhcmQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==

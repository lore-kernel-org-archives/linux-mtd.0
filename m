Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91030112583E
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2026 15:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MH76FAIMqBH+ycBHNXAOsjRYo5psK2V88czxiuN1MgE=; b=3QBRi9ZuYTgmry
	F9QXF/T5plOUjqtxOrtRuLj9XXsvmUTGzsgqKPHOnyYIdUl7uEiQre2YeFhsKaqnFAr78vSFulQzY
	MUDtf2Trvo4xAJlhtOE4tdbosj4rTBhz4rfWJAN1jfhSxYA8hWbJ3/g7cmh675Lu46ZNSgqy0RVoY
	UwcnqEodgiEJkRAaukQjb3SI0kvV5oGWAvWR3TA3g5FFYQTryp/p/2RxAHcvyqGG14j8Qi25+QM1h
	kKbHNDFv1RuuoN/tYzs3NUheXRc1bCkB2RM1D+8g0yvVwtf+zSCkszDHekgltt/Q5yUK1xSshN7lA
	nfrqNtzd6kNAAypFeGGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0LFk-0000000Blz7-0pTW;
	Wed, 11 Mar 2026 15:13:40 +0000
Received: from mout.web.de ([212.227.15.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0LFg-0000000Blxy-0rzg;
	Wed, 11 Mar 2026 15:13:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1773241960; x=1773846760; i=markus.elfring@web.de;
	bh=giiOm4nN20bJPCHKicALa9KbdO4HtuSxDT6eKFGA2mo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Wag9Fxf+yNYQPXsTRyON3wRt6746M7liQFpZpr6olBI3Hroz514SMRate1mi9Xg/
	 MIASsdEYNcunoz8/0486PBcCtmiUbXpXZk7SZ9UfEjg2yZ/tPzswVOTPVBMcMOZI0
	 P5tpvgiKmN/AWRSyt4QzAOeFSzOnPlGV7COlz4Px5LChMrnWVtTVF6O0hgI7HspJ9
	 ZFokJK/ysEIyBkMx8vWGA+V0bsSD1FiKNQpHbXMbvGQ3/XnE4gJZFGitvxFp9Ukqq
	 G2o9A+gT473BGTVzhrJiV0v2XUcnMqFfYGkufDQuk2aN8veffUebr4e9kMFhtnu0/
	 59bsB5DtXuFN3mqFBA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N9cHJ-1vWLef0wrt-00vzxd; Wed, 11
 Mar 2026 16:12:40 +0100
Message-ID: <e6145c17-64ce-494e-a41a-c847df3d999e@web.de>
Date: Wed, 11 Mar 2026 16:12:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Philipp Hahn <phahn-oss@avm.de>, cocci@inria.fr,
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>
Cc: amd-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com,
 bpf@vger.kernel.org, ceph-devel@vger.kernel.org, dm-devel@lists.linux.dev,
 dri-devel@lists.freedesktop.org, gfs2@lists.linux.dev,
 intel-gfx@lists.freedesktop.org, intel-wired-lan@lists.osuosl.org,
 iommu@lists.linux.dev, kvm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-cifs@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-input@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-modules@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-nfs@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-trace-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 ntfs3@lists.linux.dev, samba-technical@lists.samba.org,
 sched-ext@lists.linux.dev, target-devel@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, v9fs@lists.linux.dev,
 LKML <linux-kernel@vger.kernel.org>
References: <20260310-b4-is_err_or_null-v1-1-bd63b656022d@avm.de>
Subject: Re: [PATCH 01/61] Coccinelle: Prefer IS_ERR_OR_NULL over manual NULL
 check
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260310-b4-is_err_or_null-v1-1-bd63b656022d@avm.de>
X-Provags-ID: V03:K1:8uNlJJTAs0E3eVrueF6w+kamgZld8V5k307BMa2qc/KwhoVrne3
 cPN5KceT1D2i5YOSNggwsPxOs655cWyte1CKlNlBLyuH93VGvstvy+ggV5GDmk4PUMu8Iwj
 lIBpLLqKBgo7uQxQM9uBZQLnvS5wa1t6ITQ23zK6Z5KinOA9Ud5Ss1etUILA/92IsKQJLWt
 MbIOhZYtTIg4ZGnA6bYYw==
UI-OutboundReport: notjunk:1;M01:P0:JCtAJ/zNjOI=;sDWY82KXUVoSud92r84ZXuFAtv9 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 tJ2F8GMFz7+S2uTh+G9X
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_081336_529503_9228D97F 
X-CRM114-Status: UNSURE (   3.49  )
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

4oCmCj4gKy8vIENvbmZpZGVuY2U6IEhpZ2gKClNvbWUgY29udHJpYnV0b3JzIHByZXNlbnRlZCBk
aXNjZXJuaW5nIGNvbW1lbnRzIGZvciB0aGlzIGNoYW5nZSBhcHByb2FjaC4KVGh1cyBJIGJlY2Ft
ZSBhbHNvIGN1cmlvdXMgaG93IG11Y2ggdGhleSBjYW4gZXZlbnR1YWxseSBiZSB0YWtlbiBiZXR0
ZXIgaW50byBhY2NvdW50CmJ5IHRoZSBtZWFucyBvZiB0aGUgc2VtYW50aWMgcGF0Y2ggbGFuZ3Vh
Z2UgKENvY2NpbmVsbGUgc29mdHdhcmUpLgoK4oCmCitAcDEgZGVwZW5kcyBvbiBwYXRjaEAKK2V4
cHJlc3Npb24gRTsKK0BACisoCj4gKy0JRSAhPSBOVUxMICYmICFJU19FUlIoRSkKPiArKwkhSVNf
RVJSX09SX05VTEwoRSkKPiArfAo+ICstCUUgPT0gTlVMTCB8fCBJU19FUlIoRSkKPiArKwlJU19F
UlJfT1JfTlVMTChFKQo+ICt8Cj4gKy0JIUlTX0VSUihFKSAmJiBFICE9IE5VTEwKPiArKwkhSVNf
RVJSX09SX05VTEwoRSkKPiArfAo+ICstCUlTX0VSUihFKSB8fCBFID09IE5VTEwKPiArKwlJU19F
UlJfT1JfTlVMTChFKQo+ICspCgpTZXZlcmFsIGRldGVjdGVkIGV4cHJlc3Npb25zIHNob3VsZCBy
ZWZlciB0byByZXR1cm4gdmFsdWVzIGZyb20gZnVuY3Rpb24gY2FsbHMuCmh0dHBzOi8vZW4ud2lr
aXBlZGlhLm9yZy93aWtpL1JldHVybl9zdGF0ZW1lbnQKCiogRG8gYW55IGRldmVsb3BtZW50IGNo
YWxsZW5nZXMgaGluZGVyIHN0aWxsIHRoZSBkZXRlcm1pbmF0aW9uIG9mIGNvcnJlc3BvbmRpbmcK
ICBmYWlsdXJlIHByZWRpY2F0ZXM/CgoqIEhvdyB3aWxsIGludGVyZXN0cyBldm9sdmUgdG8gaW1w
cm92ZSBkYXRhIHByb2Nlc3NpbmcgYW55IGZ1cnRoZXIgZm9yIHN1Y2gKICB1c2UgY2FzZXM/CgoK
UmVnYXJkcywKTWFya3VzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=

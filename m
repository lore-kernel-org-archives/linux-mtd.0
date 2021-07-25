Return-Path: <SRS0=WCs9=MR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD482C4338F
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Jul 2021 19:15:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23A4460249
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Jul 2021 19:15:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 23A4460249
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sigma-star.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:
	Subject:From:To:Date:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=lij+Sek2W3UdSfx+TGu7ddUTSWel+rvwr6oyRJHcO0U=; b=0xW
	gW2slwmwc6H30B6tupb7nPvCtta/+gLSMgkNv3VPmGnIwNPAbgiLgLp00VBBvmhNdtj+yzH7CK/X0
	FGukCt0UKb/YAPTno5buV+HHFWbQGYmk6ccm0iljDoLqOMmQm1n/wxrH/5PTx88fratOFdAtCunuv
	2q6PWOacbEsj3LcDaqYTcDHQRj/+4hFLgGtAYOpmFpGRntK+n4RtBOZJNB7cBleNmTOrOr046hNHZ
	Id1pBDSfa0IMJa2yZ6Aj5F7bUAf4qhvaKxD+awyneBZLbZ8P+aIWzx1AvKVDemwSiCa52ozoqgaiy
	+6cBTZFgSdxiSP89tJmfmwcavkyU+QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7jZU-0093Yt-LG; Sun, 25 Jul 2021 19:13:56 +0000
Received: from mail-4323.protonmail.ch ([185.70.43.23])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7jZP-0093YX-1d
 for linux-mtd@lists.infradead.org; Sun, 25 Jul 2021 19:13:53 +0000
Date: Sun, 25 Jul 2021 19:13:37 +0000
Authentication-Results: mail-4317.protonmail.ch; dkim=none
To: MTD Mailing List <linux-mtd@lists.infradead.org>,
 Buildroot Mailing List <buildroot@busybox.net>,
 "Josh Boyer (Fedora)" <jwboyer@gmail.com>,
 "Riku Voipio (Debian)" <riku.voipio@linaro.org>,
 "Pascal Bleser (SUSE)" <pascal.bleser@opensuse.org>,
 "Levente Polyak (Arch)" <anthraxx@archlinux.org>,
 "Robbat (Gentoo)" <robbat2@gentoo.org>, embedded@gentoo.org,
 "Oliver Schinagl (Alpine)" <oliver@schinagl.nl>,
 "Pascal Bellard (SliTaz)" <pascal.bellard@slitaz.org>,
 =?utf-8?Q?Llu=C3=ADs_Batlle_i_Rossell?= <shaba@altlinux.org>,
 "Sergey Bolshakov (ALT Linux)" <sbolshakov@altlinux.org>,
 "Orphaned (Void Linux)" <orphan@voidlinux.org>,
 Richard Weinberger <richard@nod.at>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [ANNOUNCE] mtd-utils-2.1.3 is released
Message-ID: <c5996a18-9dd9-142d-4440-7be94c4929e1@sigma-star.at>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210725_121351_280984_D2938122 
X-CRM114-Status: UNSURE (   5.38  )
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
Reply-To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgptdGQtdXRpbHMtMi4xLjMgaXMgcmVsZWFzZWQuCgpUYXJiYWxsOiAgICAgICAgICAgICAg
IGZ0cDovL2Z0cC5pbmZyYWRlYWQub3JnL3B1Yi9tdGQtdXRpbHMvbXRkLXV0aWxzLTIuMS4zLnRh
ci5iejIKVGFyYmFsbCBncGcgc2lnbmF0dXJlOiBmdHA6Ly9mdHAuaW5mcmFkZWFkLm9yZy9wdWIv
bXRkLXV0aWxzL210ZC11dGlscy0yLjEuMy50YXIuYnoyLmFzYwpTaWduZWQgZ2l0IHRhZzogICAg
ICAgIGdpdDovL2dpdC5pbmZyYWRlYWQub3JnL210ZC11dGlscy5naXQgdjIuMS4zCgoKQWx0ZXJu
YXRpdmVseSBhbHNvIG1pcnJvcmVkIGhlcmU6CgpUYXJiYWxsOiAgICAgICAgICAgICAgIGh0dHBz
Oi8vaW5mcmFyb290LmF0L3B1Yi9tdGQvbXRkLXV0aWxzLTIuMS4zLnRhci5iejIKVGFyYmFsbCBn
cGcgc2lnbmF0dXJlOiBodHRwczovL2luZnJhcm9vdC5hdC9wdWIvbXRkL210ZC11dGlscy0yLjEu
My50YXIuYnoyLmFzYwpTaWduZWQgZ2l0IHRhZzogICAgICAgIGh0dHBzOi8vZ2l0LmluZnJhcm9v
dC5hdC9tdGQtdXRpbHMuZ2l0IHYyLjEuMwoKClRoZSBsaXN0IG9mIGNoYW5nZXMgKHByaW1hcmls
eSBmaXhlcykgaXMgbm90IGFzIGxvbmcgYXMgZm9yIHRoZSBsYXN0IHJlbGVhc2UsCmJ1dCB0aGV5
IGhhdmUgYmVlbiBiYWNrbG9nZ2VkIGZvciBhIHllYXIgbm93LCBmaW5hbGx5IHByb21wdGluZyBh
IG5ldyBwYXRjaApsZXZlbCByZWxlYXNlLgoKCkNoYW5nZXMgZnJvbSAyLjEuMiB0byAyLjEuMzoK
CkZlYXR1cmVzOgogICAgICAgZmxhc2hjcDogQWRkIG5ldyBmdW5jdGlvbiB0aGF0IGNvcHkgb25s
eSBkaWZmZXJlbnQgYmxvY2tzCiAgICAgICBmbGFzaF9lcmFzZTogQWRkIGZsYXNoIGVyYXNlIGNo
aXAKICAgICAgIEFkZCBmbGFzaF9vdHBfZXJhc2UKICAgICAgIEFkZCBhbiB1YmlmcyBtb3VudCBo
ZWxwZXIKICAgICAgIEFkZCBuYW5kZmxpcGJpdHMgdG9vbAoKRml4ZXM6CiAgICAgICBta2ZzLnVi
aWZzOiBGaXggcnVudGltZSBhc3NlcnRpb25zIHdoZW4gcnVubmluZyB3aXRob3V0IGNyeXB0bwog
ICAgICAgbXRkLXV0aWxzOiBVc2UgQUNfU1lTX0xBUkdFRklMRQogICAgICAgRml4IHRlc3QgYmlu
YXJ5IGluc3RhbGxhdGlvbgogICAgICAgbGlibXRkOiBhdm9pZCBkaXZpZGUgYnkgemVybwogICAg
ICAgdWJpaGVhbHRoZDogZml4IFVCSUZTIGJ1aWxkIGRlcGVuZGVuY3kKICAgICAgIG1rZnMudWJp
ZnM6IHJlbW92ZSBPUEVOU1NMX25vX2NvbmZpZygpCiAgICAgICBtaXNjLXV0aWxzOiBBZGQgZmVj
dGVzdCB0byBidWlsZCBzeXN0ZW0KICAgICAgIG1rZnMudWJpZnM6IEZpeCBidWlsZCB3aXRoIFNF
TGludXgKICAgICAgIEZpeCB0eXBvcyBmb3VuZCBieSBEZWJpYW4ncyBsaW50aWFuIHRvb2wKICAg
ICAgIEZpeCBqZmZzMiBidWlsZCBpZiB6bGliIG9yIGx6byBoZWFkZXJzIGFyZSBub3QgaW4gZGVm
YXVsdCBwYXRocwoKClJhdyBzaG9ydCBsb2cgc2luY2UgdGhlIDIuMS4yIHJlbGVhc2U6CgpCYXN0
aWFuIEdlcm1hbm4gKDMpOgogICAgICAgRml4IHR5cG9zIGZvdW5kIGJ5IERlYmlhbidzIGxpbnRp
YW4gdG9vbAogICAgICAgbWtmcy51YmlmczogRml4IGJ1aWxkIHdpdGggU0VMaW51eAogICAgICAg
bWlzYy11dGlsczogQWRkIGZlY3Rlc3QgdG8gYnVpbGQgc3lzdGVtCgpCb3JpcyBCcmV6aWxsb24g
KDEpOgogICAgICAgbXRkLXV0aWxzOiBBZGQgbmFuZGZsaXBiaXRzIHRvb2wKCkNocmlzIFBhY2to
YW0gKDEpOgogICAgICAgbGlibXRkOiBhdm9pZCBkaXZpZGUgYnkgemVybwoKRGF2aWQgT2Jlcmhv
bGxlbnplciAoNSk6CiAgICAgICBSZW1vdmUgaGVhZGVycyBmcm9tIEVYVFJBX0RJU1QKICAgICAg
IENsZWFudXA6IEF1dG9tYWtlOiByZW1vdmUgc2luZ2xlIHVzZSB2YXJpYWJsZXMKICAgICAgIEZp
eCB0ZXN0IGJpbmFyeSBpbnN0YWxsYXRpb24KICAgICAgIEFkZCBtaXNzaW5nIGZpbGxqZmZzMi5z
aCB0byBFWFRSQV9ESVNUCiAgICAgICBSZWxlYXNlIG10ZC11dGlscy0yLjEuMwoKSGFydmV5IFd1
ICgxKToKICAgICAgIG1pc2MtdXRpbHM6IGZsYXNoY3A6IEFkZCBuZXcgZnVuY3Rpb24gdGhhdCBj
b3B5IG9ubHkgZGlmZmVyZW50IGJsb2NrcwoKSGVucmkgUm9vc2VuICgxKToKICAgICAgIG1rZnMu
dWJpZnM6IEZpeCBydW50aW1lIGFzc2VydGlvbnMgd2hlbiBydW5uaW5nIHdpdGhvdXQgY3J5cHRv
CgpKdWVyZ2VuIEJvcmxlaXMgKDEpOgogICAgICAgbXRkLXV0aWxzOiB1YmloZWFsdGhkOiB0aGlz
IHRvb2wgZG9lcyBub3QgZGVwZW5kIG9uIFVCSUZTCgpMYXJpc2EgSWxlYW5hIEdyaWdvcmUgKDEp
OgogICAgICAgbXRkLXV0aWxzOiBmbGFzaF9lcmFzZTogQWRkIGZsYXNoIGVyYXNlIGNoaXAKCk1p
Y2hhZWwgV2FsbGUgKDEpOgogICAgICAgbXRkLXV0aWxzOiBBZGQgZmxhc2hfb3RwX2VyYXNlCgpS
b2xmIEVpa2UgQmVlciAoMSk6CiAgICAgICBmaXggYnVpbGQgb2YgamZmczJyZWFkZXIgYW5kIGpm
ZnMyZHVtcCBpZiB6bGliIG9yIGx6byBoZWFkZXJzIGFyZSBub3QgaW4gZGVmYXVsdCBwYXRocwoK
U2FzY2hhIEhhdWVyICgxKToKICAgICAgIG10ZC11dGlsczogVXNlIEFDX1NZU19MQVJHRUZJTEUK
ClRvcmJlbiBIb2huICgxKToKICAgICAgIG1rZnMudWJpZnM6IHJlbW92ZSBPUEVOU1NMX25vX2Nv
bmZpZygpCgpVd2UgS2xlaW5lLUvDtm5pZyAoMSk6CiAgICAgICBBZGQgYW4gdWJpZnMgbW91bnQg
aGVscGVyCgoKUmVnYXJkcywKCkRhdmlkCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K

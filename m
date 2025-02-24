Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA23DC021B6
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Feb 2025 22:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8+PLeSx1GFtpEeVtdCpXam6vv/N2a5iPgWZTkogO+U4=; b=MYrxfgYlGjRx/H
	mu6ajlt49rXQNVZdvCc7EVwQh7VicD7cFiZ4FNKtMwLxyhC8unulPC6JhqN10mbvOe5E5h8fujak3
	0A14GJ0vJ6fG/e4IP7PAIn4SL9cJXWP1E1ePGu937uu6WZskw9KbcVaWNi5e49JtQgUosl/AKN/Gz
	VURLQqv/vk74xrP2l0Vx2OAhYlZeEzDrdqRWzBfBf/d0XXLJC5TbyiZxHZRpOyXoZ5JI2udydzgJX
	CCgYyFdXbX1tsPxLDa4UiO9AfQ3OThtH5aNfprOCx8G2VtcvtS6AJ3jZZST+kPv/IVUHf0MMyt0c2
	4ihpGJVeRDPUPaNqddyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmgn8-0000000FLPK-2TSk;
	Mon, 24 Feb 2025 22:19:10 +0000
Received: from [2607:7c80:54:3::138] (helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmgn6-0000000FLOc-2fRV
	for linux-mtd@lists.infradead.org;
	Mon, 24 Feb 2025 22:19:09 +0000
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 51OMIJ9V935362
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 24 Feb 2025 14:18:19 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 51OMIJ9V935362
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025021701; t=1740435502;
	bh=QVRdF3EAXIHa/WOpzueNrjkWna1IYk5vm0KLQKRBt1g=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=LBCMVcF1JBUzSpFQa0NclgZSN1lbJ6R8l4P7gV/GP3OfWksuvJSk8UFAnCLrz2stD
	 zfBgNKQ/2LRfu2C7llD7zbNpCRWed6pOnPU5J/rmByu17lskqRa2z1Rn4bMzv0Gtrp
	 RsTWuEFZFH9XaV0gR9XSqUCDQaZHojh1ozgY06ibIOO0Yqru+WPUEv+njgn02D+BSb
	 AxrPR7FbBtmmBrmKcGPInLjOvNUJ+QE9Q87mz2O2DxJyDTSANU+Lg2qd0d24d46W8Q
	 acNifs2uoGssEaapuK60oCfTN5FpL6SRf+yCzsC/DVfUihJLjByLPlr8GNKX3Z4pU9
	 0NfLcLSzqxqfw==
Date: Mon, 24 Feb 2025 14:18:17 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: Uros Bizjak <ubizjak@gmail.com>
CC: Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de,
        Ingo Molnar <mingo@redhat.com>, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org,
        joel@jms.id.au, eajames@linux.ibm.com, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
        dmitry.torokhov@gmail.com, mchehab@kernel.org, awalls@md.metrocast.net,
        hverkuil@xs4all.nl, miquel.raynal@bootlin.com, richard@nod.at,
        vigneshr@ti.com, louis.peens@corigine.com, andrew+netdev@lunn.ch,
        davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
        parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
        johannes@sipsolutions.net, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, yury.norov@gmail.com, akpm@linux-foundation.org,
        mingo@kernel.org, alistair@popple.id.au, linux@rasmusvillemoes.dk,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, kuba@kernel.org,
        linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
        dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
        oss-drivers@corigine.com, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
        brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
        bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
        Yu-Chun Lin <eleanor15x@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_03/17=5D_x86=3A_Replace_open-c?=
 =?US-ASCII?Q?oded_parity_calculation_with_parity8=28=29?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CAFULd4a_AnP4iqgQs7a6xAsnUFL8oZXxFcAWLmZFMm6MPF_zDQ@mail.gmail.com>
References: <20250223164217.2139331-1-visitorckw@gmail.com> <20250223164217.2139331-4-visitorckw@gmail.com> <d080a2d6-9ec7-1c86-4cf4-536400221f68@gmail.com> <e0b1c299-7f19-4453-a1ce-676068601213@zytor.com> <CAFULd4a_AnP4iqgQs7a6xAsnUFL8oZXxFcAWLmZFMm6MPF_zDQ@mail.gmail.com>
Message-ID: <B5E017BC-8BE4-482A-B1A2-3F3074968B56@zytor.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_141908_672397_EB1E86C4 
X-CRM114-Status: GOOD (  10.91  )
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

T24gRmVicnVhcnkgMjQsIDIwMjUgMjowODowNSBQTSBQU1QsIFVyb3MgQml6amFrIDx1Yml6amFr
QGdtYWlsLmNvbT4gd3JvdGU6Cj5PbiBNb24sIEZlYiAyNCwgMjAyNSBhdCAxMDo1NuKAr1BNIEgu
IFBldGVyIEFudmluIDxocGFAenl0b3IuY29tPiB3cm90ZToKPj4KPj4gT24gMi8yNC8yNSAwNzoy
NCwgVXJvcyBCaXpqYWsgd3JvdGU6Cj4+ID4KPj4gPgo+PiA+IE9uIDIzLiAwMi4gMjUgMTc6NDIs
IEt1YW4tV2VpIENoaXUgd3JvdGU6Cj4+ID4+IFJlZmFjdG9yIHBhcml0eSBjYWxjdWxhdGlvbnMg
dG8gdXNlIHRoZSBzdGFuZGFyZCBwYXJpdHk4KCkgaGVscGVyLiBUaGlzCj4+ID4+IGNoYW5nZSBl
bGltaW5hdGVzIHJlZHVuZGFudCBpbXBsZW1lbnRhdGlvbnMgYW5kIGltcHJvdmVzIGNvZGUKPj4g
Pj4gZWZmaWNpZW5jeS4KPj4gPgo+PiA+IFRoZSBwYXRjaCBpbXByb3ZlcyBwYXJpdHkgYXNzZW1i
bHkgY29kZSBpbiBib290ZmxhZy5vIGZyb206Cj4+ID4KPj4gPiAgICA1ODogICAgODkgZGUgICAg
ICAgICAgICAgICAgICAgIG1vdiAgICAlZWJ4LCVlc2kKPj4gPiAgICA1YTogICAgYjkgMDggMDAg
MDAgMDAgICAgICAgICAgIG1vdiAgICAkMHg4LCVlY3gKPj4gPiAgICA1ZjogICAgMzEgZDIgICAg
ICAgICAgICAgICAgICAgIHhvciAgICAlZWR4LCVlZHgKPj4gPiAgICA2MTogICAgODkgZjAgICAg
ICAgICAgICAgICAgICAgIG1vdiAgICAlZXNpLCVlYXgKPj4gPiAgICA2MzogICAgODkgZDcgICAg
ICAgICAgICAgICAgICAgIG1vdiAgICAlZWR4LCVlZGkKPj4gPiAgICA2NTogICAgNDAgZDAgZWUg
ICAgICAgICAgICAgICAgIHNociAgICAlc2lsCj4+ID4gICAgNjg6ICAgIDgzIGUwIDAxICAgICAg
ICAgICAgICAgICBhbmQgICAgJDB4MSwlZWF4Cj4+ID4gICAgNmI6ICAgIDMxIGMyICAgICAgICAg
ICAgICAgICAgICB4b3IgICAgJWVheCwlZWR4Cj4+ID4gICAgNmQ6ICAgIDgzIGU5IDAxICAgICAg
ICAgICAgICAgICBzdWIgICAgJDB4MSwlZWN4Cj4+ID4gICAgNzA6ICAgIDc1IGVmICAgICAgICAg
ICAgICAgICAgICBqbmUgICAgNjEgPHNiZl9pbml0KzB4NTE+Cj4+ID4gICAgNzI6ICAgIDM5IGM3
ICAgICAgICAgICAgICAgICAgICBjbXAgICAgJWVheCwlZWRpCj4+ID4gICAgNzQ6ICAgIDc0IDdm
ICAgICAgICAgICAgICAgICAgICBqZSAgICAgZjUgPHNiZl9pbml0KzB4ZTU+Cj4+ID4gICAgNzY6
Cj4+ID4KPj4gPiB0bzoKPj4gPgo+PiA+ICAgIDU0OiAgICA4OSBkOCAgICAgICAgICAgICAgICAg
ICAgbW92ICAgICVlYngsJWVheAo+PiA+ICAgIDU2OiAgICBiYSA5NiA2OSAwMCAwMCAgICAgICAg
ICAgbW92ICAgICQweDY5OTYsJWVkeAo+PiA+ICAgIDViOiAgICBjMCBlOCAwNCAgICAgICAgICAg
ICAgICAgc2hyICAgICQweDQsJWFsCj4+ID4gICAgNWU6ICAgIDMxIGQ4ICAgICAgICAgICAgICAg
ICAgICB4b3IgICAgJWVieCwlZWF4Cj4+ID4gICAgNjA6ICAgIDgzIGUwIDBmICAgICAgICAgICAg
ICAgICBhbmQgICAgJDB4ZiwlZWF4Cj4+ID4gICAgNjM6ICAgIDBmIGEzIGMyICAgICAgICAgICAg
ICAgICBidCAgICAgJWVheCwlZWR4Cj4+ID4gICAgNjY6ICAgIDczIDY0ICAgICAgICAgICAgICAg
ICAgICBqYWUgICAgY2MgPHNiZl9pbml0KzB4YmM+Cj4+ID4gICAgNjg6Cj4+ID4KPj4gPiB3aGlj
aCBpcyBmYXN0ZXIgYW5kIHNtYWxsZXIgKC0xMCBieXRlcykgY29kZS4KPj4gPgo+Pgo+PiBPZiBj
b3Vyc2UsIG9uIHg4NiwgcGFyaXR5OCgpIGFuZCBwYXJpdHkxNigpIGNhbiBiZSBpbXBsZW1lbnRl
ZCB2ZXJ5IHNpbXBseToKPj4KPj4gKEFsc28sIHRoZSBwYXJpdHkgZnVuY3Rpb25zIHJlYWxseSBv
dWdodCB0byByZXR1cm4gYm9vbCwgYW5kIGJlIGZsYWdnZWQKPj4gX19hdHRyaWJ1dGVfY29uc3Rf
Xy4pCj4+Cj4+IHN0YXRpYyBpbmxpbmUgX19hdHRyaWJ1dGVfY29uc3RfXyBib29sIF9hcmNoX3Bh
cml0eTgodTggdmFsKQo+PiB7Cj4+ICAgICAgICAgYm9vbCBwYXJpdHk7Cj4+ICAgICAgICAgYXNt
KCJhbmQgJTAsJTAiIDogIj1AY2NucCIgKHBhcml0eSkgOiAicSIgKHZhbCkpOwo+Cj5hc20oInRl
c3QgJTAsJTAiIDogIj1AY2NucCIgKHBhcml0eSkgOiAicSIgKHZhbCkpOwo+Cj5iZWNhdXNlIHdl
IGFyZSBpbnRlcmVzdGVkIG9ubHkgaW4gZmxhZ3MuCj4KPlVyb3MuCj4KClNhbWUgdGhpbmcsIHJl
YWxseSwgYnV0IHllcywgdXNpbmcgdGVzdCBpcyBjbGVhbmVyLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K

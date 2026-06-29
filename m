Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D3CC43458
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2026 08:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=cRsRiGb3a2/594RtxAqoQJaBH04oQpbBtnrfmDIJhik=; b=DOhNqKuUQS13QP8UR757rIb0qj
	Sg6K8eTPImDV5xEF+RL083Vl35MplMBYnTE8W5U7YlKD2GWM+TWow/a0bkCgxJynOlmZ7tG4clUQO
	N7YR6N+Be1a3nXpa8jBA3tSFUL7c5hvZyZ26RvKyhQv/P+3gQGdgsgtWAxGO+v8TUVhoWTJkpNLNT
	TGQdMn+jt6SSiF34e3XLDYYmwD4cGlM0F84vozI/RClQmq86JxpMfYp9C3qrSKCXTtAanBLHsh2Vy
	IZLLy5yX5hm31BxAop1iCWVe/BdPojAwWYk8hggL1Qi49Aw9Hk9ZW03UqIaGhdRpHpR6b++zcckpA
	sOPlRBQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we71q-0000000Dyga-3j4D;
	Mon, 29 Jun 2026 08:07:42 +0000
Received: from flow-a2-smtp.messagingengine.com ([103.168.172.137])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we71o-0000000Dyfw-04e0;
	Mon, 29 Jun 2026 08:07:41 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.phl.internal (Postfix) with ESMTP id 95552138020B;
	Mon, 29 Jun 2026 04:07:38 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Mon, 29 Jun 2026 04:07:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1782720458;
	 x=1782727658; bh=/WIe7fhbq6CJNEEuiOwk3r/zWUSncZp6R6QFRwJ6sZY=; b=
	TEpYlNln6M/GwjHpSnfu7rcdvzFIRDl8PaPZdTR79bfu+93tv92bHNDr8ENAoz0o
	I+3XOz+pyki2rkkp/RkwXg8QRaJpJiIvR1f0tt8I+SaQuvnEJlOAQI6CC1z6yuZ0
	cVgd/4iHRc6MLkND4uxVIRG0nvMRx4MGsgfInhPlnKeJM8pUkN12VG8ueW2PsOxW
	4MefLznfvAN244lHNATTmj+ua+WwiZat+gfP8BGqjCXRdi0M/+5lN5Uzmi8DBRk9
	qOZeAPBpKTz28WGmYMtNgUnS3AhyykTIUnN8T+m0kvmDFl4Aj7gFAV/TTmsNx+r6
	Jtg81SkeOZQVOe1HWz4Juw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1782720458; x=
	1782727658; bh=/WIe7fhbq6CJNEEuiOwk3r/zWUSncZp6R6QFRwJ6sZY=; b=c
	24Brf1SGc6bjX+gJggjD7fmSOT+iM2lF24wJCuV8s2Amdzt3Twtd0vjLYD7Kbt7Z
	+kQoptcHz/VtGk8XGv79LNoCZacAq5R7BAxPksArO05cBqn1akZdOx6QMuzHyKsp
	jZ5aPv2lk/STvMi4lhBu2oUJ3KD+K5F5xqv9MBLZ6CU0PGJ3KI+fRCvE0f+e7q5T
	uEQZkmuOQpm6EKiGmWuLksFY8y18pLeUcAz299olDRkgTanwR4wU8CSDkLsduURr
	qyrnHb9qvfpeWKz95/irIS1jl+HSEg0BQDlK7TA+5DM9R3tqbP934xrod3JsNeCN
	bn6beHziPLZyr1RaQBnnQ==
X-ME-Sender: <xms:yCdCapri6_Fghw3mlaxsy_gFSSzhIwFXsDsNSMOFs66NbUuvHEYu7g>
    <xme:yCdCamerjDzu3SkJsJt3qEPErm5Jr5VIrDx-XCtfJMJEoOf5pYL1aPAL4K1m0ol0d
    u21Y6WhZ3M90bX6VcOFH8qU30t4-5iJBk_D2YIapVkzsHqYJk_o71YS>
X-ME-Proxy-Cause: dmFkZTGqoTHHYaCI7RURCJhbWHvAkwwtWLTme13LzQ5hLxT15nHz8y1KVwyjgVqWxzHrQs
    ToUxEitfKDOpnMGHxJtxeXXfPwSpUOYKCbLG3DvDrtRiFisamjIvbRYQ8eHCu3vuqKkFV+
    oGsvHlqt2QnvGfcOvmRuOO3Rgzas4qMskWtx3Scnrrx20Qj6yj3iPd9+zKy3qioo1rB1kC
    NbqXUUQhwk7CbH9jPKcbA4qnRTFNBVVyitidRmU/FN7E7sMWO92pJbypgI30pCru3tSGoX
    4d3jRIE5+wGTHtOqlpEwsN0x3RyunobmR8KafNHjr3b8znb/Ht8a7MfJTFEzr6ZVtoIPkp
    YEm/Y5IKpJ7BR9D7SOhiAKZmz+xhjw+Rj3xZl+UuPyzGO/ptf2uS48xftDP82jFSPGfW1i
    WUFvAhWp7rn6kmw50O2IbqNmMpIJJk3N6j0QnhkZxe9rSsCXY+yz3p4OT2eGCGDnr01Arj
    1sqDxkxM7AGOwRp2cqGArUzSLYhPKHqfyQLHeEzDtqWWPt2AfNkUlUPb4ugsBXY3ifDHcm
    rEin2AiU1hzBEGVpJXGUq8YO8ASTb7YaAQ4Ms9TA2vnH06i8XtAwN9VbW6ypBxduNhUPiP
    nLczW/MyU9OJ2FdWXbqKiIb/kfE3CMT7L0MTJSderW3WxiiH9wuQPU0UShyg
X-ME-Proxy: <xmx:yCdCaqfbNNdmOfirtwC33qahd0NFGOxhg_dXK8UoYrkmnnmFjgFULw>
    <xmx:yCdCakdFbzk9KweAfKAiLwLQgD4racV8i02VE4-Fx5JTJvZq9isCqw>
    <xmx:yCdCakb8QFZewQ3ezXiHAUYXU4zyjwrQ2jNwpx7JVpowCgaV4w9SdQ>
    <xmx:yCdCar0ySJMq0u8YC5UhoDauKTq85d7kaWxynrhTGphqhhBu2OB0Rg>
    <xmx:yidCaoHTNZ_VOhE49MHuA-FguNtgyjgUdDsWkzp50DUo55mdeNXYC66h>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4D341182007E; Mon, 29 Jun 2026 04:07:36 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ApSqBjiSqQZ-
Date: Mon, 29 Jun 2026 10:06:54 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Juergen Gross" <jgross@suse.com>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org,
 "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, x86@kernel.org,
 linux-acpi@vger.kernel.org, kvm@vger.kernel.org, linux-coco@lists.linux.dev,
 linux-pci@vger.kernel.org, virtualization@lists.linux.dev,
 linux-ide@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-crypto@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-hyperv@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-mtd@lists.infradead.org,
 platform-driver-x86@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
 "Daniel Lezcano" <daniel.lezcano@kernel.org>,
 "Zhang Rui" <rui.zhang@intel.com>,
 "lukasz.luba@arm.com" <lukasz.luba@arm.com>,
 "Jason Baron" <jbaron@akamai.com>, "Borislav Petkov" <bp@alien8.de>,
 "Tony Luck" <tony.luck@intel.com>,
 "Yazen Ghannam" <yazen.ghannam@amd.com>, "Len Brown" <lenb@kernel.org>,
 "Pavel Machek" <pavel@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>,
 "Ingo Molnar" <mingo@redhat.com>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "Sean Christopherson" <seanjc@google.com>,
 "Paolo Bonzini" <pbonzini@redhat.com>,
 "Kirill A. Shutemov" <kas@kernel.org>,
 "Rick Edgecombe" <rick.p.edgecombe@intel.com>, "Pu Wen" <puwen@hygon.cn>,
 "Bjorn Helgaas" <bhelgaas@google.com>,
 "Ajay Kaher" <ajay.kaher@broadcom.com>,
 "Alexey Makhalov" <alexey.makhalov@broadcom.com>,
 "Broadcom internal kernel review list"
 <bcm-kernel-feedback-list@broadcom.com>,
 "Viresh Kumar" <viresh.kumar@linaro.org>,
 "Reinette Chatre" <reinette.chatre@intel.com>,
 "Dave Martin" <Dave.Martin@arm.com>, "James Morse" <james.morse@arm.com>,
 "Babu Moger" <babu.moger@amd.com>,
 "Tony W Wang-oc" <TonyWWang-oc@zhaoxin.com>,
 "Damien Le Moal" <dlemoal@kernel.org>,
 "Niklas Cassel" <cassel@kernel.org>, "Dave Airlie" <airlied@redhat.com>,
 "Helge Deller" <deller@gmx.de>, linux-geode@lists.infradead.org,
 "Olivia Mackall" <olivia@selenic.com>,
 "Herbert Xu" <herbert@gondor.apana.org.au>,
 "Linus Walleij" <linusw@kernel.org>,
 "Bartosz Golaszewski" <brgl@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 "Haiyang Zhang" <haiyangz@microsoft.com>, "Wei Liu" <wei.liu@kernel.org>,
 "Dexuan Cui" <decui@microsoft.com>, "Long Li" <longli@microsoft.com>,
 "Guenter Roeck" <linux@roeck-us.net>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Arnaldo Carvalho de Melo" <acme@kernel.org>,
 "Namhyung Kim" <namhyung@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Alexander Shishkin" <alexander.shishkin@linux.intel.com>,
 "Jiri Olsa" <jolsa@kernel.org>, "Ian Rogers" <irogers@google.com>,
 "Adrian Hunter" <adrian.hunter@intel.com>,
 "James Clark" <james.clark@linaro.org>,
 "Josh Poimboeuf" <jpoimboe@kernel.org>,
 "Pawan Gupta" <pawan.kumar.gupta@linux.intel.com>,
 "Vitaly Kuznetsov" <vkuznets@redhat.com>,
 "Andy Lutomirski" <luto@kernel.org>,
 "Boris Ostrovsky" <boris.ostrovsky@oracle.com>,
 "Huang Rui" <ray.huang@amd.com>,
 "Mario Limonciello" <mario.limonciello@amd.com>,
 "Perry Yuan" <perry.yuan@amd.com>,
 "K Prateek Nayak" <kprateek.nayak@amd.com>,
 "srinivas.pandruvada@linux.intel.com"
 <srinivas.pandruvada@linux.intel.com>,
 "Artem Bityutskiy" <artem.bityutskiy@linux.intel.com>,
 "Artem Bityutskiy" <dedekind1@gmail.com>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Ashok Raj" <ashok.raj.linux@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Rajneesh Bhardwaj" <irenic.rajneesh@gmail.com>,
 "David E Box" <david.e.box@intel.com>, xen-devel@lists.xenproject.org
Message-Id: <7332feff-2649-496c-8e49-b0a19eb54a32@app.fastmail.com>
In-Reply-To: <c1608c48-13c2-4290-826b-28b5ca51eaf7@suse.com>
References: <20260629060526.3638272-1-jgross@suse.com>
 <d7c1db52-529a-43cc-ac7d-38b52627e8bc@app.fastmail.com>
 <c1608c48-13c2-4290-826b-28b5ca51eaf7@suse.com>
Subject: Re: [PATCH 00/32] x86/msr: Drop 32-bit MSR interfaces
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_010740_617172_E205E23B 
X-CRM114-Status: GOOD (  16.66  )
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

T24gTW9uLCBKdW4gMjksIDIwMjYsIGF0IDA5OjAxLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+IE9u
IDI5LjA2LjI2IDA4OjUyLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+PiBPbiBNb24sIEp1biAyOSwg
MjAyNiwgYXQgMDg6MDQsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IAo+PiBJIGFzc3VtZSB0aGlz
IGlzIGZpbmUsIGJ1dCBzaW5jZSB5b3UgZG9uJ3QgbWVudGlvbiBpdCBleHBsaWNpdGx5IGhlcmUs
Cj4+IHBsZWFzZSBjbGFyaWZ5IHdoYXQgdGhpcyBtZWFucyBmb3IgMzItYml0IENQVXMgd2l0aG91
dCB0aGUgcmRtc3JxCj4+IGluc3RydWN0aW9uLiBUaG9zZSB3aWxsIGNvbnRpbnVlIHVzaW5nIHRo
ZSBzYW1lIGluc3RydWN0aW9ucyBhcyBiZWZvcmUKPj4gYW5kIGp1c3QgY2hhbmdlIHRoZSBjYWxs
aW5nIGNvbnZlbnRpb25zLCByaWdodD8KPgo+IFllcy4gSSB0aG91Z2h0IHRoaXMgd291bGQgYmUg
Y2xlYXIgZnJvbSB0aGUgZm9sbG93aW5nOgo+Cj4gICAgLSBUaGV5IGFyZSBiYXNlZCBvbiBwcmlt
aXRpdmVzIHVzaW5nIDY0LWJpdCBzaXplZCB2YWx1ZXMgYW55d2F5LgoKUmlnaHQsIHRoYXQgd2Fz
IG15IHJlYWRpbmcgb2YgaXQgYXMgd2VsbCwgYnV0IGl0J3Mgbm90IGVudGlyZWx5CmNsZWFyIHdo
ZW4gdGhlIGZ1bmN0aW9uIG5hbWUgaXMgdGhlIHNhbWUgYXMgdGhlIG1uZW1vbmljIG9mIGFuCmlu
c3RydWN0aW9uIHRoYXQgb25seSBleGlzdHMgb24gbmV3ZXIgQ1BVcyBhbmQgdGhlIGxhdGVyIHBh
dGNoCmRlc2NyaXB0aW9ucyAoZS5nLiAyNS8zMiB0aGF0IEkgd2FzIENjJ3Mgb24pIGhhdmUgYSBt
dWNoIHNob3J0ZXIKZXhwbGFuYXRpb24uCgo+Pj4gTm90ZSB0aGF0IG1vc3QgcGF0Y2hlcyBvZiB0
aGlzIHNlcmllcyBhcmUgaW5kZXBlbmRlbnQgZnJvbSBlYWNoIG90aGVyLgo+Pj4gT25seSB0aGUg
cGF0Y2hlcyByZW1vdmluZyBhIHNwZWNpZmljIGludGVyZmFjZSAocGF0Y2hlcyA3LCAxNSwgMjYg
YW5kCj4+PiAzMCkgYW5kIHRoZSBsYXN0IHR3byBwYXRjaGVzIG9mIHRoZSBzZXJpZXMgZGVwZW5k
IG9uIGFsbCBwcmV2aW91cwo+Pj4gcGF0Y2hlcy4KPj4gCj4+IEl0IGxvb2tzIGxpa2UgeW91IGFy
ZSB0b3VjaGluZyBtb3N0IGZpbGVzIHR3aWNlIG9yIG1vcmUgaGVyZSwgdG8KPj4gZmlyc3QgY29u
dmVydCBmcm9tIHJkbXNyIHRvIHJkbXNycSBhbmQgdGhlbiB0byBjaGFuZ2UgdGhlCj4+IHR3by1h
cmd1bWVudCByZG1zcnEoKSBtYWNybyB0byBhIHNpbmdsZS1hcmd1bWVudCBpbmxpbmUuIElmIHlv
dQo+PiBpbnRyb2R1Y2UgdGhlIGlubGluZSB2ZXJzaW9uIG9mIHJkbXNycSgpIGZpcnN0LCB5b3Ug
c2hvdWxkIGJlCj4+IGFibGUgdG8gc2tpcCB0aGUgc2Vjb25kIHN0ZXAgKHBhdGNoIDMxKSBhcyB0
aGV5IGNvdWxkIGJlIGFibGUKPj4gdG8gY29leGlzdC4KPgo+IEkndmUgZGlzY3Vzc2VkIGhvdyB0
byBzdHJ1Y3R1cmUgdGhlIHNlcmllcyB3aXRoIEluZ28gTW9sbmFyIGJlZm9yZSBbMV0uIFRoZQo+
IGN1cnJlbnQgYXBwcm9hY2ggd2FzIGhpcyBwcmVmZXJlbmNlLgoKT2suCgogICAgICBBcm5kCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=

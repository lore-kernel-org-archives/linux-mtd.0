Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 940EBC43458
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2026 08:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tAERr4v9W5T9AMSSkBEDezBHC1QSOk/vWNPQVNVabyM=; b=tqJbeqX8G93Phj0YaGs2kZ6uER
	zKWwI4wR5DSNwTAF4rAJVv+/CnFFtIsqWsu9U/x576w9qQZYnzP+QwStNlgmyAmT26ExYhqq+EhZi
	2rz3+mQcyA9teE8LbTk3VK5GOoWYb+q9SEmCOhCBEgpDyloTWAiVV54O4XnYE3eHG+UltdzLFdofU
	+QjvW/Ipl49E6o3DfZiB3nioq2V9hH2DzzZve824/ix9qNalPHhczh8woTKg9qBlqTsnoUQ6d0gvP
	NgHubd5w8jwu6i4rdMX45JH5DYuLTQQBbgBmqEF54ufD0I5Ph5pygNfl1bWvnc+EmeSEaVQ7i9Yjn
	3P+yd42Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7WI-0000000E1H7-1aoL;
	Mon, 29 Jun 2026 08:39:10 +0000
Received: from flow-a2-smtp.messagingengine.com ([103.168.172.137])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we7WF-0000000E1Gj-0gqx;
	Mon, 29 Jun 2026 08:39:08 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.phl.internal (Postfix) with ESMTP id ED49E1380289;
	Mon, 29 Jun 2026 04:39:05 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Mon, 29 Jun 2026 04:39:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1782722345;
	 x=1782729545; bh=/vdY4J8WqpgsSSAPKxCtlbdJGPE0BXIq61EW+S6j6P4=; b=
	gYKRp3MkalTZcfjiyB1FWwOhagCvw7SptaL4XpUAHt9qYHSGuoiB6JpTDfeluC3Q
	rh4Aal4qSJB9FlmFMuZBGVV3Dx7WxE4URmh/8SrliuKwrNTUxDpN5M0oqIvsfjsi
	v/1VEbMFCoVKG4zgmmv8bWa1ApMxljOc9oVaEnz9RMWWBfn1NNGGQG4h+0zPBM2t
	iE4ZNSm4dlaaqkxGqpIYsAjT7stL06NVaG0wkBIsDJ79kINTzAEWrhL8L7qa9xLg
	O3+f3LvOp1joCWZj+Qj+cokk9VL0UCCg+7t2GAEkDKyIX138l7MoA7c6+0ANJpex
	b+u4XAzlz6AfSSaqRN2B+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1782722345; x=
	1782729545; bh=/vdY4J8WqpgsSSAPKxCtlbdJGPE0BXIq61EW+S6j6P4=; b=T
	moJafjBCQd2OcjAkPYpzobQBAomX1YnWDBRu3nLVcnTUyhNbi9yqP7rAKao74kvK
	W9Pyd82evV5x0oejCQ0bKAnh1OzcJ+lyR04VaBZ2mhymZiRP3GIGHdp3wRdPJAA2
	qlGUDJUJqr9OHkULgg6JVf2xPVApuQhlXvg2QIeF+hrIx5wofbMZ7ViQL+Q14vqD
	thuwp23CCztH4wo0hMRwalZDAOtGeBL9A3r2yk/KroDYmS7keKhb+A+1OFjil0iN
	BkaqZbBQ3aEgZtPAPZ9N1KDwfQ/I6E2wqsbVnBvR4gpiegR3RSa67VUyYlbj9RXz
	NOlJ/GRInhzHItsNT5WuQ==
X-ME-Sender: <xms:Jy9CajGgRjsplzBg2AtFgVQfIg8_cVyBgfhU3z9iIIWNAladEIyTng>
    <xme:Jy9CarIOubeU2rUQNxElTNzHTUc1VSiC0q76P0JncQ51McW6xYkKnxEdv3WLCricH
    AoTGPUTTEMZF6yAdwb8oDGyXnmPuUbczXMANRC2Ne84a15jGqlpK04>
X-ME-Proxy-Cause: dmFkZTGQ1+/zMJ6FRO/nrenBVaK3dgNV80cEWVcq9a0FUfwQpoRgAtHfD6iB9yAigOgUR+
    jj7UAkKII4IB5gEkT+Gq3x2a1TlJ8/9Us6NCf+Z6ozVZwwfkmtIK8B6WD3KkL3WjRWyNlq
    RY0/S5hiTmQ6/MWQZUqPxfXAFF22LmbgigARUbvZheMrxzFjsfmoo1zWrVptpHF0V+jwar
    WA4RBlo40U0z1fWy4AebOsp8HnYzB68Slr7XO9JmQmLKgIV8Fjf814MXW+8uJ77ByBAQuJ
    BGA9VM2uzadc0UNHVRSjRdmVsmOH4QsX2FHPkz6ZWqk9Mgajdyl3+bXK90tycrhFehfmXt
    Fn1W9kCa2R5qpJDYtP8FRGr1MDXzZevPPYc1/sMmYgs8yRZCCQEwPqkd6EtSRnZrYDpqiX
    r83RR5Axps70SB/YmbIacE3AvmD3xsZz6p9dt8AkDdsOc4PoBCQp+2L4l6Jczg6Hv+mjus
    wDNXfIn1FImLLVX6BBE/OD945b3OnLpEQHvjR6yFG8qsjgmGutFbt6SDv0KgUxVeb4fL5C
    4ryLUX6BjWQwb2s9pTrOmAipI+MJOoWjtsdHbN1E9hLWMLIym+D+jilNl4niSZiN/vQal8
    sGsjvTbjRleHQMEsz8fFh1nDAI8nT1w6DiLhtWhC1MqN9cKnNagMl1USoB+A
X-ME-Proxy: <xmx:Jy9CaiU4saJaD8ZZTc3oT4aVP9FZ-2KzZY1OMbt54FSVdp8C4GojwQ>
    <xmx:Jy9CarAKcIjUEzh0n01SmH8Fvdf-c-CEw6HC4kX3-wpjrz_bK_Gd2A>
    <xmx:Jy9CalRy7x7F70ztTSBlebo27l1W3InI7iznAUqc9uqjK3_xcNs__g>
    <xmx:Jy9CavcxY2931rRj96HnQy4Q94ZUMjaepmrx-pZGBtzBliSD2KlD8g>
    <xmx:KS9CaoujF5_4WrC5b_ziAcwJh2y7aclJij4MlWb0bwqEh9ZP_Ar7Yvo4>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 770CC182007E; Mon, 29 Jun 2026 04:39:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ApSqBjiSqQZ-
Date: Mon, 29 Jun 2026 10:38:16 +0200
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
Message-Id: <d315e0a8-e4e9-4f7e-80a9-7c236849eabd@app.fastmail.com>
In-Reply-To: <9acced19-573d-4923-9329-8be408d2e555@suse.com>
References: <20260629060526.3638272-1-jgross@suse.com>
 <d7c1db52-529a-43cc-ac7d-38b52627e8bc@app.fastmail.com>
 <c1608c48-13c2-4290-826b-28b5ca51eaf7@suse.com>
 <7332feff-2649-496c-8e49-b0a19eb54a32@app.fastmail.com>
 <9acced19-573d-4923-9329-8be408d2e555@suse.com>
Subject: Re: [PATCH 00/32] x86/msr: Drop 32-bit MSR interfaces
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_013907_300637_76155C42 
X-CRM114-Status: GOOD (  12.64  )
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

T24gTW9uLCBKdW4gMjksIDIwMjYsIGF0IDEwOjE1LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+IE9u
IDI5LjA2LjI2IDEwOjA2LCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+PiBPbiBNb24sIEp1biAyOSwg
MjAyNiwgYXQgMDk6MDEsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+PiBPbiAyOS4wNi4yNiAwODo1
MiwgQXJuZCBCZXJnbWFubiB3cm90ZToKPj4+PiBPbiBNb24sIEp1biAyOSwgMjAyNiwgYXQgMDg6
MDQsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+Pj4KPj4+PiBJIGFzc3VtZSB0aGlzIGlzIGZpbmUs
IGJ1dCBzaW5jZSB5b3UgZG9uJ3QgbWVudGlvbiBpdCBleHBsaWNpdGx5IGhlcmUsCj4+Pj4gcGxl
YXNlIGNsYXJpZnkgd2hhdCB0aGlzIG1lYW5zIGZvciAzMi1iaXQgQ1BVcyB3aXRob3V0IHRoZSBy
ZG1zcnEKPj4+PiBpbnN0cnVjdGlvbi4gVGhvc2Ugd2lsbCBjb250aW51ZSB1c2luZyB0aGUgc2Ft
ZSBpbnN0cnVjdGlvbnMgYXMgYmVmb3JlCj4+Pj4gYW5kIGp1c3QgY2hhbmdlIHRoZSBjYWxsaW5n
IGNvbnZlbnRpb25zLCByaWdodD8KPj4+Cj4+PiBZZXMuIEkgdGhvdWdodCB0aGlzIHdvdWxkIGJl
IGNsZWFyIGZyb20gdGhlIGZvbGxvd2luZzoKPj4+Cj4+PiAgICAgLSBUaGV5IGFyZSBiYXNlZCBv
biBwcmltaXRpdmVzIHVzaW5nIDY0LWJpdCBzaXplZCB2YWx1ZXMgYW55d2F5Lgo+PiAKPj4gUmln
aHQsIHRoYXQgd2FzIG15IHJlYWRpbmcgb2YgaXQgYXMgd2VsbCwgYnV0IGl0J3Mgbm90IGVudGly
ZWx5Cj4+IGNsZWFyIHdoZW4gdGhlIGZ1bmN0aW9uIG5hbWUgaXMgdGhlIHNhbWUgYXMgdGhlIG1u
ZW1vbmljIG9mIGFuCj4+IGluc3RydWN0aW9uIHRoYXQgb25seSBleGlzdHMgb24gbmV3ZXIgQ1BV
cyBhbmQgdGhlIGxhdGVyIHBhdGNoCj4KPiBUaGVyZSBpcyBubyBSRE1TUlEgaW5zdHJ1Y3Rpb24g
b24gYW55IHg4NiBDUFUuIEFyZSB5b3UgbWl4aW5nIHRoaXMgdXAgd2l0aAo+IFdSTVNSTlMvUkRN
U1IgdXNpbmcgYW4gaW1tZWRpYXRlIGZvciBhZGRyZXNzaW5nIHRoZSBNU1I/CgpZZXMsIEkgd2Fz
IGp1c3QgY29uZnVzZWQgYWJvdXQgdGhlIGV4YWN0IGRlZmluaXRpb24gaGVyZSBhbmQgYXNzdW1l
ZAp0aGUgc2luZ2xlLXJlZ2lzdGVyIG91dHB1dCB2ZXJzaW9uIHdhcyBhY3R1YWxseSBjYWxsZWQg
cmRtc3JxLgoKICAgICBBcm5kCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=

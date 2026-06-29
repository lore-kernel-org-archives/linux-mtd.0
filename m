Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E525C43458
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2026 06:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=XdoldAAPjoxFQVrv8uVQwTzDkCmJ0krBJ9UJg1AaNm0=; b=ayil392fenDn86Vce6wPgTvwEt
	4rOWYUwMHCS+KpBx2KFcYIEcLIMRbW/0LHtYcrapKOjUJpI1rKTjsPmkjnAN7Aw2vXMCUCAuf1TBM
	iBg0i4QZ8fcBYQ4FKfT3H2NJBX7/FkcHSvTSZiNG7ZWr4JB0ckO1VvHtpHxIbhn6mIE8FvGTUsozQ
	VsGfOW0Bk9Ab5nyRmYa3RPmADBu3T+kZYrsB2in9JZhXtO1aBGBH9/MuzAYsCvYkDWamtInRJNDwx
	zRis+/obj1ReHAi+Geli946ZIB0uzDMBb+QkXD+zi4Fe7PhmNb0FWpvjTK4he0oovf5HAuCqVTmoJ
	DsKHEboQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5rL-0000000DoQ6-1Eej;
	Mon, 29 Jun 2026 06:52:47 +0000
Received: from flow-a7-smtp.messagingengine.com ([103.168.172.142])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5rI-0000000DoON-2fXh;
	Mon, 29 Jun 2026 06:52:46 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.phl.internal (Postfix) with ESMTP id 8ADB1138013F;
	Mon, 29 Jun 2026 02:52:41 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Mon, 29 Jun 2026 02:52:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1782715961;
	 x=1782723161; bh=tOv4MTUTsrDaiEgHTG/NX+h1I0Ci3tUDRjXnSX8B8ZY=; b=
	moVeurPh2zmNrJzP8rbqUPqQIFGV1KR17RcUSPE3wJu/2S/XINfbBToo5f9RQh1/
	clf/45HkV8kiwjLDnKA0ZGB+xXs/LxQ97UYdGp3mAyhY1rMWfb2ut8ebDlQumP3M
	VdcxoT0cWYJThMe3tHYwBYuJA8gYjCl4dkRIsx+Q/6emrBa3QY8Idt3PtT6T4gzt
	pjXS/9QEWhZ2jfyda0VyMgxTDzLco04X3qt/vrJYJWvdC+PMyVwHCjEhVeOyJIAS
	gEH+rz/z5nLfxJeyVUnha0jbbsfFFgbhjlE2+BlgPqMCXL8vkYcgC6UiT7hGGY74
	xGTwwQphEUZ53wLPdY/lOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1782715961; x=
	1782723161; bh=tOv4MTUTsrDaiEgHTG/NX+h1I0Ci3tUDRjXnSX8B8ZY=; b=h
	B46Z3KrfXyr5c4NuJHJwRpFO3VNQg2XJYEDC6YUGKJUsEhIcM3CblEFDPTT7wsQg
	LH0S5A3tvITWrXHqFdF1EkeHZjTnuQT+pgHJLOdtZCOrRZh456xh3Sx0k+T+zXCp
	kNYUxD9xFRSmKJKTjyfm848VuBVywgSQdS0Y1730vc3RugkRsZPqt6GHmPUgFsPs
	4nONFFGrtMfsX7i/XMkZbKMKnAy+BEdiCfia6dBPn42W2/ZviCTsT6LG5Oj/ruof
	ficdFWVRuGB5I8j63MB1URziScDM3F1SM330Kw/lKTbew/mmDBQO8+P/9fMGp4QQ
	AUBT5DiFaGcisBboaL0uQ==
X-ME-Sender: <xms:NxZCaklUX7qMSFvSQI3f1it9KkLu2jpq-bfNhuZJai7DIcz_l7yaVw>
    <xme:NxZCaupMK91NnfDxBP2Jl6u4UEarGr4W4BjRkQiIO7vCuXpmdFgh7w7Ak6Ow7kDLB
    GwQtBq3A_KdmViF1Mt2hB3V4JkgKSjPIp_adeSQyOs0PGQS4AmZ4t8m>
X-ME-Proxy-Cause: dmFkZTGwOHixY05HMZ27iS84Skvde8o1DDsiwY6D60DzXWO2ZVrwdRrpSa8R1278jed1uY
    wlWCiz3tDrtZHQkvMp/MBP5v/ghF2ufPQuFtrtJ4F0wh9DtG/XVpt0pROqEThSmUEDgCf0
    eTVEoMiS68VQPXRPt6VCUkkecnFqx+ZBjUZbbdMDP3RsDcc++iQYtFCDsx7qN3zPyVD3xY
    9i6Bzl+AIdZTqf3H9PE4La2YJtJbmBtGNvfDerKjWxD0tIQdIxc4ff6CyIl+oAxSN3L67g
    IQoXuyz4qEo4Q1DYv/YVlijZQSf0JOEgla6HGT0QZP1hJCRQsFe920XNZ7JCBQqZpPrjbH
    Tnk4/qORnBMbT1wfL00kYIifWwvRfHEzwO8X4XjYvXGKPupOF+Aih7SyjMueufJZIiNJhm
    gk+r3F4ioudpLQgLl8s2Bai/sQm/lpFYJPWmS816rZo8N1I3fGaKF8vaCjnsPMfwksRvl0
    6Af/2BtixmkFEnOpg4axh9H+xCdn89MnkDhmnuoJzY/popvh/LfTLliWEeyDWOhpCgCE4O
    h18zdmDtHrrW/u8WZmRXrY3iQ3r0wTSENEm+dusuNb8xtIAhju1BiHn0naN+53TgzSbvzd
    yzmZYCi7ifaUifdFk2wMrmhMIjP1c9DeNzX5Xx4Sctv2yWtIBtVWa0+zIeZw
X-ME-Proxy: <xmx:NxZCavqymErkIRztjouBu-7V0slB3o25MfBbVM9KSCex8QOrTFeOZg>
    <xmx:NxZCan2DdzgvxbYRzX6pYCwK3xwrIk-cU2tFN57SqHbLubX7sFp6RQ>
    <xmx:NxZCaigvrzp3oRkZE6LwBiBQXYgj4l_X1hgb0NxTXofsjKmlb0-Pzg>
    <xmx:NxZCamzJNW0pQlTHLc_D5xB2Wj8XraMxhsaupP8Tsn_eAmCJi2chTA>
    <xmx:ORZCasPFEmYzO9oCU9bgbYUUKaJzQAtBQ2CkEcKsKYO_AOQRt9ou1Eza>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 54A63182007E; Mon, 29 Jun 2026 02:52:39 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ApSqBjiSqQZ-
Date: Mon, 29 Jun 2026 08:52:18 +0200
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
Message-Id: <d7c1db52-529a-43cc-ac7d-38b52627e8bc@app.fastmail.com>
In-Reply-To: <20260629060526.3638272-1-jgross@suse.com>
References: <20260629060526.3638272-1-jgross@suse.com>
Subject: Re: [PATCH 00/32] x86/msr: Drop 32-bit MSR interfaces
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_235245_161986_7608DF07 
X-CRM114-Status: GOOD (  18.28  )
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

T24gTW9uLCBKdW4gMjksIDIwMjYsIGF0IDA4OjA0LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IEZv
ciBhY2Nlc3NpbmcgdGhlIE1TUiByZWdpc3RlcnMgb24gdGhlIGxvY2FsIENQVSwgdGhlcmUgYXJl
IDIgdHlwZXMgb2YKPiBpbnRlcmZhY2VzOiB0aGUgIm1vZGVybiIgNjQtYml0IG9uZXMgKHJkbXNy
cSgpIGV0Yy4pIGFuZCB0aGUgMzItYml0Cj4gb25lcyAocmRtc3IoKSBldGMuKSB3aGljaCBhcmUg
dXNpbmcgdGhlIHVwcGVyIGFuZCBsb3dlciAzMi1iaXQgaGFsdmVzCj4gb2YgdGhlIDY0LWJpdCB3
aWRlIE1TUiByZWdpc3RlciB2YWx1ZXMuCj4KPiBUaGUgMzItYml0IGludGVyZmFjZXMgYXJlIG5v
dCBvcHRpbWFsIGZvciAzIHJlYXNvbnM6Cj4KPiAtIFRoZXkgYXJlIGJhc2VkIG9uIHByaW1pdGl2
ZXMgdXNpbmcgNjQtYml0IHNpemVkIHZhbHVlcyBhbnl3YXkuCj4KPiAtIE1vZGVybiB4ODYgQ1BV
cyBoYXZlIGFkZGVkIHN1cHBvcnQgZm9yIE1TUiBhY2Nlc3MgaW5zdHJ1Y3Rpb25zIHVzaW5nCj4g
ICBhbiBpbW1lZGlhdGUgdmFsdWUgaW5zdGVhZCBvZiBhIHJlZ2lzdGVyIGZvciBhZGRyZXNzaW5n
IHRoZSBNU1IsCj4gICB3aGlsZSB0aGUgdmFsdWUgaXMgaW4gYSA2NC1iaXQgcmVnaXN0ZXIuCj4K
PiAtIHJkbXNyKCkgaXMgYSBtYWNybyBzdG9yaW5nIHRoZSB1cHBlciBhbmQgbG93ZXIgMzItYml0
IGhhbHZlcyBpbgo+ICAgdmFyaWFibGVzIHNwZWNpZmllZCBhcyBtYWNybyBwYXJhbWV0ZXJzLiBU
aGlzIGlzIG9ic2N1cmluZyB2YXJpYWJsZQo+ICAgYXNzaWdubWVudCB0aHJvdWdoIGEgbWFjcm8u
IEFkZGl0aW9uYWxseSByZG1zcnEoKSBpcyBtaW1pY2tpbmcgdGhpcwo+ICAgcGF0dGVybiBieSBi
ZWluZyBhIG1hY3JvLCB0b28sIHdpdGggdGhlIHRhcmdldCB2YXJpYWJsZSBzcGVjaWZpZWQgYXMK
PiAgIGEgcGFyYW1ldGVyIGFzIHdlbGwuCj4KPiBGb3IgdGhvc2UgcmVhc29ucyBkcm9wIHRoZSAz
Mi1iaXQgaW50ZXJmYWNlcyBmb3IgYWNjZXNzaW5nIHRoZSB4ODYgTVNSCj4gcmVnaXN0ZXJzIGNv
bXBsZXRlbHkgYW5kIG9ubHkgdXNlIHRoZSA2NC1iaXQgdmFyaWFudHMuCgpIaSBKw7xyZ2VuLAoK
SSBhc3N1bWUgdGhpcyBpcyBmaW5lLCBidXQgc2luY2UgeW91IGRvbid0IG1lbnRpb24gaXQgZXhw
bGljaXRseSBoZXJlLApwbGVhc2UgY2xhcmlmeSB3aGF0IHRoaXMgbWVhbnMgZm9yIDMyLWJpdCBD
UFVzIHdpdGhvdXQgdGhlIHJkbXNycQppbnN0cnVjdGlvbi4gVGhvc2Ugd2lsbCBjb250aW51ZSB1
c2luZyB0aGUgc2FtZSBpbnN0cnVjdGlvbnMgYXMgYmVmb3JlCmFuZCBqdXN0IGNoYW5nZSB0aGUg
Y2FsbGluZyBjb252ZW50aW9ucywgcmlnaHQ/Cgo+IE5vdGUgdGhhdCBtb3N0IHBhdGNoZXMgb2Yg
dGhpcyBzZXJpZXMgYXJlIGluZGVwZW5kZW50IGZyb20gZWFjaCBvdGhlci4KPiBPbmx5IHRoZSBw
YXRjaGVzIHJlbW92aW5nIGEgc3BlY2lmaWMgaW50ZXJmYWNlIChwYXRjaGVzIDcsIDE1LCAyNiBh
bmQKPiAzMCkgYW5kIHRoZSBsYXN0IHR3byBwYXRjaGVzIG9mIHRoZSBzZXJpZXMgZGVwZW5kIG9u
IGFsbCBwcmV2aW91cwo+IHBhdGNoZXMuCgpJdCBsb29rcyBsaWtlIHlvdSBhcmUgdG91Y2hpbmcg
bW9zdCBmaWxlcyB0d2ljZSBvciBtb3JlIGhlcmUsIHRvCmZpcnN0IGNvbnZlcnQgZnJvbSByZG1z
ciB0byByZG1zcnEgYW5kIHRoZW4gdG8gY2hhbmdlIHRoZQp0d28tYXJndW1lbnQgcmRtc3JxKCkg
bWFjcm8gdG8gYSBzaW5nbGUtYXJndW1lbnQgaW5saW5lLiBJZiB5b3UKaW50cm9kdWNlIHRoZSBp
bmxpbmUgdmVyc2lvbiBvZiByZG1zcnEoKSBmaXJzdCwgeW91IHNob3VsZCBiZQphYmxlIHRvIHNr
aXAgdGhlIHNlY29uZCBzdGVwIChwYXRjaCAzMSkgYXMgdGhleSBjb3VsZCBiZSBhYmxlCnRvIGNv
ZXhpc3QuCgogICAgIEFybmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==

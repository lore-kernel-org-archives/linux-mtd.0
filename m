Return-Path: <SRS0=A4L3=E4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0871FC5519F
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Nov 2020 16:34:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A32E420781
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Nov 2020 16:34:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mCrku8R3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="StCMHC/H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A32E420781
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=362NvDanbpboF2aHTdyhRgcW0FlErA1LTbmhJ7fNcps=; b=mCrku8R30AiCrSU1Jcdi5K2WR
	6Wr5ljUz1Pu9ISjKyvkvfBiXeqi10bQKGspp6KERAmDStYTtR0roP9JSIJMrDkI3ppqzXDEyA6rl9
	ai2B7OiEj4uhUsnVcmB3PjU6S6B1YVOuF3IQSi37VeVAEWelEFv0T2jCWMpPFTb9ZMDZDJF6ElzUU
	R/HpD/5zEh5MN6SkJLB/nbirLEGRr/X+YtSaxhcgabHoTHmaX1ksRBxLvOLtxeP/9jvwKpSjYmUYD
	enGIkN/OmuRDdtPuRyxkjSR4x0ZE0zdw7w/EEt8Cm72DG0KSfT8BqjRnChooscec0RnG2NIjzL27d
	nKr2320Ew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgsIq-00082n-GL; Sun, 22 Nov 2020 16:33:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgsIn-00082R-A4
 for linux-mtd@lists.infradead.org; Sun, 22 Nov 2020 16:33:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606062804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eSFXaX0DZkpNbOwM/RCeF/BEd3n14fz/kurtk7pTmoY=;
 b=StCMHC/HyCDcHG808p/9thQCbNHLB97ek1T9oforhFojh55MW9LfrBZih5vkd7qgZ43dSF
 OZ3JOWRoVWjL7zUSFlP0LDpmoWD2sc3F8Zm34Dd/PaZ0RswUInINC4teeaarn0nRRR/QOI
 +dDEJjm8SJb3l7vs6UWTL1dZHykwyjY=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-nDOQsoa9PUuYfRHSDpfBuQ-1; Sun, 22 Nov 2020 11:33:22 -0500
X-MC-Unique: nDOQsoa9PUuYfRHSDpfBuQ-1
Received: by mail-qv1-f71.google.com with SMTP id e13so61674qvl.19
 for <linux-mtd@lists.infradead.org>; Sun, 22 Nov 2020 08:33:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=eSFXaX0DZkpNbOwM/RCeF/BEd3n14fz/kurtk7pTmoY=;
 b=KH6Kn05QxdPrYtzOZ2zkhlI+QGUyFfmFr+qY3KmvYddS67Fs2QjpemTXeiU+AL+fic
 TOlFkKhoaAe4CxiqLc1Og/cOabP8eYifgpyhMsisAMvZFFUFk4sRc4fx3/FwyThpSozd
 3nH87Q9lZyXoY+2OToWOVY9ezxsfQUKEKzqEQwY88yvFuR0BtdljWH2ajDlNLsKsSL2i
 1mDS0zedGnsmN4SPo3YF5VrMCIuNz82HbJ7p2CDvS+zJ0IeuBmTiB8BtD2OQ1qZGnFbu
 /PvqPuL/JojT4oEPRHO8nukjYUc14t2vmBjaRPGzY1wS+GFmsgXhYQ7BAkDQiqaFaBI3
 /bAw==
X-Gm-Message-State: AOAM5336be+E3qvSW74OhDijqU4bY8m8PA1gjjb6fVcyngllX7i3Vl8A
 LEn9wN14BnDuhvAooIY5ZWnoc/RgcvrS630d+MOiuCIopuN5woowwUOb+OXYsvbjVpBLNt05Zus
 zynFSZGnAAtmWlC6GVBAE6mFCSg==
X-Received: by 2002:a37:a783:: with SMTP id q125mr25815205qke.10.1606062801572; 
 Sun, 22 Nov 2020 08:33:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx2n++9V878KrbbQS+4X3uFT/lj12S/EG8yAhFKA6vFd9PzTR06otQkDsZPYmv5N+Hbwviu/A==
X-Received: by 2002:a37:a783:: with SMTP id q125mr25815168qke.10.1606062801138; 
 Sun, 22 Nov 2020 08:33:21 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id 9sm7113466qke.6.2020.11.22.08.33.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Nov 2020 08:33:20 -0800 (PST)
Subject: Re: [RFC] MAINTAINERS tag for cleanup robot
To: Joe Perches <joe@perches.com>, clang-built-linux@googlegroups.com
References: <20201121165058.1644182-1-trix@redhat.com>
 <2105f0c05e9eae8bee8e17dcc5314474b3c0bc73.camel@perches.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <6e8c1926-4209-8f10-d0f9-72c875a85a88@redhat.com>
Date: Sun, 22 Nov 2020 08:33:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <2105f0c05e9eae8bee8e17dcc5314474b3c0bc73.camel@perches.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201122_113325_410463_D0BDB1AB 
X-CRM114-Status: GOOD (  17.76  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-scsi@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 cluster-devel@redhat.com, linux-acpi@vger.kernel.org,
 tboot-devel@lists.sourceforge.net, coreteam@netfilter.org,
 xen-devel@lists.xenproject.org, MPT-FusionLinux.pdl@broadcom.com,
 linux-media@vger.kernel.org, alsa-devel@alsa-project.org,
 intel-gfx@lists.freedesktop.org, ecryptfs@vger.kernel.org,
 linux-omap@vger.kernel.org, devel@acpica.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, netfilter-devel@vger.kernel.org,
 linux-crypto@vger.kernel.org, patches@opensource.cirrus.com,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Ck9uIDExLzIxLzIwIDk6MTAgQU0sIEpvZSBQZXJjaGVzIHdyb3RlOgo+IE9uIFNhdCwgMjAyMC0x
MS0yMSBhdCAwODo1MCAtMDgwMCwgdHJpeEByZWRoYXQuY29tIHdyb3RlOgo+PiBBIGRpZmZpY3Vs
dCBwYXJ0IG9mIGF1dG9tYXRpbmcgY29tbWl0cyBpcyBjb21wb3NpbmcgdGhlIHN1YnN5c3RlbQo+
PiBwcmVhbWJsZSBpbiB0aGUgY29tbWl0IGxvZy4gIEZvciB0aGUgb25nb2luZyBlZmZvcnQgb2Yg
YSBmaXhlciBwcm9kdWNpbmcKPj4gb25lIG9yIHR3byBmaXhlcyBhIHJlbGVhc2UgdGhlIHVzZSBv
ZiAndHJlZXdpZGU6JyBkb2VzIG5vdCBzZWVtIGFwcHJvcHJpYXRlLgo+Pgo+PiBJdCB3b3VsZCBi
ZSBiZXR0ZXIgaWYgdGhlIG5vcm1hbCBwcmVmaXggd2FzIHVzZWQuICBVbmZvcnR1bmF0ZWx5IG5v
cm1hbCBpcwo+PiBub3QgY29uc2lzdGVudCBhY3Jvc3MgdGhlIHRyZWUuCj4+Cj4+IFNvIEkgYW0g
bG9va2luZyBmb3IgY29tbWVudHMgZm9yIGFkZGluZyBhIG5ldyB0YWcgdG8gdGhlIE1BSU5UQUlO
RVJTIGZpbGUKPj4KPj4gCUQ6IENvbW1pdCBzdWJzeXN0ZW0gcHJlZml4Cj4+Cj4+IGV4LyBmb3Ig
RlBHQSBERkwgRFJJVkVSUwo+Pgo+PiAJRDogZnBnYTogZGZsOgo+IEknbSBhbGwgZm9yIGl0LiAg
R29vZCBsdWNrIHdpdGggdGhlIGVmZm9ydC4gIEl0J3Mgbm90IGNvbXBsZXRlbHkgdHJpdmlhbC4K
Pgo+IEZyb20gYSBkZWNhZGUgYWdvOgo+Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8x
Mjg5OTE5MDc3LjI4NzQxLjUwLmNhbWVsQEpvZS1MYXB0b3AvCj4KPiAoYW5kIHRoYXQgdGhyZWFk
IHN0YXJ0ZWQgd2l0aCBleHRyYSBzZW1pY29sb24gcGF0Y2hlcyB0b28pCgpSZWFkaW5nIHRoZSBo
aXN0b3J5LCBob3cgYWJvdXQgdGhpcy4KCmdldF9tYXRhaW50YWluZXIucGwgb3V0cHV0cyBhIHNp
bmdsZSBwcmVmaXgsIGlmIG11bHRpcGxlIGZpbGVzIGhhdmUgdGhlIHNhbWUgcHJlZml4IGl0IHdv
cmtzLCBpZiB0aGV5IGRvbid0IGl0cyBhbiBlcnJvci4KCkFub3RoZXIgc2NyaXB0ICdjb21taXRf
b25lX2ZpbGUuc2gnIGRvZXMgdGhlIGNhbGwgdG8gZ2V0X21haW5haW50ZXIucGwgdG8gZ2V0IHRo
ZSBwcmVmaXggYW5kIGJlIGNhbGxlZCBieSBydW4tY2xhbmctdG9vbHMucHkgdG8gZ2V0IHRoZSBm
aXhlciBzcGVjaWZpYyBtZXNzYWdlLgoKRGVmZXIgbWluaW1pemluZyB0aGUgY29tbWl0cyBieSBj
b21iaW5pbmcgc2ltaWxhciBzdWJzeXN0ZW1zIHRpbGwgbGF0ZXIuCgpJbiBhIHN0ZWFkeSBzdGF0
ZSBjYXNlLCB0aGlzIHNob3VsZCBiZSB1bmNvbW1vbi4KCgo+Cj4+IENvbnRpbnVpbmcgd2l0aCBj
bGVhbmluZyB1cCBjbGFuZydzIC1XZXh0cmEtc2VtaS1zdG10Cj4+IGRpZmYgLS1naXQgYS9NYWtl
ZmlsZSBiL01ha2VmaWxlCj4gW10KPj4gQEAgLTE1NjcsMjAgKzE1NjcsMjEgQEAgaGVscDoKPj4g
wqAJIGVjaG8gICcnCj4+IMKgCUBlY2hvICAnU3RhdGljIGFuYWx5c2VyczonCj4+IMKgCUBlY2hv
ICAnICBjaGVja3N0YWNrICAgICAgLSBHZW5lcmF0ZSBhIGxpc3Qgb2Ygc3RhY2sgaG9ncycKPj4g
wqAJQGVjaG8gICcgIHZlcnNpb25jaGVjayAgICAtIFNhbml0eSBjaGVjayBvbiB2ZXJzaW9uLmgg
dXNhZ2UnCj4+IMKgCUBlY2hvICAnICBpbmNsdWRlY2hlY2sgICAgLSBDaGVjayBmb3IgZHVwbGlj
YXRlIGluY2x1ZGVkIGhlYWRlciBmaWxlcycKPj4gwqAJQGVjaG8gICcgIGV4cG9ydF9yZXBvcnQg
ICAtIExpc3QgdGhlIHVzYWdlcyBvZiBhbGwgZXhwb3J0ZWQgc3ltYm9scycKPj4gwqAJQGVjaG8g
ICcgIGhlYWRlcmRlcCAgICAgICAtIERldGVjdCBpbmNsdXNpb24gY3ljbGVzIGluIGhlYWRlcnMn
Cj4+IMKgCUBlY2hvICAnICBjb2NjaWNoZWNrICAgICAgLSBDaGVjayB3aXRoIENvY2NpbmVsbGUn
Cj4+IMKgCUBlY2hvICAnICBjbGFuZy1hbmFseXplciAgLSBDaGVjayB3aXRoIGNsYW5nIHN0YXRp
YyBhbmFseXplcicKPj4gwqAJQGVjaG8gICcgIGNsYW5nLXRpZHkgICAgICAtIENoZWNrIHdpdGgg
Y2xhbmctdGlkeScKPj4gKwlAZWNobyAgJyAgY2xhbmctdGlkeS1maXggIC0gQ2hlY2sgYW5kIGZp
eCB3aXRoIGNsYW5nLXRpZHknCj4gQSBwaXR5IHRoZSBvcmRlcmluZyBvZiB0aGUgY29kZSBiZWxv
dyBpc24ndCB0aGUgc2FtZSBhcyB0aGUgYWJvdmUuCgpUYWtlbiBjYXJlIHRoYW5rcyEKClRvbQoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=

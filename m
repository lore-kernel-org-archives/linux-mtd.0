Return-Path: <SRS0=A4L3=E4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,TRACKER_ID,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B77C5519F
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Nov 2020 16:12:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A0172076E
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Nov 2020 16:12:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A8PRy08O";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SMIkzqNz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A0172076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MNOiOJYjMdQu8+wgo60cbs37BJK7u7La7CJWVG5Vt64=; b=A8PRy08OqQqi2h4P4Uq6zLhpo
	0jFZr29MYBh5UWfs92LtAS3OsImHiljYilSog77fVc3wZIARjmg3Q3wX3HIzDgjBemliHHQVpzZub
	l64uXHtXI0LQ2/cDJ+SBL6P8hiZwabUV/E/rqJUdIxF8RrNM5XGeMJK1lYDjXLMLxRB0H/rgkA4Ml
	ya1C+pkeFdiQsXOC+GWjPsWiD8+4yJG64sWmC/WTCmBmF7f79qhqFHSHAGqPyS4WWlt/09LY8HJzf
	BUHVzrvNg2WaCMPPhnA+VwCOm7u8LIERoQVsBrq+0I73qZ4FKAexKLr8feQ4feJpMoAJ9NnaBFk+y
	J6E5TLOiQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgrxE-0006LN-Ts; Sun, 22 Nov 2020 16:11:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgrxA-0006Ku-UX
 for linux-mtd@lists.infradead.org; Sun, 22 Nov 2020 16:11:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606061464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D4o3+oRulyAmQWJaTM5GlynW0/tmbkOzx3PzhPB5iTg=;
 b=SMIkzqNzHUb1l7Fs05TnHXjOibbNmO7aExv7s9SoM7HL83Hl4Y4BQKFdSjdNN6aUJcUQNm
 KY0wlZf7UNa6xM/tuvQioY116jgpCnuPe+gbSnGzu1gbvH2cscIpFFIt4R9B7Ig8/FSeDe
 Jvd1MufkJJeF0mDHS4WxEPYq4GZEF2Y=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-h-JtP6P7Mxen5HSQbXw25Q-1; Sun, 22 Nov 2020 11:10:59 -0500
X-MC-Unique: h-JtP6P7Mxen5HSQbXw25Q-1
Received: by mail-qt1-f199.google.com with SMTP id 7so11656512qtw.23
 for <linux-mtd@lists.infradead.org>; Sun, 22 Nov 2020 08:10:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=D4o3+oRulyAmQWJaTM5GlynW0/tmbkOzx3PzhPB5iTg=;
 b=peZamgvIOXzEc9KW+PiqdGi9ox7Ax3AvpUlsm8jvs0UqYerCghpvWxkcsdLQkT/4kv
 mCP6Of03NbeWyM6i93Lxi0M20yvSEufsg8Q0qJuHXd3NxS5123KvqWRGVu/q+xYcE1oK
 8zpXec7vZlYBLXoqVcgouUFuOeRZ0/NHULxUldCfjs0OOVKV7sS+F+ToekRfk/3MAp4F
 CFMjJ8xpOK3ig57CBhCqXRgvYdjPbRKOtpZFxGS/CCBd4Dh0iyQ+M5jzUh9ptXdNRVTJ
 L49++nZRIg487wz9ACJNZFGj0sD0PImwNXfPc+1SaE0QT5ZMOc2kgPHNOpA+GanzaReU
 qLIA==
X-Gm-Message-State: AOAM532eVaYCv5FNEzxcN2LXZzcaE7v/DiYanhp+XPzOsGH6zKUvmuhS
 pUqQ1gSxohbreSGaxjZCxgBXT7zhR8EFJbZPqQFWH6Dj4l4naII2itDEZWbmcWcaIJRW+sxn+Dw
 9V4gOoQ2JS0xchLBH8WSC63idUg==
X-Received: by 2002:ac8:5a8c:: with SMTP id c12mr23364796qtc.97.1606061459262; 
 Sun, 22 Nov 2020 08:10:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw6JfmMkGlJyoaKx6ihYsYbDuDsWkyDwIosiC/apv5eylMrcIvHPxlHVgnFDCnun9WXh4UZ3w==
X-Received: by 2002:ac8:5a8c:: with SMTP id c12mr23364770qtc.97.1606061458997; 
 Sun, 22 Nov 2020 08:10:58 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id l3sm2779806qth.13.2020.11.22.08.10.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Nov 2020 08:10:58 -0800 (PST)
Subject: Re: [RFC] MAINTAINERS tag for cleanup robot
To: Matthew Wilcox <willy@infradead.org>
References: <20201121165058.1644182-1-trix@redhat.com>
 <20201122032304.GE4327@casper.infradead.org>
 <ddb08a27-3ca1-fb2e-d51f-4b471f1a56a3@redhat.com>
 <20201122145635.GG4327@casper.infradead.org>
From: Tom Rix <trix@redhat.com>
Message-ID: <0819ce06-c462-d4df-d3d9-14931dc5aefc@redhat.com>
Date: Sun, 22 Nov 2020 08:10:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201122145635.GG4327@casper.infradead.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201122_111105_084165_1D9FCF17 
X-CRM114-Status: GOOD (  15.72  )
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
 linux-scsi@vger.kernel.org, clang-built-linux@googlegroups.com,
 amd-gfx@lists.freedesktop.org, cluster-devel@redhat.com,
 linux-acpi@vger.kernel.org, tboot-devel@lists.sourceforge.net,
 coreteam@netfilter.org, xen-devel@lists.xenproject.org,
 MPT-FusionLinux.pdl@broadcom.com, linux-media@vger.kernel.org,
 alsa-devel@alsa-project.org, intel-gfx@lists.freedesktop.org,
 ecryptfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-omap@vger.kernel.org, devel@acpica.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, netfilter-devel@vger.kernel.org,
 linux-crypto@vger.kernel.org, patches@opensource.cirrus.com, joe@perches.com,
 bpf@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Ck9uIDExLzIyLzIwIDY6NTYgQU0sIE1hdHRoZXcgV2lsY294IHdyb3RlOgo+IE9uIFN1biwgTm92
IDIyLCAyMDIwIGF0IDA2OjQ2OjQ2QU0gLTA4MDAsIFRvbSBSaXggd3JvdGU6Cj4+IE9uIDExLzIx
LzIwIDc6MjMgUE0sIE1hdHRoZXcgV2lsY294IHdyb3RlOgo+Pj4gT24gU2F0LCBOb3YgMjEsIDIw
MjAgYXQgMDg6NTA6NThBTSAtMDgwMCwgdHJpeEByZWRoYXQuY29tIHdyb3RlOgo+Pj4+IFRoZSBm
aXhlciByZXZpZXcgaXMKPj4+PiBodHRwczovL3Jldmlld3MubGx2bS5vcmcvRDkxNzg5Cj4+Pj4K
Pj4+PiBBIHJ1biBvdmVyIGFsbHllc2NvbmZpZyBmb3IgeDg2XzY0IGZpbmRzIDYyIGlzc3Vlcywg
NSBhcmUgZmFsc2UgcG9zaXRpdmVzLgo+Pj4+IFRoZSBmYWxzZSBwb3NpdGl2ZXMgYXJlIGNhdXNl
ZCBieSBtYWNyb3MgcGFzc2VkIHRvIG90aGVyIG1hY3JvcyBhbmQgYnkKPj4+PiBzb21lIG1hY3Jv
IGV4cGFuc2lvbnMgdGhhdCBkaWQgbm90IGhhdmUgYW4gZXh0cmEgc2VtaWNvbG9uLgo+Pj4+Cj4+
Pj4gVGhpcyBjbGVhbnMgdXAgYWJvdXQgMSwwMDAgb2YgdGhlIGN1cnJlbnQgMTAsMDAwIC1XZXh0
cmEtc2VtaS1zdG10Cj4+Pj4gd2FybmluZ3MgaW4gbGludXgtbmV4dC4KPj4+IEFyZSBhbnkgb2Yg
dGhlbSBub3QgZmFsc2UtcG9zaXRpdmVzPyAgSXQncyBhbGwgdmVyeSB3ZWxsIHRvIGVuYWJsZQo+
Pj4gc3RyaWN0ZXIgd2FybmluZ3MsIGJ1dCBpZiB0aGV5IGRvbid0IGZpeCBhbnkgYnVncywgdGhl
eSdyZSBqdXN0IGNodXJuLgo+Pj4KPj4gV2hpbGUgZW5hYmxpbmcgYWRkaXRpb25hbCB3YXJuaW5n
cyBtYXkgYmUgYSBzaWRlIGVmZmVjdCBvZiB0aGlzIGVmZm9ydAo+Pgo+PiB0aGUgcHJpbWFyeSBn
b2FsIGlzIHRvIHNldCB1cCBhIGNsZWFuaW5nIHJvYm90LiBBZnRlciB0aGF0IGEgcmVmYWN0b3Jp
bmcgcm9ib3QuCj4gV2h5IGRvIHdlIG5lZWQgc3VjaCBhIHRoaW5nPyAgQWdhaW4sIGl0IHNvdW5k
cyBsaWtlIG1vcmUgY2h1cm4uCj4gSXQncyByZWFsbHkgYW5ub3lpbmcgd2hlbiBJJ20gd29ya2lu
ZyBvbiBzb21ldGhpbmcgaW1wb3J0YW50IHRoYXQgZ2V0cwo+IGRlcmFpbGVkIGJ5IHBvaW50bGVz
cyBjaHVybi4gIENodXJuIGFsc28gbWFrZXMgaXQgaGFyZGVyIHRvIGJhY2twb3J0Cj4gcGF0Y2hl
cyB0byBlYXJsaWVyIGtlcm5lbHMuCj4KQSByZWZhY3RvcmluZyBleGFtcGxlIG9uIG1vdmluZyB0
byB0cmVld2lkZSwgY29uc2lzdGVudCB1c2Ugb2YgYSBuZXcgYXBpIG1heSBoZWxwLgoKQ29uc2lk
ZXIKCjJlZmM0NTlkMDZmMTYzMDAwMWUzOTg0ODU0ODQ4YTU2NDcwODYyMzIKCnN5c2ZzOiBBZGQg
c3lzZnNfZW1pdCBhbmQgc3lzZnNfZW1pdF9hdCB0byBmb3JtYXQgc3lzZnMgb3V0cHV0CgpBIG5l
dyBhcGkgZm9yIHByaW50aW5nIGluIHRoZSBzeXNmcy7CoCBIb3cgZG8gd2UgdXNlIGl0IHRyZWV3
aWRlID8KCkRvbmUgbWFudWFsbHksIGl0IHdvdWxkIGJlIGEgaGVyb2ljIGVmZm9ydCByZXF1aXJp
bmcgaGlnaCBsZXZlbCBtYWludGFpbmVycyBwdXNoaW5nIGFuZCBsaWtlbHkgb25seSBnZXQgcGFy
dGlhbGx5IGRvbmUuCgpJZiBhIHJlZmFjdG9yaW5nIHByb2dyYW1hdGljIGZpeGl0IGlzIGRvbmUg
YW5kIHZhbGlkYXRlZCBvbiBhIG9uZSBzdWJzeXN0ZW0sIGl0IGNhbiBydW4gb24gYWxsIHRoZSBz
dWJzeXN0ZW1zLgoKVGhlIGVmZm9ydCBpcyBhIGNvdXBsZSBvZiB3ZWVrcyB0byB3cml0ZSBhbmQg
dmFsaWRhdGUgdGhlIGZpeGVyLCBob3VycyB0byBydW4gb3ZlciB0aGUgdHJlZS4KCkl0IHdvbid0
IGJlIHBlcmZlY3QgYnV0IHdpbGwgYmUgYmV0dGVyIHRoYW4gZG9pbmcgaXQgbWFudWFsbHkuCgpU
b20KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=

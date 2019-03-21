Return-Path: <SRS0=+wMu=RY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C324AC43381
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 07:55:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 911E6218B0
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 07:55:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ep6s+e3u";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="KRDQgFpY";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="PnVZL893"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 911E6218B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bdXd/Fm19NGiu0PnX8ELrdL4OytSGbP7p8j6cn6jLx4=; b=Ep6s+e3ueSJTMciT6Ngd2uh5R
	tnjer9h24Xtb3WW99epoYQjlODKCyjlIocKbZck55emf3CWRHbTvt//VbbSFXmz38MERbfNWZStab
	icT/1LNAZRCcldoqKvxBMD+gQZlLRKquqAtq0vdNvHGT46ncTqBKd/EROdziFClMyQcpkjQsuzZ/X
	iKCOZocQrbHjo6WTYTKX3FkOWTWFn61/vuetR0pOJ47PKlpkODXwWXRfix7NmZTyDbTxFVE+Er+Sy
	red1nXTI234+XfWK5K2uoo0skJgR/a2YNYmFqcYc2i1StxRKiae5Vg7vvOk7cot8hrNoKYiDLrn/V
	HuL6nd4mA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6sXi-0001wn-E7; Thu, 21 Mar 2019 07:55:14 +0000
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6sXb-00014r-VT
 for linux-mtd@lists.infradead.org; Thu, 21 Mar 2019 07:55:13 +0000
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 314D9608FC; Thu, 21 Mar 2019 07:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1553154907;
 bh=6HLZLXqAu+OAKx0tuTz/DZ4oCpkPVKbmwROnZg1VfXk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=KRDQgFpYsB3A5Tx0iOYsHv1te4pgAWUxFMn4rWhxz8GWXvgpFS2rXHv0oLAT1qjTZ
 LjAiMpTTTcHwJHQlZVgdtKBU6kU7OP8RdoR4b/mrME7vAhBkZomTtOqgWy220lnAih
 U2qCFs8+xS27+aK2ATESa+INacXW+lMKP9l5T/s4=
Received: from [10.79.163.157]
 (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: mojha@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 62BC4608FC;
 Thu, 21 Mar 2019 07:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1553154906;
 bh=6HLZLXqAu+OAKx0tuTz/DZ4oCpkPVKbmwROnZg1VfXk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=PnVZL893t+ixLUwW4luUHWSCkcCitXMUk8LmenhDESWp1q0HI9CdaUZdbxhy9EYju
 nvNFiB5MY3JYgx2AOYcDd2NUfOdTasWGq5ab1Gt2UHoOxzJKlWWzMzJbVviO4bBiYA
 4xSRTQ0P3Qiq2yIy57Vb16h6nVuwCmpvH0Ik9q4E=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 62BC4608FC
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none smtp.mailfrom=mojha@codeaurora.org
Subject: Re: [PATCH -next] ubifs: remove unused function __ubifs_shash_final
To: Richard Weinberger <richard@nod.at>
References: <20190320140955.11576-1-yuehaibing@huawei.com>
 <97289b81-ed73-002a-504d-2e82fad153e7@codeaurora.org>
 <2691086.gDEv9kBeKS@blindfold>
From: Mukesh Ojha <mojha@codeaurora.org>
Message-ID: <289f9994-0980-081e-f913-5729b16d16f4@codeaurora.org>
Date: Thu, 21 Mar 2019 13:24:55 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <2691086.gDEv9kBeKS@blindfold>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190321_005508_636941_5D4906DE 
X-CRM114-Status: GOOD (  12.24  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org, Yue Haibing <yuehaibing@huawei.com>,
 adrian.hunter@intel.com, linux-mtd@lists.infradead.org, dedekind1@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Ck9uIDMvMjEvMjAxOSAxOjQ4IEFNLCBSaWNoYXJkIFdlaW5iZXJnZXIgd3JvdGU6Cj4gQW0gTWl0
dHdvY2gsIDIwLiBNw6RyeiAyMDE5LCAyMTowNTozNyBDRVQgc2NocmllYiBNdWtlc2ggT2poYToK
Pj4gT24gMy8yMC8yMDE5IDc6MzkgUE0sIFl1ZSBIYWliaW5nIHdyb3RlOgo+Pj4gRnJvbTogWXVl
SGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPgo+Pj4KPj4+IFRoZXJlIGlzIG5vIGNhbGxl
cnMgaW4gdHJlZSwgYW5kIGNhbiBiZSByZW1vdmVkLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFl1
ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KPj4+IC0tLQo+Pj4gICAgZnMvdWJpZnMv
YXV0aC5jIHwgMTggLS0tLS0tLS0tLS0tLS0tLS0tCj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMTgg
ZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2ZzL3ViaWZzL2F1dGguYyBiL2ZzL3Vi
aWZzL2F1dGguYwo+Pj4gaW5kZXggNWJmNWZkMC4uMmE0MGNjY2UgMTAwNjQ0Cj4+PiAtLS0gYS9m
cy91Ymlmcy9hdXRoLmMKPj4+ICsrKyBiL2ZzL3ViaWZzL2F1dGguYwo+Pj4gQEAgLTE0NywyNCAr
MTQ3LDYgQEAgc3RydWN0IHNoYXNoX2Rlc2MgKl9fdWJpZnNfaGFzaF9nZXRfZGVzYyhjb25zdCBz
dHJ1Y3QgdWJpZnNfaW5mbyAqYykKPj4+ICAgIH0KPj4+ICAgIAo+Pj4gICAgLyoqCj4+PiAtICog
X191Ymlmc19zaGFzaF9maW5hbCAtIGZpbmFsaXplIHNoYXNoCj4+PiAtICogQGM6IFVCSUZTIGZp
bGUtc3lzdGVtIGRlc2NyaXB0aW9uIG9iamVjdAo+Pj4gLSAqIEBkZXNjOiB0aGUgZGVzY3JpcHRv
cgo+Pj4gLSAqIEBvdXQ6IHRoZSBvdXRwdXQgaGFzaAo+Pj4gLSAqCj4+PiAtICogU2ltcGxlIHdy
YXBwZXIgYXJvdW5kIGNyeXB0b19zaGFzaF9maW5hbCgpLCBzYWZlIHRvIGJlIGNhbGxlZCB3aXRo
Cj4+PiAtICogZGlzYWJsZWQgYXV0aGVudGljYXRpb24uCj4+PiAtICovCj4+PiAtaW50IF9fdWJp
ZnNfc2hhc2hfZmluYWwoY29uc3Qgc3RydWN0IHViaWZzX2luZm8gKmMsIHN0cnVjdCBzaGFzaF9k
ZXNjICpkZXNjLAo+Pj4gLQkJCXU4ICpvdXQpCj4+PiAtewo+Pj4gLQlpZiAodWJpZnNfYXV0aGVu
dGljYXRlZChjKSkKPj4+IC0JCXJldHVybiBjcnlwdG9fc2hhc2hfZmluYWwoZGVzYywgb3V0KTsK
Pj4+IC0KPj4+IC0JcmV0dXJuIDA7Cj4+PiAtfQo+Pj4gLQo+Pj4gLS8qKgo+Pj4gICAgICogdWJp
ZnNfYmFkX2hhc2ggLSBSZXBvcnQgaGFzaCBtaXNtYXRjaGVzCj4+PiAgICAgKiBAYzogVUJJRlMg
ZmlsZS1zeXN0ZW0gZGVzY3JpcHRpb24gb2JqZWN0Cj4+PiAgICAgKiBAbm9kZTogdGhlIG5vZGUK
Pj4KPj4KPj4gTG9va3MgZmluZSB0byBiZSByZW1vdmVkLgo+Pgo+PiBBY2tlZC1ieTogTXVrZXNo
IE9qaGEgPG1vamhhQGNvZGVhdXJvcmEub3JnPgo+IEkgZ3Vlc3MgeW91IG1lYW4gUmV2aWV3ZWQt
Ynk/CgpBcyBpIGFtIHVuc3VyZSBhYm91dCBmdXR1cmUgc2NvcGUgb2YgdGhpcyBmdW5jLiBpLmUg
d2h5IEFja2VkLgoKCi1NdWtlc2gKCgoKPgo+IFRoYW5rcywKPiAvL3JpY2hhcmQKPgo+Cj4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==

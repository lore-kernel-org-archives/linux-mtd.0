Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E71606A332
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2026 16:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sOxg2Hhd;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X0vb+QKs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RWITyAFkk4fX2Gi0UKTJLC+rfV+UtAVt9ILNfhixA/A=; b=sOxg2HhdMBG4k7xCVCUA4Ej4lE
	IOppPdOlVm3owcCPIm0Cc5d7Dds3M55p7SX6c2FvALtkJ4LP1BU2xREoxD8kCHU/skp/DGOvPYuZo
	omDM3kdAP4Hnd7eZxp7x5RN7E2mJ0oPpZc1wh9XwpMC0sHw/tDHDnWXnZIC3MzdaYwGBnFSsIw2XA
	9piA8RVtmZI87HFIscoskvUkRxVlUzbDpYXvOkSRKQosjMJ5U/UlyuFFmxNpnWXeAvPxGqCfcRs1K
	g65Jh5sGQPAmBG27MlbxvSV1UNzOOI4EPbVepMGaeroGyblnNOsy/Is7dfoWg3uQQvXJu8QzRGQPy
	ZWX5Xv8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpAz-0000000C5bo-0R70;
	Fri, 30 Oct 2026 16:09:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMpAx-0000000C5al-1jsQ
	for linux-mtd@lists.infradead.org;
	Fri, 30 Oct 2026 16:09:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C546402BA;
	Fri, 30 Oct 2026 16:09:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FFD41F00A17;
	Fri, 30 Oct 2026 16:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793376594;
	bh=G/NlFSnNcldx9naDXGStLPpiwmKvzlTeOOk/gge3EPI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X0vb+QKsc0IfCurUZLqL1bXCL4/R5byO7UPcHRV5QGGJsKwXncsM9RFyYBy3fzkXd
	 FdIt7I8/c4kyHBMyx+WzDD4cFvakaVRlfmo+h/MfUVXnPumegsa4GttpC83jrDvxx6
	 ZoxohkjJWLK01b6m8c43ZltgssPNu3ZQu8ZOVj7UOiWfUFzg58iw4UIruyslgfhirt
	 YbOnPd6ULjJJiF0dUJLE9TxPkv1KDrpr52th/qSGVq3gfYBkVJjLF0dt/mV0KhRjsk
	 zSHCKLTNZ6vYq1vhtPLSrNcc6x6TN3ldQwLcgkR8qx/xN0+ZAGwc6MYM+mWhG4c8r8
	 6E/+TaSxXOhVw==
Message-ID: <sashiko-outbox-191226@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/34] fat: don't set SB_RDONLY after filesystem
 errors
To: "Christian Brauner" <brauner@kernel.org>, "Jan Kara" <jack@suse.com>
Cc: "Al Viro" <viro@zeniv.linux.org.uk>, linux-ext4@vger.kernel.org, linux-mm@kvack.org, linux-efi@vger.kernel.org, linux-mtd@lists.infradead.org, dsterba@suse.cz, tytso@mit.edu, "Mark
 Fasheh" <mark@fasheh.com>, "Joel Becker" <jlbec@evilplan.org>, "Joseph Qi" <joseph.qi@linux.alibaba.com>
In-Reply-To: <20261029-work-fs-sb_rdonly-v2-7-2f44f64f0b66@kernel.org>
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
 <20261029-work-fs-sb_rdonly-v2-7-2f44f64f0b66@kernel.org>
Date: Fri, 30 Oct 2026 16:09:53 +0000
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIGZhdDogZmF0X3dyaXRl
X2lub2RlKCkgcmVmdXNhbCBvbiBlbWVyZ2VuY3kgcm8gY29ycnVwdHMgcGVuZGluZyBkaXIgZW50
cmllcwotLQoKY29tbWl0IDU3ZTA2YTk5YjU5Yzk0NWRmMzU2MjRkNTQzZjUxZjNjZGM3ODg5N2QK
QXV0aG9yOiBDaHJpc3RpYW4gQnJhdW5lciA8YnJhdW5lckBrZXJuZWwub3JnPgoKZmF0OiBkb24n
dCBzZXQgU0JfUkRPTkxZIGFmdGVyIGZpbGVzeXN0ZW0gZXJyb3JzCgpUaGlzIGNvbW1pdCByZXBs
YWNlcyBzZXR0aW5nIFNCX1JET05MWSBpbiBfX2ZhdF9mc19lcnJvcigpIGFmdGVyIFNCX0JPUk4g
d2l0aApzYl9zZXRfZW1lcmdlbmN5X3JvKCkgc28gdGhhdCB0aGF3X3N1cGVyKCkgZG9lcyBub3Qg
bGVhdmUgc193cml0ZXJzIGxvY2tlZCBpZgphbiBlcnJvciBvY2N1cnMgd2hpbGUgdGhlIGZpbGVz
eXN0ZW0gaXMgZnJvemVuLiBJdCBhbHNvIGFkZHMKc2JfZW1lcmdlbmN5X3JvKCkgY2hlY2tzIGFj
cm9zcyBGQVQgb3BlcmF0aW9ucyB0byByZWplY3QgZnVydGhlcgptb2RpZmljYXRpb25zLgoKPiBk
aWZmIC0tZ2l0IGEvZnMvZmF0L2lub2RlLmMgYi9mcy9mYXQvaW5vZGUuYwo+IGluZGV4IGQ4NWM4
ZmJkY2NhNDYuLmFmZDczZGM0YmE5YTggMTAwNjQ0Cj4gLS0tIGEvZnMvZmF0L2lub2RlLmMKPiAr
KysgYi9mcy9mYXQvaW5vZGUuYwoKWyAuLi4gXQoKPiBAQCAtOTU0LDYgKzk2Myw5IEBAIHN0YXRp
YyBpbnQgZmF0X3dyaXRlX2lub2RlKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCB3cml0ZWJh
Y2tfY29udHJvbCAqd2JjKQo+ICB7Cj4gIAlpbnQgZXJyOwo+ICAKPiArCWlmICh1bmxpa2VseShz
Yl9lbWVyZ2VuY3lfcm8oaW5vZGUtPmlfc2IpKSkKPiArCQlyZXR1cm4gLUVST0ZTOwo+ICsKPiAg
CWlmIChpbm9kZS0+aV9pbm8gPT0gTVNET1NfRlNJTkZPX0lOTykgewo+ICAJCXN0cnVjdCBzdXBl
cl9ibG9jayAqc2IgPSBpbm9kZS0+aV9zYjsKPiAgCj4gQEAgLTE5NDksNiArMTk2MSw5IEBAIGlu
dCBmYXRfZmx1c2hfaW5vZGVzKHN0cnVjdCBzdXBlcl9ibG9jayAqc2IsIHN0cnVjdCBpbm9kZSAq
aTEsIHN0cnVjdCBpbm9kZSAqaTIpCj4gIAkJcmV0ID0gd3JpdGViYWNrX2lub2RlKGkyKTsKPiAg
CWlmICghcmV0KQo+ICAJCXJldCA9IHN5bmNfYmxvY2tkZXZfbm93YWl0KHNiLT5zX2JkZXYpOwo+
ICsJLyogVGhlIGNoYW5nZSBpcyBkb25lLCBhbiBlcnJvciBtYWRlIHVzIHJlYWQtb25seSBpbiB0
aGUgbWVhbnRpbWUuICovCj4gKwlpZiAocmV0ID09IC1FUk9GUyAmJiBzYl9lbWVyZ2VuY3lfcm8o
c2IpKQo+ICsJCXJldCA9IDA7Cj4gIAlyZXR1cm4gcmV0Owo+ICB9Cj4gIEVYUE9SVF9TWU1CT0xf
R1BMKGZhdF9mbHVzaF9pbm9kZXMpOwoKW1NldmVyaXR5OiBIaWdoXQpDYW4gcmVqZWN0aW5nIGZh
dF93cml0ZV9pbm9kZSgpIHdoZW4gc2JfZW1lcmdlbmN5X3JvKCkgaXMgc2V0IGNvcnJ1cHQKb24t
ZGlzayBkaXJlY3RvcnkgZW50cmllcyB3aGVuIGRpcnR5IGJsb2NrIGRldmljZSBidWZmZXJfaGVh
ZHMgYXJlIHN0aWxsCmZsdXNoZWQgdG8gZGlzaz8KCkluIEZBVCwgYW4gaW5vZGUncyBzdGFydGlu
ZyBjbHVzdGVyIChpX2xvZ3N0YXJ0KSBhbmQgc2l6ZSAoaV9zaXplKSBhcmUgc3RvcmVkCmluc2lk
ZSBpdHMgbXNkb3NfZGlyX2VudHJ5IGluIHNiLT5zX2JkZXYgYnVmZmVyX2hlYWRzIGFuZCBhcmUg
b25seSB3cml0dGVuIHRvCnRoYXQgYnVmZmVyX2hlYWQgYnkgZmF0X3dyaXRlX2lub2RlKCkgLT4g
X19mYXRfd3JpdGVfaW5vZGUoKToKCiAgICByYXdfZW50cnkgPSAmKChzdHJ1Y3QgbXNkb3NfZGly
X2VudHJ5ICopIChiaC0+Yl9kYXRhKSlbb2Zmc2V0XTsKICAgIGlmIChTX0lTRElSKGlub2RlLT5p
X21vZGUpKQogICAgICAgIHJhd19lbnRyeS0+c2l6ZSA9IDA7CiAgICBlbHNlCiAgICAgICAgcmF3
X2VudHJ5LT5zaXplID0gY3B1X3RvX2xlMzIoaW5vZGUtPmlfc2l6ZSk7CiAgICByYXdfZW50cnkt
PmF0dHIgPSBmYXRfbWFrZV9hdHRycyhpbm9kZSk7CiAgICBmYXRfc2V0X3N0YXJ0KHJhd19lbnRy
eSwgTVNET1NfSShpbm9kZSktPmlfbG9nc3RhcnQpOwoKRHVyaW5nIHZmYXRfcmVuYW1lKCkgYW5k
IGRvX21zZG9zX3JlbmFtZSgpLCB2ZmF0X2FkZF9lbnRyeSgpIG9yCm1zZG9zX2FkZF9lbnRyeSgp
IGNyZWF0ZXMgdGhlIHRhcmdldCBkaXJlY3RvcnkgZW50cnkgaW4gbmV3X2RpcidzIGJ1ZmZlcl9o
ZWFkCndpdGggY2x1c3RlciA9IDAgYW5kIHNpemUgPSAwIGFuZCBtYXJrcyB0aGF0IGJ1ZmZlcl9o
ZWFkIGRpcnR5OgoKICAgIGVyciA9IG1zZG9zX2FkZF9lbnRyeShuZXdfZGlyLCBuZXdfbmFtZSwg
aXNfZGlyLCBpc19oaWQsIDAsCiAgICAgICAgICAgICAgICAgICZ0cywgJnNpbmZvKTsKICAgIGlm
IChlcnIpCiAgICAgICAgZ290byBvdXQ7CiAgICBuZXdfaV9wb3MgPSBzaW5mby5pX3BvczsKICAg
IC4uLgogICAgZmF0X2RldGFjaChvbGRfaW5vZGUpOwogICAgZmF0X2F0dGFjaChvbGRfaW5vZGUs
IG5ld19pX3Bvcyk7CiAgICAuLi4KICAgIG1hcmtfaW5vZGVfZGlydHkob2xkX2lub2RlKTsKICAg
IC4uLgogICAgZXJyID0gZmF0X3JlbW92ZV9lbnRyaWVzKG9sZF9kaXIsICZvbGRfc2luZm8pOwoK
U2ltaWxhcmx5LCB3aGVuIGEgbmV3bHkgY3JlYXRlZCBmaWxlIGFsbG9jYXRlcyBpdHMgZmlyc3Qg
Y2x1c3RlciBpbgpmYXRfY2hhaW5fYWRkKCkgYW5kIHVwZGF0ZXMgaV9zaXplIGluIGZhdF93cml0
ZV9lbmQoKSwgdGhlIEZBVCBhbmQgZGlyZWN0b3J5CmJ1ZmZlcl9oZWFkcyBhcmUgZGlydGllZCBp
biBzYi0+c19iZGV2IHdoaWxlIHRoZSBkaXJlY3RvcnkgZW50cnkgc3RpbGwgaGFzCnN0YXJ0ID0g
MCBhbmQgc2l6ZSA9IDAgdW50aWwgX19mYXRfd3JpdGVfaW5vZGUoKSB1cGRhdGVzIGl0LgoKSWYg
ZmF0X2ZzX2Vycm9yKCkgc2V0cyBzYl9lbWVyZ2VuY3lfcm8oc2IpIGVpdGhlciBkdXJpbmcgdGhl
IG9wZXJhdGlvbiAoZm9yCmV4YW1wbGUsIGZhdF9hZGRfZW50cmllcygpIGhpdHRpbmcgIk9kZCBk
aXJlY3Rvcnkgc2l6ZSIgb3IgZmF0X2NoYWluX2FkZCgpCmhpdHRpbmcgImNsdXN0ZXJzIGJhZGx5
IGNvbXB1dGVkIiwgYm90aCBvZiB3aGljaCBjYWxsIGZhdF9mc19lcnJvcigpIGFuZApzdGlsbCBy
ZXR1cm4gMCkgb3IgYmVmb3JlIGJhY2tncm91bmQgaW5vZGUgd3JpdGViYWNrIHJ1bnMsIGZhdF93
cml0ZV9pbm9kZSgpCndpbGwgbm93IHJldHVybiAtRVJPRlMgd2l0aG91dCB1cGRhdGluZyB0aGUg
ZGlyZWN0b3J5IGVudHJ5J3Mgc3RhcnQgY2x1c3RlcgphbmQgc2l6ZS4KCkhvd2V2ZXIsIHRoZSBk
aXJ0eSBkaXJlY3RvcnkgYW5kIEZBVCBidWZmZXJfaGVhZHMgaW4gc2ItPnNfYmRldiBhcmUgc3Rp
bGwKd3JpdHRlbiBvdXQgYnkgYmRldiB3cml0ZWJhY2ssIG1tYl9zeW5jKCkgaW4gZmF0X2V2aWN0
X2lub2RlKCksIGFuZApzeW5jX2Jsb2NrZGV2KCkgb24gdW5tb3VudC4gV291bGRuJ3QgdGhhdCBm
bHVzaCB0aGUgZGVsZXRlZCBvbGQgZGlyZWN0b3J5CmVudHJ5IGFsb25nIHdpdGggYSBuZXcgZGly
ZWN0b3J5IGVudHJ5IGNvbnRhaW5pbmcgc3RhcnQgPSAwIGFuZCBzaXplID0gMCwKbG9zaW5nIHRo
ZSBmaWxlIG9yIGRpcmVjdG9yeSBjb250ZW50cyBhbmQgb3JwaGFuaW5nIGl0cyBjbHVzdGVyIGNo
YWluPwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRj
aHNldC8yMDI2MTAyOS13b3JrLWZzLXNiX3Jkb25seS12Mi0wLTJmNDRmNjRmMGI2NkBrZXJuZWwu
b3JnP3BhcnQ9NwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K

Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC77606A32A
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Nov 2026 13:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AykNcFl7;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xxKNrnDU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xBpoRbFycIJjT2h/kwH4+h6jRjahV1lie0OUl8AgMlQ=; b=AykNcFl7YcO71CoJ1PbWx7HdfA
	8q2Xl5lCEXivw8uJrVg1B97AnCBPKPcvKILU0wI7CaMjvMCykO156+YXnaHgrVjmCToqtGO77VQ5J
	1b6PPOARGITGEmdq/Mx7KbemoCjQvyZfnT4qOa4ddzC6RcGTJuiAYH554NNaKZgVmZPbvqGgxjHYK
	gQHTd4Uf7s3Nx0Dsc+Fy5+vjjwR/hdO+11I7q5uPzyDkUHCBaHYcKLHoRP9t4WgSgChHY6w55qbHh
	BvjB+m0XUUzrWIA+hqzZehN/89FYwfASFTNRfZs1SXc4mQ3WCZ5h+rVlqZQetwoKInIOWfm7PG/wF
	taTm6mlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8of-00000006tNi-1oCl;
	Wed, 11 Nov 2026 13:56:45 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8ob-00000006tNJ-1R25
	for linux-mtd@lists.infradead.org;
	Wed, 11 Nov 2026 13:56:42 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so31716495e9.3
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 05:56:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794405399; cv=none;
        d=google.com; s=arc-20260327;
        b=XIRqemYjLZL7Ig6QJtXC1Dz/eo9kOrizwVkJHsp59f+tHBG+oauV/0i8VNVTPurKHD
         6XuKCFUo5swVObyz0Peamd5bGtUwKfMBxGhz2lFQGidCRABCkALrZNIOGW61Uc9f05Wf
         J75v8ATEhFzuBzl2dunoLhA3FBypF0H5/QxF3qSyfjkkP1VDb7o2oBW5fYuWGcPUL19i
         H6MsnSNOp2Mv34w2QVo5qAQa1KJsW9JeiszgAYtXtf9hgxl1z7BTP1QkgwpztK3WpxYk
         lR63FOooXwE3342gLPH21sf41zzNtCCnZub+PL48ak4BYszaDDFQhs7XAh8hcr/EgYba
         v56A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oRF2guphEyqLr1O9h9fq+s+FW78qBgZ0/k6wviHnruU=;
        fh=itVXWh7OG09mx3oJ1aCtzbSxKdXk51RFJBRkXMcf+Pg=;
        b=APQ+f38Yzv3IhF/Ukzo3plXB6baPkZGcE5Mf5OSuTphhiL2UYxfky0M5dWiSNer39J
         XnVwyWE8vnwuF1xmW7Pl9tUnt4pQEAJh8Ni3+Zle3quGwNu4tcqQErOdYPuqeIm0vui6
         eCZLhJsVSEBKk9DL8hZn7+QYO3p83sGhWOrixzCYOyBkEKBhLnbCfO78s2ZkqhifjJzz
         4DcKIVYGLtZPVR2KIQIaGj+rVDv9JymhHpMawLb2JYACqyptaunZeA5loonoWqqDvNZX
         97AXqtV29qidqXnlFIBhNxKZUgf2JazY/eeG+c3ycHZyuuuqZWFBCFQt2MUJGStWL/eg
         2oUg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794405399; x=1795010199; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oRF2guphEyqLr1O9h9fq+s+FW78qBgZ0/k6wviHnruU=;
        b=xxKNrnDU6HXo9tLd1C5cUqYGaVsil7DSZBKrlkR+86NQvm3H9pCE7D4Kslls5Vnlup
         ydmWMtfJrJbac+fRFWkEi2KElpNI1tWl0Iz/3UaM3XxtKfjcudTwb+nZ8ZYkJbnDAHaS
         ARJTo7vZn5zeyWbPFwPTfYfXQ6bcVEXsw3Ya/wLkk1+rv2FsYHuZdrUcpDHN++Ei/x+S
         z6SfL4DLQrPHIqTI16MNLdbQnYUoBGHvc7JX8hbYuRPIzgMhsn9RmSPL1xI0SQqQCuVv
         Kw9fffojF5mZVd9szU4ERcppszdjED+5ihn214DkjRwg8TLIETX1R348e87Lti9DQUEQ
         FU6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794405399; x=1795010199;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oRF2guphEyqLr1O9h9fq+s+FW78qBgZ0/k6wviHnruU=;
        b=klFSxRxVrNaOepzkG82jaOMxdvi9AqLP9jmcWR3O/c2FWCEB4qsFXuE+4bauf3FyQY
         jmMJxRmbjiWD1LQAKzpfu02X09FLCDlXDyqoNgBIRrNbWcEBAfN6DFE4sLeAJQIqkdax
         Xnj8j7IfDSTKj9Yu+fP+SY6RM0VGxGTpGPtIxHMxK8htbkk6yfHk+6OO3Vu0aC40cZuC
         QIPDDHNvdtMryiTd4u56NJjjP7JgPSJzWCnV1aigwsPo2/vvnhgFhFwrjmVV3BSLf4bG
         B/WmG9BZx4I8wzP3IHbRXW0K9x5ZskGkZA02ORHrG+yjSN8n1yLrddfep+gmVCjwXFSy
         Rm2g==
X-Forwarded-Encrypted: i=1; AL+hErHZCXntErDh9hruRiLsUOusrt3iSodEYdqTezcuJUMHlsKI+YyK8i3RMNel4cKphkSR4NSAGqcHHwg=@lists.infradead.org
X-Gm-Message-State: APuU4Z8XTUelUJvbyIac3PS1aRZpcDCrsLIq78hc4ZlOGTmSvZM9jb2e
	rQLJ3pWDgqJ4Iz/wZind8OL2YFDKIR2oEH2EXilSL4TP/vp7BmG6cI4Xgg18cLFjO8v0meZmi7l
	RXL87rRMSIQiTL9vLD5lQzjUeuREjeDM=
X-Gm-Gg: AYBFou17DLjsdo3o9sWl/yTdb50RczKrblvyE8sCnaFTiwuK62fzEpPsH8X0dOHj6fZ
	TpJzdnQP3bBOxlZqlAnKNKf6kG5COypuHy6TCRYvFt6JGrVBQHCpeJAIClMoHAlxTBsP+nsiQH+
	LybWyvxCJpuVsL3EEcsDG2cPKulaUNfEEKOUYqVhxuInzaX0zvkc3KDBgzt8qiRFs5ifyYKMLAQ
	9Ej9yRZg4ZN2s1hfW1eIm34GBPjXfPMbLZMkehdkIuNFrgBsv/8P7HQwhfFejTjIFkH9U9hYna4
	ZslNavm8AJNC00/xMKfXPtgmRExVWKqn7a5RevtKQUHxCU9aGjg4PANt7LEK8HqKvQxbHhq3sVY
	yaGc7Z/8QAifaTwJkmL6ADoeoWrWFN+zoArfkWS6QEFmzb+FcU5bl/scW/cg=
X-Received: by 2002:a05:600c:3485:b0:4a5:a5ca:de1d with SMTP id
 5b1f17b1804b1-4ba093a9321mr49991515e9.30.1794405398960; Wed, 11 Nov 2026
 05:56:38 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
 <20261029-work-fs-sb_rdonly-v2-6-2f44f64f0b66@kernel.org> <sashiko-outbox-191225@kernel.org>
 <CAKFNMombDWkJ=m+CjMy7qnd_yy-vZ9c-EE7R95HKKkcy-M0+SQ@mail.gmail.com> <20261110-deformation-knabe-geltung-3bb7600eaead@brauner>
In-Reply-To: <20261110-deformation-knabe-geltung-3bb7600eaead@brauner>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Wed, 11 Nov 2026 22:56:21 +0900
X-Gm-Features: AclHuK-kg_k64kD5D3ppXkSngFLDCk2NlJ0a-lNWh9VMpnIyjECtxc1ueGN5wqg
Message-ID: <CAKFNMomUbm3JUBy2GthZwAuFZWh5TSb7i0+g8u1qv1aRviqdaw@mail.gmail.com>
Subject: Re: [PATCH v2 06/34] nilfs2: don't set SB_RDONLY after filesystem errors
To: Christian Brauner <brauner@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, Jan Kara <jack@suse.com>, 
	Al Viro <viro@zeniv.linux.org.uk>, linux-ext4@vger.kernel.org, linux-mm@kvack.org, 
	linux-efi@vger.kernel.org, linux-mtd@lists.infradead.org, 
	Karl Mehltretter <kmehltretter@gmail.com>, dsterba@suse.cz, tytso@mit.edu, 
	Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
	Joseph Qi <joseph.qi@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_055641_428748_9D3B00B1 
X-CRM114-Status: GOOD (  20.80  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCBOb3YgMTEsIDIwMjYgYXQgNjo1NuKAr0FNIENocmlzdGlhbiBCcmF1bmVyIHdyb3Rl
Ogo+Cj4gT24gV2VkLCBOb3YgMDQsIDIwMjYgYXQgMDI6MzI6MTBBTSArMDkwMCwgUnl1c3VrZSBL
b25pc2hpIHdyb3RlOgo+ID4gU2FzaGlrbydzIHBvaW50IGhlcmUgaGFzIGEgdmFsaWQgYXNwZWN0
Lgo+ID4KPiA+IFRoaXMgaW5jb25zaXN0ZW5jeSBjYW4gYmUgcmVzb2x2ZWQgYnkgaW5zZXJ0aW5n
IHRoZSBmb2xsb3dpbmcgaGFuZGxpbmcKPiA+IGxvZ2ljIGlmIHNiX2VtZXJnZW5jeV9ybyhzKSBp
cyB0cnVlOgo+ID4KPiA+ICAgICAgICB9IGVsc2UgaWYgKCFjdHgtPmNubykgewo+ID4gICAgICAg
ICAgICAgICAgIGlmIChuaWxmc190cmVlX2lzX2J1c3kocy0+c19yb290KSkgewo+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgaWYgKHNiX2VtZXJnZW5jeV9ybyhzKSkgewo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBpZiAoIShmYy0+c2JfZmxhZ3MgJiBTQl9SRE9OTFkpKSB7
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZXJyID0gLUVST0ZT
Owo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gZmFpbGVk
X3N1cGVyOwo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9IGVsc2Ugewo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHMtPnNfZmxhZ3MgfD0gU0Jf
UkRPTkxZOwo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9Cj4KPiBNZWgsIEkn
ZCBub3Qgc2V0IFNCX1JET05MWSB0aGVyZS4gQmVjYXVzZSBpdCBjaGFuZ2VzIHRoZSByZWFkLW9u
bHkgc3RhdGUKPiBvdXRzaWRlIG9mIHJlY29uZmlndXJlX3N1cGVyKCkgd2hpY2ggaXMgcHJlY2lz
ZWx5IHdoYXQgdGhpcyBzZXJpZXMgZ2V0cwo+IHJpZCBvZi4KPgo+IFRoZSBzdXBlcmJsb2NrIGNh
biBiZSBmcm96ZW4gYXQgdGhhdCBwb2ludCwgZS5nLiwgd2hlbiB0aGUgZXJyb3IgaGl0Cj4gd2hp
bGUgaXQgd2FzIGZyb3plbiwgYW5kIHRoZW4gdGhhd19zdXBlcigpIGxlYXZlcyBzX3dyaXRlcnMg
bG9ja2VkIGFnYWluOgo+Cj4gICBtb3VudCAvZGV2L3NkYSAvbW50Cj4gICBmc2ZyZWV6ZSAtZiAv
bW50Cj4gICA8ZXJyb3I+ICAgICAgICAgICAgICAgICAgICAgICAtPiBzYl9zZXRfZW1lcmdlbmN5
X3JvKCkKPiAgIG1vdW50IC1vIHJvIC9kZXYvc2RhIC9tbnQyICAgIC0+IFNCX1JET05MWSBvbiB0
aGUgZnJvemVuIHN1cGVyYmxvY2sKPiAgIGZzZnJlZXplIC11IC9tbnQgICAgICAgICAgICAgIC0+
IHNfd3JpdGVycyBzdGF5IGxvY2tlZAo+Cj4gSXQgYWxzbyB0dXJucyB0aGUgc3VwZXJibG9jayBy
ZWFkLW9ubHkgdW5kZXJuZWF0aCB0aGUgZXhpc3RpbmcKPiByZWFkLXdyaXRlIG1vdW50IHdpdGhv
dXQgc2JfcHJlcGFyZV9yZW1vdW50X3JlYWRvbmx5KCkuCj4KPiBUaGUgYnVzeS10cmVlIGJyYW5j
aCBkb2VzIHdoYXQgZ2V0X3RyZWVfYmRldigpIGRvZXMgZm9yIGV2ZXJ5IG90aGVyCj4gYmxvY2sg
ZGV2aWNlIGZpbGVzeXN0ZW0uIEEgc2Vjb25kIHJlYWQtb25seSBtb3VudCBmYWlscyB3aXRoIEVC
VVNZIGFuZCBhCj4gc2Vjb25kIHJlYWQtd3JpdGUgbW91bnQgZ2V0cyB0aGUgc3VwZXJibG9jayBh
bmQgZXZlcnkgd3JpdGUgZmFpbHMgd2l0aAo+IEVST0ZTLiBUaGF0J3Mgd2hhdCBleHQ0IGRvZXMg
c2luY2UgY29tbWl0IGQzNDc2ZjNkYWQ0YSAoImV4dDQ6IGRvbid0IHNldAo+IFNCX1JET05MWSBh
ZnRlciBmaWxlc3lzdGVtIGVycm9ycyIpLgo+Cj4gSWYgd2Ugd2FudCB0aGUgc2Vjb25kIHJlYWQt
b25seSBtb3VudCB0byB3b3JrIEkgdGhpbmsgd2Ugc2hvdWxkIGRvIGl0Cj4gZm9yIGdldF90cmVl
X2JkZXYoKSBhbmQgbmlsZnMyIGFsaWtlIGFuZCB0cmVhdCB0aGUgZW1lcmdlbmN5IHN0YXRlIGFz
Cj4gcmVhZC1vbmx5IGluIHRoZSBjb21wYXJpc29uIHdpdGhvdXQgdG91Y2hpbmcgc19mbGFnczoK
Pgo+ICAgICAgICAgaWYgKChib29sKShmYy0+c2JfZmxhZ3MgJiBTQl9SRE9OTFkpICE9Cj4gICAg
ICAgICAgICAgKHNiX3Jkb25seShzKSB8fCBzYl9lbWVyZ2VuY3lfcm8ocykpKSB7Cj4KPiBCdXQg
SSdkIGRvIHRoYXQgb24gdG9wLgoKVGhhbmtzIGZvciB0aGUgZGV0YWlsZWQgZXhwbGFuYXRpb24g
YW5kIHRoZSBjb25jcmV0ZSBzY2VuYXJpbyB3aXRoCmZzZnJlZXplOyB0aGF0Cm1ha2VzIGNvbXBs
ZXRlIHNlbnNlLgoKV2hpbGUgdGhlICJzLT5zX2ZsYWdzIHw9IFNCX1JET05MWSIgYXNzaWdubWVu
dCBpbiBteSBleGFtcGxlIGNvdWxkIHNpbXBseSBiZQpkcm9wcGVkLCB5b3VyIGFwcHJvYWNoIG9m
IHRyZWF0aW5nIGl0IGRpcmVjdGx5IGluIHRoZSBjb21wYXJpc29uIGxvb2tzIGJldHRlcgphcyBp
dCBpcyBtb3JlIGNvbnNlcnZhdGl2ZSBhbmQgbmF0dXJhbC4KCkkgYWxzbyBhZ3JlZSB3aXRoIGFs
aWduaW5nIHRoaXMgc2Vjb25kYXJ5IG1vdW50IGJlaGF2aW9yIGFjcm9zcyBnZXRfdHJlZV9iZGV2
KCkKYW5kIG5pbGZzMiBhbGlrZSBpbiBhIHNlcGFyYXRlIGZvbGxvdy11cCBzZXJpZXMgb24gdG9w
LgoKU28sIEkgYW0gY29tcGxldGVseSBmaW5lIHdpdGgga2VlcGluZyB0aGUgY3VycmVudCB2MiBw
YXRjaCBhcy1pcyBmb3IgdGhpcyBwYXJ0LgoKVGhhbmtzLApSeXVzdWtlIEtvbmlzaGkKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==

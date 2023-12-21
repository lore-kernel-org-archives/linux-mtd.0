Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F14C35274
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Dec 2023 14:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mRsudtDdXrowovb90kZyWkvBa4nn3k7xmN2CqKHQjWo=; b=LXrmWRJjZrdxJJ
	70vgyBNOYd71bhXuX6lLUHugL6jERPV61hd2d7zCdAO+A5c385LcLAFpqvx5xOIviOvtASEmSUMFx
	Fzg0NlU4zRlqjSWLmtN7UwuJmOg6qH3RithvejgneuFNb0yePRZMpXh+NLGOyDmjPWPZKS3qJ3yt0
	a74/90zWq6sgRCp7qs2MpgfrtgBQfq/e4ed8pwumP7QB1cFvmH+UXKvIC1iiBB6KXD1KILh3oBK3j
	RomZagzvnxj1KWwoUb6k+97l4FVMgj0ZnJgh+uXN3/3xxoBm5T6O9UaCwUV9OhSEkO8eS0cHOoRHr
	4wf8X42TPaLJ5//0J0LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGKRo-003EKQ-0F;
	Thu, 21 Dec 2023 14:54:52 +0000
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGKRm-003EJd-04
	for linux-mtd@lists.infradead.org;
	Thu, 21 Dec 2023 14:54:51 +0000
Received: by mail-ua1-x933.google.com with SMTP id a1e0cc1a2514c-7cb598c6b24so311867241.0
        for <linux-mtd@lists.infradead.org>; Thu, 21 Dec 2023 06:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703170487; x=1703775287; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pURYtu0NLCnQlpjaLQBb3A9CXAcN65Ivjf7L8viYZIQ=;
        b=Arv2ccPtRPuU2z9VFbhClMhrLJjUBRWitIUkojNmZoDPyJd/uIAiwVDn/YfdLmg5fu
         3A1AD2XZwtJtRYAfJP8yrm9kOyvfxy8yqfwHGNCe8Pax4fS4W6NadZllzeYEIKv0vk9M
         +E+cBXkuLoOA8GblGJvFyKCSeUphtykfpISMXlq6xVL8DdpI8lsPb7MmiIIUMP9cyk5Q
         oMs5HVBoazIA1Nl/jGvLIUrLesyPj2CSFG5lQP20jvAgxqzPAgHcffizaHRW8dMtV/9L
         mypynWUx80EN51TAsitU8hIxbewnNq+3r/xNPccyan9JVws5I/hSF/DEDgxcqieygW8o
         HAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703170487; x=1703775287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pURYtu0NLCnQlpjaLQBb3A9CXAcN65Ivjf7L8viYZIQ=;
        b=INdr0EorFAUMW0CxG+9OG15EXKtk6V4vbJ9K1xeSDliPDqEfJuAf8jaLI1e0074D00
         8D41Y26w0sJj6DIR5A7MWHXJZZigoS6lA271rGGWd6mXwGp/l+zpYiIrbrkTnaGXuevF
         rJbQCu38Jo69RQq1gqKyTxf0JNy0QExwxRA0OFJpxN8bDJ4Mh3PFY/a6Z3N4PKeIWci9
         gyvtnbe7bGNnhO9lpNytpn875NvHtP/UBQLscUByy4L3Y3sEpz636UdfwdmtXlcXDoqQ
         9mbG8TXPVlmJjK0eGmgR3R5G9X6rLoyQFfCK4ChoTlbG70SeUiX4AzrwPd4UUPoa54hS
         vwxA==
X-Gm-Message-State: AOJu0YyzRplogtKTNBdSJDupWO0fTGSbc1Mfay8briWDv16idF1Ew+Gi
	3yQAxPvNDBNpxALzxVC3Xw8djyZT+Ng5nF7YA6E=
X-Google-Smtp-Source: AGHT+IFN1NuYgs8WiPh35+AiECRKwSlqz0ZEDe3FqBLZ5rzeC9cKopqWDVql1xxie4BTiSGNKZ2Qkn8RU8vM8AW8lKI=
X-Received: by 2002:a05:6102:2c19:b0:466:a0dd:4b2 with SMTP id
 ie25-20020a0561022c1900b00466a0dd04b2mr1276429vsb.51.1703170487175; Thu, 21
 Dec 2023 06:54:47 -0800 (PST)
MIME-Version: 1.0
References: <20231221085712.1766333-1-yukuai1@huaweicloud.com> <20231221085839.1768763-1-yukuai1@huaweicloud.com>
In-Reply-To: <20231221085839.1768763-1-yukuai1@huaweicloud.com>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Thu, 21 Dec 2023 23:54:30 +0900
Message-ID: <CAKFNMo=TuhzyEs_NEOdYgJz+UVizU6Ojx4ZKXowDaux3kKddUQ@mail.gmail.com>
Subject: Re: [PATCH RFC v3 for-6.8/block 12/17] nilfs2: use bdev api in nilfs_attach_log_writer()
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: axboe@kernel.dk, roger.pau@citrix.com, colyli@suse.de, 
	kent.overstreet@gmail.com, joern@lazybastard.org, miquel.raynal@bootlin.com, 
	richard@nod.at, vigneshr@ti.com, sth@linux.ibm.com, hoeppner@linux.ibm.com, 
	hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	jejb@linux.ibm.com, martin.petersen@oracle.com, clm@fb.com, 
	josef@toxicpanda.com, dsterba@suse.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, nico@fluxnic.net, xiang@kernel.org, chao@kernel.org, 
	tytso@mit.edu, adilger.kernel@dilger.ca, jack@suse.com, willy@infradead.org, 
	akpm@linux-foundation.org, hare@suse.de, p.raghav@samsung.com, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-bcachefs@vger.kernel.org, 
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org, 
	linux-nilfs@vger.kernel.org, yukuai3@huawei.com, yi.zhang@huawei.com, 
	yangerkun@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_065450_055897_7AAD9B89 
X-CRM114-Status: GOOD (  13.13  )
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

T24gVGh1LCBEZWMgMjEsIDIwMjMgYXQgNjowMOKAr1BNIFl1IEt1YWkgd3JvdGU6Cj4KPiBGcm9t
OiBZdSBLdWFpIDx5dWt1YWkzQGh1YXdlaS5jb20+Cj4KPiBBdm9pZCB0byBhY2Nlc3MgYmRfaW5v
ZGUgZGlyZWN0bHksIHByZXBhcmUgdG8gcmVtb3ZlIGJkX2lub2RlIGZyb20KPiBibG9ja19kZXZp
Y2UuCj4KPiBTaWduZWQtb2ZmLWJ5OiBZdSBLdWFpIDx5dWt1YWkzQGh1YXdlaS5jb20+Cj4gLS0t
Cj4gIGZzL25pbGZzMi9zZWdtZW50LmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2ZzL25pbGZzMi9zZWdtZW50
LmMgYi9mcy9uaWxmczIvc2VnbWVudC5jCj4gaW5kZXggNTVlMzFjYzkwM2QxLi5hMTEzMGUzODQ5
MzcgMTAwNjQ0Cj4gLS0tIGEvZnMvbmlsZnMyL3NlZ21lbnQuYwo+ICsrKyBiL2ZzL25pbGZzMi9z
ZWdtZW50LmMKPiBAQCAtMjgyMyw3ICsyODIzLDcgQEAgaW50IG5pbGZzX2F0dGFjaF9sb2dfd3Jp
dGVyKHN0cnVjdCBzdXBlcl9ibG9jayAqc2IsIHN0cnVjdCBuaWxmc19yb290ICpyb290KQo+ICAg
ICAgICAgaWYgKCFuaWxmcy0+bnNfd3JpdGVyKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVO
T01FTTsKPgo+IC0gICAgICAgaW5vZGVfYXR0YWNoX3diKG5pbGZzLT5uc19iZGV2LT5iZF9pbm9k
ZSwgTlVMTCk7Cj4gKyAgICAgICBiZGV2X2F0dGFjaF93YihuaWxmcy0+bnNfYmRldik7Cj4KPiAg
ICAgICAgIGVyciA9IG5pbGZzX3NlZ2N0b3Jfc3RhcnRfdGhyZWFkKG5pbGZzLT5uc193cml0ZXIp
Owo+ICAgICAgICAgaWYgKHVubGlrZWx5KGVycikpCj4gLS0KPiAyLjM5LjIKPgoKQWNrZWQtYnk6
IFJ5dXN1a2UgS29uaXNoaSA8a29uaXNoaS5yeXVzdWtlQGdtYWlsLmNvbT4KClRoYW5rcywKUnl1
c3VrZSBLb25pc2hpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=

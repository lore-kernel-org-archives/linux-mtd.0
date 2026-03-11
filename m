Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A61FD88D6
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2026 01:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=whl7BoOK6HDBNWMgb+mXUlnrK4BARkpKMlN/TXT0VQU=; b=z8cS79XuFBureZ
	/z/VZ8tgrG/kgvKfbQ34Wr8SfQ0SAvOKdoPyEN8YFigDp0qYmD/IZXtYvwK425QNQVnC94N1uS5Tp
	e36PRUmD5EF8os1lvZT6LB4zAd7A2FLgs6DWr95h3eeaLe65RSDhseqzG+Q/421NC0Z/zmU3xjrvW
	TXqoF1a7cbZbOoSs/tXKGjYLWQADdQjutv42VGrZSM48mb9O77exY49goTWBkEBlhc8plfe75w30g
	JbsQTqjqfc9CLtzP72Jaz3/o9VsPmhM0njR3VRqZNyiRbY70KYulaXo7SrBStFWRuKfIU22krH6hg
	ClKyCKPIRVE301Xg9NIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w08Hp-0000000AUUl-0GN7;
	Wed, 11 Mar 2026 01:22:57 +0000
Received: from mail-ej1-f42.google.com ([209.85.218.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w08Hm-0000000AUTw-3pYS
	for linux-mtd@lists.infradead.org;
	Wed, 11 Mar 2026 01:22:55 +0000
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b96dc65b886so78052066b.0
        for <linux-mtd@lists.infradead.org>; Tue, 10 Mar 2026 18:22:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773192172; x=1773796972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/oF/doq6oyWwDTCyW1l4hS1E5POtzgyvQYrb/7hmVZg=;
        b=ShjDC3lrI9m9RSfJNelR630/QzAQF+9rfILNnoqhj7TTlBFb14gta1hKi+IgJp4y0d
         SSjVm6liMbjqZi7LlahiH2nsxXjoqBnQLLNzfnML5sQgDS0Kys//Z15byH/p5h2XVhIk
         d5cMwK3y9LI+dBqT4i2XrevP7yw1DJkGiY929DmWkmBiXGr3xRt2Lle0eKf547jhSmb0
         uXh2Hf9pu+u8j+PcAHKO54s3h1CiKFWX1gbeUJQFN6iv3SZKqoWdr/pVDn5yQPQ4Z29w
         f9oaMDKtBKbOpeogtA3siwsZv+0K7jlcB94VIWJ+vk65QlDBJdDEQoIn06eVhwPnu6ac
         GAtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVe9vZ9LcSiXNphW8szWjYjph/DGyr9RJh3HXpqKA8SJqpOyCPP+HBvODEF9BvRDCEkp9QNgBLcJAE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzRIsHH0o23Jfcuh8sNzqs5M+4pOyMaR2hyHQ2tHL/6fsc+1CBO
	wyJsX1saiPx34wOzcwCXwbWdQSeT0CaeX/fB5O6rGF0cuHe3nKfx4G9yzt1/iBc9gJogYA==
X-Gm-Gg: ATEYQzyZId0cIJRej1MY+pOjW/2Ax25qb9JV3OOLRLL/N6B/69hw/7fxYJVpWlcna3R
	ufFLYPWLjx2dixISf13oIzmzd5v66S+G0cfrHJMAe96hnrsq5rUfz1WzfN3XMx9MjkXCD+puJR5
	2SA5iCFiQ2Lww/Uronb4dqNnyaEoKo2mIBq6ePjYLZZlgT6mMdkInpseV89MQnfEt3QAYOLdnYk
	c8bC8KIBvE0Aovg1mNruY7nVlWQ4EmnQL2oCDzF/nmFVEep1jMXMjcIoHV9xgmo2xXNdU/tnnWc
	9t5Y705noFxr+6r+Em4Vt0JvRbgUjgvPtaQOpC0KteMWgxcCwpLTYRaxYrUYYFVVTXhk3huC0ps
	zHEIXYWa/ZG9DqrUvpj2DPMD9P14AO392WNj0mnBYKwuK0tmtXw4RcbDybyi9HZd7EGitOde+O1
	wcscdulFkUXQEJnAdbsboinHXAWFMuLFVaXzrQX1Dc+qzpL3XlsA6jotU=
X-Received: by 2002:a17:907:c0f:b0:b8f:c684:db3f with SMTP id a640c23a62f3a-b97118b0cfamr319872066b.12.1773192172381;
        Tue, 10 Mar 2026 18:22:52 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972de08c80sm17973666b.12.2026.03.10.18.22.51
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 18:22:52 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b93698bb57aso77566166b.0
        for <linux-mtd@lists.infradead.org>; Tue, 10 Mar 2026 18:22:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVEk2dJGbTzb0RHqDK5TK3i41MtPORXPaW8ENLhdHtS6+MWgp1xk9hd4PwdDyFErfk3CWECalmEOP8=@lists.infradead.org
X-Received: by 2002:a5d:5d05:0:b0:439:bb46:7457 with SMTP id
 ffacd0b85a97d-439eff518c7mr10359487f8f.16.1773191708627; Tue, 10 Mar 2026
 18:15:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260309062840.2937858-2-iam@sung-woo.kim> <CADUfDZorSQCVtQyfjBuaziwG2Jo28yZiiqLKbp9PkFFw-9VgfQ@mail.gmail.com>
 <CAJNyHp+i3M_ko7rhgTz=nxP=MZYM3oQf3L-y=7YnhnRyeUxayA@mail.gmail.com> <CADUfDZppWyOOPME0eJbmO1q+qvehxGiCk8Zz_nVxaQk08aukFw@mail.gmail.com>
In-Reply-To: <CADUfDZppWyOOPME0eJbmO1q+qvehxGiCk8Zz_nVxaQk08aukFw@mail.gmail.com>
From: Sungwoo Kim <iam@sung-woo.kim>
Date: Tue, 10 Mar 2026 21:14:52 -0400
X-Gmail-Original-Message-ID: <CAJNyHpLU7sTJRtDqTbczTz0iayj-Nm8bPHrPaOcsKVb6nQyw1A@mail.gmail.com>
X-Gm-Features: AaiRm51cz7xo1V1erpi09gKFdY9TTILawmEFCzQE55oadwxdss7qBUImRUPZq3I
Message-ID: <CAJNyHpLU7sTJRtDqTbczTz0iayj-Nm8bPHrPaOcsKVb6nQyw1A@mail.gmail.com>
Subject: Re: [PATCH] blk-mq: nvme: Fix general protection fault in nvme_setup_descriptor_pools()
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>, 
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
	Mikulas Patocka <mpatocka@redhat.com>, dm-devel@lists.linux.dev, 
	Ulf Hansson <ulf.hansson@linaro.org>, Richard Weinberger <richard@nod.at>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, James Smart <james.smart@broadcom.com>, 
	Chaitanya Kulkarni <kch@nvidia.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Chao Shi <cshi008@fiu.edu>, 
	Weidong Zhu <weizhu@fiu.edu>, Dave Tian <daveti@purdue.edu>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nbd@other.debian.org, linux-mmc@vger.kernel.org, 
	linux-mtd@lists.infradead.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-nvme@lists.infradead.org, 
	linux-scsi@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_182254_957665_F4B58D2D 
X-CRM114-Status: GOOD (  22.29  )
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

T24gVHVlLCBNYXIgMTAsIDIwMjYgYXQgMTE6NTfigK9BTSBDYWxlYiBTYW5kZXIgTWF0ZW9zCjxj
c2FuZGVyQHB1cmVzdG9yYWdlLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIE1hciA5LCAyMDI2IGF0
IDQ6NTXigK9QTSBTdW5nd29vIEtpbSA8aWFtQHN1bmctd29vLmtpbT4gd3JvdGU6Cj4gPgo+ID4g
T24gTW9uLCBNYXIgOSwgMjAyNiBhdCAxMTozMeKAr0FNIENhbGViIFNhbmRlciBNYXRlb3MKPiA+
IDxjc2FuZGVyQHB1cmVzdG9yYWdlLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFN1biwgTWFy
IDgsIDIwMjYgYXQgMTE6MzDigK9QTSBTdW5nd29vIEtpbSA8aWFtQHN1bmctd29vLmtpbT4gd3Jv
dGU6Cj4gPiA+ID4KPiA+ID4gPiBUaGUgbnVtYV9ub2RlIGNhbiBiZSA8IDAgc2luY2UgTlVNQV9O
T19OT0RFID0gLTEuIEhvd2V2ZXIsCj4gPiA+ID4gc3RydWN0IGJsa19tcV9od19jdHh7fSBkZWZp
bmVzIG51bWFfbm9kZSBhcyB1bnNpZ25lZCBpbnQuIEFzIGEgcmVzdWx0LAo+ID4gPiA+IG51bWFf
bm9kZSBpcyBzZXQgdG8gVUlOVF9NQVggZm9yIE5VTUFfTk9fTk9ERSBpbiBibGtfbXFfYWxsb2Nf
aGN0eCgpLgo+ID4gPgo+ID4gPiBUaGUgbm9kZSBhcmd1bWVudCB0byBibGtfbXFfYWxsb2NfaGN0
eCgpIGNvbWVzIGZyb20KPiA+ID4gYmxrX21xX2FsbG9jX2FuZF9pbml0X2hjdHgoKSwgd2hpY2gg
aXMgY2FsbGVkIGJ5Cj4gPiA+IGJsa19tcV9hbGxvY19hbmRfaW5pdF9oY3R4KCkgd2l0aCBpbnQg
bm9kZSA9IGJsa19tcV9nZXRfaGN0eF9ub2RlKHNldCwKPiA+ID4gaSkuIG5vZGUgPSBOVU1BX05P
X05PREUgd291bGQgc3VnZ2VzdCB0aGF0IGJsa19tcV9od19xdWV1ZV90b19ub2RlKCkKPiA+ID4g
ZG9lc24ndCBmaW5kIGFueSBDUFUgYWZmaW5pdGl6ZWQgdG8gdGhlIHF1ZXVlLiBJcyB0aGF0IGV2
ZW4gcG9zc2libGU/Cj4gPgo+ID4gVGhhbmtzIGZvciB5b3VyIHJldmlldywgQ2VsZWIuCj4KPiBX
aGlsZSBJJ20gZmxhdHRlcmVkIHlvdSBjb25zaWRlciBtZSBhIGNlbGVicml0eSwgbXkgbmFtZSBp
cyBDYWxlYiA6KQoKTXkgYXBvbG9naWVzLCBDYWxlYi4gSSdsbCBiZSBtb3JlIGNhcmVmdWwuCgo+
Cj4gPgo+ID4gYmxrX21xX2h3X3F1ZXVlX3RvX25vZGUoKSBjYW4gcmV0dXJuIE5VTUFfTk9fTk9E
RSBpZiB0aGUgZGV2aWNlIHF1ZXVlcwo+ID4gZXhjZWVkIHRoZQo+ID4gbnVtYmVyIG9mIENQVXMu
IEFmdGVyd2FyZCwgaXQgaXMgYWRqdXN0ZWQgb24gdGhlIGNhbGxlciBzaWRlIHRvCj4gPiBudW1h
X25vZGUgPSBzZXQtPm51bWFfbm9kZS4KPgo+IEkgdGhvdWdodCB0aGUgTlZNZSBkcml2ZXIgY2Fw
cGVkIHRoZSBudW1iZXIgb2YgcXVldWVzIHNvIGV2ZXJ5IHF1ZXVlCj4gaXMgYWZmaW5pdGl6ZWQg
dG8gc29tZSBDUFUgKHNlZSBudm1lX21heF9pb19xdWV1ZXMoKSkuIFdoYXQgYW0gSQo+IG1pc3Np
bmc/Cj4KPiBCZXN0LAo+IENhbGViCgpZb3UgYXJlIHJpZ2h0LCBldmVyeSBodyBxdWV1ZSBzaG91
bGQgYmUgYWZmaW5pdGl6ZWQuIEl0IHNlZW1zIEknbQptaXNzaW5nIGEgbG90LiBJJ2xsIGxvb2sg
aW50byB0aGUgcmVhc29ucyBhbmQgZ2V0IGJhY2sgd2l0aCBWMi4KCkkgYXBwcmVjaWF0ZSB5b3Vy
IHJldmlldyBhZ2Fpbi4KClN1bmd3b28uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=

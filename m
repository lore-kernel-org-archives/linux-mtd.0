Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB62CC4332F
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Apr 2022 06:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MSeg5UFJwKEsskNGPapaWigQTbXb6ijq/tlUvz26M8Q=; b=Vhr9h3cGR6I/oO
	Ni/Gpq9LoDfc0wEXRkgpdF5r94QwRpROBrEiFOeg3tnCv1M3qro1ECTTK/F/cdCAgELCQL3wBqtmE
	2PUuE04P6WeHyDFrHOVJC4HnJUzaV27ACtQOxQvzTALkACrOon6w3YmTu+92BV14mnqfyGY1LglR0
	ZyFwIVeAj3v18sL2din+YnMQnmsHt029A/bT1YdKuRqIzCAz5TbfMMLeExeOaooC0HW2e3cPtgInh
	wCvRSBl1lR9wOYGfRhajP+OI8cAu3GLPI7PkqfBxXTjNOmDeU2F72qPqdBYlkERirfXthc5J0vsNp
	o52zVjfg6okkAwUBpUQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbyoG-003vZq-1I; Wed, 06 Apr 2022 06:06:28 +0000
Received: from 213-225-3-188.nat.highway.a1.net ([213.225.3.188]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbynL-003uoA-Rk; Wed, 06 Apr 2022 06:05:32 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: dm-devel@redhat.com, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-um@lists.infradead.org,
 linux-block@vger.kernel.org, drbd-dev@lists.linbit.com,
 nbd@other.debian.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, linux-raid@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 jfs-discussion@lists.sourceforge.net, linux-nilfs@vger.kernel.org,
 ntfs3@lists.linux.dev, ocfs2-devel@oss.oracle.com, linux-mm@kvack.org
Subject: [PATCH 03/27] target: fix discard alignment on partitions
Date: Wed,  6 Apr 2022 08:04:52 +0200
Message-Id: <20220406060516.409838-4-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220406060516.409838-1-hch@lst.de>
References: <20220406060516.409838-1-hch@lst.de>
MIME-Version: 1.0
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

VXNlIHRoZSBwcm9wZXIgYmRldl9kaXNjYXJkX2FsaWdubWVudCBoZWxwZXIgdGhhdCBhY2NvdW50
cyBmb3IgcGFydGl0aW9uCm9mZnNldHMuCgpG0ZZ4ZXM6IGM2NmFjOWRiOGQ0YSAoIltTQ1NJXSB0
YXJnZXQ6IEFkZCBMSU8gdGFyZ2V0IGNvcmUgdjQuMC4wLXJjNiIpClNpZ25lZC1vZmYtYnk6IENo
cmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgotLS0KIGRyaXZlcnMvdGFyZ2V0L3RhcmdldF9j
b3JlX2RldmljZS5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdGFyZ2V0L3RhcmdldF9jb3JlX2Rl
dmljZS5jIGIvZHJpdmVycy90YXJnZXQvdGFyZ2V0X2NvcmVfZGV2aWNlLmMKaW5kZXggM2ExZWM3
MDVjZDgwYi4uMTZlNzc1YmNmNGE3YyAxMDA2NDQKLS0tIGEvZHJpdmVycy90YXJnZXQvdGFyZ2V0
X2NvcmVfZGV2aWNlLmMKKysrIGIvZHJpdmVycy90YXJnZXQvdGFyZ2V0X2NvcmVfZGV2aWNlLmMK
QEAgLTg0OSw4ICs4NDksOCBAQCBib29sIHRhcmdldF9jb25maWd1cmVfdW5tYXBfZnJvbV9xdWV1
ZShzdHJ1Y3Qgc2VfZGV2X2F0dHJpYiAqYXR0cmliLAogCSAqLwogCWF0dHJpYi0+bWF4X3VubWFw
X2Jsb2NrX2Rlc2NfY291bnQgPSAxOwogCWF0dHJpYi0+dW5tYXBfZ3JhbnVsYXJpdHkgPSBxLT5s
aW1pdHMuZGlzY2FyZF9ncmFudWxhcml0eSAvIGJsb2NrX3NpemU7Ci0JYXR0cmliLT51bm1hcF9n
cmFudWxhcml0eV9hbGlnbm1lbnQgPSBxLT5saW1pdHMuZGlzY2FyZF9hbGlnbm1lbnQgLwotCQkJ
CQkJCQlibG9ja19zaXplOworCWF0dHJpYi0+dW5tYXBfZ3JhbnVsYXJpdHlfYWxpZ25tZW50ID0K
KwkJYmRldl9kaXNjYXJkX2FsaWdubWVudChiZGV2KSAvIGJsb2NrX3NpemU7CiAJcmV0dXJuIHRy
dWU7CiB9CiBFWFBPUlRfU1lNQk9MKHRhcmdldF9jb25maWd1cmVfdW5tYXBfZnJvbV9xdWV1ZSk7
Ci0tIAoyLjMwLjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=

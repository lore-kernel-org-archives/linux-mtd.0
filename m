Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 575FDC4167D
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Apr 2022 04:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m+hj0pTxz10uvSuWS8je2OeyDlJTKOFhT2fL99xXmGc=; b=jPSHFcyqdGyyxL
	0mybryx+Isjl6GxdeQljddnANUad3dMXdj67tmSauIxnScy8xAzsZliIUqaPhS8UMtejb5xaxyRDL
	O99U0N7THv5IhsHxPWX+xmNZlRUQDYkWnzLy8oc0CPi5wqcqbmp7DLP++jcB0+AdoJrCpjm/XhxUl
	7gi2+bHUMwviV0g+SjtkW2MW8dg3fsA5p2nB+tdlF2SLCkvXXR55NbgVFTSHaS/gVLKZYodUbR/iQ
	mbAAgR1QwwwNr5H56fOzqUPQkoqgp6e5EHoVIV8E/5UTky2sb1vjZT6fWog8JaU2LW+dGVkxnZibf
	ukCXfU+9XL1NqN2sFXuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nd36w-002365-DQ; Sat, 09 Apr 2022 04:54:10 +0000
Received: from 213-147-167-116.nat.highway.webapn.at ([213.147.167.116]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nd33w-0020Yw-4P; Sat, 09 Apr 2022 04:51:04 +0000
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
 ntfs3@lists.linux.dev, ocfs2-devel@oss.oracle.com, linux-mm@kvack.org,
 =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
Subject: [PATCH 05/27] drbd: use bdev based limit helpers in drbd_send_sizes
Date: Sat,  9 Apr 2022 06:50:21 +0200
Message-Id: <20220409045043.23593-6-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220409045043.23593-1-hch@lst.de>
References: <20220409045043.23593-1-hch@lst.de>
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

VXNlIHRoZSBiZGV2IGJhc2VkIGxpbWl0cyBoZWxwZXJzIHdoZXJlIHRoZXkgZXhpc3QuCgpTaWdu
ZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KQWNrZWQtYnk6IENocmlz
dG9waCBCw7ZobXdhbGRlciA8Y2hyaXN0b3BoLmJvZWhtd2FsZGVyQGxpbmJpdC5jb20+Ci0tLQog
ZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbWFpbi5jIHwgMTIgKysrKysrKy0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvYmxvY2svZHJiZC9kcmJkX21haW4uYyBiL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX21h
aW4uYwppbmRleCAxMjYyZmUxYzMzNjE4Li5hYTJjMjFhZWI3NDdjIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2Jsb2NrL2RyYmQvZHJiZF9tYWluLmMKKysrIGIvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRf
bWFpbi5jCkBAIC05MjQsNyArOTI0LDkgQEAgaW50IGRyYmRfc2VuZF9zaXplcyhzdHJ1Y3QgZHJi
ZF9wZWVyX2RldmljZSAqcGVlcl9kZXZpY2UsIGludCB0cmlnZ2VyX3JlcGx5LCBlbnUKIAogCW1l
bXNldChwLCAwLCBwYWNrZXRfc2l6ZSk7CiAJaWYgKGdldF9sZGV2X2lmX3N0YXRlKGRldmljZSwg
RF9ORUdPVElBVElORykpIHsKLQkJc3RydWN0IHJlcXVlc3RfcXVldWUgKnEgPSBiZGV2X2dldF9x
dWV1ZShkZXZpY2UtPmxkZXYtPmJhY2tpbmdfYmRldik7CisJCXN0cnVjdCBibG9ja19kZXZpY2Ug
KmJkZXYgPSBkZXZpY2UtPmxkZXYtPmJhY2tpbmdfYmRldjsKKwkJc3RydWN0IHJlcXVlc3RfcXVl
dWUgKnEgPSBiZGV2X2dldF9xdWV1ZShiZGV2KTsKKwogCQlkX3NpemUgPSBkcmJkX2dldF9tYXhf
Y2FwYWNpdHkoZGV2aWNlLT5sZGV2KTsKIAkJcmN1X3JlYWRfbG9jaygpOwogCQl1X3NpemUgPSBy
Y3VfZGVyZWZlcmVuY2UoZGV2aWNlLT5sZGV2LT5kaXNrX2NvbmYpLT5kaXNrX3NpemU7CkBAIC05
MzMsMTMgKzkzNSwxMyBAQCBpbnQgZHJiZF9zZW5kX3NpemVzKHN0cnVjdCBkcmJkX3BlZXJfZGV2
aWNlICpwZWVyX2RldmljZSwgaW50IHRyaWdnZXJfcmVwbHksIGVudQogCQltYXhfYmlvX3NpemUg
PSBxdWV1ZV9tYXhfaHdfc2VjdG9ycyhxKSA8PCA5OwogCQltYXhfYmlvX3NpemUgPSBtaW4obWF4
X2Jpb19zaXplLCBEUkJEX01BWF9CSU9fU0laRSk7CiAJCXAtPnFsaW0tPnBoeXNpY2FsX2Jsb2Nr
X3NpemUgPQotCQkJY3B1X3RvX2JlMzIocXVldWVfcGh5c2ljYWxfYmxvY2tfc2l6ZShxKSk7CisJ
CQljcHVfdG9fYmUzMihiZGV2X3BoeXNpY2FsX2Jsb2NrX3NpemUoYmRldikpOwogCQlwLT5xbGlt
LT5sb2dpY2FsX2Jsb2NrX3NpemUgPQotCQkJY3B1X3RvX2JlMzIocXVldWVfbG9naWNhbF9ibG9j
a19zaXplKHEpKTsKKwkJCWNwdV90b19iZTMyKGJkZXZfbG9naWNhbF9ibG9ja19zaXplKGJkZXYp
KTsKIAkJcC0+cWxpbS0+YWxpZ25tZW50X29mZnNldCA9CiAJCQljcHVfdG9fYmUzMihxdWV1ZV9h
bGlnbm1lbnRfb2Zmc2V0KHEpKTsKLQkJcC0+cWxpbS0+aW9fbWluID0gY3B1X3RvX2JlMzIocXVl
dWVfaW9fbWluKHEpKTsKLQkJcC0+cWxpbS0+aW9fb3B0ID0gY3B1X3RvX2JlMzIocXVldWVfaW9f
b3B0KHEpKTsKKwkJcC0+cWxpbS0+aW9fbWluID0gY3B1X3RvX2JlMzIoYmRldl9pb19taW4oYmRl
dikpOworCQlwLT5xbGltLT5pb19vcHQgPSBjcHVfdG9fYmUzMihiZGV2X2lvX29wdChiZGV2KSk7
CiAJCXAtPnFsaW0tPmRpc2NhcmRfZW5hYmxlZCA9IGJsa19xdWV1ZV9kaXNjYXJkKHEpOwogCQlw
dXRfbGRldihkZXZpY2UpOwogCX0gZWxzZSB7Ci0tIAoyLjMwLjIKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=

Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71894D11182
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Nov 2024 17:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m4ebGp+NVYAmxuWWNELRp3dMwoAtbZqSN+AT2A3iLP0=; b=Y0R+oZQjyC0KFI
	FF3EJDwIX7C1cWrw5ngCdwSF39BLZsB1gRU9TnMOT2qA1Jmgc8NHZOL1cFeHTNx6vSRd3bpKUCWIs
	AxBkc13deH5+1MgjMc+xCDquG8RF4UfNmKRrApO1lLvdgMW1GrPjHKq3BYbdBDeZdzcqPhYOh5njr
	GLu8P6aWRLfeLOt0970cb24b4Vl/MT/G20baGLdje0BdlpaL3tnKgUph0HoFKvkrtuSi923Af2fqI
	kvp/rXByzuh87T2iE5p11sk3R4GcFAKydsekLfdi85Pm07mGEn5azCa22MnhucDt+3dhMUax9+ojT
	bd7ISMw8qQt9pyubyOGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7e23-0000000BklQ-0nCY;
	Sun, 03 Nov 2024 17:04:55 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7e1t-0000000BkbQ-0OgH
	for linux-mtd@lists.infradead.org;
	Sun, 03 Nov 2024 17:04:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1730653481;
	bh=GMdVqpFwoDETa/zGkV60zA/YyucohMN7ciiORB0dDFM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SyRnyZMYYiuvS05pAbdP2BNw8Ha3Wp0EjLxI/8VZebe+J32OJzQ0FfngSr11pbc3S
	 3hLaAVDffCbL3wYrk/f1ofcjd6D+cxYnSPaa7E742CRmKRTph9QuWBX2pSm+y7iW5V
	 1DVHDyNnW5ZmICuH8Tv9nJe+/D6n4jWkebWhVEBk=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 03 Nov 2024 17:03:37 +0000
Subject: [PATCH v2 08/10] sysfs: implement all BIN_ATTR_* macros in terms
 of __BIN_ATTR()
MIME-Version: 1.0
Message-Id: <20241103-sysfs-const-bin_attr-v2-8-71110628844c@weissschuh.net>
References: <20241103-sysfs-const-bin_attr-v2-0-71110628844c@weissschuh.net>
In-Reply-To: <20241103-sysfs-const-bin_attr-v2-0-71110628844c@weissschuh.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Davidlohr Bueso <dave@stgolabs.net>, 
 Jonathan Cameron <jonathan.cameron@huawei.com>, 
 Dave Jiang <dave.jiang@intel.com>, 
 Alison Schofield <alison.schofield@intel.com>, 
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>, 
 Carlos Bilbao <carlos.bilbao.osdev@gmail.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 "David E. Box" <david.e.box@linux.intel.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Matt Turner <mattst88@gmail.com>, Frederic Barrat <fbarrat@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Logan Gunthorpe <logang@deltatee.com>, 
 "K. Y. Srinivasan" <kys@microsoft.com>, 
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
 Dexuan Cui <decui@microsoft.com>
Cc: Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-cxl@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-rdma@vger.kernel.org, linux-mtd@lists.infradead.org, 
 platform-driver-x86@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-hyperv@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730653468; l=2547;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=GMdVqpFwoDETa/zGkV60zA/YyucohMN7ciiORB0dDFM=;
 b=G1PulaFbJ1PZH7AnZk220ddkyci6/SVWNb+Rtvwc4kmmjYqzz3Epr6UCHfWP8qbRyhd/TurKs
 If4brtJxns8CxxC6suNmBgy57hhP6OtLmxJDPf6RSsE1N5AsLzcns6R
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_090445_320688_A04F3792 
X-CRM114-Status: UNSURE (   9.21  )
X-CRM114-Notice: Please train this message.
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

VGhlIHByZXBhcmF0aW9ucyBmb3IgdGhlIHVwY29taW5nIGNvbnN0aWZpY2F0aW9uIG9mIHN0cnVj
dCBiaW5fYXR0cmlidXRlCnJlcXVpcmVzIHNvbWUgbG9naWMgaW4gdGhlIHN0cnVjdHVyZSBkZWZp
bml0aW9uIG1hY3Jvcy4KVG8gYXZvaWQgZHVwbGljYXRpb24gb2YgdGhhdCBsb2dpYyBpbiBtdWx0
aXBsZSBtYWNyb3MsIHJlaW1wbGVtZW50IGFsbApvdGhlciBtYWNyb3MgaW4gdGVybXMgb2YgX19C
SU5fQVRUUigpLgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFdlacOfc2NodWggPGxpbnV4QHdlaXNz
c2NodWgubmV0PgotLS0KIGluY2x1ZGUvbGludXgvc3lzZnMuaCB8IDI3ICsrKysrKysrLS0tLS0t
LS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9zeXNmcy5oIGIvaW5jbHVkZS9saW51
eC9zeXNmcy5oCmluZGV4IGNiMmE1ZTI3N2MyMzg0ZjJlOGFkZDhmYmYyOTA3ZThhODE5NTc2ZWMu
LmQxN2M0NzNjMWVmMjkyODc1NDc1YmYzYmRmNjJkMDcyNDFjMTM4ODIgMTAwNjQ0Ci0tLSBhL2lu
Y2x1ZGUvbGludXgvc3lzZnMuaAorKysgYi9pbmNsdWRlL2xpbnV4L3N5c2ZzLmgKQEAgLTMzMywx
NyArMzMzLDExIEBAIHN0cnVjdCBiaW5fYXR0cmlidXRlIHsKIAkuc2l6ZQk9IF9zaXplLAkJCQkJ
CVwKIH0KIAotI2RlZmluZSBfX0JJTl9BVFRSX1JPKF9uYW1lLCBfc2l6ZSkgewkJCQkJXAotCS5h
dHRyCT0geyAubmFtZSA9IF9fc3RyaW5naWZ5KF9uYW1lKSwgLm1vZGUgPSAwNDQ0IH0sCQlcCi0J
LnJlYWQJPSBfbmFtZSMjX3JlYWQsCQkJCQkJXAotCS5zaXplCT0gX3NpemUsCQkJCQkJXAotfQor
I2RlZmluZSBfX0JJTl9BVFRSX1JPKF9uYW1lLCBfc2l6ZSkJCQkJCVwKKwlfX0JJTl9BVFRSKF9u
YW1lLCAwNDQ0LCBfbmFtZSMjX3JlYWQsIE5VTEwsIF9zaXplKQogCi0jZGVmaW5lIF9fQklOX0FU
VFJfV08oX25hbWUsIF9zaXplKSB7CQkJCQlcCi0JLmF0dHIJPSB7IC5uYW1lID0gX19zdHJpbmdp
ZnkoX25hbWUpLCAubW9kZSA9IDAyMDAgfSwJCVwKLQkud3JpdGUJPSBfbmFtZSMjX3dyaXRlLAkJ
CQkJXAotCS5zaXplCT0gX3NpemUsCQkJCQkJXAotfQorI2RlZmluZSBfX0JJTl9BVFRSX1dPKF9u
YW1lLCBfc2l6ZSkJCQkJCVwKKwlfX0JJTl9BVFRSKF9uYW1lLCAwMjAwLCBOVUxMLCBfbmFtZSMj
X3dyaXRlLCBfc2l6ZSkKIAogI2RlZmluZSBfX0JJTl9BVFRSX1JXKF9uYW1lLCBfc2l6ZSkJCQkJ
CVwKIAlfX0JJTl9BVFRSKF9uYW1lLCAwNjQ0LCBfbmFtZSMjX3JlYWQsIF9uYW1lIyNfd3JpdGUs
IF9zaXplKQpAQCAtMzY0LDExICszNTgsOCBAQCBzdHJ1Y3QgYmluX2F0dHJpYnV0ZSBiaW5fYXR0
cl8jI19uYW1lID0gX19CSU5fQVRUUl9XTyhfbmFtZSwgX3NpemUpCiBzdHJ1Y3QgYmluX2F0dHJp
YnV0ZSBiaW5fYXR0cl8jI19uYW1lID0gX19CSU5fQVRUUl9SVyhfbmFtZSwgX3NpemUpCiAKIAot
I2RlZmluZSBfX0JJTl9BVFRSX0FETUlOX1JPKF9uYW1lLCBfc2l6ZSkgewkJCQkJXAotCS5hdHRy
CT0geyAubmFtZSA9IF9fc3RyaW5naWZ5KF9uYW1lKSwgLm1vZGUgPSAwNDAwIH0sCQlcCi0JLnJl
YWQJPSBfbmFtZSMjX3JlYWQsCQkJCQkJXAotCS5zaXplCT0gX3NpemUsCQkJCQkJXAotfQorI2Rl
ZmluZSBfX0JJTl9BVFRSX0FETUlOX1JPKF9uYW1lLCBfc2l6ZSkJCQkJXAorCV9fQklOX0FUVFIo
X25hbWUsIDA0MDAsIF9uYW1lIyNfcmVhZCwgTlVMTCwgX3NpemUpCiAKICNkZWZpbmUgX19CSU5f
QVRUUl9BRE1JTl9SVyhfbmFtZSwgX3NpemUpCQkJCQlcCiAJX19CSU5fQVRUUihfbmFtZSwgMDYw
MCwgX25hbWUjI19yZWFkLCBfbmFtZSMjX3dyaXRlLCBfc2l6ZSkKQEAgLTM3OSwxMCArMzcwLDgg
QEAgc3RydWN0IGJpbl9hdHRyaWJ1dGUgYmluX2F0dHJfIyNfbmFtZSA9IF9fQklOX0FUVFJfQURN
SU5fUk8oX25hbWUsIF9zaXplKQogI2RlZmluZSBCSU5fQVRUUl9BRE1JTl9SVyhfbmFtZSwgX3Np
emUpCQkJCQlcCiBzdHJ1Y3QgYmluX2F0dHJpYnV0ZSBiaW5fYXR0cl8jI19uYW1lID0gX19CSU5f
QVRUUl9BRE1JTl9SVyhfbmFtZSwgX3NpemUpCiAKLSNkZWZpbmUgX19CSU5fQVRUUl9TSU1QTEVf
Uk8oX25hbWUsIF9tb2RlKSB7CQkJCVwKLQkuYXR0cgk9IHsgLm5hbWUgPSBfX3N0cmluZ2lmeShf
bmFtZSksIC5tb2RlID0gX21vZGUgfSwJXAotCS5yZWFkCT0gc3lzZnNfYmluX2F0dHJfc2ltcGxl
X3JlYWQsCQkJCVwKLX0KKyNkZWZpbmUgX19CSU5fQVRUUl9TSU1QTEVfUk8oX25hbWUsIF9tb2Rl
KQkJCQlcCisJX19CSU5fQVRUUihfbmFtZSwgX21vZGUsIHN5c2ZzX2Jpbl9hdHRyX3NpbXBsZV9y
ZWFkLCBOVUxMLCAwKQogCiAjZGVmaW5lIEJJTl9BVFRSX1NJTVBMRV9STyhfbmFtZSkJCQkJCVwK
IHN0cnVjdCBiaW5fYXR0cmlidXRlIGJpbl9hdHRyXyMjX25hbWUgPSBfX0JJTl9BVFRSX1NJTVBM
RV9STyhfbmFtZSwgMDQ0NCkKCi0tIAoyLjQ3LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=

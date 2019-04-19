Return-Path: <SRS0=SE3z=SV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C10EDC282DA
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Apr 2019 09:52:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DFEA218EA
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Apr 2019 09:52:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gd4z+9K7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="oudVdW/d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DFEA218EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KnLCo6iw2mFDeisVB8z/oivTmPZBrhw+X4FuZD+qYHg=; b=gd4z+9K7w46t8E
	7JtUrF3GQOajF6uPVilGtyGdV7fTMbtbZgu1ShAMWcXUABPkeVTSz8zSKYiZxafQTl2IlKDXdnDnR
	qzS9+SOC9OB1qwdtClrUK/qZsg7QfnwOcN4oEMX3A3NfSmiE+j/cQLB53VlpJQrfvW3RuyNIaUcjV
	8F407cyfPjXJitb0STWmfxx0voKeHcKecDZQPfoAT43yiSn1YXjotkRyrDdYNlOi2Grz80ramoUgy
	8syEdPEawRV25VfQTK413ykqu/vSjvfX+Vv3uh1gAbU3BIM558o61v7tBn7M+Sp34ozF92XplI9hV
	eWS1AWDN1M9wEiIzykxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hHQC1-0003hX-QA; Fri, 19 Apr 2019 09:52:25 +0000
Received: from conuserg-08.nifty.com ([210.131.2.75])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hHQ8a-0006aX-KF; Fri, 19 Apr 2019 09:48:59 +0000
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-08.nifty.com with ESMTP id x3J9mDiQ012304;
 Fri, 19 Apr 2019 18:48:21 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com x3J9mDiQ012304
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1555667302;
 bh=i5XCWis3VrTykYK/RrX/WLSMvw74LO5onG7SxOwG69A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oudVdW/dFWq56OuDzP6kKUzuEWhB1LghoeXto+rXOPNib4DV9Uy/SJlJzj1AbmWfp
 mevr0XhyqB2vZq4Cz+Z1v2JvWwOv56OiugvEABew3D+o/TOnkAQFO0IulE/o2RPA/B
 +sTZx4hUEh4VtZpZbGYRBLePR5ICQudFoYOaeslkPILaHXz1Ak62JsBLFHuo6nXW+A
 HdImamYXzb7Yk06Xdrpl/c4BLwIZGHF/XfL1anllWbvNDOtJizhoIHVpekzfvHeQsK
 kLoe+3N8CTYNLyxpT4B5He8gmcUsZrbdL7Q+2LWqM5b83Cr/r8gBn0MoV7tumFH5RV
 2DmcgtWPSyNuw==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Andrew Morton <akpm@linux-foundation.org>,
 linux-arch <linux-arch@vger.kernel.org>
Subject: [PATCH v2 05/11] mtd: rawnand: vf610_nfc: add initializer to avoid
 -Wmaybe-uninitialized
Date: Fri, 19 Apr 2019 18:47:48 +0900
Message-Id: <20190419094754.24667-6-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190419094754.24667-1-yamada.masahiro@socionext.com>
References: <20190419094754.24667-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190419_024853_140263_DE59B820 
X-CRM114-Status: GOOD (  11.04  )
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, linux-s390@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, x86@kernel.org,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Ingo Molnar <mingo@redhat.com>, linux-mtd@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhpcyBwcmVwYXJlcyB0byBtb3ZlIENPTkZJR19PUFRJTUlaRV9JTkxJTklORyBmcm9tIHg4NiB0
byBhIGNvbW1vbgpwbGFjZS4gV2UgbmVlZCB0byBlbGltaW5hdGUgcG90ZW50aWFsIGlzc3VlcyBi
ZWZvcmVoYW5kLgoKS2J1aWxkIHRlc3Qgcm9ib3QgaGFzIG5ldmVyIHJlcG9ydGVkIC1XbWF5YmUt
dW5pbml0aWFsaXplZCB3YXJuaW5nCmZvciB0aGlzIHByb2JhYmx5IGJlY2F1c2UgdmY2MTBfbmZj
X3J1bigpIGlzIGlubGluZWQgYnkgdGhlIHg4Ngpjb21waWxlcidzIGlubGluaW5nIGhldXJpc3Rp
Yy4KCklmIENPTkZJR19PUFRJTUlaRV9JTkxJTklORyBpcyBlbmFibGVkIGZvciBhIGRpZmZlcmVu
dCBhcmNoaXRlY3R1cmUKYW5kIHZmNjEwX25mY19ydW4oKSBpcyBub3QgaW5saW5lZCwgdGhlIGZv
bGxvd2luZyB3YXJuaW5nIGlzIHJlcG9ydGVkOgoKZHJpdmVycy9tdGQvbmFuZC9yYXcvdmY2MTBf
bmZjLmM6IEluIGZ1bmN0aW9uIOKAmHZmNjEwX25mY19jbWTigJk6CmRyaXZlcnMvbXRkL25hbmQv
cmF3L3ZmNjEwX25mYy5jOjQ1NTozOiB3YXJuaW5nOiDigJhvZmZzZXTigJkgbWF5IGJlIHVzZWQg
dW5pbml0aWFsaXplZCBpbiB0aGlzIGZ1bmN0aW9uIFstV21heWJlLXVuaW5pdGlhbGl6ZWRdCiAg
IHZmNjEwX25mY19yZF9mcm9tX3NyYW0oaW5zdHItPmN0eC5kYXRhLmJ1Zi5pbiArIG9mZnNldCwK
ICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fgogICAgICAgICAgICBuZmMtPnJlZ3MgKyBORkNfTUFJTl9BUkVBKDApICsgb2Zmc2V0LAogICAg
ICAgICAgICB+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgogICAgICAgICAg
ICB0cmZyX3N6LCAhbmZjLT5kYXRhX2FjY2Vzcyk7CiAgICAgICAgICAgIH5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fgoKU2lnbmVkLW9mZi1ieTogTWFzYWhpcm8gWWFtYWRhIDx5YW1hZGEubWFz
YWhpcm9Ac29jaW9uZXh0LmNvbT4KLS0tCgpDaGFuZ2VzIGluIHYyOgogIC0gc3BsaXQgaW50byBh
IHNlcGFyYXRlIHBhdGNoCgogZHJpdmVycy9tdGQvbmFuZC9yYXcvdmY2MTBfbmZjLmMgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy92ZjYxMF9uZmMuYyBiL2RyaXZlcnMvbXRkL25hbmQv
cmF3L3ZmNjEwX25mYy5jCmluZGV4IGE2NjJjYTE5NzBlNS4uMTk3OTJkNzI1ZWMyIDEwMDY0NAot
LS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy92ZjYxMF9uZmMuYworKysgYi9kcml2ZXJzL210ZC9u
YW5kL3Jhdy92ZjYxMF9uZmMuYwpAQCAtMzY0LDcgKzM2NCw3IEBAIHN0YXRpYyBpbnQgdmY2MTBf
bmZjX2NtZChzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLAogewogCWNvbnN0IHN0cnVjdCBuYW5kX29w
X2luc3RyICppbnN0cjsKIAlzdHJ1Y3QgdmY2MTBfbmZjICpuZmMgPSBjaGlwX3RvX25mYyhjaGlw
KTsKLQlpbnQgb3BfaWQgPSAtMSwgdHJmcl9zeiA9IDAsIG9mZnNldDsKKwlpbnQgb3BfaWQgPSAt
MSwgdHJmcl9zeiA9IDAsIG9mZnNldCA9IDA7CiAJdTMyIGNvbCA9IDAsIHJvdyA9IDAsIGNtZDEg
PSAwLCBjbWQyID0gMCwgY29kZSA9IDA7CiAJYm9vbCBmb3JjZThiaXQgPSBmYWxzZTsKIAotLSAK
Mi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K

Return-Path: <SRS0=aix5=FZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BAC7C433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Dec 2020 10:02:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A807E207D2
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Dec 2020 10:02:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A807E207D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YccXrMDGqdbLmSH9rHuvaiBpQCEzsVxIEVIKAJTxLMU=; b=eoVwRc0sJLAWpda+f/YAg0MN8i
	DYfSG95yKZcvomZowzdYI4Ues0v9GxSiCUviGhO+14NhYVybWrj+72JKTZ73Oe+ExedqPFignkWCg
	J+HSF31iGujvMq+dSTY717cg4MJfMmbOZkvjCGqOMvJgbiXi1g8VTFUo11+SU+kaZmcJiTkURnaOK
	A0StUPgFYuCphXRXuV7mFS9Zg7S5y/n7tZ5arIxlwK9Z2i4B03RVpg/MG0SbdBQqm3yPu0AD4mgV5
	0KOOZag0nXwAh80fgAswzn/tHc+2gH5EIVEtUIWOv3e+PB3b4La9cZ69QZMmhdHkMSgpEyrIjswwk
	55hTmLxw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krI0X-00029K-Vd; Mon, 21 Dec 2020 10:01:38 +0000
Received: from first.geanix.com ([116.203.34.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krI0T-00027x-BJ
 for linux-mtd@lists.infradead.org; Mon, 21 Dec 2020 10:01:34 +0000
Received: from zen.. (unknown [185.17.218.86])
 by first.geanix.com (Postfix) with ESMTPSA id DDFF6487688;
 Mon, 21 Dec 2020 10:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1608544889; bh=QoIAAJdcJ2xARRst3umA4sJ7s7wi/Qvh4ASN+q/gFmw=;
 h=From:To:Cc:Subject:Date;
 b=L61J9MVQVz0CvG/ywTsNVAhA8yuwqWZizP0l97nYX2IXq3mbR8d5YhcUzSkxw035V
 TLufyfev/ejpinvQjGC4r7+9+6+uwY15YNG05diQtfYwtgHpuJgyaPIxS06Rt6kD9b
 jnO/y0TcfMcNl1diIUnbX/hdpLsCwnLofqYw5kT2jFIC0KqjGjIHyp+yD3VCe4flAo
 f9Mvtfl0KkkSGPu00dN4yEvZCnAtgY3+Jdy9sRX3HCL3UtWqW9YoV/hOLdSPapaE++
 X/ZeTV/CjXZDCq4prHW5P7u2wXwB+/xppvFg/LKrrHOM7b7HJRYryTXKeJ4FfAm+ia
 uZBkJDrx0zoWQ==
From: Sean Nyekjaer <sean@geanix.com>
To: Han Xu <han.xu@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH] mtd: rawnand: gpmi: fix dst bit offset when extracting raw
 payload
Date: Mon, 21 Dec 2020 11:00:13 +0100
Message-Id: <20201221100013.2715675-1-sean@geanix.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_050134_234190_E94F6747 
X-CRM114-Status: GOOD (  11.46  )
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Sean Nyekjaer <sean@geanix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

UmUtYWRkIHRoZSBtdWx0aXBseSBieSA4IHRvICJzdGVwICogZWNjc2l6ZSIgdG8gY29ycmVjdCB0
aGUgZGVzdGluYXRpb24gYml0IG9mZnNldAp3aGVuIGV4dHJhY3RpbmcgdGhlIGRhdGEgcGF5bG9h
ZCBpbiBncG1pX2VjY19yZWFkX3BhZ2VfcmF3KCkuCgpGaXhlczogZTVlNTYzMWNjODg5ICgibXRk
OiByYXduYW5kOiBncG1pOiBVc2UgbmFuZF9leHRyYWN0X2JpdHMoKSIpCkNjOiBzdGFibGVAdmdl
ci5rZXJuZWwub3JnClJlcG9ydGVkLWJ5OiBNYXJ0aW4gSHVuZGViw7hsbCA8bWFydGluQGdlYW5p
eC5jb20+ClNpZ25lZC1vZmYtYnk6IFNlYW4gTnlla2phZXIgPHNlYW5AZ2Vhbml4LmNvbT4KLS0t
CiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9ncG1pLW5hbmQvZ3BtaS1uYW5kLmMgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9ncG1pLW5hbmQvZ3BtaS1uYW5kLmMgYi9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9ncG1pLW5hbmQvZ3BtaS1uYW5kLmMKaW5kZXggZGM4MTA0ZTY3NTA2Li5mMDcyNmU2
OWEzMTIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9ncG1pLW5h
bmQuYworKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9ncG1pLW5hbmQvZ3BtaS1uYW5kLmMKQEAg
LTE2MTEsNyArMTYxMSw3IEBAIHN0YXRpYyBpbnQgZ3BtaV9lY2NfcmVhZF9wYWdlX3JhdyhzdHJ1
Y3QgbmFuZF9jaGlwICpjaGlwLCB1aW50OF90ICpidWYsCiAJLyogRXh0cmFjdCBpbnRlcmxlYXZl
ZCBwYXlsb2FkIGRhdGEgYW5kIEVDQyBiaXRzICovCiAJZm9yIChzdGVwID0gMDsgc3RlcCA8IG5m
Y19nZW8tPmVjY19jaHVua19jb3VudDsgc3RlcCsrKSB7CiAJCWlmIChidWYpCi0JCQluYW5kX2V4
dHJhY3RfYml0cyhidWYsIHN0ZXAgKiBlY2NzaXplLCB0bXBfYnVmLAorCQkJbmFuZF9leHRyYWN0
X2JpdHMoYnVmLCBzdGVwICogZWNjc2l6ZSAqIDgsIHRtcF9idWYsCiAJCQkJCSAgc3JjX2JpdF9v
ZmYsIGVjY3NpemUgKiA4KTsKIAkJc3JjX2JpdF9vZmYgKz0gZWNjc2l6ZSAqIDg7CiAKLS0gCjIu
MjkuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==

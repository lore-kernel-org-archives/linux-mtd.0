Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B85C43334
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jul 2022 16:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yLtbdPjzjj8RRRWWUuBPHuHI5FaR35qM+PmYyOmWULM=; b=vKMTtS/8sCS1UU
	GUMiW0uUNB7U6LFwpfdUpzauwl78sT7+r6VLeUv71I6sCaRqWINkku0m75Uby8kCmbJyMvRNaCQHs
	MZeqYObm1horGYB/7YVQTxbNOcSXdsJfKoViC2WzXhlCZKAUF+O/SMgrKH0tt431WfzLB+wKxGzjA
	IFJr84t2D6KvQ3A6lHJNdaWyg5kkq4Afugv7PWIMgvCgq6zEuE4cJoIpc7COgK8vC/4wG0Iehi++x
	gm0KfPo8Y64htf78MgCncR8sz90BCXVVXEB7JoyQQeoep7T93nNQFkdMQ9+O1p7i/fEeOYHhQntNI
	p1ovz5tbD4K+8LkfnU6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEvps-0083ZD-PO; Fri, 22 Jul 2022 16:49:08 +0000
Received: from out28-219.mail.aliyun.com ([115.124.28.219])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEvpo-0083Rl-Ff
	for linux-mtd@lists.infradead.org; Fri, 22 Jul 2022 16:49:06 +0000
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07772149|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00248871-9.81933e-05-0.997413;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047204;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=23;RT=23;SR=0;TI=SMTPD_---.Ob0cnJp_1658508527;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Ob0cnJp_1658508527)
          by smtp.aliyun-inc.com;
          Sat, 23 Jul 2022 00:48:49 +0800
From: =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= <zhouyanjie@wanyeetech.com>
To: tudor.ambarus@microchip.com,
	p.yadav@ti.com,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Cc: linux-mtd@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	aidanmacdonald.0x0@gmail.com,
	tmn505@gmail.com,
	paul@crapouillou.net,
	dongsheng.qiu@ingenic.com,
	aric.pzqi@ingenic.com,
	rick.tyliu@ingenic.com,
	jinghui.liu@ingenic.com,
	sernia.zhou@foxmail.com,
	reimu@sudomaker.com
Subject: [PATCH 1/3] mtd: spi-nor: Use the spi-mem poll status APIs.
Date: Sat, 23 Jul 2022 00:48:28 +0800
Message-Id: <1658508510-15400-2-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1658508510-15400-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1658508510-15400-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_094904_783716_213F5E4B 
X-CRM114-Status: GOOD (  14.62  )
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

V2l0aCBhZHZhbmNlZCBjb250cm9sbGVycyAoc3VjaCBhcyBJbmdlbmljIFNGQyksIGl0IGlzIHBv
c3NpYmxlIHRvIHBvbGwKdGhlIHN0YXR1cyByZWdpc3RlciBvZiB0aGUgZGV2aWNlLiBUaGlzIGNv
dWxkIGJlIGRvbmUgdG8gb2ZmbG9hZCB0aGUgQ1BVCmR1cmluZyBhIGVyYXNlIG9yIHdyaXRlIG9w
ZXJhdGlvbi4gTWFrZSB1c2Ugb2Ygc3BpLW1lbSBwb2xsIHN0YXR1cyBBUElzCnRvIGhhbmRsZSB0
aGlzIGZlYXR1cmUuCgpQcmV2aW91c2x5LCB3aGVuIGVyYXNpbmcgbGFyZ2UgYXJlYSAoZS5nLiAz
Mk1pQiksIGluIG5vbi1vZmZsb2FkIGNhc2UsCkNQVSBsb2FkIGNvdWxkIHJlYWNoIH45MCUgYW5k
IHdvdWxkIGdlbmVyYXRlIH4zLjkyIG1pbGxpb24gaW50ZXJydXB0cywKbm93IGl0IGRlY3JlYXNl
IHRvIH4xNSUgQ1BVIGxvYWQgYW5kIDAuMTUgbWlsbGlvbiBpbnRlcnJ1cHRzLgoKVGhpcyBzaG91
bGQgYWxzbyBmaXggdGhlIGhpZ2ggQ1BVIHVzYWdlIGZvciBzeXN0ZW0gd2hpY2ggZG9uJ3QgaGF2
ZSBhCmRlZGljYXRlZCBwb2xsIHN0YXR1cyBibG9jayBsb2dpYyAoZGVjcmVhc2UgdG8gfjgwJSBD
UFUgbG9hZCBhbmQgfjEuNjEKbWlsbGlvbiBpbnRlcnJ1cHRzLikuCgpTaWduZWQtb2ZmLWJ5OiDl
kajnkLDmnbAgKFpob3UgWWFuamllKSA8emhvdXlhbmppZUB3YW55ZWV0ZWNoLmNvbT4KLS0tCiBk
cml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYyB8IDQyICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKyksIDEwIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jIGIvZHJp
dmVycy9tdGQvc3BpLW5vci9jb3JlLmMKaW5kZXggNTAyOTY3Yy4uNmEzMTEzMiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9j
b3JlLmMKQEAgLTYxNywxOSArNjE3LDQxIEBAIHN0YXRpYyBpbnQgc3BpX25vcl93YWl0X3RpbGxf
cmVhZHlfd2l0aF90aW1lb3V0KHN0cnVjdCBzcGlfbm9yICpub3IsCiAJdW5zaWduZWQgbG9uZyBk
ZWFkbGluZTsKIAlpbnQgdGltZW91dCA9IDAsIHJldDsKIAotCWRlYWRsaW5lID0gamlmZmllcyAr
IHRpbWVvdXRfamlmZmllczsKKwlpZiAobm9yLT5zcGltZW0gJiYgIW5vci0+cGFyYW1zLT5yZWFk
eSkgeworCQlzdHJ1Y3Qgc3BpX21lbV9vcCBvcCA9IFNQSV9NRU1fT1AoU1BJX01FTV9PUF9DTUQo
U1BJTk9SX09QX1JEU1IsIDApLAorCQkJCQkJICAgICAgIFNQSV9NRU1fT1BfTk9fQUREUiwKKwkJ
CQkJCSAgICAgICBTUElfTUVNX09QX05PX0RVTU1ZLAorCQkJCQkJICAgICAgIFNQSV9NRU1fT1Bf
REFUQV9JTigxLCBub3ItPmJvdW5jZWJ1ZiwgMCkpOwogCi0Jd2hpbGUgKCF0aW1lb3V0KSB7Ci0J
CWlmICh0aW1lX2FmdGVyX2VxKGppZmZpZXMsIGRlYWRsaW5lKSkKLQkJCXRpbWVvdXQgPSAxOwor
CQlpZiAobm9yLT5yZWdfcHJvdG8gPT0gU05PUl9QUk9UT184XzhfOF9EVFIpIHsKKwkJCW9wLmFk
ZHIubmJ5dGVzID0gbm9yLT5wYXJhbXMtPnJkc3JfYWRkcl9uYnl0ZXM7CisJCQlvcC5kdW1teS5u
Ynl0ZXMgPSBub3ItPnBhcmFtcy0+cmRzcl9kdW1teTsKKwkJCS8qCisJCQkgKiBXZSBkb24ndCB3
YW50IHRvIHJlYWQgb25seSBvbmUgYnl0ZSBpbiBEVFIgbW9kZS4gU28sCisJCQkgKiByZWFkIDIg
YW5kIHRoZW4gZGlzY2FyZCB0aGUgc2Vjb25kIGJ5dGUuCisJCQkgKi8KKwkJCW9wLmRhdGEubmJ5
dGVzID0gMjsKKwkJfQogCi0JCXJldCA9IHNwaV9ub3JfcmVhZHkobm9yKTsKLQkJaWYgKHJldCA8
IDApCi0JCQlyZXR1cm4gcmV0OwotCQlpZiAocmV0KQotCQkJcmV0dXJuIDA7CisJCXNwaV9ub3Jf
c3BpbWVtX3NldHVwX29wKG5vciwgJm9wLCBub3ItPnJlZ19wcm90byk7CisKKwkJcmV0dXJuIHNw
aV9tZW1fcG9sbF9zdGF0dXMobm9yLT5zcGltZW0sICZvcCwgU1JfV0lQLCAwLCAwLCAxMCwKKwkJ
CQkJCSAgICAgICBqaWZmaWVzX3RvX21zZWNzKHRpbWVvdXRfamlmZmllcykpOworCX0gZWxzZSB7
CisJCWRlYWRsaW5lID0gamlmZmllcyArIHRpbWVvdXRfamlmZmllczsKIAotCQljb25kX3Jlc2No
ZWQoKTsKKwkJd2hpbGUgKCF0aW1lb3V0KSB7CisJCQlpZiAodGltZV9hZnRlcl9lcShqaWZmaWVz
LCBkZWFkbGluZSkpCisJCQkJdGltZW91dCA9IDE7CisKKwkJCXJldCA9IHNwaV9ub3JfcmVhZHko
bm9yKTsKKwkJCWlmIChyZXQgPCAwKQorCQkJCXJldHVybiByZXQ7CisJCQlpZiAocmV0KQorCQkJ
CXJldHVybiAwOworCisJCQljb25kX3Jlc2NoZWQoKTsKKwkJfQogCX0KIAogCWRldl9kYmcobm9y
LT5kZXYsICJmbGFzaCBvcGVyYXRpb24gdGltZWQgb3V0XG4iKTsKLS0gCjIuNy40CgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K

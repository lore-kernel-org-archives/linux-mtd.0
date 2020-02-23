Return-Path: <SRS0=rEYP=4L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52624C35666
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Feb 2020 17:37:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27A6E20836
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Feb 2020 17:37:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a6/d4Mbx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="lPOrAfHf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27A6E20836
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RsgcRc0drT8yafiOTwq/YtxCUTfPQXd+ZDdI1x4dzgk=; b=a6/d4MbxmRSO1D
	9qV+njE+TmODNTpueCNrJhxV3DyPcqzxIJdoJdzMjG6CflIAD3kaXl31WMvOSR3PIM+t+t7mjW/gj
	Dmzp46+hFquzqC/4bnRUqhiAZwAd7pYyaCu22NfiP3BiIBAHrcniarp6YVm8HT2dR+OcoNLSUKjPE
	PrDMjS16+JU0at4+Ey/CmhLDN5Y0SAo93phe9HAhcs/Lpo+0cKi2Yawhwe65DHmLNdYPWVO6fWf7X
	AVOPX5hEDTrkFVQs8KrSHciwwPKn2EpwhKcmrh5Cu1x8rhUhEOTKTL+t38p/7gaQdYuqKkRs1CNPR
	VIBKXXH0ZqBa0Dr6I3qg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j5vCF-0001r4-6l; Sun, 23 Feb 2020 17:37:39 +0000
Received: from mout.gmx.net ([212.227.17.21])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j5vCC-0001q9-AX
 for linux-mtd@lists.infradead.org; Sun, 23 Feb 2020 17:37:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1582479439;
 bh=if6WbC/yoW5hMRNOq9FgOOoRavmhfqy0phCb2wgo+hI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=lPOrAfHfNw2oIMGaCptqEEwINZ+KsDREJgameG6RNZllmX1o+f09goylmTGa7r1Em
 w11ezAF0cmQhJu4yjpgWElv4TwzsUDHEg8F4xXoBYVM541dC4fET14s6/RmWV5PGPd
 7GLBsZ21sJ4PI4tOTQl56Ve9B9EGR7v//fHdM4qo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.253]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MLzBp-1iofQF3bW5-00HwyG; Sun, 23
 Feb 2020 18:37:18 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2] mtd: spi-nor: Refactor spi_nor_read_id()
Date: Sun, 23 Feb 2020 18:37:13 +0100
Message-Id: <20200223173713.2981-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:pOOYy+2VyeB4DO6YBx0MwWV3mayZ/r15ZXaJYewCpadoPcSimqX
 qG+PAzlscD6iEsctfpG9pQWBA93s6MqaLDhU3v8ZFm0tEkncBla8EDSe8dvQubofnkS8c8E
 5XWJIfiTCnTf3dmE619N6GDKyEs+ezdYXASrLDJ9mE0msx107zYqicz5t1JoJdrP0Ku/Ikb
 oI5ZbDQF7A8z9QGV2dRFQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:IaRFzAZsYdM=:bkIM9+TXMp62Zh5phSY6bU
 zB65nk1WA7xu5eRiuYVNKTh9R8CzmKlsmvkl2lqyBQyXAD8UFB9W/hG1kZIbsysJmKWNpvP8E
 bjh7uSq+Q8kB0D2PSd29A+8+hNEaIjjADK1/aoFGlY3VBoeT5+6ASUh7SOSWO9fu7TCpRwqYD
 uwfxwMv76akJjUSN5LoPi1WjirkwiYU0AnIflhhCauMZrEBG8MqM3hgYKyKdjS3H8pHvtwa/I
 5p/95ZO32QNiJzGhs3TybBD9Ue3SR1GMt//30LRov5GVLumzGBvO0wB50nsLRxuBJBg1PaKyn
 Fa1gjyIR/PKMJFpadKnxu50ymFXk9FiqxcUvAUv5Rznaekf6HMsuQADtPgl9XpNEUzJj9HFVn
 vh3DDqK2YusKUMnoUKdUu92UK9KpKPzZMNrJQ98imvlF/QMUXkL6CAdAb3hIlAsqD6XuE4dRA
 rpiurGmN/6vB1fmJFem0Cp06WAmT9APLeJ+cmc5UrJz9vrOvUSkEtwkWOqDHT7FUvz73m0k9T
 kYV8Yh/jHgGW71sFcvJDXwC7O1vCwTolwwJ/sOdhszCtBM85nwEIsQiGfD2j6SZ4ehr5XJJte
 2ZtLMiTsJHf9w4ettD5ocwf5iMKrW5AZHzlPxeQUG2FpoVgyk6JfkihRoJ96vgK9Zwcr54UWT
 5XYhapIrDNB/QhKtzp/S2KscijobIa6da6Myb3lT9MceJ3/tpKr2S55AlBoQ2oBHdpqM6IS+Z
 YFBgFBpo4jN8pZKLxpqRvE06rsHYAYE2YKRj0tM2ZNLXkIrIbRZgc8sZetjI/qgT868KkBPrW
 xlUbCjVownESLd6jUXvOO5LDPbyww+WXUNPfjHYf2OAXpVxUoXxl+B4oyNkLj+wBMv9gmlD10
 rKgiJzNMv1uIKysv6vlKyLSJJe6lotINmrdt0z46+E+gOwyp1HIxBjwIZ4u71cs9ZBXCx50Mn
 X9fWDdIKClgYlEJiRPkwLo8vN79pj47jwB9kpeiZF93frlvBnf4PC+UdS+rm4D6xj2oc1Oig2
 9GxN6FjS+6hoRUh+m1zGW2rt1TEAc3CjZZU8hszJY1t7ujrr3SUkt1LmtS0ljz4wP5/rq4f8d
 BwCBNCrdpTGgHv0Kq5obsFFpdXvEesw1fuUD6DvHYcwWbhxZeyOOLWyoXIg+pZdKhv0SGSaJt
 RhD5ZcyBubZn+2X/HgA4wqIKeVKsNdF4f2mKRUZ7+GmFuhl27/DWt7N+9EDlNEYMXc1llp+Rs
 KT8ljn5ky0s6pOIMS
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200223_093736_696012_25E1D84F 
X-CRM114-Status: GOOD (  11.14  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LSBEb24ndCB1c2UgYHRtcGAgZm9yIHR3byBwdXJwb3NlcyAocmV0dXJuIHZhbHVlLCBsb29wIGNv
dW50ZXIpLgogIEluc3RlYWQsIHVzZSBgaWAgZm9yIHRoZSBsb29wIGNvdW50ZXIsIGFuZCBgcmV0
YCBmb3IgdGhlIHJldHVybiB2YWx1ZS4KLSBEb24ndCB1c2UgdGFicyBiZXR3ZWVuIHR5cGUgYW5k
IG5hbWUgaW4gdmFyaWFibGUgZGVjbGFyYXRpb25zLAogIGZvciBjb25zaXN0ZW5jeSB3aXRoIG90
aGVyIGZ1bmN0aW9ucyBpbiBzcGktbm9yLmMuCi0gUmV3cml0ZSBuZXN0ZWQgYGlmYHMgYXMgYGlm
IChhICYmIGIpYC4KLSBSZW1vdmUgYGluZm9gIHZhcmlhYmxlLCBhbmQgdXNlIHNwaV9ub3JfaWRz
W2ldIGRpcmVjdGx5LgoKU2lnbmVkLW9mZi1ieTogSm9uYXRoYW4gTmV1c2Now6RmZXIgPGoubmV1
c2NoYWVmZXJAZ214Lm5ldD4KLS0tCgp2MjoKLSBBcyBzdWdnZXN0ZWQgYnkgVHVkb3IgQW1iYXJ1
czoKICAtIHJlbmFtZSB0bXAgdG8gcmV0CiAgLSByZW1vdmUgdGFicyBiZXR3ZWVuIHZhcmlhYmxl
IHR5cGUgYW5kIG5hbWUKICAtIHJlbW92ZSBgaW5mb2AgdmFyaWFibGUKCnYxOgotIGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMDAyMTgxNTEwMzQuMjQ3NDQtMS1qLm5ldXNjaGFlZmVy
QGdteC5uZXQvCi0tLQogZHJpdmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmMgfCAyNSArKysrKysr
KysrKy0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTQg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmMg
Yi9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYwppbmRleCA0ZmM2MzJlYzE4ZmUuLjRjMDFl
YmIzOGRhOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmMKKysrIGIv
ZHJpdmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmMKQEAgLTI3MTEsOSArMjcxMSw4IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgZmxhc2hfaW5mbyBzcGlfbm9yX2lkc1tdID0gewoKIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgZmxhc2hfaW5mbyAqc3BpX25vcl9yZWFkX2lkKHN0cnVjdCBzcGlfbm9yICpub3Ip
CiB7Ci0JaW50CQkJdG1wOwotCXU4CQkJKmlkID0gbm9yLT5ib3VuY2VidWY7Ci0JY29uc3Qgc3Ry
dWN0IGZsYXNoX2luZm8JKmluZm87CisJaW50IHJldCwgaTsKKwl1OCAqaWQgPSBub3ItPmJvdW5j
ZWJ1ZjsKCiAJaWYgKG5vci0+c3BpbWVtKSB7CiAJCXN0cnVjdCBzcGlfbWVtX29wIG9wID0KQEAg
LTI3MjIsMjIgKzI3MjEsMjAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBmbGFzaF9pbmZvICpzcGlf
bm9yX3JlYWRfaWQoc3RydWN0IHNwaV9ub3IgKm5vcikKIAkJCQkgICBTUElfTUVNX09QX05PX0RV
TU1ZLAogCQkJCSAgIFNQSV9NRU1fT1BfREFUQV9JTihTUElfTk9SX01BWF9JRF9MRU4sIGlkLCAx
KSk7CgotCQl0bXAgPSBzcGlfbWVtX2V4ZWNfb3Aobm9yLT5zcGltZW0sICZvcCk7CisJCXJldCA9
IHNwaV9tZW1fZXhlY19vcChub3ItPnNwaW1lbSwgJm9wKTsKIAl9IGVsc2UgewotCQl0bXAgPSBu
b3ItPmNvbnRyb2xsZXJfb3BzLT5yZWFkX3JlZyhub3IsIFNQSU5PUl9PUF9SRElELCBpZCwKKwkJ
cmV0ID0gbm9yLT5jb250cm9sbGVyX29wcy0+cmVhZF9yZWcobm9yLCBTUElOT1JfT1BfUkRJRCwg
aWQsCiAJCQkJCQkgICAgU1BJX05PUl9NQVhfSURfTEVOKTsKIAl9Ci0JaWYgKHRtcCkgewotCQlk
ZXZfZGJnKG5vci0+ZGV2LCAiZXJyb3IgJWQgcmVhZGluZyBKRURFQyBJRFxuIiwgdG1wKTsKLQkJ
cmV0dXJuIEVSUl9QVFIodG1wKTsKKwlpZiAocmV0KSB7CisJCWRldl9kYmcobm9yLT5kZXYsICJl
cnJvciAlZCByZWFkaW5nIEpFREVDIElEXG4iLCByZXQpOworCQlyZXR1cm4gRVJSX1BUUihyZXQp
OwogCX0KCi0JZm9yICh0bXAgPSAwOyB0bXAgPCBBUlJBWV9TSVpFKHNwaV9ub3JfaWRzKSAtIDE7
IHRtcCsrKSB7Ci0JCWluZm8gPSAmc3BpX25vcl9pZHNbdG1wXTsKLQkJaWYgKGluZm8tPmlkX2xl
bikgewotCQkJaWYgKCFtZW1jbXAoaW5mby0+aWQsIGlkLCBpbmZvLT5pZF9sZW4pKQotCQkJCXJl
dHVybiAmc3BpX25vcl9pZHNbdG1wXTsKLQkJfQorCWZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpF
KHNwaV9ub3JfaWRzKSAtIDE7IGkrKykgeworCQlpZiAoc3BpX25vcl9pZHNbaV0uaWRfbGVuICYm
CisJCSAgICAhbWVtY21wKHNwaV9ub3JfaWRzW2ldLmlkLCBpZCwgc3BpX25vcl9pZHNbaV0uaWRf
bGVuKSkKKwkJCXJldHVybiAmc3BpX25vcl9pZHNbaV07CiAJfQogCWRldl9lcnIobm9yLT5kZXYs
ICJ1bnJlY29nbml6ZWQgSkVERUMgaWQgYnl0ZXM6ICUqcGhcbiIsCiAJCVNQSV9OT1JfTUFYX0lE
X0xFTiwgaWQpOwotLQoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=

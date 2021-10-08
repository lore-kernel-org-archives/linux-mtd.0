Return-Path: <SRS0=jKlu=O4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AA1AC433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 14:09:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9ED961029
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 14:09:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D9ED961029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X3xNEYihj/A6cWnlav7vFp8rtNWh74dGvk6XR7rtr5w=; b=ZkjS4VKlHC2p/M
	alBANQoe0oH00kOExxyzQ4UYki0v/WQygRsroOScATFxb1yphpcnRe3AphXjwpUlXwyefyp6HBu/G
	Hr+66lsUfYvfT4UElKt4EMjb0MK0sZwZTrvmOeDzKZwqmri6qfNB1U4KL1oK7K+Yc9tIpEpteTuqB
	Az3RZB2FpSHD+ekS0mMfKFbwI2CpdkCj5+XVVxOKPYT4tSp32jv4H3u6QSOy2YVSCVEWcl4v9SAOR
	O52MSUag+AxT40OocwrifJUwhfPtXN4ZDhADYTYaFCNQBOIoOfSLokpYg1MdnajB0GI+CdA+DAXVo
	OMmj3LXhU4OzJ1Ut/Eog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYqYY-0031xB-DK; Fri, 08 Oct 2021 14:09:02 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYqYV-0031uD-Is
 for linux-mtd@lists.infradead.org; Fri, 08 Oct 2021 14:09:01 +0000
Received: by mail-lf1-x133.google.com with SMTP id j5so39906859lfg.8
 for <linux-mtd@lists.infradead.org>; Fri, 08 Oct 2021 07:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version:organization
 :content-transfer-encoding;
 bh=L9tDcdHlXeqYvjIhg9kn1D4ktp7f1mzwtlQxwAb6+iY=;
 b=cTZPJoEZq34Bdp44jPTU12CHa29WhM7J0Btji0rh0QT3fiLm513EUbb6JFwkqCx+P7
 RAkBTT+e0YNlY3Tr53002a2WuytqMJQzXLnhi0Okv3MYF3WztSuNuo1W1oLp0zJALlnf
 h/f8mDCg73WN6D8FTv3fjCkAqwyWW9E3kGTAe/IantHM/WWftWBljx/PD7Nf/jpw4xtY
 SI4fDsD3kKfVWpH08bvRrCZjw2op5+SpJr5iy4X9+kVzaEM8620fdeTmNjISis/uv2VX
 gFS8mtoDcFehQkGmCaG77IniN9tNsKeMQz3LW+SmT93C092TmIxPKDrcdjIrbEM4M5Ep
 sLlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :organization:content-transfer-encoding;
 bh=L9tDcdHlXeqYvjIhg9kn1D4ktp7f1mzwtlQxwAb6+iY=;
 b=alwwslzrZW5jg7Mp3kldihkTGaskInu1JV1fYrPM3D0M7/4JBm9owkf0I7StFfa/r0
 JQd6WpgjB8ODoJ0B0fQGZQX1q/P0QU9OA9Ub8X32yV5svO6FfEgKUyneft0iSsOn5vGN
 YUtIO/gpyo4Qqlv60PSZ2IssyAsiOWX97ecQNYZZBg1QTMBXi6voHZWP2+JhDyp8UV7k
 GUUVRePdfvxspGf7tnSntLd7LjW6je4eT+u1fo/Dv0yigHWYecTn/AGjPQeOOPm6rDe7
 GApFJWh5Ge6tkJL6RaxFq78PlzOUc6Lu5mY829Yha6nHzp8GD9dAYU1PbaJbjn3S0Pbi
 sBSQ==
X-Gm-Message-State: AOAM531AOiKJ2PmasC1Qt9QDVpIUa7sawmeZQAhfqnot1p6TJGaACZ8j
 8JiXBRtFlJ62j/EcXe76Bq12/6nQYL0=
X-Google-Smtp-Source: ABdhPJyjr6xAkr+W6KYq6w2ZI3CL5J1B9WFe8NydT3AvKqAuHJ3Jk4ZGO4P3xqST6V7b1/gEVcSLGw==
X-Received: by 2002:a05:651c:1615:: with SMTP id
 f21mr3759201ljq.318.1633702135306; 
 Fri, 08 Oct 2021 07:08:55 -0700 (PDT)
Received: from wbg.labs.westermo.se (h-158-174-22-41.NA.cust.bahnhof.se.
 [158.174.22.41])
 by smtp.gmail.com with ESMTPSA id s7sm251591lfe.258.2021.10.08.07.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 07:08:54 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Joern Engel <joern@lazybastard.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Joachim Wiberg <troglobit@gmail.com>
Subject: [PATCH v2 1/1] mtd: block2mtd: add support for an optional custom MTD
 label
Date: Fri,  8 Oct 2021 16:08:35 +0200
Message-Id: <20211008140835.476949-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Organization: Westermo Network Technologies AB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_070859_677875_03980D37 
X-CRM114-Status: GOOD (  21.30  )
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

VGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIGFuIG9wdGlvbmFsIE1URCBsYWJlbCBmb3IgbXRk
MmJsb2NrIGVtdWxhdGVkCk1URCBkZXZpY2VzLiAgVXNlZnVsIHdoZW4sIGUuZy4sIHRlc3Rpbmcg
ZGV2aWNlIGltYWdlcyB1c2luZyBRZW11LgoKVGhlIGZvbGxvd2luZyBsaW5lIGluIC9ldGMvZnN0
YWIgY2FuIHRoZW4gYmUgdXNlZCB0byBtb3VudCBhIGZpbGUgc3lzdGVtCnJlZ2FyZGxlc3MgaWYg
cnVubmluZyBvbiBhbiBlbWJlZGRlZCBzeXN0ZW0sIG9yIGVtdWxhdGVkIHdpdGggYmxvY2sybXRk
OgoKICAgIG10ZDpDb25maWcgIC9tbnQgICAgamZmczIgICBub2F0aW1lLG5vZGlyYXRpbWUgICAg
ICAwICAgIDAKCktlcm5lbCBjb21tYW5kIGxpbmUgc3ludGF4IGluIHRoZSBlbXVsYXRlZCBjYXNl
OgoKICAgIGJsb2NrMm10ZC5ibG9jazJtdGQ9L2Rldi9zZGEsLENvbmZpZwoKTm90aW9jZSB0aGUg
JywsJywgaXQgaXMgdGhlIG9wdGlvbmFsIGVyYXNlX3NpemUsIHdoaWNoIGxpa2UgYmVmb3JlIHRo
aXMKcGF0Y2gsIGRlZmF1bHRzIHRvIFBBR0VfU0laRSB3aGVuIG9taXR0ZWQuICBIZW5jZSB0aGUg
c3RybGVuKCkgY2hlY2suCgpTaWduZWQtb2ZmLWJ5OiBKb2FjaGltIFdpYmVyZyA8dHJvZ2xvYml0
QGdtYWlsLmNvbT4KUmV2aWV3ZWQtYnk6IE1pcXXDqGwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJv
b3RsaW4uY29tPgotLS0KdjI6CiAgKiBWYXJpYWJsZXMgYW5kIGFyZ3VtZW50cyBvbiB0aGVpciBv
d24gbGluZXMKICAqIEFkZCBjb21tZW50IHRvIGV4cGxhaW4gd2h5IHdlIG5lZWQgc3RybGVuKCkK
ICAqIFJlZmFjdG9yIGhhcmQgY29kZWQgY29uc3RhbnRzIHdpdGggYSBkZWZpbmUKICAqIFNwZWxs
IGFuZCBncmFtbWFyIGNoZWNrIGNvbW1pdCBtZXNzYWdlCi0tLQogZHJpdmVycy9tdGQvZGV2aWNl
cy9ibG9jazJtdGQuYyB8IDI5ICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL210ZC9kZXZpY2VzL2Jsb2NrMm10ZC5jIGIvZHJpdmVycy9tdGQvZGV2aWNlcy9ibG9j
azJtdGQuYwppbmRleCBjMDg3MjFiMTE2NDIuLjQwZDcyMTE0ODVkYSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9tdGQvZGV2aWNlcy9ibG9jazJtdGQuYworKysgYi9kcml2ZXJzL210ZC9kZXZpY2VzL2Js
b2NrMm10ZC5jCkBAIC0zMSw2ICszMSw5IEBACiAjaW5jbHVkZSA8bGludXgvc2xhYi5oPgogI2lu
Y2x1ZGUgPGxpbnV4L21ham9yLmg+CiAKKy8qIE1heGltdW0gbnVtYmVyIG9mIGNvbW1hLXNlcGFy
YXRlZCBpdGVtcyBpbiB0aGUgJ2Jsb2NrMm10ZD0nIHBhcmFtZXRlciAqLworI2RlZmluZSBCTE9D
SzJNVERfUEFSQU1fTUFYX0NPVU5UIDMKKwogLyogSW5mbyBmb3IgdGhlIGJsb2NrIGRldmljZSAq
Lwogc3RydWN0IGJsb2NrMm10ZF9kZXYgewogCXN0cnVjdCBsaXN0X2hlYWQgbGlzdDsKQEAgLTIx
NCw3ICsyMTcsNyBAQCBzdGF0aWMgdm9pZCBibG9jazJtdGRfZnJlZV9kZXZpY2Uoc3RydWN0IGJs
b2NrMm10ZF9kZXYgKmRldikKIAogCiBzdGF0aWMgc3RydWN0IGJsb2NrMm10ZF9kZXYgKmFkZF9k
ZXZpY2UoY2hhciAqZGV2bmFtZSwgaW50IGVyYXNlX3NpemUsCi0JCWludCB0aW1lb3V0KQorCQlj
aGFyICpsYWJlbCwgaW50IHRpbWVvdXQpCiB7CiAjaWZuZGVmIE1PRFVMRQogCWludCBpOwpAQCAt
Mjc4LDcgKzI4MSwxMCBAQCBzdGF0aWMgc3RydWN0IGJsb2NrMm10ZF9kZXYgKmFkZF9kZXZpY2Uo
Y2hhciAqZGV2bmFtZSwgaW50IGVyYXNlX3NpemUsCiAKIAkvKiBTZXR1cCB0aGUgTVREIHN0cnVj
dHVyZSAqLwogCS8qIG1ha2UgdGhlIG5hbWUgY29udGFpbiB0aGUgYmxvY2sgZGV2aWNlIGluICov
Ci0JbmFtZSA9IGthc3ByaW50ZihHRlBfS0VSTkVMLCAiYmxvY2sybXRkOiAlcyIsIGRldm5hbWUp
OworCWlmICghbGFiZWwpCisJCW5hbWUgPSBrYXNwcmludGYoR0ZQX0tFUk5FTCwgImJsb2NrMm10
ZDogJXMiLCBkZXZuYW1lKTsKKwllbHNlCisJCW5hbWUgPSBrc3RyZHVwKGxhYmVsLCBHRlBfS0VS
TkVMKTsKIAlpZiAoIW5hbWUpCiAJCWdvdG8gZXJyX2Rlc3Ryb3lfbXV0ZXg7CiAKQEAgLTMwNSw3
ICszMTEsNyBAQCBzdGF0aWMgc3RydWN0IGJsb2NrMm10ZF9kZXYgKmFkZF9kZXZpY2UoY2hhciAq
ZGV2bmFtZSwgaW50IGVyYXNlX3NpemUsCiAJbGlzdF9hZGQoJmRldi0+bGlzdCwgJmJsa210ZF9k
ZXZpY2VfbGlzdCk7CiAJcHJfaW5mbygibXRkJWQ6IFslc10gZXJhc2Vfc2l6ZSA9ICVkS2lCIFsl
ZF1cbiIsCiAJCWRldi0+bXRkLmluZGV4LAotCQlkZXYtPm10ZC5uYW1lICsgc3RybGVuKCJibG9j
azJtdGQ6ICIpLAorCQlsYWJlbCA/IGxhYmVsIDogZGV2LT5tdGQubmFtZSArIHN0cmxlbigiYmxv
Y2sybXRkOiAiKSwKIAkJZGV2LT5tdGQuZXJhc2VzaXplID4+IDEwLCBkZXYtPm10ZC5lcmFzZXNp
emUpOwogCXJldHVybiBkZXY7CiAKQEAgLTM4MSw4ICszODcsOSBAQCBzdGF0aWMgaW50IGJsb2Nr
Mm10ZF9zZXR1cDIoY29uc3QgY2hhciAqdmFsKQogCS8qIDgwIGZvciBkZXZpY2UsIDEyIGZvciBl
cmFzZSBzaXplLCA4MCBmb3IgbmFtZSwgOCBmb3IgdGltZW91dCAqLwogCWNoYXIgYnVmWzgwICsg
MTIgKyA4MCArIDhdOwogCWNoYXIgKnN0ciA9IGJ1ZjsKLQljaGFyICp0b2tlblsyXTsKKwljaGFy
ICp0b2tlbltCTE9DSzJNVERfUEFSQU1fTUFYX0NPVU5UXTsKIAljaGFyICpuYW1lOworCWNoYXIg
KmxhYmVsID0gTlVMTDsKIAlzaXplX3QgZXJhc2Vfc2l6ZSA9IFBBR0VfU0laRTsKIAl1bnNpZ25l
ZCBsb25nIHRpbWVvdXQgPSBNVERfREVGQVVMVF9USU1FT1VUOwogCWludCBpLCByZXQ7CkBAIC0z
OTUsNyArNDAyLDcgQEAgc3RhdGljIGludCBibG9jazJtdGRfc2V0dXAyKGNvbnN0IGNoYXIgKnZh
bCkKIAlzdHJjcHkoc3RyLCB2YWwpOwogCWtpbGxfZmluYWxfbmV3bGluZShzdHIpOwogCi0JZm9y
IChpID0gMDsgaSA8IDI7IGkrKykKKwlmb3IgKGkgPSAwOyBpIDwgQkxPQ0syTVREX1BBUkFNX01B
WF9DT1VOVDsgaSsrKQogCQl0b2tlbltpXSA9IHN0cnNlcCgmc3RyLCAiLCIpOwogCiAJaWYgKHN0
cikgewpAQCAtNDE0LDcgKzQyMSw4IEBAIHN0YXRpYyBpbnQgYmxvY2sybXRkX3NldHVwMihjb25z
dCBjaGFyICp2YWwpCiAJCXJldHVybiAwOwogCX0KIAotCWlmICh0b2tlblsxXSkgeworCS8qIE9w
dGlvbmFsIGFyZ3VtZW50IHdoZW4gY3VzdG9tIGxhYmVsIGlzIHVzZWQgKi8KKwlpZiAodG9rZW5b
MV0gJiYgc3RybGVuKHRva2VuWzFdKSkgewogCQlyZXQgPSBwYXJzZV9udW0oJmVyYXNlX3NpemUs
IHRva2VuWzFdKTsKIAkJaWYgKHJldCkgewogCQkJcHJfZXJyKCJpbGxlZ2FsIGVyYXNlIHNpemVc
biIpOwpAQCAtNDIyLDcgKzQzMCwxMiBAQCBzdGF0aWMgaW50IGJsb2NrMm10ZF9zZXR1cDIoY29u
c3QgY2hhciAqdmFsKQogCQl9CiAJfQogCi0JYWRkX2RldmljZShuYW1lLCBlcmFzZV9zaXplLCB0
aW1lb3V0KTsKKwlpZiAodG9rZW5bMl0pIHsKKwkJbGFiZWwgPSB0b2tlblsyXTsKKwkJcHJfaW5m
bygiVXNpbmcgY3VzdG9tIE1URCBsYWJlbCAnJXMnIGZvciBkZXYgJXNcbiIsIGxhYmVsLCBuYW1l
KTsKKwl9CisKKwlhZGRfZGV2aWNlKG5hbWUsIGVyYXNlX3NpemUsIGxhYmVsLCB0aW1lb3V0KTsK
IAogCXJldHVybiAwOwogfQpAQCAtNDU2LDcgKzQ2OSw3IEBAIHN0YXRpYyBpbnQgYmxvY2sybXRk
X3NldHVwKGNvbnN0IGNoYXIgKnZhbCwgY29uc3Qgc3RydWN0IGtlcm5lbF9wYXJhbSAqa3ApCiAK
IAogbW9kdWxlX3BhcmFtX2NhbGwoYmxvY2sybXRkLCBibG9jazJtdGRfc2V0dXAsIE5VTEwsIE5V
TEwsIDAyMDApOwotTU9EVUxFX1BBUk1fREVTQyhibG9jazJtdGQsICJEZXZpY2UgdG8gdXNlLiBc
ImJsb2NrMm10ZD08ZGV2PlssPGVyYXNlc2l6ZT5dXCIiKTsKK01PRFVMRV9QQVJNX0RFU0MoYmxv
Y2sybXRkLCAiRGV2aWNlIHRvIHVzZS4gXCJibG9jazJtdGQ9PGRldj5bLFs8ZXJhc2VzaXplPl1b
LDxsYWJlbD5dXVwiIik7CiAKIHN0YXRpYyBpbnQgX19pbml0IGJsb2NrMm10ZF9pbml0KHZvaWQp
CiB7Ci0tIAoyLjI1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=

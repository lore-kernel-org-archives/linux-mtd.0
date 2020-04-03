Return-Path: <SRS0=2QCa=5T=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D5B3C43331
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Apr 2020 20:36:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A90D207FF
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Apr 2020 20:36:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DEO/6uIg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oUHdCZ8g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A90D207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u8pewqBBG9dXvn0FsDN1R9ciMTBfk+ASyZ4qrnWg28I=; b=DEO/6uIgMyH3VG1iwwsA8zYitO
	mEFxBnMr2TM0zxBNjcePJgUtbPXtnmGUzqYkDpI1Lyhp+BMmQCTz14MV8HIC+PAwhFrL3vO8SZFdw
	MvWvnomym0e8lkUuww9o2keG2lNZv+PMVWqDwXZGJhHKNS5TrisqI+TuZlOnwK+S69m0ER81IVY4x
	kzqPx6Lhc/Vl64dDpOkV1jHVfuFLM3wxPXdetxBRrkCNlL6syK5K3EtNwXnTP4RmOPw0Z2XqWip7z
	l+QXj6eIDqpYEIP4zkvxei9eujBIrnLGw7UB/eHQx2Kw2sO8GNMoTwhfg1/XTwJxRBWYfRvn0eLho
	JNjF5haQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKT2e-0003H0-C7; Fri, 03 Apr 2020 20:35:52 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKT2b-0003Ft-N7
 for linux-mtd@lists.infradead.org; Fri, 03 Apr 2020 20:35:51 +0000
Received: by mail-io1-xd30.google.com with SMTP id q9so9016606iod.4
 for <linux-mtd@lists.infradead.org>; Fri, 03 Apr 2020 13:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=O90iGbVuJX4tMSta7uKbpnb1sV4TXKCUMIjQqRprhfo=;
 b=oUHdCZ8g7jEkksVekfDwpfnJWYoch1xSYzLHvN9YPi5zfKesM4ClYOsQCTjOdvGpjn
 nDvRauK7Pr8BaCPHbiDDpRC44WMqoniizT6sI8erRB4RzApNAGKKPRhvOEezmCWjF053
 LgADJFA42VfuVaQuunktvFuXB5M1AMXzpWJYy1rfHWLOOZ9yRITN8LHY+EtC4MoEUJeP
 8itHY1E709mr1t5ANytNaBosJ/52AWHzVFIkrYjAUom127s0JC9b+DTsAHThCnlAt2M7
 umnTa2xbodLr+4bpygsVA0KoEoMHuRpzxIE79KzDJRM70cloGlVho1QQ5B58JyEfdUwv
 MTag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=O90iGbVuJX4tMSta7uKbpnb1sV4TXKCUMIjQqRprhfo=;
 b=bjZEUHLS2N8gx9HNd6pV7hUHKJ/DW7x9Px60DaOb9uI/szPpDDmCuoN1vFCVqd5WaE
 ziaeQnYa/UVY69tCxb1JbEorywZ42EgT2+P8zlZ7yCXpZIV2Rq+Ud6kcey7TpZJnAl9X
 G13WhVkiDiMFq7bkO3q4rtg4Ts0XNHBx/Yf9ALejl/WS9zo1/ALlVR3lxsm6fXAJzmEh
 U5YB0JKSsH1QYICFqJaFKCLxVDS++y4JOyKNi8/ZsFU8c+sGPiXXINCYDrK12mKhqoK8
 09Lk/CA/IPoPpo61KiIMZUbR0dhMW6RMvKJV9rYmmmtF0Zf6Nz7gl6HNoKHL6VVoVEfE
 IbIw==
X-Gm-Message-State: AGi0PubdqOoWByRlRXKdPxRh+Y0Ww2000Liv4/+1ng/LFDvQBq0sUxCG
 MrjloABpokcDbfT69bYHl56TLQNvh5iUoCL53UD1h/2K
X-Google-Smtp-Source: APiQypKl1k1boWCHRefudpyj4AqB2Ar8NA0l6IzW6gzbr5XOJDYJMMaE98ofjXczutKt/aUdJq2iqsVMa1nJDpwjQrs=
X-Received: by 2002:a5d:8742:: with SMTP id k2mr3220034iol.120.1585946146834; 
 Fri, 03 Apr 2020 13:35:46 -0700 (PDT)
MIME-Version: 1.0
From: Mark Deneen <mdeneen@gmail.com>
Date: Fri, 3 Apr 2020 16:35:35 -0400
Message-ID: <CAP6JJ8_DAS4X4-B5sa0U_SGACSyacXPXTAqRom=kG5uqrWzv3A@mail.gmail.com>
Subject: [PATCH] mtd-www: notes on when to use static and dynamic volumes
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="000000000000b780c105a268dc3a"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200403_133549_782938_70129F51 
X-CRM114-Status: GOOD (  12.15  )
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
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--000000000000b780c105a268dc3a
Content-Type: text/plain; charset="UTF-8"

This adds some documentation on when to use a static volume.  After
reading the documentation I had decided to make my squashfs root
static without knowing about a significant penalty to the boot time.
I have made some additions to the documentation to make this a little
bit more clear.

Best Regards,
Mark Deneen

--000000000000b780c105a268dc3a
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-additional-notes-on-choosing-between-a-static-and-a-.patch"
Content-Disposition: attachment; 
	filename="0001-additional-notes-on-choosing-between-a-static-and-a-.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k8kncvul0>
X-Attachment-Id: f_k8kncvul0

RnJvbSBhOGNjNzgyMGZjNTk5YjllN2YzNjZmODlhMTk0YzY3NmNjNjk3YjQ3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNYXJrIERlbmVlbiA8bWRlbmVlbkBwcm90b25tYWlsLmNvbT4K
RGF0ZTogRnJpLCAzIEFwciAyMDIwIDE2OjI3OjA3IC0wNDAwClN1YmplY3Q6IFtQQVRDSF0gYWRk
aXRpb25hbCBub3RlcyBvbiBjaG9vc2luZyBiZXR3ZWVuIGEgc3RhdGljIGFuZCBhIGR5bmFtaWMK
IHZvbHVtZQoKCiBjcmVhdGUgbW9kZSAxMDA2NDQgMDAwMS1GaXgtaHlwZXJsaW5rLXRvLVVCSS1i
bG9jay1kZXZpY2UucGF0Y2gKCmRpZmYgLS1naXQgYS8wMDAxLUZpeC1oeXBlcmxpbmstdG8tVUJJ
LWJsb2NrLWRldmljZS5wYXRjaCBiLzAwMDEtRml4LWh5cGVybGluay10by1VQkktYmxvY2stZGV2
aWNlLnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLmFkOTRhNmMKLS0t
IC9kZXYvbnVsbAorKysgYi8wMDAxLUZpeC1oeXBlcmxpbmstdG8tVUJJLWJsb2NrLWRldmljZS5w
YXRjaApAQCAtMCwwICsxLDIyIEBACitGcm9tIDQzNDljNzE1NmE3MzQzMjc5YzhhMWU2NmIwYTY1
MTA3MWRhNGRmODUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBNYXJrIERlbmVlbiA8
bWRlbmVlbkBwcm90b25tYWlsLmNvbT4KK0RhdGU6IEZyaSwgMyBBcHIgMjAyMCAxNTo1NDowNCAt
MDQwMAorU3ViamVjdDogW1BBVENIXSBGaXggaHlwZXJsaW5rIHRvIFVCSSBibG9jayBkZXZpY2UK
KworCitkaWZmIC0tZ2l0IGEvZmFxL3ViaS54bWwgYi9mYXEvdWJpLnhtbAoraW5kZXggZjlhNzZi
My4uNTUxOTU5ZCAxMDA2NDQKKy0tLSBhL2ZhcS91YmkueG1sCisrKysgYi9mYXEvdWJpLnhtbAor
QEAgLTE2OCw3ICsxNjgsNyBAQCBtb3VudCByZWFkLW9ubHkgZmlsZSBzeXN0ZW1zLjwvcD4KKyAK
KyA8cD5ZZXMuIFVCSSBhbGxvd3MgdG8gY3JlYXRlIGEgcmVhZC1vbmx5IGJsb2NrIGRldmljZSBv
biB0b3Agb2YgYSBVQkkgdm9sdW1lCisgd2hpY2ggaXMgc3VpdGFibGUgZm9yIHJlYWQtb25seSwg
YmxvY2stb3JpZW50ZWQgZmlsZSBzeXN0ZW1zLCBzdWNoIGFzIHNxdWFzaGZzLgorLVNlZSB0aGUg
PGEgaHJlZj0iLi5kb2MvdWJpLmh0bWwjTF9ibG9jayI+VUJJIGJsb2NrIGRldmljZTwvYT4gc2Vj
dGlvbiBmb3IgbW9yZSBkZXRhaWxzLjwvcD4KKytTZWUgdGhlIDxhIGhyZWY9Ii4uL2RvYy91Ymku
aHRtbCNMX2Jsb2NrIj5VQkkgYmxvY2sgZGV2aWNlPC9hPiBzZWN0aW9uIGZvciBtb3JlIGRldGFp
bHMuPC9wPgorIAorIDxoMj48YSBuYW1lPSJMX2Zvcm1hdF9tdGQiPgorIAlEbyBJIGhhdmUgdG8g
Zm9ybWF0IG15IGVtcHR5IGZsYXNoIGJlZm9yZSBydW5uaW5nIFVCSSBvbiB0b3Agb2YgaXQ/Cist
LSAKKzIuMjAuMQorCmRpZmYgLS1naXQgYS9kb2MvdWJpLnhtbCBiL2RvYy91YmkueG1sCmluZGV4
IDU2OGE2NmUuLjEyOTA3MzUgMTAwNjQ0Ci0tLSBhL2RvYy91YmkueG1sCisrKyBiL2RvYy91Ymku
eG1sCkBAIC0xMDksNiArMTA5LDEzIEBAIHZvbHVtZXMuIFN0YXRpYyB2b2x1bWVzIGFyZSByZWFk
LW9ubHkgYW5kIHRoZWlyIGNvbnRlbnRzIGFyZSBwcm90ZWN0ZWQgYnkKIHVwcGVyIGxheWVycyAo
ZS5nLiwgYSBmaWxlLXN5c3RlbSkgYXJlIHJlc3BvbnNpYmxlIGZvciBlbnN1cmluZyBkYXRhCiBp
bnRlZ3JpdHkuPC9wPgogCis8cD5TdGF0aWMgdm9sdW1lcyBhcmUgdHlwaWNhbGx5IHVzZWQgZm9y
IHRoZSBrZXJuZWwsIGluaXRyYW1mcywgYW5kIGR0Yi4KK0xhcmdlciBzdGF0aWMgdm9sdW1lcyBt
YXkgaW5jdXIgYSBzaWduaWZpY2FudCBwZW5hbHR5IHdoZW4gb3BlbmluZywgYXMgdGhlCis8Y29k
ZT5DUkMtMzI8L2NvZGU+IG5lZWRzIHRvIGJlIGNhbGN1bGF0ZWQgYXQgdGhpcyB0aW1lLiBJZiB5
b3UgYXJlIGxvb2tpbmcKK3RvIHVzZSBzdGF0aWMgdm9sdW1lcyBmb3IgYW55dGhpbmcgYmVzaWRl
cyB0aGUga2VybmVsLCBpbml0cmFtZnMsIG9yIGR0YiB5b3UKK2FyZSBsaWtlbHkgZG9pbmcgc29t
ZXRoaW5nIHdyb25nIGFuZCB3b3VsZCBiZSBiZXR0ZXIgb2ZmIHVzaW5nIGEgZHluYW1pYyB2b2x1
bWUKK2luc3RlYWQuPC9wPgorCiA8cD5VQkkgaXMgYXdhcmUgb2YgYmFkIGVyYXNlYmxvY2tzIChp
LmUuIHBvcnRpb25zIG9mIGZsYXNoIHdoaWNoIHdlYXIKIG91dCBvdmVyIHRpbWUpIGFuZCBmcmVl
cyB1cHBlci1sZXZlbCBzb2Z0d2FyZSBmcm9tIGhhdmluZyB0byBoYW5kbGUgYmFkCiBlcmFzZWJs
b2NrcyBpdHNlbGYuIFVCSSBoYXMgYSBwb29sIG9mIHJlc2VydmVkIHBoeXNpY2FsIGVyYXNlYmxv
Y2tzLCBhbmQKLS0gCjIuMjAuMQoK
--000000000000b780c105a268dc3a
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--000000000000b780c105a268dc3a--


Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76047CCD193
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Oct 2025 18:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Cc:To:From:
	MIME-Version:Content-Type:Reply-To:Message-ID:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kPTTi64eP+w6kjiLMkUtteZqA20D4CMDkaZrYHP1104=; b=nfqiFGxDmB8sF9mtf58w5OzH9y
	tFCoF+RVWuVUGDJCacUP8YbCO7drK8nrE4f3AWTbussboAU/4a8X3yA/uvfNXsS1N14yCsB+rqJUo
	9hibhmFYbL49Wvkokj3XEhnTaZqT0hOC4xYO6WFoaDfNOXtgWXK9nhDf4knG06zAFcdvu7TZzQXMm
	Ov6lDcYml2E5jr7Ue+z+OG7tId+9SeLlNf124Q9cjdGKSMEjdMkWZwPQY9I5oEcqymitdlseo1YlA
	O9qRzaPZthTbcRDGgMvVMGGGzsKXiY6XFMcIBqkpO7LwsNel7LBHXYAvMm2YoASSQXNSYncPZaZpQ
	ORGctAQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAuFJ-0000000Ea0w-3nMD;
	Mon, 20 Oct 2025 18:04:37 +0000
Received: from out28-116.mail.aliyun.com ([115.124.28.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAuFH-0000000EZzg-10l7
	for linux-mtd@lists.infradead.org;
	Mon, 20 Oct 2025 18:04:36 +0000
Received: from DESKTOP-D69P20T(mailfrom:micah.klein@vic-insightslab.com fp:SMTPD_---.f3KzPSS_1760983463 cluster:ay29)
          by smtp.aliyun-inc.com;
          Tue, 21 Oct 2025 02:04:27 +0800
Content-Type: multipart/mixed; boundary="===============0145272079=="
MIME-Version: 1.0
From: micah.klein@vic-insightslab.com
To: marketkkyplus@163.com
Cc: marketkkyplus@163.com
Subject: =?utf-8?q?DRAM_for_Automotive_For_Review?=
Date: Mon, 20 Oct 2025 18:04:22 -0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_110435_418898_9F72F3FE 
X-CRM114-Status: UNSURE (   1.75  )
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
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
Message-ID: <20251020180422.uK18ys8WKs-oJThdUvoz1vrgAFJ8o95bI_M3yVhmv4A@z>

--===============0145272079==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

RGVhci4KCldlIGhhdmUgcmVsZWFzZWQgYSByZXBvcnQgb24gdGhlIGxhdGVzdCBEUkFNIGZvciBB
dXRvbW90aXZlIG1hcmtldCByZXNlYXJjaC4KUGxzIGZlZWwgZnJlZSB0byBjb250YWN0IEphbWVz
QHZpY21hcmtldHJlc2VhcmNoLmNvbSBpZiB5b3UgYXJlIGludGVyZXN0ZWQgaW4gaXQuIEEgc2Ft
cGxlIHJlcG9ydCB3aWxsIGJlIHNlbnQgdG8geW91LgoKVGhlIGZvbGxvd2luZyBtYW51ZmFjdHVy
ZXJzIGFyZSBjb3ZlcmVkIGluIHRoaXMgcmVwb3J0OgpNaWNyb24gVGVjaG5vbG9neQpTYW1zdW5n
IFNlbWljb25kdWN0b3IKU0sgaHluaXgKSVNTSQpOYW55YSBUZWNobm9sb2d5IENvcnBvcmF0aW9u
CldpbmJvbmQgRWxlY3Ryb25pY3MgQ29ycG9yYXRpb24KRXRyb24gVGVjaG5vbG9neQrigKbigKYK
VGhlcmUgYXJlIG1vcmUgY29tcGFuaWVzIG5vdCBsaXN0ZWQgaGVyZS4KClRoaXMgbWF5IGJlIGhl
bHBmdWwgdG8gdGhlIFJlbGF0ZWQgRGVwYXJ0bWVudHMgb3IgdGhlIHBlcnNvbiBpbiBjaGFyZ2Ug
b2YgeW91ciBjb21wYW55LgoKQmVzdCByZWdhcmRzIC8gTWl0IGZyZXVuZGxpY2hlbiBHcsO8w59l
biAvIOatpOiHtOaVrOaEjwpKYW1lcwoKW1Vuc3Vic2NyaWJlXQ==

--===============0145272079==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0145272079==--


Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9654AC61D93
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Nov 2023 11:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:From:MIME-Version:Date:Message-ID:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I4Q3X/d0qJzJADpFKg4CCkDr3Hmi+baRgOhVAP4imMY=; b=PcX6xGi5VP7kSZ
	JdovI+ydIbiORWT7AE4yxuLtXtPuEgW1WaFe804pOuUDEIQGB9Qv0YYLNkgZw7WudtCoRzBd1aBsZ
	QqC4BriM6n22VT+02o7aAfeF+XxDLUR7/Jat5Cnz4j5egUIaLeXWF0iPVUePq8B1jjgqlTRtZWPYQ
	r3WEQfKI4YbVjRL7jHlLwsOhwerwzTCBNsJY4HgAhJaVsce7XSK+wEnKh2wc6TQsBwr2PQUynHXyr
	fZcZpXA0xm7Pjg+Yy5ssyWaztJW7HOyK37TJ1QaOqyz3A371ij0msf1We2FbyUivlpT7IkIB6nVSp
	pYrVrH+j2nxKBy+e6TUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5PM9-00Gcfk-2N;
	Tue, 21 Nov 2023 11:55:53 +0000
Received: from mickerik.phytec.de ([91.26.50.163])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5PM6-00Gcbi-2Q
	for linux-mtd@lists.infradead.org;
	Tue, 21 Nov 2023 11:55:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1700567744; x=1703159744;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QFHzlqh0Z2pgkauDxjEPBqHbAYeBCGexTkEaonY9wcY=;
	b=OKoEEUCCPo7smLdGJAp5wykRz9pXIQGa4fGRDlbza6gxAWTQaUK/gsMpgxNlwDjR
	ddnoYcp2Z9oKItGjGcdelElVCL+WQMEmzEPyEY0g0A1yX7MgvTMPSwTz3wxbc+Md
	ObekBfUdz7TlhEOQPnlPH645VJHn6rSB1AlKtMmxHyI=;
X-AuditID: ac14000a-fadff7000000290d-13-655c9ac0f61b
Received: from florix.phytec.de (Unknown_Domain [172.25.0.13])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 83.6C.10509.0CA9C556; Tue, 21 Nov 2023 12:55:44 +0100 (CET)
Received: from [172.25.39.28] (172.25.0.11) by Florix.phytec.de (172.25.0.13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Tue, 21 Nov
 2023 12:55:43 +0100
Message-ID: <72fe016c-b997-4587-b13a-78e4325a66d6@phytec.de>
Date: Tue, 21 Nov 2023 12:55:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Wadim Egorov <w.egorov@phytec.de>
Subject: flashcp fails with SFDP rev D on a Micron MT35XU512ABA flash
To: <linux-mtd@lists.infradead.org>, <upstream@lists.phytec.de>
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Berlix.phytec.de (172.25.0.12) To Florix.phytec.de
 (172.25.0.13)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHLMWRmVeSWpSXmKPExsWyRpKBV/fArJhUg80LeS12Ny1jt+h+p+7A
	5LF5Sb1Hf3cLawBTFJdNSmpOZllqkb5dAlfG1Fd7mQr+sFe82LifpYFxM1sXIyeHhICJxILr
	95i7GLk4hAQWM0ksP9vKDuHcZZT4sWYtE0gVr4CNxPQ7V1hAbBYBVYkLf3cyQ8QFJU7OfAIW
	FxWQl7h/awY7iM0sIC5x68l8sF42AXWJOxu+sYLYwgKuEv3XD4P1igjYS3z8uoUVot5CYvGb
	g1C98hLNW2eD1QgB2S8uLWeBuFReYtq518wQdqhE55/7LBMYBWYhOWMWktWzkIydhWTsAkaW
	VYxCuZnJ2alFmdl6BRmVJanJeimpmxhBYSrCwLWDsW+OxyFGJg7GQ4wSHMxKIrxb2GNShXhT
	EiurUovy44tKc1KLDzFKc7AoifOu7ghOFRJITyxJzU5NLUgtgskycXBKNTB6pIhcF2dcp60Y
	nxB+53+rWVj367WhpgKntDPMFi3fydXDpmO09s31bVkX9vHmfLVdV/hOvt747uUasbqFVpsS
	+xpCpI3sV7kJpdzrF58bWMx6orzg78NTe58ncEg9FtF5/EOleIOPc8XHG/+fiusz1N3y4efL
	PbbyXDGLuOesWI5zff8bU5RYijMSDbWYi4oTAdf7CctBAgAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_035551_247573_22DE1C59 
X-CRM114-Status: UNSURE (   8.72  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpJIG5vdGljZWQgdGhhdCBmbGFzaGNwIGZhaWxzIHRvIHZlcmlmeSBkYXRhIG9uIGZs
YXNoIGRldmljZXMgaW1wbGVtZW50aW5nCm5ld2VyIFNGRFAgcmV2aXNpb25zIChEKS4gSW50ZXJl
c3RpbmdseSwgdGhlIHNhbWUgc2V0dXAgd29ya3MgcHJvcGVybHkgb24KYW4gb2xkZXIgYmF0Y2gg
b2YgZGV2aWNlcy4KCiQgZmxhc2hjcCBmaWxlIC9kZXYvbXRkMApGaWxlIGRvZXMgbm90IHNlZW0g
dG8gbWF0Y2ggZmxhc2ggZGF0YS4gRmlyc3QgbWlzbWF0Y2ggYXQgCjB4MDAwMDAwMDAtMHgwMDAw
MDBkMAoKQWxsIGRhdGEgZ2V0cyBzdWNjZXNzZnVsbHkgd3JpdHRlbiBpbnRvIHRoZSBkZXZpY2Uu
IE9ubHkgdGhlIHZlcmlmeSBzdGVwIApzZWVtcwp0byBmYWlsLgoKQWZ0ZXIgYSBiaXQgb2YgZGVi
dWdnaW5nLCBJIG9ic2VydmVkIHRoYXQgYSBwYXJ0aWFsIHJlYWRvdXQgb2YgU0ZEUCBpbgpzcGlf
bm9yX3BhcnNlX2JmcHQoKSAtPiBzcGlfbm9yX3JlYWRfc2ZkcF9kbWFfdW5zYWZlKCkgd2l0aCBh
ZGRyPTB4MzAKYW5kIGxlbj0weDUwIHRyaWdnZXJzIHRoZSBpc3N1ZS4KQnV0IHdoZW4gSSByZXJl
YWQgdGhlIGZ1bGwgU0ZEUCBibG9jayBmcm9tIGFkZHI9MCBpbnN0ZWFkLCB0aGUgZXJyb3IgCmRp
c2FwcGVhcnMuCgpJcyBpdCBwb3NzaWJsZSB0aGF0IHdlIG1heSBiZSBvdmVybG9va2luZyB0aGUg
aGFuZGxpbmcgb2YgYSBjb3JuZXIgY2FzZSBmb3IKU0ZEUCByZWFkcyBvbiBNaWNyb24gZmxhc2hl
cz8gQW55IGd1aWRhbmNlIG9uIHdoZXJlIEkgc2hvdWxkIGxvb2sgYXQgd291bGQKYmUgdmVyeSBo
ZWxwZnVsLgoKTGluayB0byBhIHNob3J0IGxvZyBvZiBib3RoIGRldmljZXMgaW5jbHVkaW5nIGlu
Zm9zIGFib3V0IG10ZC11dGlscwphbmQga2VybmVsIHZlcnNpb24gYWxvbmcgd2l0aCBhIGR1bXAg
b2YgdGhlIFNGRFAuCgogwqAgaHR0cHM6Ly9wYXN0ZWJpbi51YnVudHUuY29tL3AvWll5M1JSODhU
UQoKUmVnYXJkcywKV2FkaW0KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=

Return-Path: <SRS0=y4VE=FU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E04C4361B
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Dec 2020 12:07:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 316972339F
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Dec 2020 12:07:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 316972339F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=autotrac.com.br
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oFbiRt+z3JZxatNg/p2jol/dJqMvInuhuwUrJHdKlFw=; b=rbb6xdav82YtpLJk6KGyp50wPH
	nAIom2pAbwR+F7LaYlAVX/yYS/4STweEoiSFcQYbQ17NNQPaN/pIhH7Ce3XyvTnHV2jNCsrpzI7Ny
	H7qmmyyZ+DwdwyfWbEu3HTIBDGO1l4e1/K8/0WMR/lGPTh0YBFftX4r/MagtxSrLLANlL9lDHpfnu
	51hqW9BR+DPs4I8GH8CWIOQuaXHg42lRZKElIHnSty6BFXYC5JEzNbZGjHSzMZ40fc1GxnMKzzkhv
	7rnKCJT/LY9b0idm9rDLa+EhrHW//5t3XWvC1jdenXXPmbJO38Dlbmt86cJtHwsIrzf+iYrDOVGzH
	/LNGsIeA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpVZg-0000SP-6J; Wed, 16 Dec 2020 12:06:32 +0000
Received: from smtp03.autotrac.com.br ([177.69.171.228])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpVZd-0000Qw-OJ
 for linux-mtd@lists.infradead.org; Wed, 16 Dec 2020 12:06:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; d=autotrac.com.br; s=s10; c=relaxed/simple; 
 q=dns/txt; i=@autotrac.com.br; t=1608120509; x=1702728509;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LrD2W7wS5lbGK0wLbQK9f7e9SbGwnyl7GGb9BUWId2o=;
 b=W5B4eDY+2lomQcpGZ2+mB4Jng0hgswcjK83kwb1T+5y2PHqe+QBrni8a3xIb3tpP
 40b8x99avFEViEkG8zrUkMNQTgEab3QpAsZArWuIJrgnCUL22AfSx++Cl3MaSKXK
 jQAuGJWxP0UUu231jLUP0tPCjqnevocqvkuiGbEsbf8=;
X-AuditID: ac1007f2-f2dff70000001ef9-ee-5fd9f8bd9523
Received: from smtp01.autotrac.com.br ( [172.16.1.76])
 by smtp03.autotrac.com.br (smtp03.autotrac.com.br) with SMTP id
 CC.6C.07929.DB8F9DF5; Wed, 16 Dec 2020 09:08:29 -0300 (-03)
Received: from PARDAL101.autotrac.corp (172.16.2.161) by
 PARDAL102.autotrac.corp (172.16.1.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 16 Dec 2020 09:06:17 -0300
Received: from PARDAL101.autotrac.corp (172.16.2.161) by
 PARDAL101.autotrac.corp (172.16.2.161) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 16 Dec 2020 09:06:17 -0300
Received: from PARDAL101.autotrac.corp ([fe80::393d:4533:dc50:c72f]) by
 PARDAL101.autotrac.corp ([fe80::393d:4533:dc50:c72f%8]) with mapi id
 15.01.1713.004; Wed, 16 Dec 2020 09:06:17 -0300
From: Wagner Popov <wagner.popov@autotrac.com.br>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: JFFS2 summary update
Thread-Topic: JFFS2 summary update
Thread-Index: AdbTo1h6sDTsJ73ERKWQOJZqnvJmVw==
Date: Wed, 16 Dec 2020 12:06:17 +0000
Message-ID: <362af714b8e844ea9efb77bc26b06276@autotrac.com.br>
Accept-Language: pt-BR, en-US
Content-Language: pt-BR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.115.41]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOLMWRmVeSWpSXmKPExsWyRoDRR3fvj5vxBkumSlrsblrG7sDosXlJ
 fQBjFJdNSmpOZllqkb5dAlfGwlkvGAtOyVXc3nqFpYHxiWwXIyeHhICJxI51jxi7GLk4hAS2
 MErM3PScFcJ5xyhx4/1uqMx7Rom7z9cxQzgHGCUm/3rOAtLPJmAoseD3IXYQW0RAV+JV0xpW
 EFtYQFZiZcNUJoi4kkTztOtsXYwcQLaexM9tQiBhFgFViZ1z94K18grYSXxbeQfMZgRqnfsH
 Is4sIC6xeMtKJohTBSSW7DnPDGGLSrx8/I8VwlaU+LRtGQvIeGYBTYn1u/QhWhUlpnQ/hBov
 KHFy5hOwi4WASnYuvcI0gVF0FpINsxC6ZyHpnoWkewEjyypG8YLEopTEHAMDI73E0pL8kqLE
 ZL3k/KKCTYzgqGD/tINx74eUQ4xMHJxSDYxBlils5laHUz8/38MSsvdSvM2jS8uk09hPz5f2
 qCvT+vqpxDGu2OjWs6xvy1IfTvjQnPjlivUi0avfX742v6mX8WpOy3s3U6X+AwtXeYg4sS7d
 IbIt5YuMibhMheIB713yLjUp7lKnjB3DI382vSmzTDy9bJZFxQ/3q3MlH/w+59tccipP4rkS
 S3FGoqEWc1FxIgB1loAVOgIAAA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_070630_127023_BF575582 
X-CRM114-Status: UNSURE (   8.70  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksDQoNCkknbSBzZWFyY2hpbmcgZm9yIGEgbWV0aG9kIHRvIGF1dG8tdXBkYXRlIEpGRlMyJ3Mg
c3VtbWFyeSBmb3IgYSBwYXJ0aXRpb24gdGhhdCB3YXMgZ2VuZXJhdGVkIHdpdGggYW4gZXJhc2Ug
YmxvY2sgc2l6ZSBsZXNzIHRoYW4gdGhlIE5BTkQgT05GSSBwYXJhbWV0ZXJzLiBUaGUgaWRlYSBp
cyB0byBkbyB0aGlzIG9ubHkgaW4gdGhlIGZpcnN0IGJvb3QuDQoNClRvIHRyeSB0byBzb2x2ZSB0
aGlzLCBJJ3ZlIGZvcmNlZCB0aGUgR2FyYmFnZSBDb2xsZWN0b3IgLSBHQyB0aHJlYWQgdG8gd2Fr
ZSB1cCBzZW5kaW5nIGEgU0lHSFVQIHNpZ25hbCB0byBpdHMgUElELiBUaGF0IHdvcmtzLCBidXQg
aXQgc2VlbXMgbGlrZSB0aGF0IEpGRlMyIEdDIHRocmVhZCBkb2Vzbid0IGtub3cgYWJvdXQgdGhl
IE5BTkQgYWRkcmVzc2VzIHRoYXQgd2VyZSBhbHJlYWR5IHVwZGF0ZWQgYmVjYXVzZSBpdCBzdGF5
cyB1cGRhdGluZyB0aGUgYmxvY2tzIG1vcmUgdGhhbiBvbmUgdGltZS4gU28sIGl0IHN0YXlzIHRy
eWluZyB0byB1cGRhdGUgdGhlIHBhcnRpdGlvbiB1c2luZyB0aGUgR0MgdGhyZWFkIGluZGVmaW5p
dGVseS4NCg0KSSd2ZSBmb3VuZCBhbm90aGVyIHByb2JsZW0gdGhhdCB3YXMgdGhlIG1lc3NhZ2Vz
OiAidW5jb3JyZWN0YWJsZSBiaXQtZmxpcHMgZm91bmQiIHByaW50ZWQgYnkgdGhlIEtlcm5lbC4g
QnV0LCBieSB0aGUgZW5kLCBJJ3ZlIHNlZW4gdGhhdCBhbGwgZmlsZXMgYXBwZWFyIHRvIHN0YXkg
Y29uc2lzdGVudGUgKG1kNXN1bSBlcXVhbCkuDQoNCkNvdWxkIHlvdSBwbGVhc2Ugc3VnZ2VzdCBh
bnkgbWV0aG9kIHRvIGRvIHRoaXMgYW5kIHRlbGwgbWUgd2hhdCBhcmUgdGhlIGNvbnNlcXVlbmNl
cyBvZiB1c2luZyBpdD8NCg0KQmVzdCByZWdhcmRzLA0KV2FnbmVyIFBvcG92DQoNCicNCg0KRXN0
YSBtZW5zYWdlbSBlIHF1YWxxdWVyIGFuZXhvIGEgZWxhIHPDo28gZG9jdW1lbnRvcyBjb25maWRl
bmNpYWlzIGUgZGlyZWNpb25hZG9zIGV4Y2x1c2l2YW1lbnRlIGFvKHMpIGRlc3RpbmF0w6FyaW8o
cykuIFF1YWxxdWVyIHVzbywgZGVzdmlvLCBzb25lZ2HDp8Ojbywgc3VwcmVzc8OjbywgcmV2ZWxh
w6fDo28gb3UgZGl2dWxnYcOnw6NvIG7Do28gYXV0b3JpemFkYSDDqSBwcm9pYmlkYSBlIHN1amVp
dGEgw6BzIHNhbsOnw7VlcyBlL291IHJlcGFyYcOnw7VlcyBsZWdhaXMgcG9yIGF0byBpbMOtY2l0
byAoQ8OzZGlnbyBQZW5hbCwgQXJ0aWdvcyAxNTEgZSAxNTIpLiBDYXNvIG7Do28gc2VqYSB1bSBk
b3MgZGVzdGluYXTDoXJpb3MgZXhwcmVzc2FtZW50ZSBpbmRpY2Fkb3MsIHBvciBmYXZvciBlbnRy
ZSBlbSBjb250YXRvIGNvbSBvIHJlbWV0ZW50ZSwgcmVzcG9uZGVuZG8gZXN0ZSBlLW1haWwgZSBk
ZXN0cnVhIHF1YWlzcXVlciBjw7NwaWFzIGRhIG1lbnNhZ2VtIG9yaWdpbmFsLiBRdWFscXVlciBv
cGluacOjbywgY3LDrXRpY2Egb3UgYW7DoWxpc2UgZGVzY3JpdGEgbmVzdGEgbWVuc2FnZW0gw6kg
ZGUgcmVzcG9uc2FiaWxpZGFkZSDDum5pY2EgZG8gcmVtZXRlbnRlLCBhIG1lbm9zIHF1YW5kbyBl
c3RpdmVyIGV4cGxpY2l0YW1lbnRlIGV4cHJlc3NvIHF1ZSBzZWphIGRhIGVtcHJlc2EgcmVtZXRl
bnRlLg0KDQpBIEF1dG90cmFjIHBvZGUgdHJhdGFyIG9zIHNldXMgZGFkb3MgcGVzc29haXMgcGFy
YSBwcmVzdGFyIHNlcnZpw6dvcywgc2UgY29tdW5pY2FyIGNvbSB2b2PDqiBlIGVtIG91dHJhcyBo
aXDDs3Rlc2VzIHBlcm1pdGlkYXMgcGVsYSBsZWdpc2xhw6fDo28gYXBsaWPDoXZlbC4gUGFyYSBv
YnRlciBtYWlzIGluZm9ybWHDp8O1ZXMgc29icmUgYXMgbm9zc2FzIHByw6F0aWNhcyBkZSBwcm90
ZcOnw6NvIGRlIGRhZG9zLCBjb25zdWx0ZSBhIHBvbMOtdGljYSBkZSBwcml2YWNpZGFkZSBkaXNw
b27DrXZlbCBubyBzaXRlIGRhIEF1dG90cmFjICh3d3cuYXV0b3RyYWMuY29tLmJyKS4NCg0KVGhp
cyBtZXNzYWdlIGFuZCBhbnkgYXR0YWNobWVudCBhcmUgY29uZmlkZW50aWFsIGluZm9ybWF0aW9u
IGZvciB0aGUgc29sZSB1c2Ugb2YgdGhlIGludGVuZGVkIHJlY2lwaWVudHMuIEFueSB1bmF1dGhv
cml6ZWQgdXNlLCBkZXZpYXRpb24sIHdpdGhob2xkbWVudCwgc3VwcHJlc3Npb24sIGRpc2Nsb3N1
cmUgb3IgZGlzdHJpYnV0aW9uIGlzIHByb2hpYml0ZWQgYW5kIGlzIHN1YmplY3RlZCB0byBsZWdh
bCBzYW5jdGlvbnMgYW5kL29yIGNvbXBlbnNhdGlvbnMgcGVyIGlsbGljaXQgYWN0IChQZW5hbCBD
b2RlLCBhcnRpY2xlcyAxNTEgYW5kIDE1MikuIElmIHlvdSBhcmUgbm90IG9uZSBvZiB0aGUgaW50
ZW5kZWQgcmVjaXBpZW50cywgcGxlYXNlIGNvbnRhY3QgdGhlIHNlbmRlciBieSByZXBseSBlLW1h
aWwgYW5kIGRlc3Ryb3kgYW55IGNvcHkgb2YgdGhlIG9yaWdpbmFsIG1lc3NhZ2UuIEFueSB2aWV3
LCBjb21tZW50IG9yIGFuYWx5c2lzIGV4cHJlc3NlZCBpbiB0aGlzIG1lc3NhZ2UgaXMgc29sZSBy
ZXNwb25zaWJpbGl0eSBmcm9tIHRoZSBzZW5kZXIsIGV4Y2VwdCB3aGVuIGl04oCZcyBzcGVjaWZp
Y2FsbHkgZXhwcmVzc2VkIHRoYXQgaXTigJlzIHRoZSB2aWV3LCBjb21tZW50IG9yIGFuYWx5c2lz
IG9mIHRoZSBjb21wYW55Lg0KDQpBdXRvdHJhYyBtYXkgcHJvY2VzcyB5b3VyIHBlcnNvbmFsIGRh
dGEgaW4gb3JkZXIgdG8gcHJvdmlkZSBzZXJ2aWNlcywgY29tbXVuaWNhdGUgd2l0aCB5b3UgYW5k
IGluIG90aGVyIGNhc2VzIHBlcm1pdHRlZCBieSBhcHBsaWNhYmxlIGxhdy4gRm9yIG1vcmUgaW5m
b3JtYXRpb24gb24gb3VyIGRhdGEgcHJvdGVjdGlvbiBwcmFjdGljZXMsIHNlZSB0aGUgcHJpdmFj
eSBwb2xpY3kgYXZhaWxhYmxlIG9uIG91ciB3ZWJzaXRlICh3d3cuYXV0b3RyYWMuY29tLmJyKS4N
Cg0KDQonDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=

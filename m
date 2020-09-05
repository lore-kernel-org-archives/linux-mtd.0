Return-Path: <SRS0=qoSA=CO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0FC9C43461
	for <linux-mtd@archiver.kernel.org>; Sat,  5 Sep 2020 20:45:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 639D420738
	for <linux-mtd@archiver.kernel.org>; Sat,  5 Sep 2020 20:45:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TR58LNdR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="ELv20a6X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 639D420738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FFWq9Qr2th5SiOTyY5Ornb2XKsDLgYPKG2Azhb9sscA=; b=TR58LNdR8DQlzHZbi/2GXyy1B
	5BlZOmHC4uyikVOBybHNx6E6o0/WXtpwYO2vIpfEyYgsqy6D+mk5sJJu6WsZGslZ5S3XPnB9hipQL
	krwrVK7Nqp7GmMYFzSE3nI0E/zz8bKsP/W2jsxOc/lTObHWK/ngpf3X+L071Rw0dBJCMGF0j9wBkh
	vyxNUG7ZX8liiw0v+3Z0SAh7xaJXRkq5CHRmPuc8c6RHsp6BrG6Xc4cUBifq7JOYQL4t37eFJniYu
	2D1BmH/gvFhu3qHLtCfdvSVP10J9/YhND6KImPAhURNnPsrJ8A8cUPJ/c70KPFTOzGeuLbjtFyI7J
	cRsdexSwg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEf34-00026g-63; Sat, 05 Sep 2020 20:44:34 +0000
Received: from mout.gmx.net ([212.227.17.22])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEf32-00025v-8K
 for linux-mtd@lists.infradead.org; Sat, 05 Sep 2020 20:44:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1599338645;
 bh=srqAocpg+qFA810VKjx0Q4fyVeb/swOxFzZHhnyTYg4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=ELv20a6XJgDEttfp9zoZ4p+RJjgPjUa0PeNl+0OgalamqAyfL7hu+XR0KTcCxoCM4
 6QcZ/PPu6H0osPsI7Y8gJXazKQyjYQUueUW5yWlYF92taNbxXrvYB09LJHdKX7IIW/
 355wLPfE2XjUr8eTGzCNyDh5JtqKpuaozuCDhZfM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.195.151]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Md6R1-1kmtnS02Ut-00aER8; Sat, 05
 Sep 2020 22:44:05 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 1/2] MAINTAINERS: Add ubifs-authentication.rst to UBIFS
Date: Sat,  5 Sep 2020 22:43:25 +0200
Message-Id: <20200905204326.1378339-2-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200905204326.1378339-1-j.neuschaefer@gmx.net>
References: <20200905204326.1378339-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:vHub08Obk2f8katnYdRDwvodrOZOCSe71bpCue3F8Qd4rvhzTSm
 aQvTDKdWAfGK+oaIDMsoZVQGVqOXpapQLdWMKMMNo/mIb3jPySGpn68HqWF+AjxOHgUSoEv
 Wjw5WT0CQ/o47CwDDzhgiTVyNpyDxqAb7uIMDA/RjD6ECivLyFOZdOMMAzjXFpStgndkgZg
 v5ou117OWmn7MxJhEPIZw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:IMAZyOAfxOw=:hAc5ulTA2IhIW/JWArfXLx
 bM7N5cjYrwYAcx0/E2JWrC0BwrqDZKpt1deaP2JSW4qsx0CQGwIWV3C94bvVHWOqP9w26vqZ5
 FxEb3BPYShxfj4VtznANM+tBot8QpwwuIpbIuYpYN6ZP9NtpFm+ePhsZISTReCT7DSDfJ10SO
 bDxRLY7qpoPdkUxXqKmWN7owcV5kAl4oUMoCWH8vHtO3UqELB5h81i6zN57ZNrMY9F0v+tguo
 040beivG5G2gFNx64zAmssrXa1p698TvSTtYCqa6V1j10nzo2JcCjKSt2qXFpusOGGrhqnDmw
 Pf6J76LeE5IZCFv7L9RdcrJuT8birU9YBbd/v9+FXSYGR5R18D1/wcFIfKTWUvi81+1muqbd7
 ia9p35M97ODZqGhSnnBbDnWouSKeY+rFieqE4PYmCdGDgKu1upraJix1l2HXq4/fPulTgde01
 8iSX5PjnBLKGGWgiQMLwJYWbGBSxr2dk5pd7lIjc9gSpLY8QTNc2FhsWynRDczlv53Se1+9lg
 76nlH/se08LPoftqzFroM82eGGgzwpt2A54ymMxGcUroD0n/xWWDRD/1gT4k+plwuwDofSHQA
 emMYw2tPTxmAlMoqrN0uPhe9U0mZryYwh6GQB2CNvjB5z3ctIy2nL+qwO43Frmnr5mDbbv+x1
 hlqtQcvTQ2JfYbEu2WKNmBjOVFuPkC6H7koBGZJeY/UUmXcoWn0GHv+92s/7ZAF6UQ5SRAJpw
 /lrve9a3i4AxRyf5vM9KiIjksySNNPxdFFa0Ad/adUqvRbW4Qo2MIrx91Mwv1gehx930caDTE
 WwudR4E0lXHEyqghYX7jsx7U1dUEogbDyaonGhfILSqjdJX2eQUsFD7sV8dHPiGmSeFlmnUN8
 /nKm0u/A5cLSkLjTPnrrlHDDMjdfIyhkBkYe4zQTSI6/PzKJ5DIr5rACDB1ERcz5mOuVBRBKi
 3I9AzsSgBh+O3BM79TWuh4cM5wYov8bO1oEygSl9AkcxYe78u4v7Qhb5HRELsh4/a33ATH4gr
 FrjzdxiIGZ5X2/Wns+Bkn3l0mv3nd0jC7dXIxDA6pjxTMw5MFb1k8pvN30bB4ZUHpe2bUoKeL
 zfXYeR0anKC06xI62bcFvKg0o9tdAObA2pA24fyWnFsnKz6/ZV3rEGlGuMjDdNer5n3ME74Fq
 ZYT1U1SMoQLNlx3sSm3678zToCjEQ7qMIza3P11SdoULvrbyrEDvRsH4q1l0lOo3kf9zh2hbV
 TB80RF23uTtFEc5bLyfuBZbyRNe2FS1qBTkoA2Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200905_164432_537919_5EF202A2 
X-CRM114-Status: GOOD (  12.12  )
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
Cc: Rob Herring <robh@kernel.org>, Miklos Szeredi <mszeredi@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-doc@vger.kernel.org,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 "David S. Miller" <davem@davemloft.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Tobin C. Harding" <tobin@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

U2lnbmVkLW9mZi1ieTogSm9uYXRoYW4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5l
dD4KLS0tCiBNQUlOVEFJTkVSUyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
CgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwppbmRleCBlNDY0N2M4NGM5
ODdlLi5iODU2NzE3MzYxMDhlIDEwMDY0NAotLS0gYS9NQUlOVEFJTkVSUworKysgYi9NQUlOVEFJ
TkVSUwpAQCAtMTc2OTksNiArMTc2OTksNyBAQCBTOglTdXBwb3J0ZWQKIFc6CWh0dHA6Ly93d3cu
bGludXgtbXRkLmluZnJhZGVhZC5vcmcvZG9jL3ViaWZzLmh0bWwKIFQ6CWdpdCBnaXQ6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcncvdWJpZnMuZ2l0IG5leHQKIFQ6
CWdpdCBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcncvdWJp
ZnMuZ2l0IGZpeGVzCitGOglEb2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL3ViaWZzLWF1dGhlbnRp
Y2F0aW9uLnJzdAogRjoJRG9jdW1lbnRhdGlvbi9maWxlc3lzdGVtcy91Ymlmcy5yc3QKIEY6CWZz
L3ViaWZzLwoKLS0KMi4yOC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K

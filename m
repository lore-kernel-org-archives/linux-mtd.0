Return-Path: <SRS0=qoSA=CO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC31DC433E2
	for <linux-mtd@archiver.kernel.org>; Sat,  5 Sep 2020 20:45:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49825206A5
	for <linux-mtd@archiver.kernel.org>; Sat,  5 Sep 2020 20:45:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tKLYCMXf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="Q+F3ABzx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49825206A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=W4uI/wLRt2lFLgadyjMe19v0jB5MzS/BaML7K/1Euu8=; b=tKLYCMXf3DxRmZ+Hp6lwW55zB
	ojSmoq37zr0SjAeOq9f3+3/BHXKEhDXwPqAhiwjdSkm7lek7Jeu2NvBeh0QOZqRrN1dvO4MCQVl3S
	+2VkMD7HbLABzL5DXLd/nhcQh+AuMC6Ng9NwlDJktvZQ6Hm2SOA2lEUNPZwLDdY7wx+Fpmom0IFT1
	OQWK8RLlhy7rkMhcK1dOyobYvjBhtmgnQXNg7y3prBN7cJGbgEaF980ugjrz7ux6D2UNkWmZ7Nkqi
	MVQD7RboiytbAyWqWfZ053ZnyRoV6T4B0Y23EqR0YrJyMX5uAnn6lsXGCBy8m3MUkho9QIqe2oTAC
	95Z3vj/mg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEf2z-00025g-0c; Sat, 05 Sep 2020 20:44:29 +0000
Received: from mout.gmx.net ([212.227.15.19])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEf2x-000251-AY
 for linux-mtd@lists.infradead.org; Sat, 05 Sep 2020 20:44:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1599338649;
 bh=Be/pWWRCdG9k6oAZQXTcja1Tc2WaPrzbgsSdvaLxfZ4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Q+F3ABzxf6onrrkrNJBPuXNu0dHuu9JfTv44cr3smoCoqnowKl48cJP03RfzrOOgV
 W4NVpd2hjTXwrX9EEkoZAaocaQdV6foAoBm/Vx4baoGrLkHw1eoYcT5xjH8psHIz33
 gM07c/GiOEtF8MWNhGf6Ef9XereN855HQXghhVyE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.195.151]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mof5H-1ktzCz3e93-00p6n5; Sat, 05
 Sep 2020 22:44:09 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 2/2] docs: ubifs-authentication: Add a top-level heading
Date: Sat,  5 Sep 2020 22:43:26 +0200
Message-Id: <20200905204326.1378339-3-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200905204326.1378339-1-j.neuschaefer@gmx.net>
References: <20200905204326.1378339-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:JCZ9dogxu6N+RKhbMPfW1OC69oFNA7oU53WsieXUXkqlBdaEgxw
 hYf9C8XKUtNhM+adsNx2AyU1FWtSjEi+tJO0PI+5RcAUrSnXgUcPBfYmjkkpKs9VgnoA3kc
 CoWDSA6KjQrnwq8KD1aov7dV1gi3/NoD1xAKaeeI7z5nMBrZMP9rGI03q/b5ofl6UVzBVFF
 27/UcfcBJroX8S6wxPeHg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/tKJFPdbk3k=:gQcm/T0WkZ6j+W/XpL/lxc
 wV5Wkmt829NuLGiAFrCJPtKya5IXazn/hlJWwEjxSrB7oSj+BGzBXeMeX0Kg2dVEU5ZRZa+DH
 46/B2zyQFsIDjC6mYTSVv+XbMStQE3/Ani/Swt4mSu1Q8ZdMre1L0GXgJZ5SIFB8FKXp7cHmE
 5tuR81mWAFCTaEuPFedO/H8h4LSWSohFfnrDlKsDh/cfoiKjWBD13111rWMDPOos98/ZI5aXC
 k9c4cD6pzaR2biKqpiLw34T0AieqQ6v7ubNC/rDuMn8gKgA3DhGNr3RJ/1MSsCR9p+DU0KN27
 pMKNgsK6QDuI2xUJ+FVwXbIi6sFNvf+gpNeeoeYkd0jLj5590EcvV20QYcu/Qo0hACnNE46gO
 HPC3hmjS/g9BEtDi8u4vI5d6GvcC/fqwkLYRCIHekx+Bq50hDpR8nIbzMRQIWOfia119NswpZ
 VtX4RmW2KWe3pgndT1BUNx6liyQyTz3tFHpVN7JxavtuW2kLKubc3LvXnp/5zvgkuH3BJKaHx
 iDcQNKix1kD9b8mrmrkodrFB0VLRAtwgs+gzcJgK5YC0W2CND38ZwJoSAzCWIKmakm68OzSLw
 fk8PwbMFkeiQh6G8eteFm0Kjbeo88GpEgjPYDTVHvb+3Bn3vpV6P0E7qfA9SXaQb4mqilLk9h
 z3hOu9w25HnAakxUivbJblwBirV+EnXft5scev6UKtFc6qfcX5wkrqEiuzXh5fZRfC1JVWikX
 +qaUemnQ8n6yY79YA3jQ6Po+awvTuELETQXBedzzqwruDfDDA+BgJ7O7xw3khq0YB8uxbVcVv
 RpbW/O0fNL66YyeuxW6Hm17+ubi7Xj+yQ456NNoDp82/8ngxNXj11HyylOIFY8UH9lPA9obqB
 Iu6G0yf8ypjB6HZaBcLksEcxZaFFHZhsDM7IG7qzi73qgBRvtLkB5CSAlD17J1weAjBImuEPO
 qal/sV5wFVkJbl7oFPlXqjKm3W0xgdx2vXcvLqTOWyNRcdr3F9tEZHTT0PBM/RYSepem9+Z1D
 iD0QHnkIvNRl8NHlKc4pUaM8Wj1YWRZC8VZfSx5dvwB9DSki+HPR83EJOOEXj8dmvOrDLK8DC
 QhPCvhpyLBzZ/hiPA58ih8/JsoromNyNTGg/EVT07WoBemWtiIOP2ixTR1G+qnM3EdaDIG/oT
 KoM8aXAkbdj9zmxOdXk5tmMEzcmKAEBDMXvh55D+H4WrM8j/NIHVEjiXt3NcccQuDs8lQqI8K
 kIdSIiTFQitcFOpHSs0AK3unodCkOrvKIeNTv5g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200905_164427_587222_053B31A5 
X-CRM114-Status: GOOD (  11.94  )
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

VGhpcyBwcmV2ZW50cyB0aGUgY2hhcHRlciBoZWFkaW5ncyBmcm9tIHNob3dpbmcgdXAgaW4gdGhl
IHRhYmxlIG9mCmNvbnRlbnRzIGluIGZpbGVzeXN0ZW1zL2luZGV4Lmh0bWwuCgpOb3RlIHRoYXQg
SSBkaWRuJ3QgcGljayAiVUJJRlMgQXV0aGVudGljYXRpb24iIGFzIHRoZSBkb2N1bWVudCB0aXRs
ZSwKYmVjYXVzZSB0aGVyZSBpcyBhIGNoYXB0ZXIgb2YgdGhlIHNhbWUgbmFtZSwgYW5kIFNwaGlu
eCBjb21wbGFpbnMgYWJvdXQKbXVsdGlwbGUgaGVhZGluZ3Mgd2l0aCB0aGUgc2FtZSBuYW1lOgoK
ICAvLi4uL0RvY3VtZW50YXRpb24vZmlsZXN5c3RlbXMvdWJpZnMtYXV0aGVudGljYXRpb24ucnN0
OjIwNzoKICBXQVJOSU5HOiBkdXBsaWNhdGUgbGFiZWwgZmlsZXN5c3RlbXMvdWJpZnMtYXV0aGVu
dGljYXRpb246dWJpZnMKICBhdXRoZW50aWNhdGlvbiwgb3RoZXIgaW5zdGFuY2UgaW4KICAvLi4u
L0RvY3VtZW50YXRpb24vZmlsZXN5c3RlbXMvdWJpZnMtYXV0aGVudGljYXRpb24ucnN0CgpSZW1v
dmUgdGhlIDpvcnBoYW46IHRhZywgYXMgdGhlIGRvY3VtZW50IGhhcyBiZWVuIGluY2x1ZGVkIGlu
dG8gdGhlCnRvY3RyZWUuCgpTaWduZWQtb2ZmLWJ5OiBKb25hdGhhbiBOZXVzY2jDpGZlciA8ai5u
ZXVzY2hhZWZlckBnbXgubmV0PgotLS0KIERvY3VtZW50YXRpb24vZmlsZXN5c3RlbXMvdWJpZnMt
YXV0aGVudGljYXRpb24ucnN0IHwgNiArKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9maWxlc3lz
dGVtcy91Ymlmcy1hdXRoZW50aWNhdGlvbi5yc3QgYi9Eb2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW1z
L3ViaWZzLWF1dGhlbnRpY2F0aW9uLnJzdAppbmRleCAxZjM5YzhjZWE3MDI5Li41MjEwYWVkMmFm
YmMzIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL3ViaWZzLWF1dGhlbnRp
Y2F0aW9uLnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL3ViaWZzLWF1dGhlbnRp
Y2F0aW9uLnJzdApAQCAtMSwxMSArMSwxMyBAQAogLi4gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjAKCi06b3JwaGFuOgotCiAuLiBVQklGUyBBdXRoZW50aWNhdGlvbgogLi4gc2lnbWEg
c3RhciBnbWJoCiAuLiAyMDE4CgorPT09PT09PT09PT09PT09PT09PT09PT09PT09PQorVUJJRlMg
QXV0aGVudGljYXRpb24gU3VwcG9ydAorPT09PT09PT09PT09PT09PT09PT09PT09PT09PQorCiBJ
bnRyb2R1Y3Rpb24KID09PT09PT09PT09PQoKLS0KMi4yOC4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K

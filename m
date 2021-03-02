Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 503EDC433DB
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 22:21:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B156F64EC3
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 22:21:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B156F64EC3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0LaeYg8BjAflJtHQC/TsmsWk8zvaGFOb/H9Q1XskiYA=; b=bY6lDqnyELh2gqlzwZglq4odH
	N9XwO7YtyJjowd4TU+LT2HluMgEDl/qe4scEtY+smlH6cxhiRQ1/FNl33PfKeDzkSTSPq4A0MfgOd
	j7fegbCXVnXhTdi8dKAURmCI2Vz+iIWm6hCxAz0yvOpwsZgkfDOzDd3JGdHHTNg/Raz70nU1nVaFr
	PthVce6pUU9jvToAMpeUsS0yBc8f58ktP/X/7OT5+V98h23Apd9Iw3hMJM5Rafjdsf4FFc+kIs2Qh
	iWX5n9avU2aNCcWe56Wp0lmFMHr9dei2k2xT+tB2iztA3RMGwM5qtkrlJO6RH/SsTrzH0Zb6bLpKD
	Nkdf+PYmQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHZnR-006jTB-P8; Wed, 03 Mar 2021 22:17:21 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHTAn-005KgQ-Rr
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 15:12:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=jWXB60fdbmA0b6w81seNejwRjlJlorwau1WeLcMjZs4=; b=GGJ6TkWzywQg5U3THxcl6oKFwP
 IE3wbMLCFmZSknGQMnYIXUdEkCEw7BUdsaILivz9fM6AKahwuSNyN6FQ79GDZtY74CxGdqY9xqnxe
 VdZUW0aB+ftq57to4K4zC3AePfNMDNfECuoxVQtYM4qbSH1xj3rHk7E6wDPFHvyl86Zbzkq0PpOQ2
 +R5ok+o2sBuVuZRXuysKgT50JAZt2OkpdUTI2RurRq81tjGplZjoRUaHN5wSQnvUy0iZA95dMtsDy
 h/EtXwznJQv5a5BrrqJNcYJUwpADP/GFg1v3kQa+dQXeRi+9hTAOFEpVhPTU/JXgcKUniTm2bRKtd
 +qtQLxvw==;
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH8ay-00HW7X-Ot
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 17:14:08 +0000
X-Originating-IP: 86.206.8.148
Received: from xps13.stephanxp.local
 (lfbn-tou-1-491-148.w86-206.abo.wanadoo.fr [86.206.8.148])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 5338A1C0007;
 Tue,  2 Mar 2021 17:13:39 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 =?utf-8?b?UmFm?= =?utf-8?b?YcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Vivek Unune <npcomplete13@gmail.com>
Subject: Re: [PATCH V4] mtd: parsers: ofpart: support BCM4908 fixed partitions
Date: Tue,  2 Mar 2021 18:13:38 +0100
Message-Id: <20210302171338.811-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210301105823.31032-1-zajec5@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 457da931b60868580d878c0b683df6114870042d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_171408_475418_55941E19 
X-CRM114-Status: UNSURE (   8.19  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyMDIxLTAzLTAxIGF0IDEwOjU4OjIzIFVUQywgPT91dGYtOD9iP1VtRm1ZY1dDSUUx
cHhZSmxZMnRwPz0gd3JvdGU6Cj4gRnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tp
LnBsPgo+IAo+IFNvbWUgZGV2aWNlcyB1c2UgZml4ZWQgcGFydGl0aW9uaW5nIHdpdGggc29tZSBw
YXJ0aXRpb25zIHJlcXVpcmluZyBzb21lCj4gZXh0cmEgbG9naWMuIEUuZy4gQkNNNDkwOCBtYXkg
aGF2ZSBtdWx0aXBsZSBmaXJtd2FyZSBwYXJ0aXRpb25zIGJ1dAo+IGRldGVjdGluZyBjdXJyZW50
bHkgdXNlZCBvbmUgcmVxdWlyZXMgY2hlY2tpbmcgYm9vdGxvYWRlciBwYXJhbWV0ZXJzLgo+IAo+
IFRvIHN1cHBvcnQgc3VjaCBjYXNlcyB3aXRob3V0IGR1cGxpY2F0aW5nIGEgbG90IG9mIGNvZGUg
KHdpdGhvdXQgY29weWluZwo+IG1vc3Qgb2YgdGhlIG9mcGFydC5jIGNvZGUpIHN1cHBvcnQgZm9y
IHBvc3QtcGFyc2luZyBjYWxsYmFjayB3YXMgYWRkZWQuCj4gCj4gQkNNNDkwOCBzdXBwb3J0IGlu
IG9mcGFydCBjYW4gYmUgZW5hYmxlZCB1c2luZyBjb25maWcgb3B0aW9uIGFuZCByZXN1bHRzCj4g
aW4gY29tcGlsaW5nICYgZXhlY3V0aW5nIGEgc3BlY2lmaWMgY2FsbGJhY2suIEl0IHNpbXBseSBy
ZWFkcyBvZmZzZXQgb2YKPiBjdXJyZW50bHkgdXNlZCBmaXJtd2FyZSBwYXJ0aXRpb24gZnJvbSB0
aGUgRFQuIEJvb3Rsb2FkZXIgc3BlY2lmaWVzIGl0Cj4gdXNpbmcgdGhlICJicmNtX2JscGFybXMi
IHByb3BlcnR5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWls
ZWNraS5wbD4KCkFwcGxpZWQgdG8gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCBtdGQvbmV4dCwgdGhhbmtzLgoKTWlxdWVsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=

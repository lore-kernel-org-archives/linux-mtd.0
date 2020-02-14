Return-Path: <SRS0=cpaL=4C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82E5DC2BA83
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Feb 2020 17:11:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CC6B20637
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Feb 2020 17:11:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BH+JiJFa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="CSnRtHNY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CC6B20637
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eukyzf2qEW8i3QwkO8hThkzunU+v8wQVfwxmFIwekPk=; b=BH+JiJFaAildNE
	4WrpD+zDgoZALYgHXJvSDk7ycbUBPRdvimhFrYhZ2g+J61Q8VjyRztevPzkQl5dUZp/HtBohzt6jg
	jLdvZA8juONVmijIZdy3686MpdmOFymkeUxFQV8ChZICd0Ns5TAJOGigPGvSrRxn5lPldVbwJER6G
	ej8ylfmVrV8U645OjD2DuxoE9vTXjiuTRbvOhAejlMP8Udo5N2ImVCt/QhW+oRfHGXfJqPsJTrD1R
	kxmJM1UCK49qvT//xSPYShE3SzLStXg5slmDKGap7qKfryjKfd2b35aVUPNEEg3lG/O27LqvEC6vL
	MWZOsiydJpwujLzG+HpQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2eV3-0000nr-CC; Fri, 14 Feb 2020 17:11:33 +0000
Received: from mout.gmx.net ([212.227.15.19])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2eUK-0008U7-4Y
 for linux-mtd@lists.infradead.org; Fri, 14 Feb 2020 17:10:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1581700219;
 bh=eLMiagqOTLo0Fe/eUccWWaRAzlh3W3WBBNSVjdyDeUw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=CSnRtHNYRCXuK+aBmFanayRkMjOeJZYH/9P92XEeHHVq1Y0cGMUpQ8Vfx+ZIL8F2H
 krlBCChypzqVYgyQjG0cSAjL6Gukxk6jEZYmbWmOrUXNe6OixPXomA/KMiHvxwza74
 NzGxB1i6m676axNAEoXCD1Q0LWqlkuOImqWJS/c8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.214.12]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M9o1v-1j6Cqd3y9F-005to1; Fri, 14
 Feb 2020 18:10:19 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/4] docs: ubifs-authentication: Add a top-level heading
Date: Fri, 14 Feb 2020 18:08:05 +0100
Message-Id: <20200214170833.25803-2-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214170833.25803-1-j.neuschaefer@gmx.net>
References: <20200214170833.25803-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:oxp8U1MKXiQ6HnjYqIf7xioUtO3cN711dKpnmsvNQm3K62qLzoR
 lUghIYWoTuZNFgwtwb98ByRUGrm5H75dKw5yhLeN5BbVaLqmLvGSxwHFva4gSpNuLRjXxny
 Qvnun5mHzJivOus+IShpvKvwbYVRC+R7GLZJIXSXNKDrqvw9iMbGv99qEU4GFaZbgr4V3aH
 FzGlBKMl8XK5EJfdXf/Fg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tgBDfQi+c7k=:PKbXmSYEs/3x5wtfvmEl0Y
 eDBL06MIj6Hx8+nM3NxmrJiNM+Ipfy2skD46CenQimh9eety5c8l0D1z3Mbrh+kNkPQf7PJ1A
 wYoUlxJa9+4a6DNAWC9M7pl6eXAOW9/UcG1litBtbqRLfQ87tvDrBz/7uZLzVXN9XpxN2wGIQ
 FvwkPdhYYL/xGdHsh3rT80PlgpBg3MKfrwJi6+lD9925r6TneE8dlp4fQUTCU7Yh/xfR31g8x
 Gr9T9wFVyDq0qLzyUCVFYlrQj8dukZKlvU9ZlO5TyxSh3NUkQbx1JT2BFopekEtuyd8Bscs0p
 E4D43u4krmxLd9PEru/458K71Yl4y59CBUOqYFGN6LIsyBJr/aR0l6OG5ILzFeAejLBOcVOYm
 Q+2c3xbRrQ664v7q6vMWuljEXgrb7pq9Lx3HUfi8VgUHCvuHrhHzdIZ89tTznA3bVd2A3Q0Ev
 yy3sM46AwoV3eWl2HOHmaUqF/G2Q5LPq/4BROMSEj/F2cxz9Ks34TtgTlK9Fu1b/W2WPF+GCA
 bwSiiQv6ZqFKLakuwxcRV4XriHLiJUDCS46Vnt/a1ueTgWwlfM9hgNbtq5HIFCUFcwdhuBvVV
 cjNU3ZE6vt+vS7b5FMRRCPWZqeq1ShgbjzZ2XAn2UAFO4Mlw0l5xi7qXjMaHX8Nm/8IKurgJy
 j/Bjg3pvBZNtJEU2HLar1+bfO6bcHwo4mzp2T6mvcSsod1kg7FrK5ZBKt4b/aSsRA0ninHlKu
 xdttoNBWef/+hWtfyr00hiKUH/SsFOWMO0mcP7QanNrfntBCoArhwbjODW3H3a2uoWYdEl4gm
 jlO1uoZmxog84V8sP0VTMhUYQ+ukIhmEEG1OiZxPa97FHL4sxNEhznamtNwB4WLuTgYdvzdwH
 QungWdVjmW6S+dn9sexrRKy3g8BSCgElGVkUZ37+28iByuIjtz2sLHkNr+Fgyz0R57i2WwxKz
 2+t9hOKAsgWyUBjulFjfo3eVjwS/VowJwAD5QRljgOxCs7LLcZ7ZhbBubtWDrJKlibBs86bo7
 t+3LVw98XybPDRXpzyw4LFhPaEOAEw/fd/kt/0W8SddiOmkkghUPh+m0UmDGuBBWGyhU0mZxU
 LKqCJAgHovhZJp2HDU5ZqV82CSQF12mff+55tqbS+tqKHPWk5Hw/hK+BWhuCM2jWc+a/ArteX
 zvWpzpvVHkwWT3TvafyQvXYSXWW8h2VVWrgeG6kWcXRFuJ4z6YEPdhHliFCbNQmLC7ZsUkQ9X
 1tuOs5GTc25SAcUTB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200214_091048_482468_89881EEF 
X-CRM114-Status: UNSURE (   7.62  )
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

VGhlcmUgYXJlIHR3byBjaGFwdGVyIGhlYWRpbmdzLCB3aGljaCBvdGhlcndpc2UgYm90aCBzaG93
IHVwIGluIHRoZQp0YWJsZSBvZiBjb250ZW50cyBpbiBmaWxlc3lzdGVtcy9pbmRleC5odG1sLgoK
U2lnbmVkLW9mZi1ieTogSm9uYXRoYW4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5l
dD4KLS0tCiBEb2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL3ViaWZzLWF1dGhlbnRpY2F0aW9uLnJz
dCB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZmlsZXN5c3RlbXMvdWJpZnMtYXV0aGVudGljYXRpb24ucnN0IGIvRG9j
dW1lbnRhdGlvbi9maWxlc3lzdGVtcy91Ymlmcy1hdXRoZW50aWNhdGlvbi5yc3QKaW5kZXggNmE5
NTg0ZjZmZjQ2Li4xMmJhYmI5NWE4MjIgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZmlsZXN5
c3RlbXMvdWJpZnMtYXV0aGVudGljYXRpb24ucnN0CisrKyBiL0RvY3VtZW50YXRpb24vZmlsZXN5
c3RlbXMvdWJpZnMtYXV0aGVudGljYXRpb24ucnN0CkBAIC00LDYgKzQsMTAgQEAKIC4uIHNpZ21h
IHN0YXIgZ21iaAogLi4gMjAxOAoKKz09PT09PT09PT09PT09PT09PT09CitVQklGUyBBdXRoZW50
aWNhdGlvbgorPT09PT09PT09PT09PT09PT09PT0KKwogSW50cm9kdWN0aW9uCiA9PT09PT09PT09
PT0KCi0tCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==

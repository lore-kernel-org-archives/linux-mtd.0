Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE84C47258
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Jan 2024 08:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yuas5jJvu6Lp3v5DoAsk0e90TESIJZ+1eEZWwM4dRl4=; b=ZESkG75Nt3j7mY
	ld/GM7vjPAkrICPD3lF4K+blGxib6MWevnn6qqYLcKzdOSMX6Wfl6bSWn6iyeH9G4FozR0A7/oZRv
	NxJ/mBgSzsIPZqt8aynWNQ+Stkq4NvKSOlFLX5z9GUTpUZJQv/diE23yDN7ZMrfJqZW2H1K+hy5JI
	XOCIzZ5Jdr6nIUuSewyczPw595NtdDQUat3Se6AMLSdk7mYJW8tcay3MOTrRqOKSNebee/LJ7rBTm
	2OUQEXs3+tY+iY/aQe5yRVcuoiV0V1Ds8ulZ7v4ZhWSyOIxNxQ1Zv10Ej97FaUvxU2lkSctS2Gg0P
	imy0OTs5eUuU5Hs1C4jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV66S-000000029v2-1u7f;
	Wed, 31 Jan 2024 08:37:52 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV66Q-000000029u8-2l1l
	for linux-mtd@bombadil.infradead.org;
	Wed, 31 Jan 2024 08:37:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=V4qwQGqC7KpJoyielzRpnopuINFIOvKXsSgJ3ZENIXU=; b=TVlLAvkdZZS0dfRMzF0c6jQWTl
	FaYC8y5pvQyuXqdQuYHieIJseJpECbb4ERUHISyDH3+j5dLpYvRzSDnsfYVj29IQcbC2yelKAbxmv
	e1JrEs79B/z+ce6BabraksM4pVbyhNs85IGhaxjbJfWs5gT6hKpQZl+YED1j2oNo5uCPO6d3b3bcc
	/9oC7JRjUTohqW/Zmx214CDWQae920QhEfAJIF6/BNIM2ZZrs3ZCx6PJCNwttGUS/znlt8JekmNfr
	7AtdkeV8pa0Ijd0AL58sxTip6DKqjTsHYkV3Y9p6goiYud+ud+9ylZlJN5OWaxrJG+7Uq/pf74ZUz
	MyAVAG1A==;
Received: from mail.quirkbyte.pl ([94.177.238.152])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV66K-0000000CCyF-2z6k
	for linux-mtd@lists.infradead.org;
	Wed, 31 Jan 2024 08:37:48 +0000
Received: by mail.quirkbyte.pl (Postfix, from userid 1002)
	id C1DB8839A5; Wed, 31 Jan 2024 09:36:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=quirkbyte.pl; s=mail;
	t=1706690242; bh=V4qwQGqC7KpJoyielzRpnopuINFIOvKXsSgJ3ZENIXU=;
	h=Date:From:To:Subject:From;
	b=HabT700pB1voiq3NzILFfwdKDR7rjO7AxCiWwHSaHCN3EdoEWYI8ZoDDiPaXxhseS
	 TJ0WN4SCexxYSG2aQGCwe8QkRpFYtBAJfa7bL0dXAOHEqyJ/tpX1f0JOoThOI8QZy2
	 BllgwOALeLGHjnaGVk4cqhwJ1c09xO/wDQUtARTHYOQ8Gz0kGGKsqw+sWpvxFMC1YZ
	 AF7vMawr3NK1u10Zpe9dl/VeJ7O/WG50tDVlAHSvlODO614FonD9/TKGZD8JiIeh+l
	 XSr/Ub6SdwuNwQ3+qzXNjVdneIGjspT8vmb1btJ1hyrsCc1tFjrCzKcIW9oUnP2wLI
	 iCMtp68O1DnsQ==
Received: by mail.quirkbyte.pl for <linux-mtd@lists.infradead.org>; Wed, 31 Jan 2024 08:35:46 GMT
Message-ID: <20240131084500-0.1.10.iwt3.0.fgypnl74fe@quirkbyte.pl>
Date: Wed, 31 Jan 2024 08:35:46 GMT
From: "Norbert Karecki" <norbert.karecki@quirkbyte.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Fotowoltaika - propozycja instalacji
X-Mailer: mail.quirkbyte.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_083746_726066_156C2F7D 
X-CRM114-Status: UNSURE (   1.59  )
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

RHppZcWEIGRvYnJ5LAogCkN6eSByb3p3YcW8YWxpIFBhxYRzdHdvIG1vbnRhxbwgc3lzdGVtdSBm
b3Rvd29sdGFpY3puZWdvPwogCkluc3RhbGFjamEgZm90b3dvbHRhaWN6bmEgamVzdCBuYWpsZXBz
enltIHNwb3NvYmVtIG5hIG9ibmnFvGVuaWUgd3lzb2tvxZtjaSByYWNodW5rw7N3IHphIHByxIVk
IChwb3pvc3RhasSFIHR5bGtvIG9wxYJhdHkgc3RhxYJlKSBpIHphYmV6cGllY3plbmllIHNpxJkg
cHJ6ZWQgcm9zbsSFY3ltaSBjZW5hbWkgZW5lcmdpaSBlbGVrdHJ5Y3puZWouIEplc3QgdG8gdyBw
ZcWCbmkgb2RuYXdpYWxuZSBpIGJlemVtaXN5am5lIMW6csOzZMWCbyBlbmVyZ2lpLCBkemnEmWtp
IGN6ZW11IHByenljenluaWFteSBzacSZIGRvIG9jaHJvbnkgxZtyb2Rvd2lza2EgbmF0dXJhbG5l
Z28uCiAKRHppYcWCYW15IG9kIHdpZWx1IGxhdCBuYSByeW5rdSBlbmVyZ2V0eWN6bnltLiBQcnp5
Z290dWplbXkgcHJvamVrdCwgd3ljZW7EmSBvcmF6IGtvbXBsZWtzb3dvIHd5a29uYW15IGkgemfF
gm9zaW15IHJlYWxpemFjasSZIGRvIHpha8WCYWR1IGVuZXJnZXR5Y3puZWdvLiAKIApDenkgY2hj
xIUgUGHFhHN0d28gcG96bmHEhyBuYXN6xIUgcHJvcG96eWNqxJk/ICAKCgpQb3pkcmF3aWFtCk5v
cmJlcnQgS2FyZWNraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K

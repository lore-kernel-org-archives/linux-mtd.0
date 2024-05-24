Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A653C25B79
	for <linux-mtd@archiver.kernel.org>; Fri, 24 May 2024 07:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yuas5jJvu6Lp3v5DoAsk0e90TESIJZ+1eEZWwM4dRl4=; b=uz6N7V05nQ/lFV
	454RoodC+5EOR4PLPRAK6ulqcpxz2JCahaYIravAJakq1O20sFEouBP6x1tIDpaQgesBuTArm/AzS
	OhVJaupF0tUk6lqUABXI6/ByncJzy11/B1L4Q3DQgN0fA+jHkBuvCA+zxG80gX7iLXbfjhPdzNnaq
	fV4+4Feof1qe6tWAmdscm0cF1P2zL0WBxRboYonpi92mGzTK3HLojYccM5qifsxNQjIa5m4Iuhn2E
	Li6sf1gQHT0Oi30gtshdCBpPMsIybXNnhXEONBYZi2W5B9ppByXDFt336kWgHM8Fk1NqJALD5+bCo
	8EFG9A/We7ej4AvSFFVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAPYy-00000008IEh-2kD6;
	Fri, 24 May 2024 07:42:04 +0000
Received: from mail.quirkbyte.pl ([94.177.238.152])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAPYw-00000008ID6-0h4N
	for linux-mtd@lists.infradead.org;
	Fri, 24 May 2024 07:42:03 +0000
Received: by mail.quirkbyte.pl (Postfix, from userid 1002)
	id C9F5E86ECE; Fri, 24 May 2024 09:41:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=quirkbyte.pl; s=mail;
	t=1716536520; bh=V4qwQGqC7KpJoyielzRpnopuINFIOvKXsSgJ3ZENIXU=;
	h=Date:From:To:Subject:From;
	b=QdGQKMK6HNu0HeERfX4Ts1VHQg2p2T+x6hat1ra7sP2RFfTNn43BStBg+hgjl6FhF
	 wDTJIq+NHy+QIwNIeFoxjByMieHgidLkO+o8OoTOUX5Pe/KfuFulcNvpBXpo4cvT+t
	 aMb4LO5R1LBapTOmjiubDJI7FiqIQu4hYSylhR6KAzOubrhl7viagueP6D2sq6riwE
	 H0/zVxkw97xo9+B6j9lZUhNvZaR1cbV5Jb/zZrlPAuTmmF5idcdk5ZvNBgbjqmydMm
	 tTuhTUwUdPoNsia+gf59SISQYtlMmENGBWhv0MwM+bqQG+smfXk+EWyZpak+N2vedE
	 7nZwN7VsOpPFA==
Received: by mail.quirkbyte.pl for <linux-mtd@lists.infradead.org>; Fri, 24 May 2024 07:40:52 GMT
Message-ID: <20240524084500-0.1.37.1t0u1.0.9j24zoic1n@quirkbyte.pl>
Date: Fri, 24 May 2024 07:40:52 GMT
From: "Norbert Karecki" <norbert.karecki@quirkbyte.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Fotowoltaika - propozycja instalacji
X-Mailer: mail.quirkbyte.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_004202_363761_57B8F1E1 
X-CRM114-Status: UNSURE (   0.71  )
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

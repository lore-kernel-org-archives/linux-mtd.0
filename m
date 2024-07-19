Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34BFAC3DA59
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Jul 2024 08:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yuas5jJvu6Lp3v5DoAsk0e90TESIJZ+1eEZWwM4dRl4=; b=E57vF9Q6MEvXbS
	UcDI+RzxJBc0hvBWRSlp1gfVu8ryzt0chN4OzYaFcg3hry04kMHUL53qzHMKUy4gYoMm929Zhh7ys
	BylneVOhAcfK7n4SmAh6BnKyPsa5HEQCrvW0IpnrkwKeDP80iRIXSjA/HB3ogNUGK3l/64r2NhBx/
	dopECxtkjrrPx8XtNo66V8ccgeC7fngVt24RpccOlN4shA3m3/beCciTlGBQTPMobkI81zW7/wW/i
	Bh45AxpKzQsszyTQmO0J3/gyntycbtLJDsx4V1hsfd7qc9X5g6QI0FvxBHgt3+U/wOrDb+bkuZzes
	DVFF4sHJcW9EPq16rfGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUiqI-000000022e8-2dQx;
	Fri, 19 Jul 2024 08:19:54 +0000
Received: from mail.quirkbyte.pl ([94.177.238.152])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUiqF-000000022dM-27VD
	for linux-mtd@lists.infradead.org;
	Fri, 19 Jul 2024 08:19:52 +0000
Received: by mail.quirkbyte.pl (Postfix, from userid 1002)
	id CB12789BE9; Fri, 19 Jul 2024 10:12:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=quirkbyte.pl; s=mail;
	t=1721376750; bh=V4qwQGqC7KpJoyielzRpnopuINFIOvKXsSgJ3ZENIXU=;
	h=Date:From:To:Subject:From;
	b=O16kNroN/CFiIbTHa/zFs7KHqsB2KCz9s+6vqfxsGIVgvrlM905WGgQtiSOpusK43
	 aRE+D+LsjwuogJoPZ8x01JIMgcOMfHw0zwf9DaFOm187PQS1gqEn5YAMovQ7At9HdQ
	 +V0UMTzShwOS235Yn5/DsUMEmCrMXIvnK0lpy65Nspujoa3hnAqbwBleUvPk6bAxMn
	 ntT8BB12UuaZuvR6yRiKGKg8xPjJVss0bbC0QXYzVO9jvGOEsoUZWHD5u2MA8VJ6Sn
	 5649guTn4nIwjqY0qYMY1gE+a6AuIqkYdZ8HBrvTX5KcMMFRyMEnAWGF7ED1+xpCBZ
	 U/1wh6cFPI32A==
Received: by mail.quirkbyte.pl for <linux-mtd@lists.infradead.org>; Fri, 19 Jul 2024 08:11:13 GMT
Message-ID: <20240719084500-0.1.4a.2h2fa.0.pwiigg4k7a@quirkbyte.pl>
Date: Fri, 19 Jul 2024 08:11:13 GMT
From: "Norbert Karecki" <norbert.karecki@quirkbyte.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Fotowoltaika - propozycja instalacji
X-Mailer: mail.quirkbyte.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_011951_697978_07B4578C 
X-CRM114-Status: UNSURE (   1.37  )
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

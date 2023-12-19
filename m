Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6CEC46CA2
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Dec 2023 08:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yuas5jJvu6Lp3v5DoAsk0e90TESIJZ+1eEZWwM4dRl4=; b=iMRKj9JTOGWcDh
	xR5USvUYpuwAD60cmsD7DfdGeG6ah0vBbnUVD7PthV+QxRyPBDGdnwKt1/26EK0cyV1LrDUd8zZol
	SM5eLFnNOpoN65/cTMfWptpoYJtjnsc3CTjjoDBYyGKxWIg56/IRJSOC9IYFB2fzkyIMVurHQjnxf
	2z7AUO52vVyGk0EOW3Fji7wKYZ+GElVBBsOwNDURhiA56t1Y1+mnoAxQCDjTvj+dXSYA6lLpEb6aM
	ZVY/05022zGkZq7uXnSS8DEQk5Okgxe1ChJyghXMhWh55P0/F67oMelhIV7+inIw4tLW7rjMCysj7
	yQPxVXJufsN7GeCsMVrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFVYT-00DK3n-1U;
	Tue, 19 Dec 2023 08:34:21 +0000
Received: from mail.quirkbyte.pl ([94.177.238.152])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFVYP-00DK2z-04
	for linux-mtd@lists.infradead.org;
	Tue, 19 Dec 2023 08:34:19 +0000
Received: by mail.quirkbyte.pl (Postfix, from userid 1002)
	id C918D83E1F; Tue, 19 Dec 2023 09:31:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=quirkbyte.pl; s=mail;
	t=1702974724; bh=V4qwQGqC7KpJoyielzRpnopuINFIOvKXsSgJ3ZENIXU=;
	h=Date:From:To:Subject:From;
	b=qZUReIbaTa2wFgJ9oVvw4Y10GuVyM737HFt2oYRNuOBj03koKoAh0es8CYUlLuP3k
	 es9AFoPHICSa9W3/l3/wqD2zTQoMbbzCz6KKszE88wC3Yj2+rIRnGW9aUrBu1Wns0J
	 uphLCEgN7YpuRuKelI81MLd/ojbQngQi+S/S6nIIu0TRGxeWOQ6bgw5hsF2hAWvYjc
	 dETzE+PebVw2srXexsMbJTNolyNK0d8U8db5m/WHk4pUS+xNpBwJtHuX3jm3otShhu
	 Rs6Z7XGYOUyt0AoyPbTmUGsIeK//FEHzD3bNIblwJbNA5Mo+y2pIuTxr4WRtK1yVdV
	 8rBOw9VOt0HiA==
Received: by mail.quirkbyte.pl for <linux-mtd@lists.infradead.org>; Tue, 19 Dec 2023 08:30:16 GMT
Message-ID: <20231219084500-0.1.9.26gt.0.t55pvh5phi@quirkbyte.pl>
Date: Tue, 19 Dec 2023 08:30:16 GMT
From: "Norbert Karecki" <norbert.karecki@quirkbyte.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Fotowoltaika - propozycja instalacji
X-Mailer: mail.quirkbyte.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_003417_829275_A6770B22 
X-CRM114-Status: UNSURE (   2.41  )
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

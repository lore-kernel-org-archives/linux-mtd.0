Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC55AC3DA64
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2024 08:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yuas5jJvu6Lp3v5DoAsk0e90TESIJZ+1eEZWwM4dRl4=; b=ZPvZM/c90F5wkZ
	Txt8EBh2WtdwB48FwhNtHAgp9JC0nt2SmWUXEsf7VOC8SJwHTYhSc51k2bm9bmDXumlKfBLfMVUt1
	rYjWWAef1v07/Er7yN95AmfZb7swXfSuQVYaOHoiNVzNiY+9rxoBFXYF2r6fF7dYXDEPPHo82knRN
	9ikkqgs35fyiaxhtyN165rdNhSM4xua34TVJkz6HLY6p/8t+EP13b0WGbeRfVJkKghsYjg7n/+65K
	4jgQAba/y4/U8NxunX8db8Agq09rmsPFy+RAUdeV6hgRxyUk9lqNu1mAx8wgFgXXxSd79fEYlioyU
	xOicGeZF4QpdyWxORLDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZR9G-00000004LgG-17kc;
	Thu, 01 Aug 2024 08:26:58 +0000
Received: from mail.quirkbyte.pl ([94.177.238.152])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZR8k-00000004LYA-1urF
	for linux-mtd@lists.infradead.org;
	Thu, 01 Aug 2024 08:26:28 +0000
Received: by mail.quirkbyte.pl (Postfix, from userid 1002)
	id C7FCD87F5B; Thu,  1 Aug 2024 10:16:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=quirkbyte.pl; s=mail;
	t=1722500243; bh=V4qwQGqC7KpJoyielzRpnopuINFIOvKXsSgJ3ZENIXU=;
	h=Date:From:To:Subject:From;
	b=U93hfKgk/zrJYIe1/5eAryYM10MmV2qNG/1q1uBE3v1B0IW89imLfGLbFFtltxbI5
	 P/IYBUvQpgLEQ2s6dHMEPq81BXP7xxBhNpzPsDNjIEKel/QA6fiPz0kaDAiC209BpY
	 y21ucOtUVDlUSPrCZlaDEJV26GtsjOadOZ9s1fNQUC7aqHJDBPrgVWA9YRcOMxNpaI
	 RRhVTiTTYMecrVFFS+qqWoYNtT2hz8A3rAlH7/C49VS8mEARG1uDOiiSG3vsd4JuPi
	 1oyNutGH9lwC20tMz6m4PvdXa0bD/KI4kWdlCzMeRrf2muebrGtvgf+37vOVJKHjYN
	 dz8Zpa+e5ZmKQ==
Received: by mail.quirkbyte.pl for <linux-mtd@lists.infradead.org>; Thu,  1 Aug 2024 08:16:19 GMT
Message-ID: <20240801084501-0.1.4j.2lzkr.0.71cery024h@quirkbyte.pl>
Date: Thu,  1 Aug 2024 08:16:19 GMT
From: "Norbert Karecki" <norbert.karecki@quirkbyte.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Fotowoltaika - propozycja instalacji
X-Mailer: mail.quirkbyte.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_012627_193268_8DAEC738 
X-CRM114-Status: UNSURE (   1.73  )
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

Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6CFC3064D
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2024 08:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yuas5jJvu6Lp3v5DoAsk0e90TESIJZ+1eEZWwM4dRl4=; b=aRXfNHWQgf+p5C
	gsS/chG+a00MgHHU8ukGbjAzbP7ItUKTdp52RZmUqxCtePb1qUg1SN2xYbJWeYihcNdOX5dL4u0/n
	hjZeyeNTNmF1NW9vJ+VD7509da/uqnoXW7v9WDxMlf1cZY4M8VCpyJXNLwobF0nlHRNLptimO0iB2
	iLwauUXeij/h3DjhITySv3CG0BoZU/cy5InpOPTDN2tpAAhly89TmQQLsW0mAUW2lxId/W1ODl9DG
	me28PyOf3Ku8MxdHGNu5+vvlRySbe2DWRqw4zeF3AjxCgJ1nMDl6GmIRHbLqwqiPQLzj7nPX2I/df
	IK8v+Th8OTIkchb4jPwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN6eV-0000000D0jE-1s65;
	Fri, 28 Jun 2024 08:08:15 +0000
Received: from mail.quirkbyte.pl ([94.177.238.152])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN6eS-0000000D0iR-274Z
	for linux-mtd@lists.infradead.org;
	Fri, 28 Jun 2024 08:08:13 +0000
Received: by mail.quirkbyte.pl (Postfix, from userid 1002)
	id 6E44A8BE3D; Fri, 28 Jun 2024 10:01:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=quirkbyte.pl; s=mail;
	t=1719561772; bh=V4qwQGqC7KpJoyielzRpnopuINFIOvKXsSgJ3ZENIXU=;
	h=Date:From:To:Subject:From;
	b=UO15RaGCn5mK7ETUJ/aER5PC56trEzdyVQNX2CAfrZUokccqEJt1+tFib8D3T+CQm
	 oBPRGPyd16dpUJSeOSVEmo8VJMKGmBDEqGSZ/SZxgLhQlHMGObc627i1HzBCvUDKxQ
	 W5/8OX2Md484s9rnEXQ+fdP2SaKgcbRWtvywOGAZv5Y2HNYx7UGmtvHbGwxO84PD7i
	 0MxEb6Cmv9f9cAVRgBM/yjgHAZKQarWE2GjkJHOzgLUcn6knDujC78ZRRGkT9tKsMH
	 B5+voHmJ4FHIUaKvMJPfcaQ/6dGDZOBBp1XRAMeTc+cA357RfCb/o0JoMJZ0kGy3dU
	 DcJUeGvU6E9xw==
Received: by mail.quirkbyte.pl for <linux-mtd@lists.infradead.org>; Fri, 28 Jun 2024 08:00:33 GMT
Message-ID: <20240628084500-0.1.3v.284cz.0.198k608284@quirkbyte.pl>
Date: Fri, 28 Jun 2024 08:00:33 GMT
From: "Norbert Karecki" <norbert.karecki@quirkbyte.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Fotowoltaika - propozycja instalacji
X-Mailer: mail.quirkbyte.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_010812_777923_4D2C92E6 
X-CRM114-Status: UNSURE (   1.00  )
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

Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 837E6D49221
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Nov 2024 13:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XVLd8hwzueXnHFVkppjm6teT+tuZHFNKrn2Ua2pka20=; b=QiEN+3eX5ivXUY
	iBNzMtc0mkcKlmP91EAvFjW5p0Vfj1CzbSfC8yH9XkR+96th9GTqyN8R8t3cNKHlDW8mKMdmsGPJt
	ZF0VTYYeuhbewdZG1il7kZXUHRMXPzECJ1o4yfltHA/s4xHJTjUFVTM71O63MnsPCgCMRVZn2j+EP
	fnq0XtYM9TaEpPw+IEXpQsfdm4XyDJpTnKi1yXTiqKh/4YlDvw4JmtwBII/Ni7DHLkgkIB/GSugb7
	TY4M21+OlMAhagKO1r7dK9aypk1FCU7KuZv95YsIVcoGyLpGKuH5Tv02Db0kjKs21BVLq3w0M/hBv
	nxbr33Sr5ADDkz9zGBbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD2EF-00000009gBi-3GyQ;
	Mon, 18 Nov 2024 13:55:47 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD20R-00000009dLB-3gRK
	for linux-mtd@lists.infradead.org;
	Mon, 18 Nov 2024 13:41:33 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 190701BF20B;
	Mon, 18 Nov 2024 13:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731937290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N+wkVNWq5O5wqzLl+pe4K8hwXpV5Z++skWgMkbBTPdY=;
	b=FcJ1Tbvx995+nm4Hf5K1dmWYQSQI878Nyq9P4vfpNDuOCKkmMJRGz5d7LAzmv2Sb2iAUtK
	vbOeCuOe6v8bDRqSfym/opNgDhr+O7NNbmFUequCU6w0o6hC9UPHNSZWz/zRnAIaFtIx/v
	86ui4y806Xy/pM1eP+GJ8HxeFq1pgkQSMFHXygV/ohQywBb5n4TC8rJNyBtyqNaBnP5VWW
	iCa194ABW9gnRPaN4q5JG6o9FbDVJA/YB1IR2iJ5TkFDuE+i54pkxld9Prmh5HV/LjCJK5
	+N9itm0frh+Fks/mQwR23dA5JJFLIag3/ddEe0EwuabKol0HkCKT0H7VmjlALQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Oetken, Andreas" <andreas.oetken@siemens-energy.com>
Cc: Andreas Oetken <ennoerlangen@gmail.com>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] mtd: core/part: trying to delete partition with
 usecount > 0 corrupt partition
In-Reply-To: <FR0P281MB1626159D92BE16A35E8272BAAE272@FR0P281MB1626.DEUP281.PROD.OUTLOOK.COM>
	(Andreas Oetken's message of "Mon, 18 Nov 2024 12:03:18 +0000")
References: <20241115085516.1852668-1-andreas.oetken@siemens-energy.com>
	<87ldxg26hn.fsf@bootlin.com>
	<FR0P281MB1626159D92BE16A35E8272BAAE272@FR0P281MB1626.DEUP281.PROD.OUTLOOK.COM>
User-Agent: mu4e 1.12.1; emacs 29.4
Date: Mon, 18 Nov 2024 14:41:29 +0100
Message-ID: <87mshwwtfa.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_054132_081202_4F7CFAB6 
X-CRM114-Status: UNSURE (   9.09  )
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

SGkgQW5kcmVhcywKCk9uIDE4LzExLzIwMjQgYXQgMTI6MDM6MTggR01ULCAiT2V0a2VuLCBBbmRy
ZWFzIiA8YW5kcmVhcy5vZXRrZW5Ac2llbWVucy1lbmVyZ3kuY29tPiB3cm90ZToKCj4gSGkgTWlx
dcOobCwKPgo+IFRoYW5rcyBmb3IgcmV2aWV3aW5nLiBZb3UgYXJlIHJpZ2h0LiBUaGUgaXNzdWUg
d2FzIGFscmVhZHkgZml4ZWQgd2l0aCAxOWJmYTllYi4gCj4gSSBoYWQgdGhlIGlzc3VlIHdpdGgg
djUuMTAueC4KPiBTb3JyeSBmb3Igc3VibWl0dGluZyB0aGUgcGF0Y2ggaW4gYSBodXJyeSB3aXRo
b3V0IHJlYmFzaW5nIGFuZAo+IGNoZWNraW5nIGlmIGl0J3MgYWxyZWFkeSBmaXhlZC4KCk5vIHBy
b2JsZW0uIFlvdSBjYW4gaG93ZXZlciBzdWJtaXQgeW91ciBwYXRjaCB0byBzdGFibGVAIGlmIHlv
dSB3YW50IHRvCmZpeCB0aGlzIGluIDUuMTAuCgpBbHNvLCBtaW5kIHlvdSBoYXZlIGEgZG91Ymxl
IFxuXG4gc29tZXdoZXJlIHdoaWNoIHdpbGwgaGF2ZSB0byBiZSBmaXhlZC4KCkNoZWVycywKTWlx
dcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K

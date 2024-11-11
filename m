Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C44D3ABEC
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 18:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BVPlIDmhPsLH3TTlHP4qTnwQfmIg+Hj6JTApvVsugFI=; b=1OXg66/szcjAYs
	TeLbVbcTeo4M53kClEy5JrZbxI+ciIU+WUhFFYKdwwF660bJugnw9LETXACZ9c3pCzur2HF+LvPO8
	zrfGGwSjvLoThdiF987+PhNk5ROvSca0yex9PquBujoQmxPhNxBAry0C+KyIwKtSBH1rRpbM8YFw3
	kEtUPd+/beQ4XMRhxN8drywBIaGqpZWDmFkAFtqiQHx3sk67mjX3me1YWAnrpOZLd6ULVjMYaNyl5
	Tqkt1GbK4so8xI6ixYYHTpQzKRW1pGH4M7cUc+Ymf9rLUibJmCWsH1HOiicScv9l3LHM3I2XBb63V
	DRC5oFxwzkeURVYZ7AwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAZOf-00000000wc9-2J8A;
	Mon, 11 Nov 2024 18:44:21 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAZOc-00000000wbm-0H4V
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 18:44:19 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6D8B4240002;
	Mon, 11 Nov 2024 18:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731350654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=viYys6zmu5xXnNXfFw/VztBcMQ1nIoywWWvp0uvBB4g=;
	b=TK+tD8a+i076CFruJwh8785yWyE+WWNrWIcT6ogi9n0D/lu7txMFJwDSzRNqS4YgPV4AUc
	ZKura415m3bkWqHx8yfpB7kxj8l9THSV85gwTTuRixAwV/kngoIXSxL86vXHhLpYoj0azj
	O4utHKYXBz2u7fMeQdwus4ybH/zxnhRegfR/hNp/c/sc1fAh2cfQVq4TGjk+gqdL9t+lIe
	WwdNaC5tCiLwlgppPOYwPl/rwhypbJDMWKVfHl2nGx6nkPIWSsxVB4y9fhsSw7TB8zdS16
	qonr66X3reyi26ZCKuqmpXdCP4oKyjKJjgXI87NJQVKf59KyS46mbV+TmZeRuw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: tkuw584924@gmail.com
Cc: linux-mtd@lists.infradead.org,  richard@nod.at,  vigneshr@ti.com,
  tudor.ambarus@linaro.org,  pratyush@kernel.org,  mwalle@kernel.org,
  kr.kim@skyhighmemory.com,  zhi.feng@skyhighmemory.com,
  Bacem.Daassi@infineon.com,  Takahiro Kuwano
 <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH 0/2] mtd: spinand: Add support for SkyHigh S35ML-3 family
In-Reply-To: <cover.1730340421.git.Takahiro.Kuwano@infineon.com> (tkuw's
	message of "Thu, 31 Oct 2024 11:21:53 +0900")
References: <cover.1730340421.git.Takahiro.Kuwano@infineon.com>
User-Agent: mu4e 1.12.1; emacs 29.4
Date: Mon, 11 Nov 2024 19:44:12 +0100
Message-ID: <87v7wtsj9f.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_104418_255478_617BF2D3 
X-CRM114-Status: UNSURE (   5.51  )
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

T24gMzEvMTAvMjAyNCBhdCAxMToyMTo1MyArMDksIHRrdXc1ODQ5MjRAZ21haWwuY29tIHdyb3Rl
OgoKPiBGcm9tOiBUYWthaGlybyBLdXdhbm8gPFRha2FoaXJvLkt1d2Fub0BpbmZpbmVvbi5jb20+
Cj4KPiBUaGlzIHNlcmllcyBpcyBzdWNjZXNzb3Igb2YgdGhlIHBhdGNoIHN1Ym1pdHRlZCBieSBL
UiBLaW06Cj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4LW10ZC9w
YXRjaC8yMDI0MDgyMDA2NDU0Ny41MDM1LTEta3Iua2ltQHNreWhpZ2htZW1vcnkuY29tLwoKUGxl
YXNlIGFwcGVuZCBhIGNoYW5nZWxvZyBuZXh0IHRpbWUuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==

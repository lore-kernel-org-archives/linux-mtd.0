Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9850C369DC
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Apr 2025 08:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nz9XBoiNW89S5o3Id5dok755gz3et8B+G3HZ3WrbB1o=; b=Hhyq2rqqiR/u4X
	6FO6ET58QO2FFl++El6mJEUb3Bo2+IRGKoR1fqIAOHnTMAd1Ej5cmcK6n3SCZ0SefsAJCl634hM8n
	OminMmlk+eOgbweXLPXwKoaSJY6ZaXDpx+4PkkxUE/uCQfY9H04I66jAVW9o+w6Un2EhSRb2mulOa
	mcdtSBxJbhB9V6fYyVXN/F/cweVALD1cvVoMd93bTlNtLECWFMVlWUhBzRud92UduFQE4b3S45fGB
	/rAexNac2H6POjLopbo+pRAM1AoF/0Vy6lu+ftDovwTlVqwS9mPbcj3ITSnm88pV7w2bhgqBXxSo9
	VPRv6jF+r//QbAiGzMYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9g9j-00000008tZ9-18jP;
	Tue, 29 Apr 2025 08:17:31 +0000
Received: from mail.enterprisma.pl ([141.94.250.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9g7x-00000008tFf-1wC4
	for linux-mtd@lists.infradead.org;
	Tue, 29 Apr 2025 08:15:46 +0000
Received: by mail.enterprisma.pl (Postfix, from userid 1002)
	id 59B34A395F; Tue, 29 Apr 2025 10:15:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=enterprisma.pl;
	s=mail; t=1745914536;
	bh=0Hy4qnxxB8F5j2bW9mazqgYR6Rj6BM+brCgZs3yBeQ8=;
	h=Date:From:To:Subject:From;
	b=Kxc1vsWxZjRokQj8SH/IOzyLrGj7TegX9H7uc0MEvwWlWBuJdL5HqaDPeY9eHA5JU
	 xJ3/xtvTcewqDUOZ12aUwbBcAIaqQA3nScdCF3vTMy5F96lokNI2qN2E7k9X9/cQoZ
	 EMLXs3kG0jAW7INBgzyMrgYQYw56tOle/GMj27d67FAIucX5yTQbr/GpOqy7x5q/yg
	 tMMO77bOdkryn4N2YQmJlYKSLdqydk3nM1K3d7NNNb4IiouxxuOlkWjBMqWUjGL5o1
	 NbrwUlYq/bU1VrTOIsxYCfRvwPQLRtUao2ymcJdhs2MDHhkS62j/P2CJ1Zv6UJZgNW
	 Um/6n/OSoPGTA==
Received: by mail.enterprisma.pl for <linux-mtd@lists.infradead.org>; Tue, 29 Apr 2025 08:15:35 GMT
Message-ID: <20250429084500-0.1.mp.1lpmv.0.nka01v6eh3@enterprisma.pl>
Date: Tue, 29 Apr 2025 08:15:35 GMT
From: "Jakub Daroch" <jakub.daroch@enterprisma.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Fotowoltaika_i_pompa_ciep=C5=82a?=
X-Mailer: mail.enterprisma.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_011542_187212_5676BB58 
X-CRM114-Status: UNSURE (   0.90  )
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

RHppZcWEIGRvYnJ5LAoKbmFzemEgZmlybWEgemFqbXVqZSBzacSZIHJlYWxpemFjasSFIGluc3Rh
bGFjamkgZm90b3dvbHRhaWN6bnljaCAgb3JheiBwb21wIGNpZXDFgmEgZGxhIGZpcm0geiB3b2pl
d8OzZHp0d2EgcG9ka2FycGFja2llZ28gaSBtYcWCb3BvbHNraWVnby4gCgpQb3NpYWRhbXkgd2ll
bG9sZXRuaWUgZG/Fm3dpYWRjemVuaWUgaSBzcHJhd25pZSB6YXByb3BvbnVqZW15IG5hamtvcnp5
c3RuaWVqc3plIHJvendpxIV6YW5pZSBkbGEgUGHFhHN0d2EgZmlybXkuIFpham1pZW15IHNpxJkg
d3N6ZWxraW1pIGZvcm1hbG5vxZtjaWFtaSwgamFrIGkgc3p5YmtpbSBtb250YcW8ZW0uCgpQcm9z
aW15IG8gcG96b3N0YXdpZW5pZSBrb250YWt0dSwgYWJ5IG5hc3ogc3BlY2phbGlzdGEgbcOzZ8WC
IHByemVkc3Rhd2nEhyBvZmVydMSZIHpnb2RuxIUgeiBQYcWEc3R3YSBwb3RyemViYW1pLgoKS2ll
ZHkgbW9nbGliecWbbXkgeiBQYcWEc3R3ZW0gdW3Ds3dpxIcgc2nEmSBuYSBrcsOzdGvEhSByb3pt
b3fEmSB3IGNlbHUgemJhZGFuaWEgcG90cnplYj8KCgpQb3pkcmF3aWFtCkpha3ViIERhcm9jaAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K

Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0896BE7717D
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Dec 2024 08:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nz9XBoiNW89S5o3Id5dok755gz3et8B+G3HZ3WrbB1o=; b=ks9XNafv/9Etx9
	gW65cn7ebkpL5zFXQlIfj94OcC3FizWMHks7PnlWa93ugi/Vb3jXhBRwnqUg3VVreLhr3lnF12+n+
	X8lkZUXGwL4i/eMXcMmHfS2fopUbxnrvWOD/2lJvC5l4LMeaKDkc2rz/K6ZOEG2C+leULqvtASuou
	JVOfr7ErktXfm3GQkvKv3XBiR+xICuTzrfHtmYXvAs1DO55po0mphwzHkdidJRGnhl0e8gvMiGWgW
	EdLWhMGVCZngMWAj5nxAwH+zdGhKxRSBmdAogIKBR7hnFhWSOVQLGHbg/phfVyD4uj3R/E0yLLQD/
	A7iQf1CKgLn3wTrhPX8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJTu9-00000000xbm-0kCy;
	Fri, 06 Dec 2024 08:41:41 +0000
Received: from mail.enterprisma.pl ([141.94.250.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJTtn-00000000xXE-1Lmd
	for linux-mtd@lists.infradead.org;
	Fri, 06 Dec 2024 08:41:21 +0000
Received: by mail.enterprisma.pl (Postfix, from userid 1002)
	id EA212A331E; Fri,  6 Dec 2024 09:41:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=enterprisma.pl;
	s=mail; t=1733474473;
	bh=0Hy4qnxxB8F5j2bW9mazqgYR6Rj6BM+brCgZs3yBeQ8=;
	h=Date:From:To:Subject:From;
	b=iRq2xv2rztyQYOhZrfFWMFF7F3auQQpsh0UvOMAeXeRw0uxRUM3uqI8tM7zGCPh8m
	 xiqGSeb4CHhqfsYRJYuS+7F0veJRWiIP7QfUs20ZWs64xJ5LfsFBUKN+VTrH3XaDb/
	 SwYULIHxv45Ykjx8nQCL5e0v0r/aJQJ8VhErN2ZprtXVUxl+dn1mGr+423EBYodH6+
	 4pL2518+vsg5bewsZe3eADTaJKgRaPzKiVsAL9WdzmhYdm9Dh/urDd6nJIH4W/TBw4
	 zsNzXTJ0FaSsqzewH/flJzEs0SkIIJ3zBVowICcWhr91NETRZGfTmnTfLqXm2lFETd
	 5wqw1qXy7Fezw==
Received: by mail.enterprisma.pl for <linux-mtd@lists.infradead.org>; Fri,  6 Dec 2024 08:41:02 GMT
Message-ID: <20241206084500-0.1.k0.1ewrc.0.icn1dotlz3@enterprisma.pl>
Date: Fri,  6 Dec 2024 08:41:02 GMT
From: "Jakub Daroch" <jakub.daroch@enterprisma.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Fotowoltaika_i_pompa_ciep=C5=82a?=
X-Mailer: mail.enterprisma.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_004120_071998_AAC4E64B 
X-CRM114-Status: UNSURE (   1.30  )
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

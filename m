Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26EC8C46CD8
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Dec 2023 08:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=enlUXmFXrdk5LcKDWS5DV7VXssScZIzx/4sra41PyQA=; b=IXYxy486vyAoHt
	rHIJdIDfC+MiiyX0fLmtpmb3QMB/DLcYcZu5B14IAGGmj8vKp3nFbaAg2KGCzk0KhJSfOArWAl6HJ
	WuCmyS1FEkuPja4G2Q8WV4pKpxvyBduo43jWgaZg9HeieXD7PuWh1LABge7DlZyoki6S0tgqtufuq
	yv30RpJqXjrfkYaYjkYhXFiK4ifH8/1ZFiOjmMadXXD7+ahIQq1z8w67Tu61CMFJj0DVRIgDovyOv
	9TWgp7W3AxeqY7WQvNDvQEacQ8m+Z2ltQpOM081yCOqtMxOzKMvcxtECLXadgocPAJwxQ948hSeBm
	o9AV0OQtHqdfHthvERvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFsDD-00GcUk-2v;
	Wed, 20 Dec 2023 08:45:55 +0000
Received: from mail.bizloop.pl ([217.61.97.183])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFsDA-00GcT6-0p
	for linux-mtd@lists.infradead.org;
	Wed, 20 Dec 2023 08:45:54 +0000
Received: by mail.bizloop.pl (Postfix, from userid 1002)
	id F384482C3E; Wed, 20 Dec 2023 09:36:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bizloop.pl; s=mail;
	t=1703061406; bh=fAh84/03FbcPDOiro+kD9EaI9x3ZXWqpoFIQ90ndT2M=;
	h=Date:From:To:Subject:From;
	b=XCKgaFYJ5MNXzUDvAti7oFoXTu9UranwrSFi6exya6QTSJq8oNd98s/Dkt1o/Z81o
	 K91b53OAWp6xB++X69V34fTDw2hLZLq/5IqwAtvXLevhqDftxI0U8u3swdKCD1Zono
	 cOXGewclSPJNI1lhRO/uOdzjn9EPTlhp44W7T+/OGwKLGtj8rK7sV+WvzOExN3gGkk
	 Z7+/xpTIkdFptj59PK75a2fBKobmRnKrkAJ9GGFWwl3cRcrRbXjt1yZgGwBg4vTkoA
	 eJNIj4RIMqbBeY5iACOOUvF7BpRWln1oyxjKin8VgFN5s8Q7FUPNeBjyF4gm/q7pH0
	 jmfhzxqXkzPEg==
Received: by mail.bizloop.pl for <linux-mtd@lists.infradead.org>; Wed, 20 Dec 2023 08:36:17 GMT
Message-ID: <20231220084500-0.1.1a.3i3x.0.v1r7skqegv@bizloop.pl>
Date: Wed, 20 Dec 2023 08:36:17 GMT
From: "Adrian Mackiewicz" <adrian.mackiewicz@bizloop.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Nowe informacje na stronie www
X-Mailer: mail.bizloop.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_004552_440669_5C8B6D95 
X-CRM114-Status: UNSURE (   1.76  )
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

U3phbm93bmkgUGHFhHN0d28sCgp6YXN0YW5hd2lhbGkgc2nEmSBQYcWEc3R3byBuYWQgbm93xIUg
c3Ryb27EhSBpbnRlcm5ldG93xIUgZGxhIHN3b2plaiBmaXJteT8KClRlY2hub2xvZ2lhIGkgdHJl
bmR5IHcgcHJvamVrdG93YW5pdSBzdHJvbiBzdGFsZSBzacSZIHptaWVuaWFqxIUuIEFrdHVhbGl6
YWNqYSB3aXRyeW55IHBvendvbGkgV2FtIHV0cnp5bWHEhyBrcm9rIHogbmFqbm93c3p5bWkgcm96
d2nEhXphbmlhbWksIGNvIHogcGV3bm/Fm2NpxIUgcHJ6eWNpxIVnbmllIHV3YWfEmSBrbGllbnTD
s3cgaSB3eXLDs8W8bmkgV2FzIHfFm3LDs2Qga29ua3VyZW5jamkuCgpEemnEmWtpIG5vd3ltIHRl
Y2hub2xvZ2lvbSBvZmVydWplbXkgbGVwc3plIGRvxZt3aWFkY3plbmllIHXFvHl0a293bmlrYSwg
Y28gcHJ6ZWvFgmFkYSBzacSZIG5hIHp3acSZa3N6b27EhSBzYXR5c2Zha2NqxJkga2xpZW50w7N3
IGkgd2nEmWtzesSFIHNrxYJvbm5vxZvEhyBkbyBpbnRlcmFrY2ppIHogV2FzesSFIG1hcmvEhS4K
CldhcnRvIHJvendhxbx5xIcsIGphayBub3dvY3plc25lIHBvZGVqxZtjaWUgbW/FvGUgcG9kbmll
xZvEhyBQYcWEc3R3YSBvYmVjbm/Fm8SHIG9ubGluZSBuYSB3ecW8c3p5IHBvemlvbS4gTW/FvGVt
eSBwb3Jvem1hd2lhxIcgdyB0ZWogc3ByYXdpZT8KCgpQb3pkcmF3aWFtCkFkcmlhbiBNYWNraWV3
aWN6CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=

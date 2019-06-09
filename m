Return-Path: <SRS0=Yh92=UI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26D26C28EBD
	for <linux-mtd@archiver.kernel.org>; Sun,  9 Jun 2019 10:01:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB71E20868
	for <linux-mtd@archiver.kernel.org>; Sun,  9 Jun 2019 10:01:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o7j6JgE1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB71E20868
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=srJF+gQ0MOVuwTsnimsuko9GQnxrQQhoN4nZE++hdEg=; b=o7j6JgE1FFY7Qq
	tMk4VsnXj6zEeo0EMAC/A0N8vf14WLnnM3QR+261EV/vjt358AZ3tHPT5jSm+DA+wqSa9OOP6osxZ
	uwmnzmPUU/pnjViKG/dPFs9dBJWbIlFHv0hzJftf8BfV5340DT8BJAZ61yLfh7Seg8HvlcOBY9LGR
	otndNIoypwf2GbWqipobVKbuAcssBDoIK5CZsnmQw6La4iYOVTi/TEh1ByRJ86iAUI1jiXt8SPZuE
	aXKjGN8Uma7xpXah1/q+iwOyG9J7AxPI50p4rN36sXj3D/yfe2LemY4KmekQJWQbLGf656gOI7asu
	U5Esdnq7dI08Ww6sTepw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZudN-0008LZ-Cm; Sun, 09 Jun 2019 10:01:05 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZudK-0008Kw-Dr
 for linux-mtd@lists.infradead.org; Sun, 09 Jun 2019 10:01:04 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 405F2608310F;
 Sun,  9 Jun 2019 12:01:00 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 4acshPSPK03k; Sun,  9 Jun 2019 12:00:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id CA7276083114;
 Sun,  9 Jun 2019 12:00:59 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id gCWz6zux3eRa; Sun,  9 Jun 2019 12:00:59 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id ACA2C608310F;
 Sun,  9 Jun 2019 12:00:59 +0200 (CEST)
Date: Sun, 9 Jun 2019 12:00:59 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Sergei Poselenov <sposelenov@emcraft.com>
Message-ID: <1159355903.85757.1560074459598.JavaMail.zimbra@nod.at>
In-Reply-To: <ac7d203471da8db3a148c207b586cae919304307.camel@emcraft.com>
References: <20190606121037.40a1cc5e@sergmir.emcraft.com>
 <20190607172355.6541fa51@sergmir.emcraft.com>
 <1299833819.84614.1559923336123.JavaMail.zimbra@nod.at>
 <08a796c9a296245c372511c683adb80913d14553.camel@emcraft.com>
 <766367078.85018.1559983598342.JavaMail.zimbra@nod.at>
 <a43eb232a51b7d0c95623de9403158c290163237.camel@emcraft.com>
 <1957000286.85744.1560070414116.JavaMail.zimbra@nod.at>
 <ac7d203471da8db3a148c207b586cae919304307.camel@emcraft.com>
Subject: Re: UBIFS: file data corruption during the power cut-off test
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.8_GA_3025 (ZimbraWebClient - FF60 (Linux)/8.8.8_GA_1703)
Thread-Topic: UBIFS: file data corruption during the power cut-off test
Thread-Index: B69v502MK5vtNWavlEHwCeZ2GPt/YQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190609_030102_618479_61E74F47 
X-CRM114-Status: UNSURE (   2.91  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+PiBXZWxsLCB6ZXJvIGJ5dGVzIGFyZSBu
b3QgZ2FyYmFnZS4gOykKPiAKPiBJJ3ZlIHNlZW4gc29tZSBkYXRhIGluIHRoZSBsYXN0IDUxMiBi
eXRlcyBhcyB3ZWxsLgoKVGhhdCB3b3VsZCBiZSBhIGJ1ZywgdW5sZXNzIHlvdSBhcmUgb3Zlcndy
aXRpbmcgYW4gZXhpc3RpbmcKZmlsZS4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=

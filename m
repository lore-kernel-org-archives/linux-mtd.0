Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57680C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Mar 2022 07:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=CmKrSNGws6Xs6fs+6MIz+pYbKJxTB3MPRVdbYhNmUP4=; b=MMeU8lhCAdal06XcHyQDnM7avK
	nR45GXIYkZZrDPTMIQm5cXeGRVEm71AfsIauvs7EFo3/Duwo/Ur4LP75g+SRoLCfhua9jUCfMZokD
	QVNwgPuN1+Ctmvk8kkTFi2pe4pY20u33D+UvmPDANReuRMgXsjG4ue3WmbAgTxteB1SHvQOrjnqKu
	/aE7PLwhgwYuwJFkC3ZN+5a6G0/XbSIzU8H2JvJDJ6tUGyiih4XhPH84YvJPijcxWlS/0pCG75Z4P
	iaJctHQj+li++tn/21qLPLTFFq249DbjM2oKnPu70664Gbp7bVdze5P0vpr3MmKV77DgNu154gO4+
	Zk9Fs/Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYjni-007cj0-I1; Mon, 28 Mar 2022 07:28:30 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYjnf-007chU-OY
 for linux-mtd@lists.infradead.org; Mon, 28 Mar 2022 07:28:29 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id BB991609B3EA;
 Mon, 28 Mar 2022 09:28:25 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id yyi3F8qE9qxL; Mon, 28 Mar 2022 09:28:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 39971609B3F1;
 Mon, 28 Mar 2022 09:28:25 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 1gtuU7JFMaBF; Mon, 28 Mar 2022 09:28:25 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 2096F609B3EA;
 Mon, 28 Mar 2022 09:28:25 +0200 (CEST)
Date: Mon, 28 Mar 2022 09:28:25 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: david oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Message-ID: <901245998.192182.1648452505055.JavaMail.zimbra@nod.at>
In-Reply-To: <98502d10-17dc-6ed5-3baf-92cd639ca7a2@sigma-star.at>
References: <20220325120025.17931-1-zajec5@gmail.com>
 <98502d10-17dc-6ed5-3baf-92cd639ca7a2@sigma-star.at>
Subject: Re: [PATCH mtd-utils] nandwrite: warn about writing 0xff blocks
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: nandwrite: warn about writing 0xff blocks
Thread-Index: TJ4mtiagmxYr+26+g4zWqXOqvklttQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_002827_967945_5A81B808 
X-CRM114-Status: UNSURE (   2.15  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImRhdmlkIG9iZXJob2xsZW56
ZXIiIDxkYXZpZC5vYmVyaG9sbGVuemVyQHNpZ21hLXN0YXIuYXQ+Cj4gQW46ICJSYWZhxYIgTWnF
gmVja2kiIDx6YWplYzVAZ21haWwuY29tPiwgIk1pcXVlbCBSYXluYWwiIDxtaXF1ZWwucmF5bmFs
QGJvb3RsaW4uY29tPiwgInJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4KPiBDQzogImxpbnV4LW10
ZCIgPGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnPiwgIlJhZmHFgiBNacWCZWNraSIgPHJh
ZmFsQG1pbGVja2kucGw+Cj4gR2VzZW5kZXQ6IE1vbnRhZywgMjguIE3DpHJ6IDIwMjIgMDg6NTE6
MzgKPiBCZXRyZWZmOiBSZTogW1BBVENIIG10ZC11dGlsc10gbmFuZHdyaXRlOiB3YXJuIGFib3V0
IHdyaXRpbmcgMHhmZiBibG9ja3MKCj4gQXBwbGllZCB0byBtdGQtdXRpbHMuZ2l0IG1hc3Rlci4K
ClBsZWFzZSBzbG93IGRvd24gYSBsaXR0bGUuIDopCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K

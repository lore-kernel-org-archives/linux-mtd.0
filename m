Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC8FFC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Apr 2022 06:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2QgxhAOnJokiiAWUI1FjOzpwZp1B71V1yFxZIeQyxDs=; b=TrNNBnR83UF5y0kBWKWOEyzxun
	INeP5sPyc861slGCkzBv3ZCExOeQKLqy+ahat9ScpP4RnhxXCX0jPq3pXcx0HJxkXhdyDyyQqnqMO
	wYsoGFZDm+oKTEeVgy2Sdko4mLmw7Llg+T/sV86Ay39aIzpT0QwhNxff0IHnmXnYD5Df3WDxF5mar
	SEamgiEU62Y+NVsNu2Sb5VbCwZeEl3vwTtN5EpM8ZMNCyNudhWbZVmV/RXGW6Hk/EfBSDanMBe7kn
	PFVpT5tsmx6MNA6B3AfiXfZhMc9Mi+hGO19kvf/FfsNGxDUINEjPN9ocarqYmPTPd8gmde/3a47iv
	/d5WIyfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh3nW-007Yai-OH; Wed, 20 Apr 2022 06:26:42 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh3nT-007YaA-FE
 for linux-mtd@lists.infradead.org; Wed, 20 Apr 2022 06:26:41 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 1C93B608110A;
 Wed, 20 Apr 2022 08:26:34 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id rEpoGuv9JJjs; Wed, 20 Apr 2022 08:26:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id C253C608110E;
 Wed, 20 Apr 2022 08:26:33 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id jAYdmwV2C7ot; Wed, 20 Apr 2022 08:26:33 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 96C1E608110A;
 Wed, 20 Apr 2022 08:26:33 +0200 (CEST)
Date: Wed, 20 Apr 2022 08:26:33 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Scott Zhang <macromarship@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 Richard Weinberger <richard.weinberger@gmail.com>
Message-ID: <1619753182.269553.1650435993461.JavaMail.zimbra@nod.at>
In-Reply-To: <CABy3iKyZdZ=S9Jo4tu39qXWnzRj0JefKA_5B2BKjU9J3bYAPOA@mail.gmail.com>
References: <CABy3iKxexzn2TnYVV8k0=_onqdrjQGoPeLMOd2q8cqzVECvBWw@mail.gmail.com>
 <20220415102929.5c654933@xps13>
 <CABy3iKwAVYkstq4=fg6cjh4VRAzSwGa7JNy494Ag69e_t9UTjA@mail.gmail.com>
 <20220419093317.7fe2ae6c@xps13>
 <542373121.266606.1650354270993.JavaMail.zimbra@nod.at>
 <CABy3iKzeJ4CF74YjF60_F_zbZhhYq_5imuG=BU4fOBrKQ5eqaw@mail.gmail.com>
 <CABy3iKxw1KV6W60-sso7RButgxSDn7WX_FQ6Pz4EVrYQMb-GKw@mail.gmail.com>
 <CABy3iKyZdZ=S9Jo4tu39qXWnzRj0JefKA_5B2BKjU9J3bYAPOA@mail.gmail.com>
Subject: Re: ubifs_decompress: cannot decompress 2293 bytes, compressor lzo,
 error -22
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs_decompress: cannot decompress 2293 bytes, compressor lzo,
 error -22
Thread-Index: Higpvv6ODTL0bDT7/oOPypbi0ZpSWg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_232639_693356_D23624DD 
X-CRM114-Status: UNSURE (   2.59  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IEkgdHJpZWQgYWxsIHRoZSB0ZXN0cy4g
TG9va3MgYWxsIHBhc3NlZC4KCkFsc28gVUJJIHRlc3RzPyBlLmcuIGlvX3BhcmFsPwogIApNYXli
ZSB0aGUgcHJlLWdlbmVyYXRlZCBVQklGUyBpcyB0aGUgcHJvYmxlbS4KSG93IHRvIHlvdSBmbGFz
aCB0aGUgVUJJIGltYWdlPwpQbGVhc2UgbWFrZSBzdXJlIHRvIHNraXAgMHhGRiBwYWdlcyBpZiB1
c2luZyBuYW5kd3JpdGUuCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K

Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B86C001E0
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Aug 2023 12:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RQhr8In9eYB3SCPeMBcOfIk/tMdTESlLQ/dkgAAdbaI=; b=jYNF/Ii8rnIsUM
	J0BVjd5+0A+E+vjIiLzXHRXqUjLhtvAkjPCyC3b5XGaPKbiIeHKTZNxm3hAWeP16c4/fQxQb33S8W
	7L0tQ5Rbqk1M9eddLY68law5O97nAQc/0+x9aokcF96Rxw685RED1E3ketosaBmiNpwLS8QURwpJt
	VZQA6u6GTZTSL43V0Wny4Zu1ZDNzyMWFcx2JjQ7xW/5AAK+0eaM0bcDa3vfNznm2+LldT02SAui84
	GyX/ES1giqZVy7AOfFNgGvPnQNAPRpLmdzSuRAzZ4QB3lWRl+Sr/7LI8Tfm12QCNBrjvs4tqn8Mzt
	4ZEfED5tg8pKiHkol7lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRBDV-004vOY-0I;
	Wed, 02 Aug 2023 12:44:41 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRBDR-004vNu-09
	for linux-mtd@lists.infradead.org;
	Wed, 02 Aug 2023 12:44:39 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7AC5C20004;
	Wed,  2 Aug 2023 12:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690980270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8dOawE5kxCNhvhOKy8LNvd/QWehP28IWgnL5mXG3Rew=;
	b=P0MhsdyMGZ3XJmzlSk4CllYXA1geVTZWmr2Fjyv88Q7ZPbHTwBOY5k2DAO10JT5OBplmOH
	AkBEeUvauITGmK6ZBJFuyrm00gpgRlP2bOcLdHV440gFQUtFiggkLxUePTWXmrNCKkpqhY
	EGBLCDf8ZfXprGt5SE+XdzM+LdOBAWV3F79mVQH6J9Ho+ErqTC05FGasNo8+wDhuEmugMM
	P2t52sXwv0DEpNOjNaTUYrGW2Nnu0EhVpz4IgSJ1QQ6q6zE2V6BXxF5ax4F47OMdGcjYSa
	OYxOfE1neZ7jzISDyTQOAr6lACPpVNakre4JdzAU23aukqgVknLj69Y+J4mtjA==
Date: Wed, 2 Aug 2023 14:44:26 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "zhangxiaoxu (A)" <zhangxiaoxu5@huawei.com>
Cc: "Usyskin, Alexander" <alexander.usyskin@intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "Winkler, Tomas" <tomas.winkler@intel.com>,
 "Lubart, Vitaly" <vitaly.lubart@intel.com>
Subject: Re: [PATCH] mtd: fix use-after-free in mtd release
Message-ID: <20230802144426.2411bba2@xps-13>
In-Reply-To: <d9d56389-7409-79ae-6854-00ab8de7da4d@huawei.com>
References: <20230727145758.3880967-1-alexander.usyskin@intel.com>
	<ZMKJRNDoQV8p0DH4@smile.fi.intel.com>
	<20230727172013.7c85c05d@xps-13>
	<ZMKUJbl7kFOfgKGg@smile.fi.intel.com>
	<20230727183611.37d01f51@xps-13>
	<CY5PR11MB63660B9CE604C0CFF2E088DAED04A@CY5PR11MB6366.namprd11.prod.outlook.com>
	<d9d56389-7409-79ae-6854-00ab8de7da4d@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_054437_247725_15B1CE53 
X-CRM114-Status: UNSURE (   8.65  )
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

SGkgemhhbmcsCgp6aGFuZ3hpYW94dTVAaHVhd2VpLmNvbSB3cm90ZSBvbiBNb24sIDMxIEp1bCAy
MDIzIDA5OjM1OjQyICswODAwOgoKPiDlnKggMjAyMy83LzMwIDE5OjEwLCBVc3lza2luLCBBbGV4
YW5kZXIg5YaZ6YGTOgo+ID4gTWlxdWVsLCBpcyB0aGlzIHBhdGNoIGhlbHBzIHdpdGggeW91ciBv
cmlnaW5hbCBwcm9ibGVtIG9mIGRldmljZXMgbm90IGZyZWVkPwo+ID4gCj4gPiBaaGFuZywgaXMg
dGhpcyBwYXRjaCBoZWxwcyB3aXRoIHlvdXIgcHJvYmxlbSB3aXRoIEtBc2FuPyAgCj4gQWZ0ZXIg
dGhpcyBwYXRjaCBhcHBsaWVkLCB0aGUgcHJvYmxlbSBjYW4gc3RpbGwgYmUgcmVwcm9kdWNlZC4K
CkRpZCB5b3UgdGVzdCBteSBwYXRjaCBhcyB3ZWxsPyBEb2VzIEthc2FuIHN0aWxsIGNvbXBsYWlu
IHdpdGggaXQ/CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==

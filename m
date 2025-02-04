Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88BD5C02193
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Feb 2025 09:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FF7B/cXqAH3BOsKTc63IM177kmRIn8mbT6otaT1v3oc=; b=X68dEbnnSI0aSL
	4FSG1eA7JRokrLqiopjnmr/caBNCTRtDEP+NyUgf6e3NBJSuw2Kw6Cpz9+HNMbKDrCHLPvdZesAJs
	pp6HurP/nYJQhzzYQ+e91UhoHfFpXDfCSUUaX3Nd2HOXPQ00SheO7jJj/L+xoGFD7X7GKwP/WXxG6
	bUdETkvrY8sR9S74FrU8yjxtfobqcCtAcHJGZe/gimm+JL7mhnenRxTG5+DtdIGVMOKa3mjotz2y0
	nVFy4Z+5FFc8mIR8FdzUV3xz/75I7FBxaUeOb3L6yHkhOGEm4nC7J0elKoibc6fSzYjs6qSKrlax5
	5tNqaQnEoI2JNzL3sTbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfF6X-000000001EQ-3M7V;
	Tue, 04 Feb 2025 09:20:25 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfF6U-000000001DS-2GMC
	for linux-mtd@lists.infradead.org;
	Tue, 04 Feb 2025 09:20:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DF3AD42CCD;
	Tue,  4 Feb 2025 09:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738660819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rauOalsmd53sQxTxWW+uFzWBgqNaCYhWVzouMA54tTg=;
	b=lJ41DndbhSwaKVTS9QcQq8lKiruEm45BV3yrs1ZR0Y8qpvjzNkhgbENBF2P6XUUkkW/4Yl
	maveDONaBpvr4ypfy7kXlHClI+PaLdSNM0l9JmzGwRi3AWiUV0wx/3WYUMI9j/NUdhyFo0
	LuFxREbXDl8OwRqQ7hhJxA6QmaUL2qD6DzCV21eYDb4qWFEU0BwPPKpUZ1FXD1vu3cAB5C
	CRPDqWXhrRXauyMPNBAZ1L5JeK3w1iF7IJlt76ZpRxQIxw0O/SeB9FoBn8VgjUe+nAhbgT
	7OfGPfHBusjszCYT60w2yb0UqQQU5IDbge2GZFKeYi8heAXMok9axBXUK7GjfA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Rabara, Niravkumar L" <niravkumar.l.rabara@intel.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  "linux@treblig.org" <linux@treblig.org>,  Shen Lichuan
 <shenlichuan@vivo.com>,  Jinjie Ruan <ruanjinjie@huawei.com>,
  "u.kleine-koenig@baylibre.com" <u.kleine-koenig@baylibre.com>,
  "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
  "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] mtd: rawnand: cadence: support deferred prob
 when DMA is not ready
In-Reply-To: <BL3PR11MB6532451B44E7C5D82F5EC4AFA2F42@BL3PR11MB6532.namprd11.prod.outlook.com>
	(Niravkumar L. Rabara's message of "Tue, 4 Feb 2025 07:48:57 +0000")
References: <20250116032154.3976447-1-niravkumar.l.rabara@intel.com>
	<20250116032154.3976447-2-niravkumar.l.rabara@intel.com>
	<87plkgpk8k.fsf@bootlin.com>
	<BL3PR11MB653276DFD3339ADAADC70CCFA2EE2@BL3PR11MB6532.namprd11.prod.outlook.com>
	<874j1i0wfq.fsf@bootlin.com>
	<BL3PR11MB65321B556C59C995DC05C70AA2E92@BL3PR11MB6532.namprd11.prod.outlook.com>
	<87msf8z5uu.fsf@bootlin.com>
	<BL3PR11MB6532451B44E7C5D82F5EC4AFA2F42@BL3PR11MB6532.namprd11.prod.outlook.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 04 Feb 2025 10:20:17 +0100
Message-ID: <87o6zi83se.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepteehkeelvddvheehtdefkedtjeeutedthfegudekgeefleetkeettdekiefftdeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepnhhirhgrvhhkuhhmrghrrdhlrdhrrggsrghrrgesihhnthgvlhdrtghomhdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtoheplhhinhhugiesthhrvggslhhighdrohhrghdprhgtphhtthhopehshhgvnhhlihgthhhurghnsehvihhvo
 hdrtghomhdprhgtphhtthhopehruhgrnhhjihhnjhhivgeshhhurgifvghirdgtohhmpdhrtghpthhtohepuhdrkhhlvghinhgvqdhkohgvnhhighessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_012022_721656_E7BADBC2 
X-CRM114-Status: UNSURE (   6.89  )
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

SGVsbG8sCgo+IE15IGFwb2xvZ2llcyBmb3IgdGhlIGNvbmZ1c2lvbi4KPiBTbGF2ZSBETUEgdGVy
bWlub2xvZ3kgdXNlZCBpbiBjYWRlbmNlIG5hbmQgY29udHJvbGxlciBiaW5kaW5ncyBhbmQKPiBk
cml2ZXIgaXMgaW5kZWVkIGNvbmZ1c2luZy4gIAo+Cj4gVG8gYW5zd2VyIHlvdXIgcXVlc3Rpb24g
aXQgaXMsIAo+IDEgLSBFeHRlcm5hbCBETUEgKEdlbmVyaWMgRE1BIGNvbnRyb2xsZXIpLgo+Cj4g
TmFuZCBjb250cm9sbGVyIElQIGRvIG5vdCBoYXZlIGVtYmVkZGVkIERNQSBjb250cm9sbGVyICgy
IC0gcGVyaXBoZXJhbCBETUEpLiAKPgo+IEZZUiwgaG93IGV4dGVybmFsIERNQSBpcyB1c2VkLiAK
PiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4xMy4xL3NvdXJjZS9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9jYWRlbmNlLW5hbmQtY29udHJvbGxlci5jI0wxOTYyCgpJbiB0aGlzIGNh
c2Ugd2Ugc2hvdWxkIGhhdmUgYSBkbWFzIHByb3BlcnR5IChhbmQgcGVyaGFwcyBkbWEtbmFtZXMp
LCBubz8KCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==

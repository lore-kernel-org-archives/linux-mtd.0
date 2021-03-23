Return-Path: <SRS0=GnEg=IV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55AC2C433C1
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Mar 2021 10:33:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D44B360C3E
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Mar 2021 10:33:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D44B360C3E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rgboowtkSfgFaz4bPWrNnUp+ff10SWsqdzRJpXaOyfM=; b=ma7G1uoXXZGXUPXCIGdYhcqRB
	iDCO2QWyqRbjbJf1yU/vGh+G9uR5pjZnliEEEjmtCixiUF2S6rF+o4Sr3Y/ojXKXdNPKF4JXBifQ1
	sbzvv4nJkrRm6Rl8/BYc/qspvYTK79GslW6uyuW15RefmdcFLK1/+R81WgW6OmBkUgjaS2KiuilyB
	blsgSkmw89fp74P885evu2CtF0AZ7ulsdDFfm6PdDnkDMBB3S3bMGQVyVgVcyNvCbbvlQaC4XVGuV
	UlP7rejPCOSMWIEyZUHP112scU+istIvXWaanGVR+WmbXCbKgdYlqDD74AjUiJcWRGYvEwb26fxRI
	2pwoo5iVw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOeL3-00Ech8-9o; Tue, 23 Mar 2021 10:32:41 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOeKz-00Ecg7-7O
 for linux-mtd@lists.infradead.org; Tue, 23 Mar 2021 10:32:39 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13 (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr [90.89.138.59])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 618D1C0008;
 Tue, 23 Mar 2021 10:32:33 +0000 (UTC)
Date: Tue, 23 Mar 2021 11:32:33 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: linux-mtd@lists.infradead.org, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] mtd: spinand: add support for Foresee FS35ND01G-S1Y2
Message-ID: <20210323113233.3523d66b@xps13>
In-Reply-To: <CAFr9PX=mL9UWcr-yWbYa5NXS-R=yHeGgM+hd_MKOa2XiBUAJOQ@mail.gmail.com>
References: <20210213095724.3411058-1-daniel@0x0f.com>
 <20210215112409.1a755bf0@xps13>
 <CAFr9PXkh+attaCc6C2UxB=qvXksWriWOaaoEndy4k6SGE0QOHQ@mail.gmail.com>
 <20210215121653.4edd86c4@xps13>
 <CAFr9PXmVehtcm6FjBqi_hmEAj1rgtxMvarisjPmWhgjruVj++Q@mail.gmail.com>
 <20210322193213.18520b9a@xps13>
 <CAFr9PX=mL9UWcr-yWbYa5NXS-R=yHeGgM+hd_MKOa2XiBUAJOQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_103237_355786_C3CC57DB 
X-CRM114-Status: GOOD (  14.40  )
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

SGkgRGFuaWVsLAoKRGFuaWVsIFBhbG1lciA8ZGFuaWVsQDB4MGYuY29tPiB3cm90ZSBvbiBUdWUs
IDIzIE1hciAyMDIxIDE4OjMzOjU0CiswOTAwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gT24gVHVlLCAy
MyBNYXIgMjAyMSBhdCAwMzozMiwgTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGlu
LmNvbT4gd3JvdGU6Cj4gPiA+IEkgdGhpbmsgdGhpcyBzaG93cyB0aGF0IHRoZSBkYXRhc2hlZXQg
aXMgcmlnaHQgaW4gdGhhdCB0aGUgY29tcGxldGUgNjQKPiA+ID4gYnl0ZXMgb2YgInNwYXJlIGFy
ZWEiIGlzIHVzYWJsZS4KPiA+ID4gSSBoYXZlIG5vIGlkZWEgd2hlcmUgaXQgcHV0cyB0aGUgRUND
IHRob3VnaC4gOikgIAo+ID4KPiA+IEFyZ2gsIEkgZG9uJ3QgbGlrZSB3aGVuIGhhcmR3YXJlIHRy
aWVzIHRvIGJlIHNtYXJ0LiAgCj4gCj4gSSdtIHNvcnQgb2Ygd29ycmllZCB0aGF0IHRoZXJlIGp1
c3QgaXNuJ3QgYW55IEVDQyA6RAoKWW91IGNhbiBydW4gbmFuZGJpdGVycnMgLWkgL2Rldi9tdGRY
CgpZb3UnbGwgc2VlIGlmIHRoZXJlIGlzIEVDQyBjb3JyZWN0aW9uIG9yIG5vdCAoYW5kIGl0cyBs
ZXZlbCkuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==

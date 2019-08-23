Return-Path: <SRS0=tnEL=WT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F338C3A5A2
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Aug 2019 09:25:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0235E21726
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Aug 2019 09:25:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nFdUc43d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0235E21726
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=etictelecom.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:To:
	MIME-Version:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9suEzo3HWDkpg/zvcujAaBp5BUzsUT2uRznuvfa+2/0=; b=nFdUc43dDHUZki
	y8kFb5B2zG4+zgM8DyDuird08VPmkS7dF7C7TLtzpeWgwjO7bxnXMLaiZqfQBYDHWYzyxKyYbIMEw
	afqUR6CzTSd9oHXyhd4Pt0IuPVN1OFoARxuRGmJ3jCaNT5PU43Sv3rK9whGSO4XVoi2gaSNmZsPli
	Fj30rTHmuE5YiDHmdtk74HON2CPEVDZuFMfBelcy4N7UR9S0mVYeX3nzdT4LQHRe0KCIZQ1VytDFP
	zXHujtswpHaZlVOX5Xz/FXuYd3E17e2wiFz+43WtvunYjWokBKCYXNAI2bb+4FKoKgSVlMALvQKTy
	0No513+py4rb/eOTIduQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i15om-0003cz-5e; Fri, 23 Aug 2019 09:25:12 +0000
Received: from 1.mo1.mail-out.ovh.net ([178.32.127.22])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i15oi-0002mR-Gg
 for linux-mtd@lists.infradead.org; Fri, 23 Aug 2019 09:25:10 +0000
Received: from player157.ha.ovh.net (unknown [10.108.54.141])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 15266189390
 for <linux-mtd@lists.infradead.org>; Fri, 23 Aug 2019 11:25:02 +0200 (CEST)
Received: from etictelecom.com (130.9.1.81.rev.sfr.net [81.1.9.130])
 (Authenticated sender: mickael.chazaux@etictelecom.com)
 by player157.ha.ovh.net (Postfix) with ESMTPSA id 6FA418FE5DF4;
 Fri, 23 Aug 2019 09:25:00 +0000 (UTC)
Message-ID: <5D5FB0CC.3050502@etictelecom.com>
Date: Fri, 23 Aug 2019 11:24:28 +0200
From: Mickael Chazaux <mickael.chazaux@etictelecom.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
 rv:17.0) Gecko/20130330 Thunderbird/17.0.5
MIME-Version: 1.0
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: ubifs_check_node: bad CRC
References: <5D3EF488.6010307@etictelecom.com>
 <CAFLxGvyicArpTC_VmE8GPXeHwXVT3CV-Z_5v-+qo=MB9i_-6-w@mail.gmail.com>
 <5D3FF1A6.7050407@etictelecom.com>
 <CAFLxGvzF8iDJG_rTqGwrLdmFsehaLxD4os50_QLZTMjytVQ9Dw@mail.gmail.com>
In-Reply-To: <CAFLxGvzF8iDJG_rTqGwrLdmFsehaLxD4os50_QLZTMjytVQ9Dw@mail.gmail.com>
X-Enigmail-Version: 1.6
X-Ovh-Tracer-Id: 12749127598919488364
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrudegkedguddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190823_022508_709715_3B574773 
X-CRM114-Status: GOOD (  11.01  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 13/08/2019 23:41, Richard Weinberger wrote:

> =

>> The problem occured in the field on several devices, and I cannot reprod=
uce it
>> in the lab.
> =

> It sounds a bit like a memory corruption.
> =

>>> Please also disable compression in UBIFS, then the read back data maybe=
 gives
>>> you a hint what went wrong.
>>
>> In the corrupted node I see data from syslog. This system is a bit diffe=
rent
>> than the others we usually make, as there are more power cuts and more l=
og writes.
> =

> Hmm. Power cuts or many writes should not trigger such a corruption.
> I'd expect ECC errors or data structure errors in UBIFS. But not a good E=
CC
> with bad UBIFS data CRC.
> =

> But with only one sample it is almost impossible to figure...
> =


Memory corruption as in some kind of buffer overflow or use after free ? or=
 physical =

bus errors? Anyway I think I will implement some mitigations at the applica=
tion level, =

(eg. less log messages, recovery by creating a new volume, copy the now-rea=
donly data, =

rename the volume) because the haystack just got too big for the needle.

Thank you for your help,

Mickael

-- =

Mickael Chazaux
Software Engineer
Tel : (33) 476 042 006
Fax : (33) 476 042 001

ETIC TELECOM
13, Chemin du Vieux Ch=EAne
38240 MEYLAN
Tel: 33 4 76 04 20 00
fax : 33 4 76 04 20 01

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7AB6C44536
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2026 13:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3UR+mqe2s0PTU9M2amI2A8C/ixkFKDeL+mag9e3K8Mw=; b=coeWeUdEgJpVSr
	BuDiGLXFsgtLGe2U0LnZocKqg1yJ3hD99L3N1O3ydknt3Es5kgZch1kQep5oLlRP0TxP5N2VALrTE
	uAD3c5QwuldEHKMSdGDkIz1Aufi2av7G/UA7ZE1JupSN+KSV1quuYjlSX8Ml2tCKz/J7rBKXN5F6T
	tEXJEO09TitKYGmk2HPoK9aKBMmubLD81t231JESzpTPqafYPbdYC1x71JoL1/6SKFutIjNBMz5wY
	t2Y27twtGX1cLWUMqP8ILACY+P+KI3dFhFE6/8FjfiLJKMjYfGHXtuRwaqMlPPbNJ0deNSYO+aDLX
	Z2IsGkdwp9TwAH0jTxqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmWvC-0000000Btfa-0AnY;
	Wed, 22 Jul 2026 13:23:38 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmWv8-0000000BtfC-3w71
	for linux-mtd@lists.infradead.org;
	Wed, 22 Jul 2026 13:23:36 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 5B9AB12F;
	Wed, 22 Jul 2026 15:23:32 +0200 (CEST)
Mime-Version: 1.0
Date: Wed, 22 Jul 2026 15:23:32 +0200
Message-Id: <DK54S6U9L51W.1BIED2GDI8AIK@kernel.org>
Subject: Re: [PATCH 03/30] mtd: spi-nor: winbond: Stop filling the .name
 entry
Cc: "Pratyush Yadav" <pratyush@kernel.org>, "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Steam Lin" <STLin2@winbond.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
X-Mailer: aerc 0.20.0
References: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-0-87e5d3122244@bootlin.com> <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-3-87e5d3122244@bootlin.com> <DJRJJB4NEUEP.168MF88DBSFDF@kernel.org> <8733xbji7s.fsf@bootlin.com>
In-Reply-To: <8733xbji7s.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_062335_170617_240925F2 
X-CRM114-Status: GOOD (  19.50  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed Jul 22, 2026 at 2:56 PM CEST, Miquel Raynal wrote:
> On 06/07/2026 at 15:59:53 +02, "Michael Walle" <mwalle@kernel.org> wrote:
>
>> On Fri May 29, 2026 at 5:22 PM CEST, Miquel Raynal wrote:
>>> This is a legacy field, it is often incorrectly filled and will soon
>>> become very incorrect due to IDs being reused.
>>
>> And I thought winbond is doing better... So if you have a contact
>> there, please suggest they are putting a table with a unique
>> identifier per chip there. So we can use that to do fixups.
>
> Yes, this is something that has been raised, I can confirm. We found a
> way through the SFDP data to reliably identify which chip it is since
> the SFDP version has been reliably updated over time (see the RV and PW
> addition patches).

This seem to be two different things here. What I meant is that
Winbond will put a vendor table with a unique id per flash part in
it.

What you have now is some kind of way to differentiate between
existing flashes, that's good, but it's not a generic solution to
the problem.

The end goal here should be to make all flash vendor put a vendor
table into SFDP to sidestep the new notorious flash id reuse. IOW.
put a new id into the SFDP and do it correctly. We should push in
that direction.

>>> Replace the names with a comment above the entry with the newly instated
>>> naming scheme to indicate what chips are covered by each entry.
>>
>> This is exported via sysfs, so this could be a regression.
>>
>> Not sure..
>
> Yes, but the names are totally wrong. And become even wronger with the
> addition of the RV, PW, etc families. I was already asked to not put a
> name on the new additions, I believe we should drop those fields, they
> are very misleading. So what is your final position? Pratyush any
> feedback? I can keep the old names, but, well, you know my position,
> they are wrong and old.

Well, but that's actually on Winbond for just reusing the IDs :)
Sheldon me would also be dropping the wrong names, but yeah, it
might be an ABI now. Maybe a SFDP fixup could just unset the name
for newer flashes.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

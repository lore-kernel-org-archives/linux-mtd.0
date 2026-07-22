Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C266C4453C
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2026 15:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ppo+l/3cXa6VmscqkzbVZsR9qH8GUfavskEogmSdAA0=; b=Y9kenzh5/poJKd
	sXsSvN9Xn8Hd4OJLV7KvhIUHCiG8l0GKo3h+PWkmHzJwjM2dNxfleC8BuJxre6s8b6cXOmg0hhT6D
	7wy4gyGr46G3RoYDiBs420DKl3/Ux6etgI0iDQKOAp55ypNZ+PI4lRKrdmqSccUosLfqNUMoBM5KP
	+0mSXmsXp4umJKwxTfmerUXDXP0sRDMbrKzplXOGfVlsze4DmIw7cG2ORlij9dKRj2iTZElgJX6jB
	f51uDz2nn2WXVVUVzTJGXgyIlPxK6QlFQYHj4cZQefXu9X3b7XlppgZ0S62LEbL2zPDNvfWCfrnBt
	d7gCke9/f0j3hfRqLLCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZEW-0000000CG4X-2i3Y;
	Wed, 22 Jul 2026 15:51:44 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZET-0000000CG37-2Xwz
	for linux-mtd@lists.infradead.org;
	Wed, 22 Jul 2026 15:51:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 446251A1170;
	Wed, 22 Jul 2026 15:51:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0C31F60388;
	Wed, 22 Jul 2026 15:51:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 04F3711BD2234;
	Wed, 22 Jul 2026 17:51:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784735497; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=HNd93889pYseDJt9BalvcazzZRow9GWLIkcfLoh+4hc=;
	b=yw7+O3k2/1Pie135iKW3VzG892M/sfQ7d60pNGeGLjq80qO8Wjv965+kn+ZnYQCq7T4OeO
	Lx+rL5SkcFa1AmGsxw7BdTsfoi1iOuLwHSAm0nNEhk4fGmW69i+8KrxmHbcNLPxxDLHq/4
	JI1/q19l47RqV6PltKBeT2C+0dzYTymz0hGbPMuXKFN0dclRPtBl1u3kLco/cssW96adZH
	F3HdQ/ZqRNSOl17+adY9Qv3AI71IQyLTckg4Jp6OfJNgQcEqAzkSdNCJC+jv74dRI5ry2H
	HJGOtAT+SnigHiF1B5dHKjFOdvshuX9b96x4VR5/VdgClNsSWzZ84IwhqdoKjA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Richard Weinberger" <richard@nod.at>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  "Steam Lin" <STLin2@winbond.com>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 03/30] mtd: spi-nor: winbond: Stop filling the .name entry
In-Reply-To: <DK54S6U9L51W.1BIED2GDI8AIK@kernel.org> (Michael Walle's message
	of "Wed, 22 Jul 2026 15:23:32 +0200")
References: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-0-87e5d3122244@bootlin.com>
	<20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-3-87e5d3122244@bootlin.com>
	<DJRJJB4NEUEP.168MF88DBSFDF@kernel.org> <8733xbji7s.fsf@bootlin.com>
	<DK54S6U9L51W.1BIED2GDI8AIK@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 22 Jul 2026 17:51:33 +0200
Message-ID: <874ihrhvju.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_085141_788483_B47BC4D4 
X-CRM114-Status: GOOD (  22.99  )
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

On 22/07/2026 at 15:23:32 +02, "Michael Walle" <mwalle@kernel.org> wrote:

> On Wed Jul 22, 2026 at 2:56 PM CEST, Miquel Raynal wrote:
>> On 06/07/2026 at 15:59:53 +02, "Michael Walle" <mwalle@kernel.org> wrote:
>>
>>> On Fri May 29, 2026 at 5:22 PM CEST, Miquel Raynal wrote:
>>>> This is a legacy field, it is often incorrectly filled and will soon
>>>> become very incorrect due to IDs being reused.
>>>
>>> And I thought winbond is doing better... So if you have a contact
>>> there, please suggest they are putting a table with a unique
>>> identifier per chip there. So we can use that to do fixups.
>>
>> Yes, this is something that has been raised, I can confirm. We found a
>> way through the SFDP data to reliably identify which chip it is since
>> the SFDP version has been reliably updated over time (see the RV and PW
>> addition patches).
>
> This seem to be two different things here. What I meant is that
> Winbond will put a vendor table with a unique id per flash part in
> it.
>
> What you have now is some kind of way to differentiate between
> existing flashes, that's good, but it's not a generic solution to
> the problem.
>
> The end goal here should be to make all flash vendor put a vendor
> table into SFDP to sidestep the new notorious flash id reuse. IOW.
> put a new id into the SFDP and do it correctly. We should push in
> that direction.

Yes.

>>>> Replace the names with a comment above the entry with the newly instated
>>>> naming scheme to indicate what chips are covered by each entry.
>>>
>>> This is exported via sysfs, so this could be a regression.
>>>
>>> Not sure..
>>
>> Yes, but the names are totally wrong. And become even wronger with the
>> addition of the RV, PW, etc families. I was already asked to not put a
>> name on the new additions, I believe we should drop those fields, they
>> are very misleading. So what is your final position? Pratyush any
>> feedback? I can keep the old names, but, well, you know my position,
>> they are wrong and old.
>
> Well, but that's actually on Winbond for just reusing the IDs :)
> Sheldon me would also be dropping the wrong names, but yeah, it
> might be an ABI now. Maybe a SFDP fixup could just unset the name
> for newer flashes.

That could work, but would badly impact readability of the table:
developers would see a name that is not matching their chip but is
matching their chip ID, but since the name would not appear in sysfs,
they might think the entry is not used, although it would in
practice... What a (useless?) nightmare.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

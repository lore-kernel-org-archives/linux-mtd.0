Return-Path: <SRS0=FPAn=5K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8057C10DCE
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2020 01:10:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4FED2073C
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2020 01:10:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RLoizy3J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4FED2073C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S4RZO+mDIFuhqP0IpYP8L0GYQGXsPh/M3Ps0wQbYvqE=; b=RLoizy3J+Y2WNq
	WgsWwDcCXv+xzlG7jVBynBDNPjSNVb+h/RpJwPageYcU9a1TubsAAPzrNmMhF38CH1fL7u8YQeg0w
	cV7xqekE5E5Q0YgUj225dhkDpQTSQN0PfBdkejGEy+o8ZjnPQGvYGUQdykyOkQnfc01R1bwnRHoQ3
	9T1SjcIyRfzvYr4Fcv7uKqJRNIGFt8OgGl/4tT95ug0k9KsJRIDm1KV9Oy0lgTutaZb9KKr5s1jZg
	tj8F5URFMOtF2NLdwczqTH0fZR33BJHFNnsivEorXo0BJdZzuaI/mqaZjqoe4jVsIeb3O0ZzUq2+y
	jJ3l7aX5hW45ZyFeCQTg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGuZ1-0000aQ-Eh; Wed, 25 Mar 2020 01:10:35 +0000
Received: from twhmllg4.macronix.com ([211.75.127.132])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGuYx-0000Z4-Lh
 for linux-mtd@lists.infradead.org; Wed, 25 Mar 2020 01:10:33 +0000
Received: from twhfm1p2.macronix.com (twhfmlp2.macronix.com [172.17.20.92])
 by TWHMLLG4.macronix.com with ESMTP id 02P19dJM056234;
 Wed, 25 Mar 2020 09:09:39 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.mxic.com.tw [172.17.14.55])
 by Forcepoint Email with ESMTP id 8F40FA52ED8DA1FC9596;
 Wed, 25 Mar 2020 09:09:39 +0800 (CST)
In-Reply-To: <20200324225739.11538d08@xps13>
References: <1584517348-14486-1-git-send-email-masonccyang@mxic.com.tw>	<1584517348-14486-3-git-send-email-masonccyang@mxic.com.tw>
 <20200324225739.11538d08@xps13>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v4 2/2] mtd: rawnand: macronix: Add support for deep power
 down mode
MIME-Version: 1.0
X-KeepSent: 7F063DBA:65AA16F3-48258536:0006374F;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OF7F063DBA.65AA16F3-ON48258536.0006374F-48258536.00065F7D@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Wed, 25 Mar 2020 09:09:39 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2020/03/25 AM 09:09:39,
 Serialize complete at 2020/03/25 AM 09:09:39
X-MAIL: TWHMLLG4.macronix.com 02P19dJM056234
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200324_181031_978397_6D8185B4 
X-CRM114-Status: UNSURE (   5.25  )
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
Cc: vigneshr@ti.com, bbrezillon@kernel.org, juliensu@mxic.com.tw,
 richard@nod.at, s.hauer@pengutronix.de, yuehaibing@huawei.com,
 linux-kernel@vger.kernel.org, frieder.schrempf@kontron.de,
 linux-mtd@lists.infradead.org, stefan@agner.ch, tglx@linutronix.de,
 allison@lohutok.net
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi Miquel,

> Mason Yang <masonccyang@mxic.com.tw> wrote on Wed, 18 Mar 2020 15:42:28
> +0800:
> =

> > Macronix AD series support deep power down mode for a minimum
> > power consumption state.
> > =

> > Overload nand_suspend() & nand_resume() in Macronix specific code to
> > support deep power down mode.
> > =

> > Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> =

> This was not based on nand/next so as I applied changes in this files
> (patches 1 and 2 of the original series) this patch did not apply. I
> manually merged it.

Got it and thanks a lot for your help.

> =

> =

> Thanks,
> Miqu=E8l

best regards,
Mason


CONFIDENTIALITY NOTE:

This e-mail and any attachments may contain confidential information =

and/or personal data, which is protected by applicable laws. Please be =

reminded that duplication, disclosure, distribution, or use of this e-mail =

(and/or its attachments) or any part thereof is prohibited. If you receive =

this e-mail in error, please notify us immediately and delete this mail as =

well as its attachment(s) from your system. In addition, please be =

informed that collection, processing, and/or use of personal data is =

prohibited unless expressly permitted by personal data protection laws. =

Thank you for your attention and cooperation.

Macronix International Co., Ltd.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

CONFIDENTIALITY NOTE:

This e-mail and any attachments may contain confidential information and/or=
 personal data, which is protected by applicable laws. Please be reminded t=
hat duplication, disclosure, distribution, or use of this e-mail (and/or it=
s attachments) or any part thereof is prohibited. If you receive this e-mai=
l in error, please notify us immediately and delete this mail as well as it=
s attachment(s) from your system. In addition, please be informed that coll=
ection, processing, and/or use of personal data is prohibited unless expres=
sly permitted by personal data protection laws. Thank you for your attentio=
n and cooperation.

Macronix International Co., Ltd.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

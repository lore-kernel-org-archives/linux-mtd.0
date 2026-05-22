Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DBA0CD5BB3
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2026 16:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AhSJKwrd16uG3q4tDKiX5AokK9NiVYWgLZD89ZoO/8I=; b=SSXKLRujJfGKpR
	QEnC7PNbtPQelnM3mKDxePRe+BHqqFeQIVrzuC7NgUGZN1Tg3UakgApd3/8lSDIB5i336XKWit6E9
	WgthLPf6u5gXnhMgyZAEiMQAGLxCvuXTsF1jUDe6z44bYdsyn4oQ7i+RmOKIEVFvV3ODQ2aATDVGe
	AMHvfx+c4ev07UrT4niNWG0I5I6xfQOMapAUTkoJzEmkPQBALRxTzwwqdwL4vnVo8bl/Hr8decEN6
	sks7OKkvtfUuzYsGVDNC4v4Kg25ozrVVxKMBenzd/UskXZ7i55+twM0dGy864mpCIlW8pjcAiqVb8
	GK/1/Ubob3E0lh7D+IEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQSO9-0000000BN2C-2HP2;
	Fri, 22 May 2026 16:06:17 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQSO6-0000000BN1b-2tzn
	for linux-mtd@lists.infradead.org;
	Fri, 22 May 2026 16:06:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2359EC5E179;
	Fri, 22 May 2026 16:07:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 71E0C6003C;
	Fri, 22 May 2026 16:06:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1590710811604;
	Fri, 22 May 2026 18:06:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779465970; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=9xacnRpg4W5meEuTwneUnNV8XO5zOlIIsbg3+CODjXM=;
	b=IMCSY/ACLu9CWZgXj+dk/78nIdJb1q0gucT4uxcTaETe+wbx1NSPPUMewxeGUHlNFzVttv
	Y6j6AU1i7+rN7/WmASadM/ByNeQ5gN/DIndccxv4HZzFqyrYQHRWaU6hC5/1Vjrq7w6EA4
	EoJe8r6obpNICdEY/KCUJJ/86P3V3Z4DqDAETHPee2wT0Z6x0v2xVFXz/CZps168rt2UNG
	XUGqjrtSXqZi34Hx+0JXW9JtiCcSHzPaADU6AL8NihbLleMWvjBplBUTKmOOX7AkV1Ydif
	7cUd88eKeamgWqGqFYTgnx4tSbS6o9PJyFPXmTobz1nFOV1Opb8sfM+/fEWHYg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Jonathan Corbet <corbet@lwn.net>,  Shuah Khan
 <skhan@linuxfoundation.org>,  Sean Anderson <sean.anderson@linux.dev>,
  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Steam Lin
 <STLin2@winbond.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 13/28] mtd: spi-nor: swp: Create a TB intermediate
 variable
In-Reply-To: <a54562a0-1a75-401c-9508-8e0322d81a3f@linaro.org> (Tudor
	Ambarus's message of "Fri, 22 May 2026 12:39:48 +0300")
References: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
	<20260507-winbond-v6-18-rc1-spi-nor-swp-v5-13-93453e1a9597@bootlin.com>
	<a54562a0-1a75-401c-9508-8e0322d81a3f@linaro.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 22 May 2026 18:06:06 +0200
Message-ID: <87zf1ro2dt.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_090614_882616_13EDFD18 
X-CRM114-Status: UNSURE (   8.51  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


On 22/05/2026 at 12:39:48 +03, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:

> On 5/7/26 7:46 PM, Miquel Raynal wrote:
>> Ease the future reuse of the tb (Top/Bottom) boolean by creating an
>> intermediate variable.
>
> Please squash this in the patch that needs it.

The problem with CMP addition is that it touches all functions all over
the place. I want people to be able to focus on the CMP addition, not
all the side changes which have nothing to do with the CMP addition by
itself. Most of the preparation patches are just steps in that
direction, they could also be squashed, but overall they make the final
diff much simpler. I believe every small change making that last step a
little bit easier to read goes into the right direction?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

Return-Path: <SRS0=cYNo=AK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0584FC433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2020 09:14:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C886A233A2
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2020 09:14:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HlSHHcAZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4NL5xSpo";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="b98lAQeb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C886A233A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HXMr32yHL0xwlSGhvmJ1OKeIkE+Y6guPNB12KwmLKnY=; b=HlSHHcAZnzYqeJgcCr2sDQbH8
	hIV2NyRBur+PEJ7RCgLkwD4pUk46zCCBhCdOUmbSwejYkYNZVatH914XHQ8cVJZsPz/myI/hM0mcl
	KZ/SxpUniPJHh2BhCADtGNB2nD5qZTzTwrWMwRgntNEE216S/8U27A6UcPmEZVhi2AdoB3gWcO/Cf
	TjlUB8Cz2AzKbhDvmxyu+UytW9Qq6MIXnQJaROXjb+vXAE2j0iJvIN5Y14IE6IFJy+dku9v87a2Uv
	t3K1XLzWX3RJwUy61AVzHlcioycTl75IT4n2R/Y/o1rPA8RfBni+CyrVM7977Mbpk/YVb5s6AhZ2q
	pIoVMCJHw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jppr6-0005Gm-8x; Mon, 29 Jun 2020 09:13:36 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jppr3-0005G9-SO
 for linux-mtd@lists.infradead.org; Mon, 29 Jun 2020 09:13:34 +0000
Date: Mon, 29 Jun 2020 11:13:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1593422012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dW3Qbd0PjI/AYjIKPLLwXVRJGt+j8lA2SaYDanwbG8A=;
 b=4NL5xSpoApF0wL9FrSzDlFWCUcnc/VFFV7IJhzbRee7T6RCbIJu1XT2/iPQiIujPUEfyaN
 ZKeofxawy/ySuE1Wj9pnDEVC2BsYkg+4w5HAtnmDjtDZB3AfkoLkhIlkbn5ifX/xwGHfw+
 eIj0IS6scYNlL6opA4vAPqwKHwNlQTBcWjKSU43VeI3nyl6VY8ILGUsBOtLaeSLVKtuv7g
 94MKRvyNUHczr6Ox0EPYPDhAcsaBb+mppXE7Uz1p5qEJHqWY2EBtXLeJu7x8Y+tf1sv7k5
 5tIzz1L8tpTb0+cxrxsp2yLXvn4tlnzF439jtm+3FB4qTfhn/E4ySCVbcYrHzA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1593422012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dW3Qbd0PjI/AYjIKPLLwXVRJGt+j8lA2SaYDanwbG8A=;
 b=b98lAQebh5JTBPh0h7+C3+m5VgFKCxlBuRI7TCjhsO+vO9uSmDSCJzRPZudQSfT/7++8t8
 rJvgCFHBjMoFlvDw==
From: Torben Hohn <torben.hohn@linutronix.de>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v2 0/4] ubifs: support authentication without hmac
Message-ID: <20200629091331.GC17241@linutronix.de>
References: <20200625155927.28430-1-torben.hohn@linutronix.de>
 <20200626112907.13201-1-torben.hohn@linutronix.de>
 <1644538308.62483.1593181011127.JavaMail.zimbra@nod.at>
 <1203806497.62586.1593182186554.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1203806497.62586.1593182186554.JavaMail.zimbra@nod.at>
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
Cc: bigeasy <bigeasy@linutronix.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 tglx <tglx@linutronix.de>, david <david@sigma-star.at>,
 Sascha Hauer <s.hauer@pengutronix.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Jun 26, 2020 at 04:36:26PM +0200, Richard Weinberger wrote:
> ----- Urspr=FCngliche Mail -----
> > I didn't dig deep into the code so far, I'm still checking the concept.
> > =

> > Your approach works only on pristine offline signed images from mkfs.ub=
ifs.
> > So, if somebody does this, it won't work:
> > =

> > $ keyctl padd logon ubifs:authfs @s < secret.key
> > $ mount -t ubifs /dev/ubi0_0 /mnt/ -o
> > auth_hash_name=3Dsha256,auth_key=3Dubifs:authfs
> > =

> > ... change the fs ...
> > =

> > $ umount /mnt
> > $ mount -t ubifs /dev/ubi0_0 /mnt/ -o auth_hash_name=3Dsha256,ro
> > =

> > The ro mount will fail because UBIFS is no longer able to verify the su=
per block
> > using the system key ring. It was overwritten by they ubifs:authfs key.
> > =

> > A possible solution is keeping a copy of the offline sign key forever i=
n the fs.
> > But I'm not sure whether this is wise.
> =

> Or we change the feature from "ro mount without hmac" to "keep offline si=
gn key and imply ro mount".
> IOW adding a new mount option such as "auth_keep_offlinekey". If mounted =
with this option
> UBIFS will not look for a hmac and enforce read-only mode.

Thats just another name for the same feature.
But it indeed seems to make the implications clearer.

And it porbably also makes the code easier to read.

> =

> Hmm?
> =

> Thanks,
> //richard

-- =

Torben Hohn
Linutronix GmbH | Bahnhofstrasse 3 | D-88690 Uhldingen-M=FChlhofen
Phone: +49 7556 25 999 18; Fax.: +49 7556 25 999 99

Hinweise zum Datenschutz finden Sie hier (Informations on data privacy =

can be found here): https://linutronix.de/kontakt/Datenschutz.php

Linutronix GmbH | Firmensitz (Registered Office): Uhldingen-M=FChlhofen | =

Registergericht (Registration Court): Amtsgericht Freiburg i.Br., HRB700 =

806 | Gesch=E4ftsf=FChrer (Managing Directors): Heinz Egger, Thomas Gleixner

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

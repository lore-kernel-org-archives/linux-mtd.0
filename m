Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5BCDC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jan 2022 13:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=cXCRvpyORGSdpZ5fWkpAycFnjs9NgtLtxtueuYfpeVU=; b=ZAf
	9JRcbCLTEF+/tp4vtyAi1LZiKQSUcasfZkATAdqc53K1NJVG2B8VPsg7D61to/445A0hm8zAynITR
	P6EMW1IjuThS6cXDRETpG0iyr4pVVLWjno3fL5L8KLHtrfCXEgFEkCnsfizJeJzed3g4W6+pTjTto
	pNdI1Wp5rL/wlzvM6D5gqRuW5c5FkjtBhELmY1c3nQ+seLzy53rGtt5dYw96n5iQlH7ejYh0Lg/zT
	1wkgWfDjsIh20xka74FlXOtfs/NH2ZNoF3UDmmMkg+IaE9lQBjvTd8cBcyfEJztbx6m8IFEW1QUqF
	iqoEhUlkDKYU3IwQ4TETqtSOMsgarCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nByxf-003M7W-NZ; Mon, 24 Jan 2022 13:00:43 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nByxc-003M64-Al
 for linux-mtd@lists.infradead.org; Mon, 24 Jan 2022 13:00:41 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id s6so13553317qvv.11
 for <linux-mtd@lists.infradead.org>; Mon, 24 Jan 2022 05:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=A/izteUQPWGLy1ZBe5SvgYtpqXpWeOOavaOC/pgeMjA=;
 b=E+Y+xXITjpnowEJw7HlmDOUKWmPebceEUnrrHN8hXXn/YrRfsHO2+ILqiAC5LaHBHk
 R/arXNOHBYl9ejCle1tEbzmwKozgJaBH0Urd3rRNR6IFi8FvVoq3S26EC11U4KPAAp8a
 gQ5CLeE/wOOv5o1TckCwyHnLwQzwAvY0diMn0HwUXbaUMX+RMR3ZZcHWBGOMeV4dYmkz
 q61NimtkxitqrXFm70Xc+cfWuZXSTnVNYdte842TG2ceC2H0+rtqBGwHhRLG/LQEFDAc
 X143uyUS14jIXCco4+dtxKf7v8qTNFYrROXM8G8TUV7I1wAIGMop/0A0Mtm9Z+3pzzTm
 LKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=A/izteUQPWGLy1ZBe5SvgYtpqXpWeOOavaOC/pgeMjA=;
 b=fGP2fm2hEUE/IZpreBxAGuptQskR8PkYWk+pGcjFfc9sYOyz/c7g0HDZ9nlqFpo+58
 9bukkC9l9uUA0akTix87HT6nKrUBVZuuYf6c2u1nbPt6wZ0WPL7d0SAPVf5p+8shx48+
 Zxk1/oF3YkoJ5f9301iwQxJ/syJwEltLIQiC+70+UIQZK5147YsJDH9PKIIxBThR8qd2
 T9A2lq2Ne5iy84w06WlRpHQu4lTtuNVdl5EqM5I8gs9X27+SY31sScK2fkBnacMt8dXF
 v/I9DaSQND7vwmPRiqfOWz6YsbZ9JBNvIxzvvYnDyUHvAPWCQ8DOkfXoJ/VwtqqbjZyA
 c6+g==
X-Gm-Message-State: AOAM533PeZHWynudfk5Kf9AFExaEt35oeH2ONPOFWzYg1s1jZ3jTSzka
 loDGLqubIlUIm3cSxUfVBsOYArmBtAHWYYfeNzCLAl5jKEY=
X-Google-Smtp-Source: ABdhPJzNzGkxJng6xI8kZ0hpThV+YxvcbCXjHVIVgC3aSbWRtMUC3tQ0vToOTXttBW187Gxve1v5rIPzHhhSGGwzKyo=
X-Received: by 2002:a05:6214:d41:: with SMTP id
 1mr14261959qvr.68.1643029238074; 
 Mon, 24 Jan 2022 05:00:38 -0800 (PST)
MIME-Version: 1.0
From: Sergey Zakharchenko <doublef.mobile@gmail.com>
Date: Mon, 24 Jan 2022 13:00:27 +0000
Message-ID: <CADYCxoPywV3de24UfZRirnyU0F==oLy992945LH9Lz+FinmoJw@mail.gmail.com>
Subject: block2mtd status request
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_050040_417479_839245B8 
X-CRM114-Status: UNSURE (   7.26  )
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

Hello list,

I'm trying to emulate an MTD device (using block device + block2mtd)
on a reasonably recent (5.4.x) kernel; this used to work on an older
4.9.x kernel, but now operations on the resulting MTD device issued by
the filesystem hang indefinitely.

From my entirely naive point of view, it would seem like block2mtd
triggers an unexpected generic_make_request recursion (e.g. SquashFS
asks for an MTD page, block2mtd asks for block device page, second
request goes onto the queue of the first one, the requests infinitely
wait for each other to complete).

I have a crude workaround for this, but my question is: Is block2mtd
supported at the moment?

Best regards,

-- 
DoubleF

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

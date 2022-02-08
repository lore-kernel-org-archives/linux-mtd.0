Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9001AC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Feb 2022 08:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BeNQg4qkBeoOXBDgt7ZCYkF7jZA44z909BWSpPqV00o=; b=owJIXoauW1A1Xt
	jbHkXBFcnmNJPXJ74Saj1utzzjL59C3wV+jitehe5mZ+U9PjyYThHUt2b+A3NhGD5VUdkoE3KkEHd
	5Uuj92x+7vESnuXKAvlHXUBsuw36EAVVi7mfSSP61EQODktw26MC6eAuOxhujucQWVEQV03w5f/7w
	ymBZmVZ59jTWRE0e57ySuK8vwiNNCHDWgLTr2wxZaOl728Owl/n1qh39oHk6CRJ6TMJRy7p/bc38o
	YOLVPCrI7AYDtmPM0uD56bMJyberUWP7o2cjggjjnFRGGXvkxk8vsH0T0FRJXlh2acUkZb/ToxgiC
	JJB71Jly3rdMzToFyStg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHMBz-00D4vK-EJ; Tue, 08 Feb 2022 08:49:43 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHMBv-00D4t5-1s
 for linux-mtd@lists.infradead.org; Tue, 08 Feb 2022 08:49:41 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 49D9960008;
 Tue,  8 Feb 2022 08:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644310176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fd4uFtjJGdfJJRwtaUHWCEU07/RNAAQNRJtK8s2mzd8=;
 b=LfDLqMxR8q5HG5/ou30jf/aMXvkUet5xFv6OvZ4BzwNreZ5GdvRwTq8XIQvLl7SP1VnO14
 ce+iDmDkL2WfUe58kYBv3Z+rvo1n1PeRD4buA2PM7uzSP/xu/C5B2cwCH3mF9JUR4Egsn1
 YtqTikj9mtErK09HoqG2oTph/UUxL/ykzL0iSUzKOepnFixAZHjxZCnBrSbb6Ef1luwcod
 7DQ3/BAcS4ECqGqxhLJTz51vJp9F9a5pzON1DcSrHu/vlfBfCpbPwTEkocq4hXKkbYLbfj
 ZCRQ+xsTYufC8rup445NDq/HtrRZ0gaMO4F6jgZOQJDOfLd5QnK3aaoP/Gx3xA==
Date: Tue, 8 Feb 2022 09:49:31 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Greg KH <gregkh@linuxfoundation.org>, linux-mtd@lists.infradead.org
Cc: Sean Nyekjaer <sean@geanix.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon
 <bbrezillon@kernel.org>, stable@vger.kernel.org, sfr@canb.auug.org.au,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mtd: rawnand: protect access to rawnand devices
 while in suspend
Message-ID: <20220208094931.0b4454dc@xps13>
In-Reply-To: <YgIsK+eGr6pqHQhQ@kroah.com>
References: <20220208082507.1837764-1-sean@geanix.com>
 <YgIsK+eGr6pqHQhQ@kroah.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_004939_377435_33210907 
X-CRM114-Status: GOOD (  11.93  )
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

Hi Sean,

gregkh@linuxfoundation.org wrote on Tue, 8 Feb 2022 09:39:07 +0100:

> On Tue, Feb 08, 2022 at 09:25:06AM +0100, Sean Nyekjaer wrote:
> > Prevent rawnend access while in a suspended state.

                ^
Just saw the typo here

> > 
> > Commit 013e6292aaf5 ("mtd: rawnand: Simplify the locking") allows the
> > rawnand layer to return errors rather than waiting in a blocking wait.
> > 
> > Tested on a iMX6ULL.
> > 
> > Fixes: 013e6292aaf5 ("mtd: rawnand: Simplify the locking")
> > Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> > Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

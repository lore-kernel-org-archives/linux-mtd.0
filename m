Return-Path: <SRS0=Emx/=DU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD60C433E7
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2020 17:15:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88B8D25337
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2020 17:15:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dk1lsv/u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88B8D25337
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:Date:To:
	From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4NYzyEgnY/krKgIda8j1GYwdpuzl6UgxnXlYbNJrD0g=; b=dk1lsv/uC6esbdQVTs64K8BZs
	EE7VeqrzmWRO/dFosg8/m0JpghFjGY8WBmikNhSj7W0NZ1/QkLHw/FsUIsyCZaK7cmCIC/jb9i+Lz
	Hw/peQuznVBzeQhRhKpGoS114XAxbTDoPczaV7uAV+m+BZFwgXR9d/I0ROt05819vyxNAchGZCrw0
	6zIqxHRVgy0dFqHnv/R6IbsWwK60NFWjnmTOHpWyH8fEjDC2r1/HcFV50qelG210xOgo4WJcJ7IKP
	unP6T4fNG1F+sf9ABxO4RMvr6uVyxAD5Jk8L0hIj43WnXb1a0/PWwE49oCWpRhYlrG/14sWCP/s5V
	cShctDsHg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSNsa-0002AA-An; Tue, 13 Oct 2020 17:14:28 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSNsY-00029g-EI
 for linux-mtd@lists.infradead.org; Tue, 13 Oct 2020 17:14:27 +0000
Received: from [2a0a:edc0:0:900:6245:cbff:fea0:1793]
 (helo=kresse.office.stw.pengutronix.de)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1kSNsU-00047V-N8; Tue, 13 Oct 2020 19:14:23 +0200
Message-ID: <622a62489fa717fe8a94cd2e9cdf3d906da5141f.camel@pengutronix.de>
From: Lucas Stach <l.stach@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>
Date: Tue, 13 Oct 2020 19:14:21 +0200
In-Reply-To: <CAOMZO5BVHBqxLSEZgEqHEdAXstaK8GHHqjQnY+FtOJhXjX--qw@mail.gmail.com>
References: <CAOMZO5DnGGbZg_th=kjwBmNa8FznYErYCGvmD6dKgBbMV869+w@mail.gmail.com>
 <20200921094010.GH21278@pengutronix.de> <20200928172012.712035f8@xps13>
 <CAOMZO5CzNrGnwAB4zuUzeO3LVUqxaD4u0UXfYO8HBNcKSS-mvw@mail.gmail.com>
 <CAOMZO5D8W+Z5enehxFt7XTPn6sEXe9pWM6Tn1SixMntkZ31Wgw@mail.gmail.com>
 <20200930165831.418b8edd@xps13>
 <CAOMZO5BVHBqxLSEZgEqHEdAXstaK8GHHqjQnY+FtOJhXjX--qw@mail.gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:6245:cbff:fea0:1793
X-SA-Exim-Mail-From: l.stach@pengutronix.de
Subject: Re: imx27: Unsupported ECC algorithm
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_131426_490478_154F10E1 
X-CRM114-Status: GOOD (  20.31  )
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
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org,
 Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Do, 2020-10-01 at 18:39 -0300, Fabio Estevam wrote:
> Hi Miquel,
> 
> On Wed, Sep 30, 2020 at 11:58 AM Miquel Raynal
> <miquel.raynal@bootlin.com> wrote:
> 
> > I found a board (NTC C.H.I.P, sun5i R8 SoC) with a parallel NAND.
> > 
> > with the same DT properties but a different NAND controller driver I
> > could not reproduce the issue.
> > 
> > However, I did tried with soft BCH and I found a related error which I
> > just fixed. I also got a bug report from Intel's robot which I also
> > fixed. Perhaps what you see is related (still around this ->total entry
> > not being set at the right moment at probe time).
> > 
> > If tomorrow's report still returns an error, we will need someone
> > to get physical access to the device to add debugging code and track
> > down the failure.
> 
> The linux-next 20201001 results from the kernelci Pengutronix lab did
> not show up, so let's wait to see the imx27 boot log to be back online
> again.

Just a heads up: our lab was broken for some time due to a local issue.
It's now back to working and the backlog of jobs is being executed on
the boards right now, so results should show up in the near furture.

Regards,
Lucas


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

Return-Path: <SRS0=la4X=XL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C324C49ED7
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Sep 2019 09:43:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58191206C2
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Sep 2019 09:43:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kB1bDtm3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JCUG8AWm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58191206C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WLJsTTgNBqGdU3K35S6u/Eu4r4RoBbfBpNs+VOwbij8=; b=kB1bDtm3KYEISC
	hJmWAi/LCR5vDY0dCKaHcK55hv1Gezuxnnb2ViJNCSdVrgIihQJbQzJZ7va5Z31du/Pz/h6WRoFSy
	FWG/UqBN2QB44DRxepRHA6WbWKS9AK9NB5bZqggei7hJSt7FxMaD9KALtu4gw70wbp/S/9j/yn9or
	G+YK+EvZmqNtMRjFqSOo/GJDukgEhTCGtFU7dK6tbOfB1c/+QAZ46sTZLcPTVg5X+z9+ng6iy8DV4
	Upb7V0iWdIuRVJuipMMwYLsSvKZ/ic8CjLeAI8lZilwkf9Ha5kDQpuxDd2Ncw39cI6+Fs5WkNqoE4
	/wXeoUX+ofLN6WjJ/85Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i9nXT-0002lp-TA; Mon, 16 Sep 2019 09:43:19 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i9nXS-0002le-Ij
 for linux-mtd@bombadil.infradead.org; Mon, 16 Sep 2019 09:43:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MerZGLjBa4o3KYLqDmeoSQA4MxnWkVS1cTanFYS2ARE=; b=JCUG8AWmW94eh9JFIuybYz5rq
 kxVelQ2Bm5VEA1qHNrIVZ68aEY3mznhnw5F20ilPlWTiGJmb8GeDW4F/UlFgm30P2MUlhzT5KBcrb
 iWEGw5pTSlt43xi0COXQqK9DNiXOeJoUv/a1NBnkVvtnHzAy777DxiaMxAYgXmrUlgdCthk2Dj/wt
 sIOwxyyMW8HtnN+vBJ+AsqIsOaFjhuVlKS5sYxJV4hKHyuW1ziKMCo52anMRjgBj609uomsIgbrLJ
 Lcn22y4qLVJ/7RqEokfAp0D1V6sTlIY8Ou4ArRIK87VFL6B2AoB7+2k7SMD35px47YNlugr9FFgGx
 hb9FuaXeg==;
Received: from mga09.intel.com ([134.134.136.24])
 by casper.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i9nXh-0002SJ-AP
 for linux-mtd@lists.infradead.org; Mon, 16 Sep 2019 09:43:35 +0000
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Sep 2019 02:42:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,512,1559545200"; d="scan'208";a="201566288"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
 by fmsmga001.fm.intel.com with SMTP; 16 Sep 2019 02:42:09 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 16 Sep 2019 12:42:08 +0300
Date: Mon, 16 Sep 2019 12:42:08 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Jethro Beekman <jethro@fortanix.com>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: intel-spi: support chips without
 software sequencer
Message-ID: <20190916094208.GU28281@lahna.fi.intel.com>
References: <69f4a8e8-7889-8b00-0adc-7faaef6b42e4@fortanix.com>
 <32ab6570-c3b7-4eec-7a0b-69bc2f7f76dc@fortanix.com>
 <20190916091157.GR28281@lahna.fi.intel.com>
 <e284a2a8-1d4c-2b57-642c-c91f39a5ee99@fortanix.com>
 <20190916091920.GS28281@lahna.fi.intel.com>
 <f7708f65-1450-ce5a-7dfb-70d7ca4b9df1@fortanix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f7708f65-1450-ce5a-7dfb-70d7ca4b9df1@fortanix.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190916_104333_691465_F7F38112 
X-CRM114-Status: GOOD (  22.77  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Sep 16, 2019 at 09:22:04AM +0000, Jethro Beekman wrote:
> On 2019-09-16 11:19, Mika Westerberg wrote:
> > On Mon, Sep 16, 2019 at 09:12:50AM +0000, Jethro Beekman wrote:
> >> On 2019-09-16 11:11, Mika Westerberg wrote:
> >>> Hi,
> >>>
> >>> On Sun, Sep 15, 2019 at 08:41:55PM +0000, Jethro Beekman wrote:
> >>>> Could someone please review this?
> >>>>
> >>>> On 2019-09-04 03:15, Jethro Beekman wrote:
> >>>>> Some flash controllers don't have a software sequencer. Avoid
> >>>>> configuring the register addresses for it, and double check
> >>>>> everywhere that its not accidentally trying to be used.
> >>>
> >>> All the supported types in intel_spi_init() set ->sregs so I don't see
> >>> how we could end up calling functions with that not set properly. Which
> >>> controller we are talking about here? CNL?
> >>>
> >>
> >> Yes, see 2/2.
> > 
> > OK, thanks. Please mention that in the commit log as well.
> 
> It seems obvious to me that the need for a patch may be further
> explained by the next patch in the patch set.

Yes, that's fine but then you should make sure the intended reviewers
get to see all the patches in the series. For me I got only Cc'd on this
1/2 yesterday. I think I reviewed 2/2 some time ago.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

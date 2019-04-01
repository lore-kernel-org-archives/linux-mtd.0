Return-Path: <SRS0=Y0kv=SD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8815BC43381
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 10:28:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 536272087F
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 10:28:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AKKGuW/V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 536272087F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xz+epcvVxVIx9yGTJn5aRnQmmq0S/C9cKGsm8iazvTY=; b=AKKGuW/VRiWEfR
	I8mQ2/b/QWVWSDbrlrqkw6xlpHfMgwKSHWshYsJVFSIK2DkLZOrBddLy1JQjOal2PpYVwZeIOdpEO
	omTWyTDlRMNe27ekE6SDtv/OMW/JBndIonyFysnlJEuMMedQhyjunppTsRcl1XrCAiinPG8GOW467
	ste9k7C0jRNnBxWUEhPmRYLSdUdD566jGlLHd6HWrQ0BAPFdQcbKK65XoLNzEK+pjdJVNMxxRnubE
	RSXr8SMRqE6SzhhWA3zkt1w9Pvw5GyCXmjcqyoLnWsSzx0pQpZ8LrnqXF6WPJ9/vohKw5mNrfCU/8
	dAP1KGOmBigro1G57PlA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAuAu-0002ET-ON; Mon, 01 Apr 2019 10:28:20 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAuAr-0002De-Mq; Mon, 01 Apr 2019 10:28:18 +0000
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Apr 2019 03:28:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,296,1549958400"; d="scan'208";a="333890611"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.86])
 by fmsmga005.fm.intel.com with ESMTP; 01 Apr 2019 03:28:09 -0700
Received: from andy by smile with local (Exim 4.92)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1hAuAg-0003zN-6d; Mon, 01 Apr 2019 13:28:06 +0300
Date: Mon, 1 Apr 2019 13:28:06 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: George Spelvin <lkml@sdf.org>
Subject: Re: [PATCH v2 5/5] Lib: sort.h: replace int size with size_t size in
 the swap function
Message-ID: <20190401102806.GE9224@smile.fi.intel.com>
References: <19606671554056883@myt3-1179f584969c.qloud-c.yandex.net>
 <23051461554058370@iva6-3ac3de5fcc31.qloud-c.yandex.net>
 <20190401093555.GD9224@smile.fi.intel.com>
 <201904010956.x319u70q021113@sdf.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <201904010956.x319u70q021113@sdf.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_032817_796572_C65BB135 
X-CRM114-Status: GOOD (  11.66  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: peterz@infradead.org, benh@kernel.crashing.org, dchinner@redhat.com,
 linux-kernel@vger.kernel.org, st5pub@yandex.ru, linux-mtd@lists.infradead.org,
 hpa@zytor.com, jslaby@suse.cz, sfr@canb.auug.org.au, darrick.wong@oracle.com,
 mpe@ellerman.id.au, mark@fasheh.com, x86@kernel.org, mingo@redhat.com,
 naveen.n.rao@linux.vnet.ibm.com, linux-snps-arc@lists.infradead.org,
 jannh@google.com, bp@alien8.de, jlbec@evilplan.org, jpoimboe@redhat.com,
 tglx@linutronix.de, ard.biesheuvel@linaro.org, gregkh@linuxfoundation.org,
 dedekind1@gmail.com, adrian.hunter@intel.com, vgupta@synopsys.com,
 richard@nod.at, paulus@samba.org, linuxppc-dev@lists.ozlabs.org,
 ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Apr 01, 2019 at 09:56:07AM +0000, George Spelvin wrote:
> On Mon, 1 Apr 2019 at 12:35:55 +0300, Andy Shevchenko wrote:
> > Hmm... If (*swap)() is called recursively it means the change might increase
> > stack usage on 64-bit platforms.
> > 
> > Am I missing something?
> 
> Under what conceivable circumstance would someone write a recursive
> (*swap)() function?
> 
> You're technically right, but the precondition is more fantastical
> than "if the U.K.'s parliament get their shit together before the
> 12th", so I have a hard time worrying about it.
> 
> But you did make me think of something: the whole reason swap()
> takes a size argument is for the benefit of the (no longer existing)
> generic swap functions.  All of the custom swap functions ignore
> it.
> 
> So how about *deleting* the parameter instead?  That simplifies
> everything.

I like this idea!

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

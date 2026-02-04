Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B48DE8B387
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Feb 2026 01:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4iSPzx4Td75xJAMiq5N/kmLRkTNa3bkc/k5fJgST794=; b=Y/DM/LqvwZiOtn
	8SAfFCDFzQ/gbUx8HB96bpme+tPgl5skvSC55ljmFFaOnp+mGIU4Iejzn6jopWcolfU6eQwIF7U1L
	jFC7C6wBZBQkDWmNo3XPVYTH7oh9hClxmkWWClvsqaJchI3yYAGDDVqwoxgtegQWNVhq5OSyQj3Dp
	KLDaUjEGawf4ZX53j16xwcbTBg7pRJEF5LxoIfY++b6yJyH5t18ffiG4DTTzMTXLDfA8JQ18mG7Zf
	8pBYqHs5pA7S74Q3HtrzOBJ55Tx9t+V1E72xtqsTryZJug+TVuTAdtA1m/LdaxveEf8cr3UskdINE
	lNnDvjA3LQBBUazfjBnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnRfv-00000007gPy-3JmF;
	Wed, 04 Feb 2026 01:27:23 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnRft-00000007gP8-1Tfb
	for linux-mtd@lists.infradead.org;
	Wed, 04 Feb 2026 01:27:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770168442; x=1801704442;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U36NIkoSvp9cWRBoThv8JAOkw96bU6j8Xva025NH7Cs=;
  b=XxfYH79X44C6zxdYlV/N0m8Lk/6OpP+gb8bNtmJyYl5BbnLDKXt0p5Cn
   td7Qw7eyNxf7XUyed3UHc5RM1OBKbf0WjSU6+RIvj0K58b3UsI1OI4o5s
   B0Iv+oZ8HZYUffFgTu3pWqFmIbA5L0g1XCWY3xXKUIHNtqSZPbmcQtBt1
   mtC4qqYI35k/oWOnj+5bzQ98WJmCSDXDbe6YQ+8jZhskheACk1OXstK0z
   f+coslLUdo8canYaSn55ES3qcEUqWRTE9/JYN3NoMEI9iMnEVZfNf5KZU
   Vo3YVl4fGRZXdAcIB7Rsd51dbmqVvE49ugTcrN5AtqpipZAgrm6VLxH70
   Q==;
X-CSE-ConnectionGUID: 0D2zqResQ5G4RTv36xX1dg==
X-CSE-MsgGUID: 3ThvwSyKRU6Hg62w4CdaKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="81664761"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="81664761"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 17:27:21 -0800
X-CSE-ConnectionGUID: npXbnVvwQby+8LDDAF4RAw==
X-CSE-MsgGUID: 10CBa2xQQgqaZRl/mL2GMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="214987947"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.99])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 17:27:18 -0800
Date: Wed, 4 Feb 2026 03:27:16 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Raghavendra, Vignesh" <vigneshr@ti.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v1 1/1] mtd: cfi_cmdset_0001: Factor out
 do_write_buffer_locked() to reduce stack frame
Message-ID: <aYKgdIOvJA3KHo4J@smile.fi.intel.com>
References: <20260124005203.3167280-1-andriy.shevchenko@linux.intel.com>
 <aXQak2FKyQpdQW2M@smile.fi.intel.com>
 <87ldhgl1lg.fsf@bootlin.com>
 <d7e637be-0489-44f0-b5ab-86eb55484fde@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d7e637be-0489-44f0-b5ab-86eb55484fde@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_172721_433018_23DF5AC3 
X-CRM114-Status: GOOD (  17.33  )
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

On Sun, Feb 01, 2026 at 03:29:59PM +0530, Raghavendra, Vignesh wrote:
> On 1/29/2026 11:53 PM, Miquel Raynal wrote:

...

> >>>  	XIP_INVAL_CACHED_RANGE(map, initial_adr, initial_len);
> >>>  	ENABLE_VPP(map);
> >>
> >> It seems more logical to leave these two in the original call.
> >>
> >> ...
> > 
> > [...]
> > 
> >>> +	DISABLE_VPP(map);
> >>
> >> Otherwise this will seem dangling here.
> >>
> >>>  	put_chip(map, chip, cmd_adr);
> >>>  	mutex_unlock(&chip->mutex);
> >>>  	return ret;
> >>
> >> ...
> >>
> >> Another approach is to leave goto as is in the _locked() and move DISABLE_VPP()
> >> there.
> >>
> >> Tell me what do you prefer?
> > 
> > While I also find more logical to keep the ENABLE_VPP/DISABLE_VPP
> > together, I do not mind to see them in one side or the other. I would by
> > default let them in the main caller and suffi the inner function with
> > "_locked()" as you did, but I'm fine either ways.
> 
> Keeping ENABLE_VPP/DISABLE_VPP together along with _locked() suffix for
> inner function is cleaner to read.

I just sent a v2 where I kept them in the original call.

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

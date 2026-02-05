Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5234DECD981
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Feb 2026 15:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=20M4DUN42O4EOYQsbcxQhcVmj0b+uS8yU/EZR3+/iW4=; b=mpmYSaTyOG7MGU
	EJrqWiqSKCbxk0iTHf8fIamonm7csBSGqVQ8rPPGoQ+yzzouPzDhIe7Ux4uXuD0gY3wpRPhhADLoE
	CoascwPt1HE+0GcpMqibeqaS8D6ZzG2zH+g+6/4isKMWXD3KykQPK+0wAcsPDA/JLc5bPUu2No3E3
	fdXuSYd/W0HzkKxK83NbuNa97Hi9v5InY3P5TVuwaToAakbo6JqKAhTNlQtp5dX/W6Om0yKWVgueg
	29XkXFhb6rGaWdpy8nywyMrjOLSK0xXbnO0+r4So4BDvsZLhyecpufIeGuMvFgwqQmlAHAjwHIMEi
	HMQE9bgu8Vw344NQJ+0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo1jV-0000000ABby-30tx;
	Thu, 05 Feb 2026 15:57:29 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo1jR-0000000ABbc-0YTa
	for linux-mtd@lists.infradead.org;
	Thu, 05 Feb 2026 15:57:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770307045; x=1801843045;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FSJGCR5FLHXrzPlPXM11LUVlzH6IJFhUUCap2Vzlq1w=;
  b=nGul5D4rzs7l5fp3mEuqNMdeSUIyaJIALqLH/DZDh7b2RRYnaxsPYgLV
   BP3lGrZtcBOBcP3R7qKLdHkLhMEB6b/9ZSNHzRsjVeB9PWn0LfzVy2zwP
   8OO/ecdIOiTQH7udRpPyMAC4a6lWO7CkIP38z8yYG8id8N9sUuouz/+ot
   JD+JE7Qc+rA6V6ogFA5tRsMqVNxG/DGmLu5gOzQymCnTntc7z1N4bO5je
   CjjujYpr5mQvTwiNDYBzwJ5T+D81+2cgRNCZAovxQBkCcMNkK2dvbJR+F
   RX2KNGNFtI3gYYFN3MqKJh9WRmPuxquaVkta/m+LQiF6c5z4N8XzS/6dd
   w==;
X-CSE-ConnectionGUID: tUAoPhsGR2ia0vnG8RJR1w==
X-CSE-MsgGUID: bXKlpNguQPOOfHpYcmXCGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="96963330"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="96963330"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 07:57:21 -0800
X-CSE-ConnectionGUID: /hVbtxL3TTSV2kUnXfA0Lg==
X-CSE-MsgGUID: 3Rt17CMxQNqHrWRlq/EFxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="241246646"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.142])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 07:57:19 -0800
Date: Thu, 5 Feb 2026 17:57:17 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2 1/1] mtd: cfi_cmdset_0001: Factor out
 do_write_buffer_locked() to reduce stack frame
Message-ID: <aYS93aJ_TlN3C3-T@smile.fi.intel.com>
References: <20260204012630.2211832-1-andriy.shevchenko@linux.intel.com>
 <aYO2IPsoxmDtTsec@smile.fi.intel.com>
 <87a4xnfu8j.fsf@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87a4xnfu8j.fsf@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_075725_379543_292E8388 
X-CRM114-Status: GOOD (  17.03  )
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

On Thu, Feb 05, 2026 at 09:51:56AM +0100, Miquel Raynal wrote:
> On 04/02/2026 at 23:12:00 +02, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > On Wed, Feb 04, 2026 at 02:25:27AM +0100, Andy Shevchenko wrote:
> >> Compiler is not happy about used stack frame:
> >> 
> >> drivers/mtd/chips/cfi_cmdset_0001.c: In function 'do_write_buffer':
> >> drivers/mtd/chips/cfi_cmdset_0001.c:1887:1: error: the frame size of 1296 bytes is larger than 1280 bytes [-Werror=frame-larger-than=]
> >> 
> >> Fix this by factoring out do_write_buffer_locked().
> >
> > My gosh, I already sent a v2 earlier and there were some replies,
> > I need to check...
> 
> I'm not sure I get what you mean here? I got no reply (in my inbox) to
> your v2. I am letting a bit of time for Vignesh to take a look, but I
> know he's busy so I might take it nevertheless by the end of the week as
> we are approaching the merge window.

I got some strange LKP reports, I need to check them.
Please, discard this email thread as we have it there

https://lore.kernel.org/r/20260124133730.3454241-1-andriy.shevchenko@linux.intel.com

-- 
With Best Regards,
Andy Shevchenko



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

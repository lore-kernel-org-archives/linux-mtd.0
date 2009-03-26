Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LmoSS-0007E2-Lg
	for linux-mtd@lists.infradead.org; Thu, 26 Mar 2009 12:13:23 +0000
Subject: Re: ubifs version 1 compatibility
From: Artem Bityutskiy <dedekind@infradead.org>
To: Hamish Moffatt <hamish@cloud.net.au>
In-Reply-To: <20090326120431.GA13745@cloud.net.au>
References: <20090326051508.GA4760@cloud.net.au>
	<1238049297.3321.20.camel@localhost.localdomain>
	<20090326074443.GA7842@cloud.net.au>
	<1238061023.3321.67.camel@localhost.localdomain>
	<20090326120431.GA13745@cloud.net.au>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 26 Mar 2009 14:12:05 +0200
Message-Id: <1238069525.3321.83.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-03-26 at 23:04 +1100, Hamish Moffatt wrote:
> On Thu, Mar 26, 2009 at 11:50:23AM +0200, Artem Bityutskiy wrote:
> > On Thu, 2009-03-26 at 18:44 +1100, Hamish Moffatt wrote:
> > makes it very difficult to turn old image into new one. This will
> > basically mean we need:
> > 
> > 1. extract files from the old image
> > 2. feed them to mkfs.ubifs.
> > 
> > > Maybe before upgrade we could run mkfs.ubifs using the contents of the
> > > existing volume to create the new format, unmount it and ubiupdatevol it..
> > 
> > The easiest way to do this is to boot the old kernel,
> > e.g. in vmware, extract the files using the nandsim technique:
> > http://www.linux-mtd.infradead.org/faq/ubifs.html#L_ubifs_nandsim
> > 
> > then feed them to mkfs.ubifs.
> 
> Well I have these files on embedded devices out in the real world. The
> volume is storing user data, so I need to do this change in-place.

Let me make sure I understand the need.

So you have devises with v1 format in the wild. You want to upgrade
those devices. While upgrading, you will re-write some UBI volumes, but
after upgrade the user-data volume should contains exactly the same data
as before the upgrade, right?

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)

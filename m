Received: from e35.co.us.ibm.com ([32.97.110.153])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IGaVA-0002Mm-Ds
	for linux-mtd@lists.infradead.org; Thu, 02 Aug 2007 14:14:06 +0100
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e35.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id l72DDPNm005482
	for <linux-mtd@lists.infradead.org>; Thu, 2 Aug 2007 09:13:25 -0400
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v8.4) with ESMTP id
	l72DDPFH203180
	for <linux-mtd@lists.infradead.org>; Thu, 2 Aug 2007 07:13:25 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l72DDOi6019550
	for <linux-mtd@lists.infradead.org>; Thu, 2 Aug 2007 07:13:24 -0600
Date: Thu, 2 Aug 2007 08:13:23 -0500
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: "Pete MacKay" <linux@architechnical.net>
Subject: Re: mkfs.jffs2 version broken
Message-ID: <20070802081323.10e07fcd@weaponx.rchland.ibm.com>
In-Reply-To: <8871.69.30.123.186.1185394199.squirrel@architechnical.net>
References: <8871.69.30.123.186.1185394199.squirrel@architechnical.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 25 Jul 2007 13:09:59 -0700 (PDT)
"Pete MacKay" <linux@architechnical.net> wrote:

> Paul Wakeman raised a valid issue in his XATTR email about the version
> number reported in mkfs.jffs2.  We have two versions, both with
> different behaviors and even option lists / help screens, and they
> both report as version 1.50.  I pulled from the git last week and
> this was still the case.
> 
> Could someone who has access or responsibility for that code please
> update it or replace it with a date?  (It caused us hours of
> debugging and broke our build).

Sure, I'll look at that soon.

josh

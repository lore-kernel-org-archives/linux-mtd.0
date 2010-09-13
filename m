Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OvDmy-0006Ml-Fd
	for linux-mtd@lists.infradead.org; Mon, 13 Sep 2010 18:30:01 +0000
Received: by bwz13 with SMTP id 13so6210783bwz.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 13 Sep 2010 11:29:59 -0700 (PDT)
Subject: Re: [PATCH 00/13] UBI reliability improvements
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <1283763293-1882-1-git-send-email-dedekind1@gmail.com>
References: <1283763293-1882-1-git-send-email-dedekind1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 13 Sep 2010 21:29:55 +0300
Message-ID: <1284402595.1783.34.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "Matthew L. Creech" <mlcreech@gmail.com>,
	Matthieu CASTET <matthieu.castet@parrot.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-09-06 at 11:54 +0300, Artem Bityutskiy wrote:
> Hi,
> 
> here is a set of patches which should improve UBI reliability. I wrote them
> during my trip to LinuxCon Brazil.
> 
> Patches 1-5 should be interesting for Matthieu CASTET - they improve -EUCLEAN
> errors handling a little.
> 
> Patches 6-13 should be interesting for Matthew L. Creech - they presimably have
> to help in catching why in his setup UBIFS refers unmapped LEB. I'm not sure
> they will help, but there is a chance - my theory is that UBI decides that the
> LEB is corrupted and wipes it. With this patch-set UBI should instead preserve
> corrupted LEBs, so we could take a look what happened.
> 
> Please, reveiw, test. I tested them a little as well, but not extensively.

OK, although no one reviewed / tested this so far, I'm pushing this to
the ubi-2.6.git / master tree.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)

Received: from smtprelay0205.hostedemail.com ([216.40.44.205]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aYvuI-0001e4-1Z
 for linux-mtd@lists.infradead.org; Thu, 25 Feb 2016 13:24:38 +0000
Message-ID: <1456406652.10763.48.camel@perches.com>
Subject: Re: [PATCH] ubi: Fix early logging
From: Joe Perches <joe@perches.com>
To: linux-mtd <linux-mtd@lists.infradead.org>, Richard Weinberger
 <richard@nod.at>
Date: Thu, 25 Feb 2016 05:24:12 -0800
In-Reply-To: <E1aYvh4-0006C7-QZ@feisty.vs19.net>
References: <E1aYvh4-0006C7-QZ@feisty.vs19.net>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From:	Richard Weinberger <richard@nod.at>
[]
> We must not use ubi_* log functions before the ubi_device
> struct is initialized.
> And while we are here, define a sane pr_fmt and add new lines to
> existing pr_* calls.

I think it'd be better to use and extend the patch I sent
for this problem.

https://patchwork.ozlabs.org/patch/587057/

Add a state check of the ubi pointer in the ubi_<level>
functions and do the right thing there.

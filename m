Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M8YZZ-0003f6-74
	for linux-mtd@lists.infradead.org; Mon, 25 May 2009 11:42:36 +0000
Subject: Re: [patch 01/14] mtd: Flex-OneNAND support
From: Artem Bityutskiy <dedekind@infradead.org>
To: apgmoorthy <moorthy.apg@samsung.com>
In-Reply-To: <5205AB2678D945D194F6372BE9297942@sisodomain.com>
References: <5205AB2678D945D194F6372BE9297942@sisodomain.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 25 May 2009 14:41:58 +0300
Message-Id: <1243251718.21646.107.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: vishak.g@samsung.com, amul.saha@samsung.com, kyungmin.park@samsung.com,
	linux-mtd@lists.infradead.org, akpm@linux-foundation.org,
	dwmw2@infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Mon, 2009-05-25 at 16:22 +0530, apgmoorthy wrote:
> On Sat May 23 05:35:19 EDT 2009 dedekind@infradead.org wrote :
> 
> >I get the following warning when compile this:
> 
> >drivers/mtd/onenand/onenand_base.c:3263: warning: 'flexonenand_setup'
> >defined but not used 
> 
> I tried on the MTD Git  and have seen the warning as you mentioned.
> '#ifndef MODULE' around the function 'flexonenand_setup' should help to get away with that warning.
> We will post a patch.
> 
> Against which Fork , the patch should be ? 

Dunno. Probably 2.6.30-rc7? Also, I think the loooong printk's
lines in the patch are ugly. If you could make them nicer,
it'd be cool. But whole MTD is full of printk's like this, so
I did not complain about that.

I wanted to take your patch to my l2-mtd-2.6.git tree, and then
ping dwmw2 to pull from it. But because of the warning and
these ugly printk's I decided that I will rather not do this
so far.

Also, I'm not sure about #ifndef MODULE. AFAIK, the whole
'__setup()' thing is not supposed to be used in drivers.
But I'm not sure. I'll leave this for Andrew to comment on :-)

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)

Received: from fish.redhat.com ([213.86.99.237]
	helo=executor.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19sNYi-0006Vi-Nw
	for <linux-mtd@lists.infradead.org>; Thu, 28 Aug 2003 15:15:32 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: John Hall <john-news1@cambridgetechgroup.com>
In-Reply-To: <414.3f4e0a87.b6729@irwin2.crw.uk.net>
References: <6306.3f4dd070.667ee@irwin2.crw.uk.net>
	 <1062066193.8465.1571.camel@hades.cambridge.redhat.com>
	 <696f.3f4dd944.a899d@irwin2.crw.uk.net>
	 <1062070043.8465.1615.camel@hades.cambridge.redhat.com>
	 <414.3f4e0a87.b6729@irwin2.crw.uk.net>
Message-Id: <1062080106.12122.1.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 28 Aug 2003 15:15:07 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Lost space on JFFS2 partition
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-08-28 at 14:58 +0100, John Hall wrote:
> Is the current CVS head considered stable,

Yes.

>  and will it work correctly under 2.4 

Yes....

> (in fact armlinux 2.4.18-rmk7)? 

... but maybe not for ancient 2.4 like that. Won't be far off though --
you may just have to reinstate some backward-compat stuff in
include/linux/mtd/compatmac.h which got removed recently.

> On a completely different note, is it possible to disable compression in
> JFFS2 without hacking the sourcecode?

No. At least not if you count just reading the archives for the last
week or two and applying the patch therein as 'hacking' ;) 

-- 
dwmw2

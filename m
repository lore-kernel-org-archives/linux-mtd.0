Received: from risingsoftware01.propagation.net ([66.221.33.65])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JtJl2-0003hD-Ao
	for linux-mtd@lists.infradead.org; Tue, 06 May 2008 09:46:48 +0000
Date: Tue, 6 May 2008 19:46:42 +1000
From: Hamish Moffatt <hamish@cloud.net.au>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [PATCH] mkfs.ubifs: support --squash-uids
Message-ID: <20080506094642.GB23685@cloud.net.au>
References: <20080502051655.GA6654@cloud.net.au>
	<1209972672.3645.8.camel@sauron>
	<20080505084617.GA11042@cloud.net.au>
	<1210055916.3645.21.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1210055916.3645.21.camel@sauron>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 06, 2008 at 09:38:36AM +0300, Artem Bityutskiy wrote:
> I've committed your patch and will do the "prefer dev. table" change

Thanks.

> later. Just a note - the patch was against some old mkfs.ubifs, so I had
> to do conflict resolution. Also note, we changed -p (--orph-lebs) option
> to -P at some point. You are unlikely using it - this is just for
> information.

Yes it was against the v0.4 tag. 

mkfs.jffs2 and genext2fs both use -P as the short version of
--squash-perms, so mkfs.ubifs will have to use something different. No
big deal however (although they are pretty similar otherwise).

Also, what is the purpose of --max-leb-cnt? It seems to be just a safety
check that the volume will fit? It's a bit unusual.

thanks
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>

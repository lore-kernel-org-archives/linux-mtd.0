Received: from bay17-f12.bay17.hotmail.com ([64.4.43.62] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EHunm-0003NQ-3i
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2005 22:57:57 -0400
Message-ID: <BAY17-F127FC28C2D9627C1F5DCC6E8940@phx.gbl>
In-Reply-To: <20050920113616.GD2143@wohnheim.fh-wedel.de>
From: "zhao forrest" <zhao_fusheng@hotmail.com>
To: joern@wohnheim.fh-wedel.de, dedekind@infradead.org
Date: Wed, 21 Sep 2005 10:57:40 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH]Add JFFS2 eraseblock header support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> > On Tue, 2005-09-20 at 12:24 +0200, Jörn Engel wrote:
> > > > 4 old JFFS2 binaries reject mounting new JFFS2 images
> > >
> > > Why this?
> >
> > Because he changed cleanmarker to the EB header (eraseblock header). 
Old
> > binaries got confused by this since there are working no compatibility
> > flags in cleanmarkers.
>
>WTF?  Old code can simply delete the EB.  You lost all the goodies
>from EB, sure, but they are only optimization.  So who cares?
>
> > Moreover, we are going to implement the 1:1 mapping at the same time.
> >
> > If old binary mounts new image, it starts writing its cleanmarkers, use
> > 1:N mapping etc. A "mixed" image appears. Afterwords, if this mixed
> > image is being mounted on new JFFS2 binary, what poor Zhao is supposed
> > to do? There will be too much ugliness in the code to handle that.
>
>Please don't mix those two problems.  1:1 mapping has been dealt with.
>If you don't like how it has been dealt with, complain in the context
>of 1:1 mapping.
>

Let me give some my thoughts about the above two problems.
It's ture that 1:1 mapping was dealt with a few days ago. But we can't
assume 1:1 mapping when writing EBH patch. Because there still exist the
old JFFS2 code(the code without the recent 1:1 mapping patch) that use 1:N
mapping.So I can't set the comp_flag of eraseblock_header to JFFS2_FEATURE_
RWCOMPAT_DELETE. Otherwise the "mixed" image will appear for old JFFS2 code
(the code without the recent 1:1 mapping patch) as explained by Artem.

Joern,
I can understand your opinion. Your idea is that, since 1:1 mapping was 
handled recently, the comp_flag of eraseblock_header can be set to 
RWCOMPAT_
DELETE for the JFFS2 code with 1:1 mapping. But for the older JFFS2 code 
with
1:N mapping, the comp_flag of eraseblock_header have to be set to INCOMPAT.
IMHO I think 1:1 mapping and eraseblock_header should be added to JFFS2 at 
the same time. But the current situation is that 1:1 mapping patch was 
checked into CVS earlier than eraseblock_header. 
So I still agree that "old JFFS2 binaries reject mounting new JFFS2 
images".

Thanks,
Forrest

Received: from bay17-f10.bay17.hotmail.com ([64.4.43.60] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EIdpt-00036s-3z
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2005 23:03:11 -0400
Message-ID: <BAY17-F10C500F5E809F9445B7A52E8960@phx.gbl>
In-Reply-To: <433299BA.2020104@yandex.ru>
From: "zhao forrest" <zhao_fusheng@hotmail.com>
To: dedekind@yandex.ru
Date: Fri, 23 Sep 2005 10:45:00 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Adding eraseblock header support(revised version)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


>
>zhao forrest wrote:
> > According to the comments from mailing list, one problem is
> > still open:
> > Whether should we set the compat flag of eraseblock_header to
> > RWCOMPAT_DELETE or INCOMPAT? Now in my patch I still set the compat 
flag
> > of eraseblock_header
> > to INCOMPAT. After the final decision is made, I can modify
> > the patch accordingly.
> >
>Well, this was discussed... But I still don't see any conclusion. My
>opinion is below.
>
>Terms:
>1. New JFFS2 - recent JFFS2 where 1:1 was added.
>2. Old JFFS2 - older JFFS2, before 1:1 was added.
>3. New JFFS2 image - an image made for new JFFS2.
>4. Old JFFS2 image - an image made for old JFFS2.
>
>Q: are there any issues when an old JFFS2 image is mounted by new JFFS2
>code?
>A: yes, there are. Old JFFS2 did eraseblock concatenations and worked
>with virtual eraseblocks. So, there are nodes which cross the eraseblock
>boundary.
>
>Q: why is this a problem?
>A: because with 1:1 mapping we will have nodes which cross the
>eraseblock boundary. JFFS2 will suffer hard.
>
>Q: what to do?
>A: either handle this or reject mounting old images in New JFFS2.
>
>Thus, my answer is - yes, you must reject mounting old images.
>
>But this has no relation to your parch. Could you implement that by a
>distinct patch please? Or Ferenc, who actually committed the 1:1 patch
>may do this :-) (please).
>
>You may implement it like this. If you have met any clean marker during
>scan - reject mounting JFFS2. No need to introduce messy
>JFFS2_NODETYPE_INODE_EBH and the like.
>
1 According to the later disscusion in "1:1 mapping" thread, we should
reject mounting when detect cross-boundary. In another word, we should
not reject mounting if we don't detect cross-boundary. Right? This is
just what my patch implemented :)

2 The reason why we introduce JFFS2_NODETYPE_INODE_EBH has nothing to
do with "when an old JFFS2 image is mounted by new JFFS2 code". It's
related with "when an new JFFS2 image is mounted by old JFFS2 code".
Your original design mail for eraseblock header has a clear description
of it.
So the problem is still open:
Whether should we set the compat flag of eraseblock_header to
RWCOMPAT_DELETE or INCOMPAT???

Thanks,
Forrest

Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EIPYD-0003Zo-Df
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2005 07:47:53 -0400
Message-ID: <433299BA.2020104@yandex.ru>
Date: Thu, 22 Sep 2005 15:47:06 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: zhao forrest <zhao_fusheng@hotmail.com>
References: <BAY17-F11A5B6E921FA39088B715BE8970@phx.gbl>
In-Reply-To: <BAY17-F11A5B6E921FA39088B715BE8970@phx.gbl>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

zhao forrest wrote:
> According to the comments from mailing list, one problem is
> still open:
> Whether should we set the compat flag of eraseblock_header to
> RWCOMPAT_DELETE or INCOMPAT? Now in my patch I still set the compat flag 
> of eraseblock_header
> to INCOMPAT. After the final decision is made, I can modify
> the patch accordingly.
> 
Well, this was discussed... But I still don't see any conclusion. My
opinion is below.

Terms:
1. New JFFS2 - recent JFFS2 where 1:1 was added.
2. Old JFFS2 - older JFFS2, before 1:1 was added.
3. New JFFS2 image - an image made for new JFFS2.
4. Old JFFS2 image - an image made for old JFFS2.

Q: are there any issues when an old JFFS2 image is mounted by new JFFS2
code?
A: yes, there are. Old JFFS2 did eraseblock concatenations and worked
with virtual eraseblocks. So, there are nodes which cross the eraseblock
boundary.

Q: why is this a problem?
A: because with 1:1 mapping we will have nodes which cross the
eraseblock boundary. JFFS2 will suffer hard.

Q: what to do?
A: either handle this or reject mounting old images in New JFFS2.

Thus, my answer is - yes, you must reject mounting old images.

But this has no relation to your parch. Could you implement that by a
distinct patch please? Or Ferenc, who actually committed the 1:1 patch
may do this :-) (please).

You may implement it like this. If you have met any clean marker during
scan - reject mounting JFFS2. No need to introduce messy
JFFS2_NODETYPE_INODE_EBH and the like.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.

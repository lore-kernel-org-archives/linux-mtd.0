Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E7YB1-0008M7-Ac
	for linux-mtd@lists.infradead.org; Tue, 23 Aug 2005 08:46:55 -0400
Date: Tue, 23 Aug 2005 14:46:49 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Kaigai Kohei <kaigai@ak.jp.nec.com>
Message-ID: <20050823124649.GB30853@wohnheim.fh-wedel.de>
References: <430AF95F.1050704@ak.jp.nec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <430AF95F.1050704@ak.jp.nec.com>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	Ma Yun <sx_yunma@hotmail.com>
Subject: Re: [PATCH] XATTR issues on JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 23 August 2005 19:24:31 +0900, Kaigai Kohei wrote:
> 
> The attached patch provids XATTR support in JFFS2.
> We can apply it to mtd-snapshot-20050822.tar.bz2 tree.
> 
> I hope your worthwhile comments for improvement.
> # By coincidence, two patches for similar functionality are posted in same day :)

Which is quite nice.  Would you two mind reading the others patch and
stating what is bad at that one and why your's is better?  If there is
a clear winner in this batter, we should merge that one.  Most likely,
the result is that both patches are lacking details and a new one with
elements from both should be used instead.  At this moment, we just
don't know yet, what those details are.

Jörn

-- 
Mundie uses a textbook tactic of manipulation: start with some
reasonable talk, and lead the audience to an unreasonable conclusion.
-- Bruce Perens

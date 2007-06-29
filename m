From: "Kyungmin Park" <kyungmin.park@samsung.com>
To: "'Alexander Belyakov'" <abelyako@googlemail.com>
References: <fe810cf0706282325k536bf24ct6ad216f0c980e97c@mail.gmail.com>
	<001201c7ba2c$aa54a5b0$e1ac580a@swcenter.sec.samsung.co.kr>
	<fe810cf0706290231l473bfcf3s86b0db49c09d39f8@mail.gmail.com>
Subject: RE: [PATCH] [JFFS2] Fix unreasonable jffs2_do_reserve_space() failure
Date: Fri, 29 Jun 2007 18:42:10 +0900
Message-ID: <001301c7ba31$c6da0810$e1ac580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
In-reply-to: <fe810cf0706290231l473bfcf3s86b0db49c09d39f8@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > After this patch, I can't delete the existing files. So we can't operation
> > anymore.
> 
> It's strange. You should understand that pre patch
> jffs2_refile_wbuf_blocks() could also put block to erasable_list. I
> mean random ((jiffies + (n++)) & 127) condition. So basically patch
> doesn't change that behavior. We just _always_ put one block in
> erasable_list if it is empty. Pre patch version does exactly the same
> but with some randomness.

What's pre patch? Could you link the pre-patch?

I apply this patch to the latest mtd tree.
11 hours ago	Adrian Bunk	[MTD] [MAPS] Cleanup nettel map driver  master.

Thank you,
Kyungmin Park

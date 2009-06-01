Received: from cantor2.suse.de ([195.135.220.15] helo=mx2.suse.de)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MB4LV-0007qh-4p
	for linux-mtd@lists.infradead.org; Mon, 01 Jun 2009 10:02:28 +0000
Date: Mon, 1 Jun 2009 12:02:11 +0200
From: Jan Kara <jack@suse.cz>
To: anees a m <aneesgnu@gmail.com>
Subject: Re: JFFS2 filesystem problem
Message-ID: <20090601100211.GD14373@duck.suse.cz>
References: <17cc26190905290122u52e2f9a1q15103557e214883e@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17cc26190905290122u52e2f9a1q15103557e214883e@mail.gmail.com>
Cc: npiggin@suse.de, linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  Hello,

On Fri 29-05-09 13:52:05, anees a m wrote:
> Iam uses JFFS2 filesystem for an embedded flash device. But when the power
> is removed i between, the JFFS2 filesystem is corrupted.Resulting in fails.
> Iam able to find that the JFFS2 garbage collector is causing the problem. If
> mounted as READ only, I dont have an issue, but mounting write only is
> resulting in corrupted filesystem some times.
> 
> Unfortunately I need to mount it with read write support.
  I'm not sure why you decided to write to linux-ext4 mailing list, to me
and to Nick. Anyway, the right person for this report seems to be David
Woodhouse who's listed as a maintainer of JFFS2 filesystem.
  Adding him to CC.

									Honza
-- 
Jan Kara <jack@suse.cz>
SUSE Labs, CR

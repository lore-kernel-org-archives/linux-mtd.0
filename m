Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Nwb2o-0002d8-2v
	for linux-mtd@lists.infradead.org; Tue, 30 Mar 2010 12:59:50 +0000
Subject: Re: [PATCH] jffs2: Move erasing from write_super to GC.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
In-Reply-To: <1269079399-27087-1-git-send-email-Joakim.Tjernlund@transmode.se>
References: <1269079399-27087-1-git-send-email-Joakim.Tjernlund@transmode.se>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 30 Mar 2010 15:57:34 +0300
Message-ID: <1269953854.6648.4.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2010-03-20 at 11:03 +0100, Joakim Tjernlund wrote:
> Erasing blocks is a form of GC and therefore it should live in the
> GC task. By moving it there two problems will be solved:
> 1) unmounting will not hang until all pending blocks has
>    been erased.
> 2) Erasing can be paused by sending a SIGSTOP to the GC thread which
>    allowes for time critical tasks to work in peace.
> 
> Since erasing now is in the GC thread, erases should trigger
> the GC task instead.
> wbuf.c still wants to flush its buffer via write_super so
> invent jffs2_dirty_trigger() and use that in wbuf.
> Remove surplus call to jffs2_erase_pending_trigger() in erase.c
> and remove jffs2_garbage_collect_trigger() from write_super as
> of now write_super() should only commit dirty data to disk.
> 
> Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
> ---

Chatted with dwmw2, and he is fine with your patch, so I'll add it to my
l2 tree, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

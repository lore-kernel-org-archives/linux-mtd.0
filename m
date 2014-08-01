Received: from [2002:c35c:fd02::1] (helo=ZenIV.linux.org.uk)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XDG8Y-0000WK-Tm
 for linux-mtd@lists.infradead.org; Fri, 01 Aug 2014 16:57:04 +0000
Date: Fri, 1 Aug 2014 17:56:07 +0100
From: Al Viro <viro@ZenIV.linux.org.uk>
To: Jeff Harris <jefftharris@gmail.com>
Subject: Re: [PATCH] jffs2: Re-enable write-buffering after filesystem sync
Message-ID: <20140801165607.GM18016@ZenIV.linux.org.uk>
References: <1406909172-7219-1-git-send-email-jharris@westell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1406909172-7219-1-git-send-email-jharris@westell.com>
Sender: Al Viro <viro@ftp.linux.org.uk>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org, Jeff Harris <jharris@westell.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 01, 2014 at 12:06:12PM -0400, Jeff Harris wrote:

> +	spin_lock(&c->wbuf_dwork_lock);
>  	cancel_delayed_work_sync(&c->wbuf_dwork);

Umm...  Usually ..._sync in function name is a sign of potential sleeper,
and calling those under a spinlock is a bad idea.

And looking at the definition of cancel_delayed_work_sync() turns up the
following call chain: cancel_delayed_work_sync() -> __cancel_work_timer() ->
flush_work() -> wait_for_completion(), which definitely isn't something
you should ever do under a spinlock.

While we are at it, you follow that with
> +	c->wbuf_queued = 0;
> +	spin_lock(&c->wbuf_dwork_lock);
which would be broken even if cancel_delayed_work_sync() hadn't blocked.
That's easily fixed, of course, (s/lock/unlock/).  cancel_delayed_work_sync()
under a spinlock is more serious...

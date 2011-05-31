Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QRQAr-0003ca-PQ
	for linux-mtd@lists.infradead.org; Tue, 31 May 2011 14:44:06 +0000
Received: by vws8 with SMTP id 8so4139890vws.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 31 May 2011 07:43:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <cover.1306780983.git.bengardiner@nanometrics.ca>
References: <cover.1306780983.git.bengardiner@nanometrics.ca>
Date: Tue, 31 May 2011 10:43:55 -0400
Message-ID: <BANLkTinu7dX5Tfhs0ak0BEfc212mpJKb+w@mail.gmail.com>
Subject: Re: [PATCH 0/3] fix-up free space earlier in mount_ubifs()
From: "Matthew L. Creech" <mlcreech@gmail.com>
To: Ben Gardiner <bengardiner@nanometrics.ca>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Adrian Hunter <adrian.hunter@nokia.com>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 30, 2011 at 2:56 PM, Ben Gardiner
<bengardiner@nanometrics.ca> wrote:
> In testing Mattew Creech's free-space-fixup flag series I found that was unable
> to boot a da850evm which had flashed to it's NAND a ubinized image containing a
> UBIFS that has the free-space-fixup flag set.
>
> The cause of the problem was found to be the call to ubifs_write_master() from
> mount_ubifs() as is evidenced the backtrace produced by the assertion
> introduced in the first patch of this series; where the assertion introduced is
> that c->space_fixup is false when ubifs_write_node() is called.
>

Interesting - so the problem is that if ubifs_read_master() resizes
the master node, a subsequent attempt to read the first (c->mst_offs +
c->mst_node_alsz) bytes from the master LEB fails?

I wonder why this is the case when free-space fixup is enabled, and
not otherwise?  The -EBADMSG seems to imply that this is the original
problem that the fix-up is intended to solve - i.e. the master node
has empty pages with non-empty OOB values, and writing to them results
in a bogus ECC.

Do you happen to know if the same thing occurs when you uncleanly
reboot (so that recovery is needed on the next boot)?  It looks like
ubifs_recover_master_node() reads the same data that
fixup_leb_free_space() does, so I'd expect it to fail similarly if
that's what's happening, regardless of whether fix-up is performed or
not.

Just trying to fully understand the error.  :)  That aside, this patch
set makes sense to me.  Thanks!

-- 
Matthew L. Creech

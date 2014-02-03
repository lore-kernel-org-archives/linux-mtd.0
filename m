Date: Mon, 3 Feb 2014 02:23:03 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Andrew Ruder <andrew.ruder@elecsyscorp.com>
Subject: Re: [HACK] fs/super.c: sync ro remount after blocking writers
Message-ID: <20140203102303.GB11829@infradead.org>
References: <1391095614-21554-1-git-send-email-andrew.ruder@elecsyscorp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1391095614-21554-1-git-send-email-andrew.ruder@elecsyscorp.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>,
 Christoph Hellwig <hch@infradead.org>, linux-mtd@lists.infradead.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 30, 2014 at 09:26:54AM -0600, Andrew Ruder wrote:
> Move sync_filesystem() after sb_prepare_remount_readonly().  If writers
> sneak in anywhere from sync_filesystem() to sb_prepare_remount_readonly()
> it can cause inodes to be dirtied and writeback to occur well after
> sys_mount() has completely successfully.
> 
> This was spotted by corrupted ubifs filesystems on reboot, but appears
> that it can cause issues with any filesystem using writeback.

>From the link that Richard posted it seems like you have a testcase.
Can you please integrate it into xfstests so that we can properly
regression test for this issue from now on?

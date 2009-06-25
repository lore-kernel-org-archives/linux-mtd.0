Date: Wed, 24 Jun 2009 20:00:29 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] [JFFS2] jffs2_start_garbage_collect_thread() return
	value cleanup
Message-Id: <20090624200029.d875c48e.akpm@linux-foundation.org>
In-Reply-To: <1245838141.25547.5207.camel@macbook.infradead.org>
References: <20090602113216.GA3513@tank>
	<1243944686-7039-1-git-send-email-gerard.lledo@gmail.com>
	<1243944686-7039-2-git-send-email-gerard.lledo@gmail.com>
	<1245838141.25547.5207.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Gerard Lledo <gerard.lledo@gmail.com>,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 24 Jun 2009 11:09:01 +0100 David Woodhouse <dwmw2@infradead.org> wrote:

> On Tue, 2009-06-02 at 15:11 +0300, Gerard Lledo wrote:
> > There is no user of this return value in the kernel.  Change it to return void
> > instead.
> 
> NAK. I hate this type of patch.
> 
> A function _should_ return an error value indicating success or failure,
> if there's _any_ chance that it (or a future rewrite of it) may fail.
> 
> It's up to the _callers_ to act on that result, or not, as they see fit.

True.

> Andrew, may I suggest that you look for such justification in future
> patches of this type?

eh, I sometimes don't even look at them.  I just save them up in case of
maintainer fumblage.

I might retain this one as a "jffs2 fails to check
jffs2_start_garbage_collect_thread() return value" bug report :)

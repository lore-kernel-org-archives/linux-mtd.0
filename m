Subject: Re: [BUG] JFFS2 power loss recovery issues in 2.6.25, 2.6.26-rc
From: David Woodhouse <dwmw2@infradead.org>
To: Alexey Korolev <akorolev@infradead.org>
In-Reply-To: <alpine.LFD.1.10.0806021239440.5100@pentafluge.infradead.org>
References: <alpine.LFD.1.10.0805291205480.22130@pentafluge.infradead.org>
	<6934efce0805301224t5e5d7a01n3b652c4df5324d58@mail.gmail.com>
	<alpine.LFD.1.10.0806021239440.5100@pentafluge.infradead.org>
Content-Type: text/plain
Date: Mon, 02 Jun 2008 12:56:14 +0100
Message-Id: <1212407774.16924.120.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2008-06-02 at 12:41 +0100, Alexey Korolev wrote:
> Hi,
> > > We made some investigations for this issue and found commit number which
> > > breaks JFFS2 power loss recoverability.
> > > It is:  [JFFS2] Improve getdents vs. f_pos handling on NOR flash.
> > >        http://git.infradead.org/mtd-2.6.git?a=commitdiff;h=15953580e79b58caefb107e77f218e009b9992e6
> > >
> > > Currently we don't know why it breaks JFFS2 and how it could be fixed
> > > except roll back.
> > 
> > Does everything work when you unmerge this one commit?
> > 
> Correct, commit roll back fixes the problem. 

But leaves another one. I was away last week, and I'm home now -- I'll
try to reproduce and understand what's going on.

-- 
dwmw2

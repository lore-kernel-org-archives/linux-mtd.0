Received: from e35.co.us.ibm.com ([32.97.110.133])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BkPyU-0004uI-T9
	for linux-mtd@lists.infradead.org; Tue, 13 Jul 2004 12:17:50 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: "Eric W. Biederman" <ebiederman@lnxi.com>
In-Reply-To: <m3658sj5ex.fsf@maxwell.lnxi.com>
References: <m3vfgsmwfs.fsf@maxwell.lnxi.com>
	<1089699909.8822.9.camel@imladris.demon.co.uk>
	<m3658sj5ex.fsf@maxwell.lnxi.com>
Content-Type: text/plain
Message-Id: <1089735455.29112.14.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Date: Tue, 13 Jul 2004 11:17:35 -0500
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [RFC] refactoring MTD cmdset ops, jedec_probe, and cfi_probe
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-07-13 at 10:25, Eric W. Biederman wrote:
> Ok recording what the reason for this that I got on irc.
> 
> cfi_cmdset_0020 is just a variant on cfi_cmdset_0001 that shares most of
> the code.

Thinking about this more, I wouldn't worry too much about
cfi_cmdset_0020.c.  It's old, fairly unmaintained, and only has a single
user as far as I know.

If your changes break it, then it'll give someone and excuse to update
the code.  Eventually it should be merged with cfi_cmdset_0001.c anyway,
since M58LW128A reports command set 01, but really needs the
functionality of command set 20.  The exception list you talked about in
IRC might help with that.

But don't let me stop you from making it work if you want to :).

> A data sheet for the M58LW128A ( which erroneously reports cmdset 01 instead of 0x20)
> is at:
> http://www.st.com/stonline/books/pdf/docs/9229.pdf
> 
> cmdset 020 was written for the  M58LW064A and I doesn't currently have a datasheet reference
> for on ST site.

Probably because it isn't that common of a part, and newer versions of
that chip have been made available.

josh

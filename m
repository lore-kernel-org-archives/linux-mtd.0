Subject: Re: For UBIFS users: be aware of write-back!
From: David Woodhouse <dwmw2@infradead.org>
To: dedekind@infradead.org
In-Reply-To: <1222840288.8051.24.camel@sauron>
References: <1222840288.8051.24.camel@sauron>
Content-Type: text/plain
Date: Fri, 03 Oct 2008 08:15:49 +0100
Message-Id: <1223018149.3328.21.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Bruce_Leonard@selinc.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-10-01 at 08:51 +0300, Artem Bityutskiy wrote:
> 
> this e-mail informs about a quite important UBIFS feature which
> have already confused many people.
> 
> If you use UBIFS, and especially if you have been using JFFS2 before,
> please, read this documentation entry:
> 
> http://www.linux-mtd.infradead.org/doc/ubifs.html#L_writeback
> 
> Please, remember that UBIFS is _asynchronous_ FS. JFFS2 was synchronous,
> so expect some of your old applications which were fine on JFFS2 to be
> not ready to handle power cuts correctly in case of UBIFS.

JFFS2 wasn't synchronous on NAND. You still needed to use fsync() as
appropriate to ensure that written data made it to the flash and not
just to the write-buffer.

Your list of things to think about is good, but it should be pointed out
that it applies _generally_ to all systems and all file systems.

This is "Programming 101", and there was no excuse for people getting it
wrong on JFFS2, either. It's not as if an fsync() was expensive in the
cases where it did nothing.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation

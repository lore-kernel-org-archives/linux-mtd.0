Subject: Re: Support of removable MTD devices and other advanced features
	(follow-up from lkml)
From: David Woodhouse <dwmw2@infradead.org>
To: Alex Dubov <oakad@yahoo.com>
In-Reply-To: <411628.55054.qm@web36703.mail.mud.yahoo.com>
References: <411628.55054.qm@web36703.mail.mud.yahoo.com>
Content-Type: text/plain
Date: Wed, 21 May 2008 10:06:07 +0100
Message-Id: <1211360767.21380.325.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2008-05-20 at 06:59 -0700, Alex Dubov wrote:
> Therefore, I propose (and intend to implement) a new architecture for MTD core,
> modeled after the block device API. The "alpha" version of it is here:
> 
> http://gentoo-wiki.com/User:Oakad/mtd_proposal

That looks very interesting, and is fairly similar to what we were
thinking. Some of the outstanding problems we need to solve when we
change are:

 - Support for devices larger than 4GiB.
 - Clarifying whether buffers can be used for DMA
 - Partitioning (which is a bit of a hack right now) & concatenation.
 - Removable devices
 - Sysfs presence

Here's one way I think we can get started on this...

 1. Turn all calls to functions like mtd->read(mtd...) into calls to 
    core functions 'mtd_read()' which we can later play with.
 2. Introduce a wrapper which acts on mtd_requests by making calls to
    the existing direct driver functions (much like mtd_blkdevs.c does
    for block requests).
 3. Make our code 'mtd_read()' et al functions use the mtd_request API.
 4. Shift partitioning into the new layer.
 5. Make it possible for devices to provide the new API directly instead
    of the old one being invoked through the wrappers -- and for user
    modules to use it directly. This is the point at which we fix sysfs.

-- 
dwmw2

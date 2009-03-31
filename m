Received: from mail-qy0-f122.google.com ([209.85.221.122])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LoiiK-0008QV-Lx
	for linux-mtd@lists.infradead.org; Tue, 31 Mar 2009 18:29:44 +0000
Received: by qyk28 with SMTP id 28so14622qyk.28
	for <linux-mtd@lists.infradead.org>;
	Tue, 31 Mar 2009 11:29:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <200903311251.04746.arnd@arndb.de>
References: <a95a62fe0903301814k75ce56f5xef0a04c5c188012@mail.gmail.com>
	<200903311251.04746.arnd@arndb.de>
Date: Tue, 31 Mar 2009 11:29:31 -0700
Message-ID: <a95a62fe0903311129g7ecf6997k2f06f6d9a2abe2c@mail.gmail.com>
Subject: Re: [PATCHv4] MTD: New ioctl calls for >4GiB device support
From: Kevin Cernekee <kpc.mtd@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 31, 2009 at 3:51 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Tuesday 31 March 2009, Kevin Cernekee wrote:
>> +struct mtd_oob_buf64 {
>> +       uint64_t start;
>> +       uint32_t res0;
>> +       uint32_t length;
>> +       unsigned char __user *ptr;
>> +       uint32_t res1[8];
>> +};
>
> Does this have to use an indirect pointer? We normally try to avoid
> ioctl interfaces like this, because they are hard to trace and you
> need a compat wrapper. You might be able to at least avoid the wrapper
> by defining the data structure with a __u64 to take the pointer.

Could you please point out another ioctl that is set up this way, so
that I can follow the same conventions?

Are we ever worried about pointers that are larger than 64 bits, or
ints that are larger than 32 bits?  Or is it generally OK to assume
this will never happen?

> If you leave the data structure the way it is, you should at least
> move the compat_ioctl handling into mtdchar.c from compat_ioctl.c.
> It will simplify your code and help reduce the size of the common
> ioctl handling.

Is this what you are recommending?

1) Leave existing MTD COMPATIBLE_IOCTLs in fs/compat_ioctl.c

2) Implement compat_ioctl handler in mtdchar.c for MEMREADOOB64_32 and
MEMWRITEOOB64_32

3) For all other commands, the new handler should return -ENOIOCTLCMD
and let fs/compat_ioctl.c handle them

Would it be a good idea to move MTDREADOOB32 / MEMWRITEOOB32 out of
fs/compat_ioctl.c at the same time, so that everything is in one
place?

If the compat wrappers are moved to mtdchar.c , does that imply that
they should be reimplemented "natively" instead of using
compat_alloc_user_space(), copy_in_user(), and sys_ioctl() to cause
them to reinvoke the 64-bit versions?

Thanks.

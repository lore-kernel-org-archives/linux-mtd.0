Received: from yw-out-1718.google.com ([74.125.46.152])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lk2GJ-00052D-W1
	for linux-mtd@lists.infradead.org; Wed, 18 Mar 2009 20:21:22 +0000
Received: by yw-out-1718.google.com with SMTP id 9so156344ywk.72
	for <linux-mtd@lists.infradead.org>;
	Wed, 18 Mar 2009 13:21:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1237368029.3622.6.camel@localhost.localdomain>
References: <a95a62fe0903171813x404fcb4bsf29dc5ce9495dbb5@mail.gmail.com>
	<1237368029.3622.6.camel@localhost.localdomain>
Date: Wed, 18 Mar 2009 13:21:13 -0700
Message-ID: <a95a62fe0903181321o688257eco35b6dbe8d12184d4@mail.gmail.com>
Subject: Re: [PATCH] [MTD] mtd-utils: Use new 64-bit ioctls to access >4GiB
	devices
From: Kevin Cernekee <kpc.mtd@gmail.com>
To: dedekind@infradead.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 18, 2009 at 2:20 AM, Artem Bityutskiy
<dedekind@infradead.org> wrote:

Thanks to everyone for the quick feedback.

> I think dwmw2 put it clearly that he will not accept new
> _informational_ ioctls like MEMGETINFO64 and so on. This should
> be exposed via sysfs instead.

Saw that in the archives; I urge him to reconsider.  MEMGETINFO* is a
simple, straightforward interface that is entirely consistent with the
rest of the MTD ABI.  It gets the job done and it is the least
complicated way of doing it on both the user and kernel sides.

If MEMGETINFO64 must be implemented through sysfs, here are some
likely outcomes:

1) Any software using the MTD interface will need to add another
dependency like libsysfs, or add extra code to open/read/parse the
sysfs files and figure out the /sys/* pathnames.  Of course they still
need to open /dev/mtd* anyway in order to erase, unlock, read, write,
or perform any other operation.  So this creates extra work and extra
code, and provides no real benefit to the application.

2) CONFIG_SYSFS needs to be enabled in the kernel.  This isn't always
true on embedded systems, where memory is often an issue.

3) Some programs will never migrate to the new interface, because it's
just too much of a hassle.  The "wrong way" is the path of least
resistance.  New code might just use MEMGETINFO for the same reasons.
This probably isn't something we want to encourage.

I am willing to add the sysfs interface if you insist, but I don't
think it is the right way to solve the problem.  I would much rather
stick to the standard ioctl-based ABI.


> Vs other inctl's, could you please reserve some space there for
> possible future inmprovements by adding
>
> uint8_t padding[128]; /* Unused, reserved for future, should be 0'd */
>
> or something like this, please? We suffered from lack of fields like
> this in the past.

OK.  This probably means we want some sort of versioning system so
that the kernel side and user side can agree on how to use the
reserved fields.

Here are two options, but I am open to suggestions:


1) Use a single ABI version number, like the wireless extensions.  Add
a "get version" ioctl that returns this version number, and put the
version number in the shared headers.

Kernel side logic: no version checking.  Just return whatever number
we were built with.

User side logic: get the kernel ABI version, and print a warning if
there is a mismatch.  Always zero out the padding anyway, to try to be
forward compatible.

How to update the ABI: add/change/remove fields or ioctls, then bump
the version number.

Assumptions:

a) If things aren't working correctly and the user gets a "version
mismatch" warning, they will upgrade (or downgrade) mtd-utils to match
the kernel.

b) Many functions will still work in spite of a version mismatch, but
compatibility is not guaranteed.

c) User programs may optionally use old structs/operations in order to
maintain backward compatibility with old kernels.


2) Use a major/minor version, like the RAID ABI.  Add a "get version"
ioctl and put the major/minor numbers in the shared headers (as
above).

kernel_major/kernel_minor = values taken at compile time from the
kernel's mtd-abi.h

user_major/user_minor = values taken at compile time from the user's mtd-abi.h

Kernel side logic: no version checking.  Just return kernel_major/kernel_minor .

User side logic: if (user_major != kernel_major), we are obsolete;
abort.  If (kernel_minor > user_minor), assume the kernel supports a
superset of the features we use.  "padding" fields must all be zeroed
in every case.

How to update the ABI: replace "padding" bytes with additional fields,
then bump the minor version in mtd-abi.h .  When adding fields, the
kernel needs to be aware that old versions of mtd-utils will
unconditionally fill them with zeroes.

Assumptions:

a) mtd-utils will always need to be upgraded for major ABI changes.

b) mtd-utils will never need to be upgraded for most kernel upgrades
(either no ABI change, or minor ABI change).

c) Compatibility is guaranteed if: ((user_major == kernel_major) &&
(user_minor <= kernel_minor)).

d) User programs may optionally downgrade their feature set to avoid
using features/fields that are unsupported by the running kernel,
allowing for compatibility in the case of ((user_major ==
kernel_major) && (user_minor > kernel_minor)).

e) Anybody changing the ABI on the kernel side needs to either
guarantee backward compatibility for the case of (user_minor <
kernel_minor), or bump the major version.

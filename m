Received: from qw-out-1920.google.com ([74.125.92.147])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LosNs-0000Yv-Qw
	for linux-mtd@lists.infradead.org; Wed, 01 Apr 2009 04:49:11 +0000
Received: by qw-out-1920.google.com with SMTP id 5so2196397qwf.24
	for <linux-mtd@lists.infradead.org>;
	Tue, 31 Mar 2009 21:49:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <200903312021.25165.david-b@pacbell.net>
References: <200903260042.42091.david-b@pacbell.net>
	<200903311418.53772.david-b@pacbell.net>
	<a95a62fe0903311817i76f9f6d8qf7470fd14a62b912@mail.gmail.com>
	<200903312021.25165.david-b@pacbell.net>
Date: Tue, 31 Mar 2009 21:49:03 -0700
Message-ID: <a95a62fe0903312149j482c1684k564896e1981f9819@mail.gmail.com>
Subject: Re: [patch/rfc 2.6.29 1/2] MTD: driver model updates
From: Kevin Cernekee <kpc.mtd@gmail.com>
To: David Brownell <david-b@pacbell.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Kay Sievers <kay.sievers@vrfy.org>,
	Linux MTD <linux-mtd@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 3/31/09, David Brownell <david-b@pacbell.net> wrote:
>> 2) region_info_user fields?  Not really sure how this would work.
>> Maybe a separate subdirectory for each region?
>
> I'm not sure I've ever had reason to care about a "region" (whatever
> that is!) with MTD hardware.

Erase Block Regions.  From the CFI spec:

"x specifies the number of regions within the device containing one or
more contiguous Erase Blocks of the same size.  For example, a 128KB
device (1Mb) having blocking of 16KB, 8KB, four 2KB, two 16KB, and one
64KB is considered to have 5 Erase Block Regions."

This is fairly common on parallel NOR devices.  Probably less so on
huge NAND devices.

> I suspect that a lot of interesting questions could come up in
> the context of enhancing mtd-utils to work with sysfs and bigger
> NAND chips.  Some might relate to "regions".

Right, this sysfs requirement raises a number of issues that need to
be fully thought out in order to make sure the new interface is a
suitable replacement for the "INFO" ioctls.  For instance:

1) If each region is a subdirectory, are user programs supposed to use
readdir() to count them?  Is ioctl(MEMGETREGIONCOUNT) still the
preferred method?  Or do we make a new "regioncount" sysfs attribute?

(A somewhat related question is whether MEMGETREGIONCOUNT only exists
because it was impossible to expand the MEMGETINFO struct.  After all,
it's just copying another field from the mtd_info struct.)

2) How are user programs expected to access MTD sysfs?  Do we
introduce a new libsysfs dependency, or roll our own implementation?
Are there any past examples of ioctls being phased out in favor of
sysfs, particularly in subsystems that are popular on embedded
platforms?

3) What should the mtd-utils changes look like?  Do we define
backward-compatibility wrapper functions that try to work the same way
the ioctls used to?  New libraries and layers of abstraction?  Or
something in the middle?

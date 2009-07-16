Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MRLTJ-0002sl-2d
	for linux-mtd@lists.infradead.org; Thu, 16 Jul 2009 07:33:44 +0000
Subject: RE: UBIFS Corrupt during power failure
From: Artem Bityutskiy <dedekind@infradead.org>
To: Eric Holmberg <Eric_Holmberg@Trimble.com>
In-Reply-To: <C77C279BA71FD14985DC8E75FB265AB703B47FC9@usw-am-xch-02.am.trimblecorp.net>
References: <1246627771.20721.191.camel@localhost.localdomain>
	<7207AAC68CE347458026863515A07DA102901F3C@usw-am-xch-02.am.trimblecorp.net>
	<1246629940.20721.219.camel@localhost.localdomain>
	<7207AAC68CE347458026863515A07DA102901F9C@usw-am-xch-02.am.trimblecorp.net>
	<1246633131.20721.224.camel@localhost.localdomain>
	<1246854654.20721.271.camel@localhost.localdomain>
	<1246855913.20721.287.camel@localhost.localdomain>
	<1246862635.20721.291.camel@localhost.localdomain>
	<1246949184.20721.302.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB703AA85C0@usw-am-xch-02.am.trimblecorp.net>
	<20090715205217.GH3056@shareable.org>
	<C77C279BA71FD14985DC8E75FB265AB703B47FC9@usw-am-xch-02.am.trimblecorp.net>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 16 Jul 2009 10:33:07 +0300
Message-Id: <1247729587.11353.80.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jamie Lokier <jamie@shareable.org>, linux-mtd@lists.infradead.org,
	Urs Muff <urs_muff@Trimble.com>, Stefan Roese <sr@denx.de>,
	Nicolas Pitre <nico@cam.org>, Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-07-15 at 15:35 -0600, Eric Holmberg wrote:
> Test Results - PASS
> -------------------
> I just finished a test run of 3 boards with a total of 8104 power cycles
> during read/modify/write operations on UBIFS.  The system cuts power
> randomly after mounting the UBIFS image while performing read/write file
> operations on the UBIFS root file system.
> 
> I experienced 0 failures.  Typically, I was getting less than 100 cycles
> before failures.
> 
> Software:
>  * 2.6.27-rc9 kernel
>  * UBIFS patches up to July 10
>  * CFI Write buffer size limited to 8 bytes (NOR chip supports 32 bytes)
>  * No power cycling during mount
> 
> Patch:
> http://git.infradead.org/users/dedekind/ubifs-v2.6.27.git?a=commit;h=201
> fce21a67d74e9703127af0d6c6084003796bb

I'm also running a power cut tests. But I do not have any buffer size
limiting patch. I'm running the 'fsstress' program from the LTP test
suite with the following parameters:

fsstress -d /mnt/ubifs -l0 -r -n1000 -p2

And I cut power randomly after 0-300 seconds after the start.

So far so good.

> Remaining tasks:
>  * Anybody:  Add support to UBI/UBIFS to allow for block-write sizes
> greater than 8 bytes

Yeah, this is in my TODO. I just wanted to first reproduce this issue,
then trying to fix it. Cannot reproduce it so far.

>  * Test with power failures during deferred recovery

Good thing to test. I did not test this.

Just in case: I assume by "deferred" recovery you mean the situation
when you mount the FS which needs recovery first R/O, so the recovery
is deferred, and it happens when you re-mount it R/W, right?

> Thanks for everybody's help so far!  I will hopefully get a chance to
> setup the power-failures during deferred recovery this weekend.

Thanks for cooperation. We are interested to make UBIFS robust.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)

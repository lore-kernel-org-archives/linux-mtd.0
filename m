Received: from nat-132.atmel.no ([80.232.32.132] helo=relay.atmel.no)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HoESj-0006Rd-EE
	for linux-mtd@lists.infradead.org; Wed, 16 May 2007 04:02:24 -0400
Received: from [10.191.255.159] (dhcp-255-159.norway.atmel.com
	[10.191.255.159])
	by relay.atmel.no (8.13.4/8.13.4) with ESMTP id l4G82HFT009228
	for <linux-mtd@lists.infradead.org>;
	Wed, 16 May 2007 10:02:17 +0200 (CEST)
	(envelope-from hcegtvedt@atmel.com)
Subject: Re: Mounting big endian jffs2 images on mtdram on a x86
From: Hans-Christian Egtvedt <hcegtvedt@atmel.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <loom.20070516T093928-915@post.gmane.org>
References: <1179133533.21753.13.camel@localhost.localdomain>
	<1179138892.3642.5.camel@sauron>
	<1179189724.3482.24.camel@shinybook.infradead.org>
	<1179215126.21753.40.camel@localhost.localdomain>
	<loom.20070516T093928-915@post.gmane.org>
Content-Type: text/plain
Date: Wed, 16 May 2007 10:02:10 +0200
Message-Id: <1179302530.21753.76.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-05-16 at 07:45 +0000, MikeW wrote:
> Hans-Christian Egtvedt <hcegtvedt <at> norway.atmel.com> writes:

<cut thoughts about bi-endian JFFS2>

> (I guess you could have both be- and le- drivers present in your dev system
> as long as they had different naming, so you could  mount -t jffs2.be / .le
> as required.)

Yes, very nice solution for developers.

> Since this is a development-only requirement, there is no need to make
> a generic read-everything upgrade for JFFS2 which would then slug the
> performance of the standard build. Keep this option as a nonstandard
> recompile option, and let the native versions use their native byte ordering.

Agree, but I would like this to be an option when building the kernel.
So distributions can choose to have this feature or not. I for example
use Ubuntu, and would be thrilled if the upstream Ubuntu kernel was
shipped with jffs2, jffs2.le and jffs2.be modules.

Perhaps just a define in Kconfig which will build the two extra
endianess specific modules.

-- 
With kind regards,

Hans-Christian Egtvedt, siv.ing. (M.Sc.)
Applications Engineer - AVR32 System Solutions - Atmel Norway

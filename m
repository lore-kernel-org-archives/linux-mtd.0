Received: from [2002:4e20:1eda::1] (helo=caramon.arm.linux.org.uk)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RpNKE-0008Qu-8z
 for linux-mtd@lists.infradead.org; Mon, 23 Jan 2012 17:04:59 +0000
Date: Mon, 23 Jan 2012 17:04:36 +0000
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: "Manjunathappa, Prakash" <prakash.pm@ti.com>
Subject: Re: [RESEND PATCH] arm:davinci: prepare to move aemif driver to
 drivers/mfd
Message-ID: <20120123170436.GZ1068@n2100.arm.linux.org.uk>
References: <1327331552-9913-1-git-send-email-prakash.pm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1327331552-9913-1-git-send-email-prakash.pm@ti.com>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: davinci-linux-open-source@linux.davincidsp.com,
 Samuel Ortiz <sameo@linux.intel.com>, Sekhar Nori <nsekhar@ti.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 23, 2012 at 08:42:32PM +0530, Manjunathappa, Prakash wrote:
> Adding: MFD maintainer and mailing list.
> 
>  arch/arm/mach-davinci/aemif.c              |    2 +-
>  arch/arm/mach-davinci/board-da830-evm.c    |    2 +-
>  arch/arm/mach-davinci/board-da850-evm.c    |    2 +-
>  arch/arm/mach-davinci/include/mach/aemif.h |   36 ----------------------------
>  drivers/mtd/nand/davinci_nand.c            |    2 +-
>  include/linux/mfd/davinci_aemif.h          |   36 ++++++++++++++++++++++++++++
>  6 files changed, 40 insertions(+), 40 deletions(-)
>  delete mode 100644 arch/arm/mach-davinci/include/mach/aemif.h
>  create mode 100644 include/linux/mfd/davinci_aemif.h

As Linus has requested on many occasions, and it's a damned good
idea, use -M when generating diffstat - and its also a *really* good
idea to use -M if you're submitting patches which rename files for
review as well.

Obviously arch/arm/mach-davinci/include/mach/aemif.h was moved to
include/linux/mfd/davinci_aemif.h, but were there any changes to its
contents?  Without -M, there only way of knowing is to compare each
file line by line.  With -M, it'll tell us that it was renamed and
produce a diff between the old and new location.

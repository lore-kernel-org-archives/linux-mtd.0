Received: from caramon.arm.linux.org.uk ([78.32.30.218])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TBikX-0008FU-Fi
 for linux-mtd@lists.infradead.org; Wed, 12 Sep 2012 08:56:46 +0000
Date: Wed, 12 Sep 2012 09:52:23 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Christian Daudt <csd@broadcom.com>
Subject: Re: [PATCH 3/3] ARM: Remove BCMRING from arm/tools/mach-types
Message-ID: <20120912085223.GV13739@n2100.arm.linux.org.uk>
References: <5050453F.4080504@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5050453F.4080504@broadcom.com>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, llinux-arm-kernel@lists.infradead.org,
 arm@kernel.org, linux-mtd@lists.infradead.org,
 "JD \(Jiandong\) Zheng" <jdzheng@broadcom.com>,
 Olof Johansson <olof@lixom.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 12, 2012 at 01:18:07AM -0700, Christian Daudt wrote:
> Remove BCMRING from mach-types as that machine type is no
> longer maintaned or used.

Please don't.  Once it's been in mainline once, it will always be in
this file whenever the file is regenerated.

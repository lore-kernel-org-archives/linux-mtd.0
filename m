Received: from smtpout.microchip.com ([198.175.253.82]
 helo=email.microchip.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cWRDm-0006vZ-5e
 for linux-mtd@lists.infradead.org; Wed, 25 Jan 2017 17:18:59 +0000
Subject: Re: [GIT PULL] Immutable branch between MFD and MTD due for the v4.11
 merge window
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Lee Jones
 <lee.jones@linaro.org>
References: <20161128120626.130693-1-mika.westerberg@linux.intel.com>
 <20170103173750.GA27589@dell> <20170125155116.GW17297@lahna.fi.intel.com>
CC: <linux-mtd@lists.infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Peter Tyser <ptyser@xes-inc.com>,
 <key.seong.lim@intel.com>, <linux-kernel@vger.kernel.org>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <6d4eac07-8894-93ca-3f78-50c7545b31c0@atmel.com>
Date: Wed, 25 Jan 2017 18:18:32 +0100
MIME-Version: 1.0
In-Reply-To: <20170125155116.GW17297@lahna.fi.intel.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mika,

Le 25/01/2017 à 16:51, Mika Westerberg a écrit :
> On Tue, Jan 03, 2017 at 05:37:50PM +0000, Lee Jones wrote:
>> MTD Maintainers,
>>
>> Enjoy!
>>
>> The following changes since commit 7ce7d89f48834cefece7804d38fc5d85382edf77:
>>
>>   Linux 4.10-rc1 (2016-12-25 16:13:08 -0800)
>>
>> are available in the git repository at:
>>
>>   git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-mtd-v4.11
>>
>> for you to fetch changes up to 87eb832ae9748fab00588b98c2e33e89de065438:
>>
>>   mfd: lpc_ich: Add support for Intel Apollo Lake SoC (2017-01-03 17:34:16 +0000)
>>
>> ----------------------------------------------------------------
>> Immutable branch between MFD and MTD due for the v4.11 merge window
>>
>> ----------------------------------------------------------------
>> Mika Westerberg (3):
>>       spi-nor: Add support for Intel SPI serial flash controller
>>       mfd: lpc_ich: Add support for SPI serial flash host controller
>>       mfd: lpc_ich: Add support for Intel Apollo Lake SoC
>>
>>  Documentation/mtd/intel-spi.txt          |  88 ++++
>>  drivers/mfd/lpc_ich.c                    | 131 ++++++
>>  drivers/mtd/spi-nor/Kconfig              |  20 +
>>  drivers/mtd/spi-nor/Makefile             |   2 +
>>  drivers/mtd/spi-nor/intel-spi-platform.c |  57 +++
>>  drivers/mtd/spi-nor/intel-spi.c          | 777 +++++++++++++++++++++++++++++++
>>  drivers/mtd/spi-nor/intel-spi.h          |  24 +
>>  include/linux/mfd/lpc_ich.h              |   3 +
>>  include/linux/platform_data/intel-spi.h  |  31 ++
>>  9 files changed, 1133 insertions(+)
>>  create mode 100644 Documentation/mtd/intel-spi.txt
>>  create mode 100644 drivers/mtd/spi-nor/intel-spi-platform.c
>>  create mode 100644 drivers/mtd/spi-nor/intel-spi.c
>>  create mode 100644 drivers/mtd/spi-nor/intel-spi.h
>>  create mode 100644 include/linux/platform_data/intel-spi.h
> 
> Hmm, I don't see the driver in linux-next. Is there something preventing
> you from merging the branch to your next branch?
> 

I've just sent an email to Stephen Rothwell to ask him whether he could
include the "next" branch of the spi-nor tree into linux-next builds.

Best regards,

Cyrille

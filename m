Received: from eusmtp01.atmel.com ([212.144.249.242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cRcyB-0008BR-3h
 for linux-mtd@lists.infradead.org; Thu, 12 Jan 2017 10:51:02 +0000
Subject: Re: [GIT PULL] Immutable branch between MFD and MTD due for the v4.11
 merge window
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Lee Jones
 <lee.jones@linaro.org>
References: <20161128120626.130693-1-mika.westerberg@linux.intel.com>
 <20170103173750.GA27589@dell> <20170105160738.GH3353@lahna.fi.intel.com>
CC: <linux-mtd@lists.infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Peter Tyser <ptyser@xes-inc.com>,
 <key.seong.lim@intel.com>, <linux-kernel@vger.kernel.org>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <83d93b17-a8dc-f7f2-0d19-8652155e4ece@atmel.com>
Date: Thu, 12 Jan 2017 11:50:35 +0100
MIME-Version: 1.0
In-Reply-To: <20170105160738.GH3353@lahna.fi.intel.com>
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

Le 05/01/2017 à 17:07, Mika Westerberg a écrit :
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
> 
> Thanks Lee for picking these up!
> 

Merged to git://github.com/spi-nor/linux.git

Thanks!

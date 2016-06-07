Received: from nbd.name ([2a01:4f8:131:30e2::2])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bAE0H-00057T-Jc
 for linux-mtd@lists.infradead.org; Tue, 07 Jun 2016 10:12:58 +0000
Subject: Re: [PATCH 0/6] MTD: xway: updates from OpenWrt/LEDE
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Hauke Mehrtens <hauke@hauke-m.de>
References: <1465161609-19303-1-git-send-email-hauke@hauke-m.de>
 <20160607114824.5f96228a@bbrezillon>
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 David.Woodhouse@intel.com
From: John Crispin <john@phrozen.org>
Message-ID: <3f0aee29-c2c0-6e42-6f74-fac491438013@phrozen.org>
Date: Tue, 7 Jun 2016 12:12:27 +0200
MIME-Version: 1.0
In-Reply-To: <20160607114824.5f96228a@bbrezillon>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 07/06/2016 11:48, Boris Brezillon wrote:
> On Sun,  5 Jun 2016 23:20:03 +0200
> Hauke Mehrtens <hauke@hauke-m.de> wrote:
> 
>> These patches are in OpenWrt for years now and should go upstream. They 
>> are fixing some problems in the NAND driver.
> 
> Just had a closer look at the xway NAND controller driver, and it's
> just a big pile of hacks :-(. I'll take those patches if nobody is
> willing to maintain this driver, but honestly, I'd prefer a complete
> rework of the driver.
> 

Hi Boris,

it is indeed a horrific pile of doo doo. it has grown historically over
a few years and then became sort of abandoned. i have been keeping it
artificially alive inside openwrt as we have users with boards that have
nand. i dont even own a lantiq board with nand, so patches were sort of
merged on cruise control and with compile testing only.

the SoCs have 2 ways of controlling the nand core. the easy one is this,
which is basically nothing more than a nand flash aware 16bit
intel/hitachi bus interafec called EBU. There is a more advanced dma
based way of doing nand I/O though.

ideally there should be a driver for the so called "high speed nand"
interface which would allow us to nuke this one.

	John

>>
>> Hauke Mehrtens (1):
>>   MTD: xway: add some more documentation
>>
>> John Crispin (5):
>>   MTD: xway: fix invalid operator
>>   MTD: xway: the latched command should be persistent
>>   MTD: xway: remove endless loop
>>   MTD: xway: add missing write_buf and read_buf to nand driver
>>   MTD: xway: fix nand locking
>>
>>  drivers/mtd/nand/xway_nand.c | 67 +++++++++++++++++++++++++++++++++-----------
>>  1 file changed, 51 insertions(+), 16 deletions(-)
>>
> 
> 
> 

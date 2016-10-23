Received: from mail-ua0-x242.google.com ([2607:f8b0:400c:c08::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1byHZN-00075m-1B
 for linux-mtd@lists.infradead.org; Sun, 23 Oct 2016 12:08:06 +0000
Received: by mail-ua0-x242.google.com with SMTP id r64so229098uar.3
 for <linux-mtd@lists.infradead.org>; Sun, 23 Oct 2016 05:07:44 -0700 (PDT)
MIME-Version: 1.0
Sender: kalluripunnaiahchoudary@gmail.com
In-Reply-To: <20161021234611.1f737144@bbrezillon>
References: <1433786918-21500-2-git-send-email-punnaia@xilinx.com>
 <20161021203322.GA28655@obsidianresearch.com>
 <20161021234611.1f737144@bbrezillon>
From: punnaiah choudary kalluri <punnaia@xilinx.com>
Date: Sun, 23 Oct 2016 17:37:42 +0530
Message-ID: <CAGnW=Bb-pnJ9-xjcw-1dR-y+oKjNs53bgD+dh1LwsMTCmzdRmQ@mail.gmail.com>
Subject: Re: [v7,
 1/3] nand: pl353: Add basic driver for arm pl353 smc nand interface
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>,
 Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "jussi.kivilinna@iki.fi" <jussi.kivilinna@iki.fi>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
 "ezequiel.garcia@free-electrons.com" <ezequiel.garcia@free-electrons.com>,
 "grant.likely@linaro.org" <grant.likely@linaro.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jason@lakedaemon.net" <jason@lakedaemon.net>,
 "pawel.moll@arm.com" <pawel.moll@arm.com>,
 "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>,
 "joern@logfs.org" <joern@logfs.org>,
 "kpc528@gmail.com" <kpc528@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "acourbot@nvidia.com" <acourbot@nvidia.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rob@landley.net" <rob@landley.net>,
 "galak@codeaurora.org" <galak@codeaurora.org>, "Khoronzhuk,
 Ivan" <ivan.khoronzhuk@ti.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris and Jason,

 I am doing rework on these patches to accommodate recent changes with
 respect to ooblayout. Also some of the comments that i have received
from Boris as part of the arasan nand controller upstream patches will
apply to this driver. So, i will be releasing the next set of patches for this
driver soon and request your time for reviewing those patches.

for now, please ignore these patches.

Regards,
Punnaiah

On Sat, Oct 22, 2016 at 3:16 AM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Fri, 21 Oct 2016 14:33:22 -0600
> Jason Gunthorpe <jgunthorpe@obsidianresearch.com> wrote:
>
>> On Mon, Jun 08, 2015 at 11:38:36PM +0530, Punnaiah Choudary Kalluri wrote:
>> > Add driver for arm pl353 static memory controller nand interface with
>> > HW ECC support. This controller is used in xilinx zynq soc for interfacing
>> > the nand flash memory.
>> >
>> > Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
>> > Changes in v7:
>> >  - Currently not implemented the memclk rate adjustments. I will
>> >    look into this later and once the basic driver is accepted.
>> >  - Fixed GPL licence ident
>> > Changes in v6:
>> >  - Fixed the checkpatch.pl reported warnings
>> >  - Using the address cycles information from the onfi param page
>> >    earlier it is hardcoded to 5 in driver
>> > Changes in v5:
>> >  - Configure the nand timing parameters as per the onfi spec
>> > Changes in v4:
>> >  - Updated the driver to sync with pl353_smc driver APIs
>> > Changes in v3:
>> >  - implemented the proper error codes
>> >  - further breakdown this patch to multiple sets
>> >  - added the controller and driver details to Documentation section
>> >  - updated the licenece to GPLv2
>> >  - reorganized the pl353_nand_ecc_init function
>> > Changes in v2:
>> >  - use "depends on" rather than "select" option in kconfig
>> >  - remove unused variable parts
>> >  - remove dummy helper and use writel_relaxed directly
>>
>> What is the status of getting this driver merged? I am interested in
>> this driver and can provide some help if there are still TODO items.
>
> I'll try to review it next week.
>
>>
>> At the very least I will test it, is there something newer than v7 out
>> there?
>>
>> Regards,
>> Jason
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>

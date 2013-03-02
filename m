Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UBnJD-0003kK-0x
 for linux-mtd@lists.infradead.org; Sat, 02 Mar 2013 14:21:07 +0000
Message-ID: <1362234094.2745.9.camel@sauron>
Subject: Re: [PATCH V3 1/3] mtd: add new fields to nand_flash_dev{}
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <shijie8@gmail.com>
Date: Sat, 02 Mar 2013 16:21:34 +0200
In-Reply-To: <CAMiH66ExMK8rPMw3kvs9M2b-0ZSkfxBYteTi8QTZf+XCzJw5Dw@mail.gmail.com>
References: <1359349039-11510-1-git-send-email-b32955@freescale.com>
 <1359349039-11510-2-git-send-email-b32955@freescale.com>
 <1360684037.12703.117.camel@sauron.fi.intel.com>
 <CAMiH66ExMK8rPMw3kvs9M2b-0ZSkfxBYteTi8QTZf+XCzJw5Dw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2013-02-16 at 11:56 +0800, Huang Shijie wrote:
> On Tue, Feb 12, 2013 at 11:47 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > On Mon, 2013-01-28 at 12:57 +0800, Huang Shijie wrote:
> >> +       {"SmartMedia 256MiB 3,3V",      {0, 0x71}, 512, 256, 0x4000 },
> >> +       {"SmartMedia 256MiB 3,3V ROM",  {0, 0x5b}, 512, 256, 0x4000,
> >> NAND_ROM},
> >
> > Sorry for a possibly stupid question, but what does it buy you adding
> > another "0" to all the entries? I see you add another table, which you
> > look up if the "traditional" table does not work. Why you need to add
> > these zeroes?
> 
> The zeros are for the maf_id.
> 
> The dev_id is the second byte of the 8-byte id data.

It does not really make me understand why we add these zeroes, they
still look useless to me... Would you please be a little more verbose
about your solution?

-- 
Best Regards,
Artem Bityutskiy

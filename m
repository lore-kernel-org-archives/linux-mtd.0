Received: from mail-ob0-x235.google.com ([2607:f8b0:4003:c01::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YUtGN-0006Cp-KL
 for linux-mtd@lists.infradead.org; Mon, 09 Mar 2015 08:42:12 +0000
Received: by obcwp4 with SMTP id wp4so25070612obc.4
 for <linux-mtd@lists.infradead.org>; Mon, 09 Mar 2015 01:41:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAKdAkRRLk8rHyUw_fAGpNu_u8wkNyL2kDqFQ-=bigefkXqUcxA@mail.gmail.com>
References: <1425560442-13367-1-git-send-email-valentinrothberg@gmail.com>
 <54F855E4.9030106@suse.de>
 <CAKdAkRRLk8rHyUw_fAGpNu_u8wkNyL2kDqFQ-=bigefkXqUcxA@mail.gmail.com>
From: Valentin Rothberg <valentinrothberg@gmail.com>
Date: Mon, 9 Mar 2015 09:41:18 +0100
Message-ID: <CAD3Xx4L6T0_MFjC+7OwgaB40kn7wZX-RAMNWi5WOjJ9z+ZV46g@mail.gmail.com>
Subject: Re: [PATCH] Remove deprecated IRQF_DISABLED flag entirely
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Nishanth Menon <nm@ti.com>,
 "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>,
 Quentin Lambert <lambert.quentin@gmail.com>, Jiri Kosina <jkosina@suse.cz>,
 Tony Lindgren <tony@atomide.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Sricharan R <r.sricharan@ti.com>, linux-mtd@lists.infradead.org,
 Felipe Balbi <balbi@ti.com>, Huacai Chen <chenhc@lemote.com>,
 Christoph Hellwig <hch@lst.de>, Kukjin Kim <kgene.kim@samsung.com>,
 iss_storagedev@hp.com, Jonathan Corbet <corbet@lwn.net>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Ewan Milne <emilne@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, Afzal Mohammed <afzal@ti.com>,
 Arnd Bergmann <arnd@arndb.de>, Rajendra Nayak <rnayak@ti.com>,
 Eyal Perry <eyalpe@mellanox.com>, Hannes Reinecke <hare@suse.de>,
 Thomas Gleixner <tglx@linutronix.de>, Paul Bolle <pebolle@tiscali.nl>,
 Keerthy <j-keerthy@ti.com>, Randy Dunlap <rdunlap@infradead.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>,
 Zhou Wang <wangzhou1@hisilicon.com>, linux-usb@vger.kernel.org,
 Santosh Shilimkar <santosh.shilimkar@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hongliang Tao <taohl@lemote.com>, Andrew Morton <akpm@linux-foundation.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 6, 2015 at 8:41 PM, Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Thu, Mar 5, 2015 at 5:11 AM, Hannes Reinecke <hare@suse.de> wrote:
>> On 03/05/2015 01:59 PM, Valentin Rothberg wrote:
>>> The IRQF_DISABLED is a NOOP and has been scheduled for removal since
>>> Linux v2.6.36 by commit 6932bf37bed4 ("genirq: Remove IRQF_DISABLED from
>>> core code").
>>>
>>> According to commit e58aa3d2d0cc ("genirq: Run irq handlers with
>>> interrupts disabled") running IRQ handlers with interrupts enabled can
>>> cause stack overflows when the interrupt line of the issuing device is
>>> still active.
>>>
>>> This patch ends the grace period for IRQF_DISABLED (i.e., SA_INTERRUPT
>>> in older versions of Linux) and removes the definition and all remaining
>>> usages of this flag.
>>>
>>> Signed-off-by: Valentin Rothberg <valentinrothberg@gmail.com>
>>> ---
>>> The bigger hunk in Documentation/scsi/ncr53c8xx.txt is removed entirely
>>> as IRQF_DISABLED is gone now; the usage in older kernel versions
>>> (including the old SA_INTERRUPT flag) should be discouraged.  The
>>> trouble of using IRQF_SHARED is a general problem and not specific to
>>> any driver.
>>>
>>> I left the reference in Documentation/PCI/MSI-HOWTO.txt untouched since
>>> it has already been removed in linux-next by commit b0e1ee8e1405
>>> ("MSI-HOWTO.txt: remove reference on IRQF_DISABLED").
>>>
>>> All remaining references are changelogs that I suggest to keep.
>>
>> While you're at it: having '0x0' as a value for the irq flags looks
>> a bit silly, and makes you wonder what the parameter is for.
>>
>> I would rather like to have
>>
>> #define IRQF_NONE 0x0
>>
>> and use it for these cases.
>> That way the scope of that parameter is clear.
>
> No, that would imply that IRQ never triggers whereas passing 0 means
> we keep triggers that have been set by the platform.

Are you against introducing a new flag or just don't like 'IRQF_NONE'?
 I think that passing 0 could mean anything when one does not know the
semantics.  Combining yours and Hannes' proposal could look like this:

#define IRQF_PLAT 0x0 - keep triggers that have been set by the platform

I wrote a Coccinelle script to check for such 0-flags and find 758
cases in current Linus' mainline.  The script only checks function
calls to {devm_}request_{threaded_}IRQ() but does not find flags
passed to wrapper functions or flags that are stored in a struct etc.

Kind regards,
 Valentin

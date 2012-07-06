Received: from mail-yx0-f177.google.com ([209.85.213.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sn9eG-000563-V9
 for linux-mtd@lists.infradead.org; Fri, 06 Jul 2012 14:36:56 +0000
Received: by yenr9 with SMTP id r9so9312994yen.36
 for <linux-mtd@lists.infradead.org>; Fri, 06 Jul 2012 07:36:38 -0700 (PDT)
Message-ID: <4FF6F7AC.3090401@gmail.com>
Date: Fri, 06 Jul 2012 11:35:24 -0300
From: "William F." <william76.sh@gmail.com>
MIME-Version: 1.0
To: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH v2 00/10] Prepare for GPMC driver conversion (w.r.t MTD)
References: <cover.1339586624.git.afzal@ti.com>
 <1340789755.29342.12.camel@sauron.fi.intel.com>
 <20120702073547.GA1122@atomide.com>
 <C8443D0743D26F4388EA172BF4E2A7A93E9A267A@DBDE01.ent.ti.com>
 <20120706071335.GJ1122@atomide.com>
In-Reply-To: <20120706071335.GJ1122@atomide.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, "Mohammed,
 Afzal" <afzal@ti.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "ivan.djelic@parrot.com" <ivan.djelic@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I've requested several times to remove my e-mail from that list. I'll 
report it to legal authorities on this issue if no action is taken.

William.
> * Mohammed, Afzal<afzal@ti.com>  [120703 05:10]:
>> Hi Tony,
>>
>> On Mon, Jul 02, 2012 at 13:05:47, Tony Lindgren wrote:
>>> * Artem Bityutskiy<artem.bityutskiy@linux.intel.com>  [120627 02:36]:
>>>> On Wed, 2012-06-13 at 17:02 +0530, Afzal Mohammed wrote:
>>>>> This series cleans up gpmc mtd interactions so that GPMC driver
>>>>> conversion which is going to happen shortly would happen smoothly
>>>>> by not creating much disturbance outside of arch/arm/*omap*/
>>>> Dunno if Tony picked this, but the MTD changes look good an the quick
>>>> glance. Feel free to add
>>>>
>>>> Acked-by: Artem Bityutskiy<artem.bityutskiy@linux.intel.com>
>>> Thanks will add to the drivers/mtd touching patches in this series.
>> Can you please consider this series for inclusion in the coming merge
>> window. This series can live by itself and is not dependent on any
>> other patches.
> Yes I have some of the gpmc patches applied locally on top of the
> dmaengine changes from Russell. Will update and push out once we have
> an immutable commit for the dmaengine changes available.
>
> Regards,
>
> Tony
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>

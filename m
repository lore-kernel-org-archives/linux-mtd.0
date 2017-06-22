Received: from dispatch1-us1.ppe-hosted.com ([67.231.154.164])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dO2aE-0003UF-Jj
 for linux-mtd@lists.infradead.org; Thu, 22 Jun 2017 13:55:44 +0000
Subject: Re: [PATCH] mtdcore: Infrastructure for the device release API
References: <20170518092248.23934.15034.stgit@mh-desktop.uk.solarflarecom.com>
 <20170527001323.GF114788@google.com>
 <7b7511f7-4380-fd3e-703e-8e50a3fcc265@solarflare.com>
CC: <linux-mtd@lists.infradead.org>, Brian Norris <computersforpeace@gmail.com>
From: Martin Habets <mhabets@solarflare.com>
Message-ID: <1f68fe2b-b546-9c9f-03ee-2b90ba382038@solarflare.com>
Date: Thu, 22 Jun 2017 14:54:07 +0100
MIME-Version: 1.0
In-Reply-To: <7b7511f7-4380-fd3e-703e-8e50a3fcc265@solarflare.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian, any opinion about this?

Thanks,
Martin

On 31/05/17 17:15, Martin Habets wrote:
> On 27/05/17 01:13, Brian Norris wrote:
>> On Thu, May 18, 2017 at 10:23:11AM +0100, Martin Habets wrote:
>>> This API adds a cleanup callback for the user of an MTD device.
>>> Normally they will have allocated the mtd_info structure, and using
>>> this callback they can free that memory when the last reference is
>>> dropped.
>>
>> Can you provide an example user? This callback is meaningless (and won't
>> be merged) if it has no users.
> 
> I found this for the sfc driver (drivers/net/ethernet/sfc), but it also affects
> all drivers that use mtd_partition (i.e. mtdpart.c).
> 
>>> CONFIG_DEBUG_KOBJECT_RELEASE can be used to detect users that free
>>> the memory too early.
>>
>> Are there any such users?
> 
> Apart from the sfc driver there are lots of drivers that use MTD partitions
> it seems. There could be other drivers that I'm not aware of.
> 
> To highlight the issue in mtdpart.c: in del_mtd_partitions() it calls
> del_mtd_device() to unregister the device and then frees the memory in
> free_partition().
> The freeing of memory could happen before the last reference to the device
> has been dropped (and off course the memory could be handed out again to
> something else).
> 
> If this callback is acceptable we can fix mtdpart.c all other drivers over
> time. Fixes for the sfc driver go through netdev, and I would not want to
> burden this mailing lists with the patch for that driver.

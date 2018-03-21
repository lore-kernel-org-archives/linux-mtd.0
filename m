Received: from dispatch1-us1.ppe-hosted.com ([67.231.154.164])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1eyafr-0004vO-Cp
 for linux-mtd@lists.infradead.org; Wed, 21 Mar 2018 10:08:53 +0000
Subject: Re: [PATCH 1/2] mtd: use put_device() if device_register fail
To: arvindY <arvind.yadav.cs@gmail.com>
CC: <linux-mtd@lists.infradead.org>
References: <cover.1520592440.git.arvind.yadav.cs@gmail.com>
 <39c4af723ea37cd05976a17cb9c1fbc975496ffd.1520592440.git.arvind.yadav.cs@gmail.com>
 <20180314153600.458c0fe4@bbrezillon> <5AACE3C9.9090602@gmail.com>
 <8d72819d-0811-33c1-41df-fb19ce6de57c@solarflare.com>
 <5AAFF9C6.2010800@gmail.com>
From: Martin Habets <mhabets@solarflare.com>
Message-ID: <62045684-37a7-4359-7f8b-00816a64aa0b@solarflare.com>
Date: Wed, 21 Mar 2018 10:08:33 +0000
MIME-Version: 1.0
In-Reply-To: <5AAFF9C6.2010800@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Arvind,

On 19/03/18 17:56, arvindY wrote:
> 
> 
> On Monday 19 March 2018 04:13 PM, Martin Habets wrote:
>> On 17/03/18 09:45, arvindY wrote:
>>>>>       of_node_put(mtd_get_of_node(mtd));
>>>> You're referencing an object that is supposed to have been
>>>> freed/released by the put_device() call. Again, it's not really a
>>>> problem because in our case ->release() does not free the mtd object
>>>> (as is usually done in other parts of the kernel), but it still looks
>>>> wrong. It's probably better to move the of_node_put() and the below
>>>> idr_remove() call in the ->release() hook if you want to use
>>>> put_device().
>>>>
>>>>>       idr_remove(&mtd_idr, i);
>>> Sure, we can move put_device() below this. But need to check
>>> how we can add hook in release.
>> My guess is that you would need this:
>> http://lists.infradead.org/pipermail/linux-mtd/2017-May/074373.html
> 
> we should not removes(device_destroy) a MTD device in
> release. MTD device should be removes when
> deleting(unregister) a MTD device.

No, deleting an MTD device should only decrement a refcounter.
At this point there can still be other processes with a /dev/mtd*
device open.
When there are no more users release gets called to remove it.

> MTD device should decrement refcount of a node and
> Remove MTD from IDR in dev->release().

You could be right about this, I'm not sure.

My patch allows the caller to free the mtd_info memory. This is needed since
the caller allocated the memory in the first place, and because the caller has
no other of knowing that the last MTD user is gone.

Martin

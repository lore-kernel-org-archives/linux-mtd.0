Received: from dispatch1-us1.ppe-hosted.com ([148.163.129.52])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1exsGb-0007po-0w
 for linux-mtd@lists.infradead.org; Mon, 19 Mar 2018 10:43:50 +0000
Subject: Re: [PATCH 1/2] mtd: use put_device() if device_register fail
To: <arvind.yadav.cs@gmail.com>
References: <cover.1520592440.git.arvind.yadav.cs@gmail.com>
 <39c4af723ea37cd05976a17cb9c1fbc975496ffd.1520592440.git.arvind.yadav.cs@gmail.com>
 <20180314153600.458c0fe4@bbrezillon> <5AACE3C9.9090602@gmail.com>
CC: <linux-mtd@lists.infradead.org>
From: Martin Habets <mhabets@solarflare.com>
Message-ID: <8d72819d-0811-33c1-41df-fb19ce6de57c@solarflare.com>
Date: Mon, 19 Mar 2018 10:43:31 +0000
MIME-Version: 1.0
In-Reply-To: <5AACE3C9.9090602@gmail.com>
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


On 17/03/18 09:45, arvindY wrote:
>>>       of_node_put(mtd_get_of_node(mtd));
>> You're referencing an object that is supposed to have been
>> freed/released by the put_device() call. Again, it's not really a
>> problem because in our case ->release() does not free the mtd object
>> (as is usually done in other parts of the kernel), but it still looks
>> wrong. It's probably better to move the of_node_put() and the below
>> idr_remove() call in the ->release() hook if you want to use
>> put_device().
>>
>>>       idr_remove(&mtd_idr, i);
> Sure, we can move put_device() below this. But need to check
> how we can add hook in release.

My guess is that you would need this:
http://lists.infradead.org/pipermail/linux-mtd/2017-May/074373.html

Martin

>>>   fail_locked:
>>
>>
> ~arvind
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

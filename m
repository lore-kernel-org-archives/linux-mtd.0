Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YICtL-0002JD-MJ
 for linux-mtd@lists.infradead.org; Mon, 02 Feb 2015 09:02:00 +0000
Message-ID: <54CF3C9F.2010502@huawei.com>
Date: Mon, 2 Feb 2015 17:00:15 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH resend] UBIFS: return -EINVAL if first log leb is empty
References: <54CC4F77.1000801@huawei.com>
 <1422697906.8637.295.camel@sauron.fi.intel.com> <54CCAFB4.3060705@huawei.com>
 <1422706597.8637.311.camel@sauron.fi.intel.com> <54CEEAC1.2080403@huawei.com>
 <54CF3333.7050909@nod.at>
In-Reply-To: <54CF3333.7050909@nod.at>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

On 2015/2/2 16:20, Richard Weinberger wrote:
> Am 02.02.2015 um 04:10 schrieb hujianyang:
>> Another problem. Someone <markus.heininger@online.de> asked:
>>
>> "UBIFS: Is it possible to get the compressed size of a file?"
>>
>> I think it's an interesting problem. Actually we used to separate an UBI
>> device into several volumes for space management reason. So could we
>> realize the compressed size getting mechanism and import *quota* to UBIFS
>> itself.
> 
> You can get the actual size by accumulating the UBIFS data node sizes.

and xattr node sizes too? may store in another variable.

> But this means that you have to load the actual data node which is rather
> expensive. I had a short chat with Artem on this, we agreed that a nice solution
> would be to store the actual size in an inode. But that is a non-trivial change
> to UBIFS.
> 

Yes, old images may not store the actual size and it's hard to
get compressed size from this kind of images by a new driver.

Users may get actual size from an ioctl call and maybe we could
return an error if this feature is not supported. How about
increasing file-system driver version and applying actual size
support in a higher version? or mark this feature as a flag
in super_node?

Another 'expensive' implement is whole scan the partition to
get the actual size of a required file in the old images.

What's your plan after that chat?


BR,
Hu

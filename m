Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YICFE-0006nF-4t
 for linux-mtd@lists.infradead.org; Mon, 02 Feb 2015 08:20:33 +0000
Message-ID: <54CF3333.7050909@nod.at>
Date: Mon, 02 Feb 2015 09:20:03 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: hujianyang <hujianyang@huawei.com>, dedekind1@gmail.com
Subject: Re: [PATCH resend] UBIFS: return -EINVAL if first log leb is empty
References: <54CC4F77.1000801@huawei.com>
 <1422697906.8637.295.camel@sauron.fi.intel.com> <54CCAFB4.3060705@huawei.com>
 <1422706597.8637.311.camel@sauron.fi.intel.com> <54CEEAC1.2080403@huawei.com>
In-Reply-To: <54CEEAC1.2080403@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 02.02.2015 um 04:10 schrieb hujianyang:
> Another problem. Someone <markus.heininger@online.de> asked:
> 
> "UBIFS: Is it possible to get the compressed size of a file?"
> 
> I think it's an interesting problem. Actually we used to separate an UBI
> device into several volumes for space management reason. So could we
> realize the compressed size getting mechanism and import *quota* to UBIFS
> itself.

You can get the actual size by accumulating the UBIFS data node sizes.
But this means that you have to load the actual data node which is rather
expensive. I had a short chat with Artem on this, we agreed that a nice solution
would be to store the actual size in an inode. But that is a non-trivial change
to UBIFS.

Thanks,
//richard

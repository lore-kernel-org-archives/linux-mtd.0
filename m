Received: from szxga01-in.huawei.com ([119.145.14.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YJubC-00043a-C5
 for linux-mtd@lists.infradead.org; Sat, 07 Feb 2015 01:54:19 +0000
Message-ID: <54D57006.2040107@huawei.com>
Date: Sat, 7 Feb 2015 09:53:10 +0800
From: shengyong <shengyong1@huawei.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [RFC PATCH] ubifs: do not write master node if recovery needed
References: <1423130080-79705-1-git-send-email-shengyong1@huawei.com>	
 <1423130080-79705-2-git-send-email-shengyong1@huawei.com>
 <1423243771.8637.581.camel@sauron.fi.intel.com>
In-Reply-To: <1423243771.8637.581.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: richard@nod.at, linux-mtd@lists.infradead.org, hujianyang@huawei.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



在 2015/2/7 1:29, Artem Bityutskiy 写道:
> On Thu, 2015-02-05 at 09:54 +0000, Sheng Yong wrote:
>> If unclean umount happens, ubifs may fail when mounting. Trying to mount
>> it will write new master nodes on the flash. This is useless but wasting
>> space and increasing sqnum. So check need_recovery before writing master
>> node, and don't create new master node if filesystem needs recovery.
> 
> Looks like you caught a bug, thanks, but I need to check the code a bit
> more carefully. So when will the master not be updated then, if you do
> not mark it dirty now?
AFAIK, if the need_recovery is set after reading master and before writing
master, the master is always marked dirty by last mount (if unclean umount
happend), and each committing will update master later, with dirty flag set.
This is same as normal mount procedure. So I don't think we need to mark it
dirty here, and only if the recovery fails, the master will not be updated.

thanks,
Sheng
> 
> Artem.
> 
> 
> 

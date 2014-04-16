Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WaFJG-0006xj-MR
 for linux-mtd@lists.infradead.org; Wed, 16 Apr 2014 02:10:47 +0000
Message-ID: <534DE65C.3080806@huawei.com>
Date: Wed, 16 Apr 2014 10:09:32 +0800
From: Zhang Zhen <zhenzhang.zhang@huawei.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH] ubifs: atomically set inode->i_flags in
 ubifs_set_inode_flags()
References: <1397465159-45836-1-git-send-email-zhenzhang.zhang@huawei.com>
 <534CCE74.9090306@huawei.com> <1397568673.4441.10.camel@karhu>
In-Reply-To: <1397568673.4441.10.camel@karhu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, adrian.hunter@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2014/4/15 21:31, Artem Bityutskiy wrote:
> On Tue, 2014-04-15 at 14:15 +0800, Zhang Zhen wrote:
>> Use set_mask_bits() to atomically set i_flags instead of clearing out the
>> S_IMMUTABLE, S_APPEND, etc. flags and then setting them from the
>> UBIFS_IMMUTABLE, UBIFS_APPEND_FL, etc. flags, since this opens up a race
>> where an immutable file has the immutable flag cleared for a brief
>> window of time.
>>
>> Signed-off-by: Zhang Zhen <zhenzhang.zhang@huawei.com>
> 
> Looks correct to me. Does it fix a real-life bug or just a hypothetical
> issue? Also, did you test it?
> 
Hi,

It's just a hypothetical issue.

I noticed the commit 00a1a053ebe5febcfc2ec498bd894f035ad2aa06 added the function
set_mask_bits() to atomically set i_flags, and it is also useful to UBIFS.
So i fix it.

Sorry, Because of lacking of test board, i can only guarantee that it has no compile error.

Best regards!

Received: from aserp1040.oracle.com ([141.146.126.69])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYdja-0008N7-Hu
 for linux-mtd@lists.infradead.org; Thu, 19 Mar 2015 16:55:51 +0000
Message-ID: <550AFF79.1030105@oracle.com>
Date: Thu, 19 Mar 2015 11:55:21 -0500
From: Dave Kleikamp <dave.kleikamp@oracle.com>
MIME-Version: 1.0
To: Boaz Harrosh <boaz@plexistor.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Subject: Re: [Jfs-discussion] [PATCH] fs: cleanup slight list_entry abuse
References: <1426764485-13637-1-git-send-email-linux@rasmusvillemoes.dk>
 <550AF51C.9000600@plexistor.com>
In-Reply-To: <550AF51C.9000600@plexistor.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: codalist@TELEMANN.coda.cs.cmu.edu, jfs-discussion@lists.sourceforge.net,
 linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/19/2015 11:11 AM, Boaz Harrosh wrote:
> On 03/19/2015 01:28 PM, Rasmus Villemoes wrote:
>> list_entry is just a wrapper for container_of, but it is arguably
>> wrong (and slightly confusing) to use it when the pointed-to struct
>> member is not a struct list_head. Use container_of directly instead.
>>
>> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
>> ---
>> Most of these predate git. If I'm the only one who has been confused
>> by this in 10 years, maybe it's not worth the churn.
>>
> 
> No you are not alone here. I have seen this once as well but did not have
> the gumption to send a fix. (The sysv.h one)
> 
> I totally agree with this patch. (So many of them, bread crumbs of copy/paste
> for you ;0)

I'm sure that was the case with jfs.

> 
> Reviewed-by: Boaz Harrosh <boaz@plexistor.com>

Acked-by: Dave Kleikamp <dave.kleikamp@oracle.com>

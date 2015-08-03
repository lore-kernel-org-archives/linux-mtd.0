Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMNJH-0006cU-UU
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2015 21:30:16 +0000
Subject: Re: [PATCH v2 17/35] ubifs: export read_block() from file.c
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, viro@ZenIV.linux.org.uk,
 jack@suse.cz, dedekind1@gmail.com, richard.weinberger@gmail.com
References: <1438235311-23788-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1438235311-23788-18-git-send-email-yangds.fnst@cn.fujitsu.com>
 <55BFD993.3000808@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <55BFDD4F.4060005@nod.at>
Date: Mon, 3 Aug 2015 23:29:51 +0200
MIME-Version: 1.0
In-Reply-To: <55BFD993.3000808@nod.at>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 03.08.2015 um 23:13 schrieb Richard Weinberger:
> Am 30.07.2015 um 07:48 schrieb Dongsheng Yang:
>> We want to use read_block to read quota file bypass the page cache.
>> So export it from file.c, then we can use it in somewhere else.
>>
>> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
>> ---
>>  fs/ubifs/file.c  | 4 ++--
>>  fs/ubifs/ubifs.h | 2 ++
>>  2 files changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
>> index 554d7b9..f307e86 100644
>> --- a/fs/ubifs/file.c
>> +++ b/fs/ubifs/file.c
>> @@ -54,7 +54,7 @@
>>  #include <linux/namei.h>
>>  #include <linux/slab.h>
>>  
>> -static int read_block(struct inode *inode, void *addr, unsigned int block,
>> +int ubifs_read_block(struct inode *inode, void *addr, unsigned int block,
>>  		      struct ubifs_data_node *dn)

Forgot one minor comment, as the function is now public please document the
parameters.

Thanks,
//richard

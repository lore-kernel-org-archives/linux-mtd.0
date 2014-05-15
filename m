Received: from fudo.makrotopia.org ([2001:41d0:8:c75d::1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wkxzp-00018H-LN
 for linux-mtd@lists.infradead.org; Thu, 15 May 2014 15:55:02 +0000
Message-ID: <5374E34A.1000003@makrotopia.org>
Date: Thu, 15 May 2014 17:54:50 +0200
From: Daniel <daniel@makrotopia.org>
MIME-Version: 1.0
To: hujianyang <hujianyang@huawei.com>
Subject: Re: [PATCH] ubifs: add missing ui pointer in debugging code
References: <20140513202750.GA27516@earthship.olsr.leipzig.freifunk.net>
 <53731C00.1020203@huawei.com>
In-Reply-To: <53731C00.1020203@huawei.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/14/2014 09:32 AM, hujianyang wrote:
>> diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
>> index 4f34dba..e13ec5e 100644
>> --- a/fs/ubifs/file.c
>> +++ b/fs/ubifs/file.c
>> @@ -903,6 +903,7 @@ static int do_writepage(struct page *page, int len)
>>  	struct ubifs_info *c = inode->i_sb->s_fs_info;
>>  
>>  #ifdef UBIFS_DEBUG
>> +	struct ubifs_inode *ui = ubifs_inode(inode);
>>  	spin_lock(&ui->ui_lock);
>>  	ubifs_assert(page->index <= ui->synced_i_size << PAGE_CACHE_SIZE);
> 
> I think here should be:
>   	ubifs_assert(page->index <= ui->synced_i_size >> PAGE_CACHE_SHIFT);
> 
> as line 1023 in ubifs_writepage:
> 
>         /* Is the page fully inside @i_size? */
>         if (page->index < end_index) {
>                 if (page->index >= synced_i_size >> PAGE_CACHE_SHIFT) {
>                         err = inode->i_sb->s_op->write_inode(inode, NULL);
> 

My intention was merely to get the code compiled with UBIFS_DEBUG enabled. If
things further than that need to be sorted out in that place as well, I suggest
that should go in a separate discussion.


Cheers

Daniel

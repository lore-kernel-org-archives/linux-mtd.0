Message-ID: <559B2ECF.6010504@huawei.com>
Date: Tue, 7 Jul 2015 09:43:43 +0800
From: Wei Fang <fangwei1@huawei.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
CC: <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] jffs2: remove unneeded kfree.
References: <55239023.5000107@huawei.com> <20150706222318.GB18370@brian-ubuntu>
In-Reply-To: <20150706222318.GB18370@brian-ubuntu>
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

Hi Brian,

Sorry, my bad, I configed my editor with expandtab. I'll
fix it and test it in my end, then resend it.

Thanks,
Wei

On 2015/7/7 6:23, Brian Norris wrote:
> On Tue, Apr 07, 2015 at 04:06:59PM +0800, fangwei wrote:
>> c->oobbuf hasn't been kmalloced in jffs2_dataflash_setup, so
>> there is no need to free it.
>>
>> Signed-off-by: Wei Fang <fangwei1@huawei.com>
>> ---
>>  fs/jffs2/wbuf.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
>> index 09ed551..63f31c0 100644
>> --- a/fs/jffs2/wbuf.c
>> +++ b/fs/jffs2/wbuf.c
>> @@ -1274,7 +1274,6 @@ int jffs2_dataflash_setup(struct jffs2_sb_info *c) {
>>  #ifdef CONFIG_JFFS2_FS_WBUF_VERIFY
>>         c->wbuf_verify = kmalloc(c->wbuf_pagesize, GFP_KERNEL);
>>         if (!c->wbuf_verify) {
>> -               kfree(c->oobbuf);
>>                 kfree(c->wbuf);
>>                 return -ENOMEM;
>>         }
> 
> Your patches are whitespace damaged and cannot be applied. Please fix
> your mailer and resend. Consider retesting by sending to yourself and
> try using git-am. If all else fails, git-send-email is your friend.
> 
> Thanks,
> Brian
> 
> 

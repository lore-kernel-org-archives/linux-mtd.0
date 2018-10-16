Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCMYw-0001os-M9
 for linux-mtd@lists.infradead.org; Tue, 16 Oct 2018 10:26:56 +0000
Subject: Re: [PATCH] jffs2: free jffs2_sb_info through jffs2_kill_sb()
To: Richard Weinberger <richard.weinberger@gmail.com>
CC: "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>,
 <stable@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Al Viro
 <viro@zeniv.linux.org.uk>, Brian Norris <computersforpeace@gmail.com>
References: <20181006090935.41714-1-houtao1@huawei.com>
 <6401cb90-a1fe-afd5-c302-ddae40876736@huawei.com>
 <CAFLxGvw+=gfrm3SH4Hu9bt0sa6s+X=3cCjkDLvWusqhHH10yEQ@mail.gmail.com>
From: Hou Tao <houtao1@huawei.com>
Message-ID: <9bb38d45-41c7-9f16-bf6b-d21ba6617f1c@huawei.com>
Date: Tue, 16 Oct 2018 18:26:34 +0800
MIME-Version: 1.0
In-Reply-To: <CAFLxGvw+=gfrm3SH4Hu9bt0sa6s+X=3cCjkDLvWusqhHH10yEQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 2018/10/16 14:41, Richard Weinberger wrote:
> On Tue, Oct 16, 2018 at 7:53 AM Hou Tao <houtao1@huawei.com> wrote:
>>
>> ping ?
>>
>> On 2018/10/6 17:09, Hou Tao wrote:
>>> When an invalid mount option is passed to jffs2, jffs2_parse_options()
>>> will fail and jffs2_sb_info will be freed, but then jffs2_sb_info will
>>> be used (use-after-free) and freeed (double-free) in jffs2_kill_sb().
>>>
>>> Fix it by removing the buggy invocation of kfree() when getting invalid
>>> mount options.
>>>
>>> Cc: stable@kernel.org
>>> Signed-off-by: Hou Tao <houtao1@huawei.com>
>>> ---
>>>  fs/jffs2/super.c | 4 +---
>>>  1 file changed, 1 insertion(+), 3 deletions(-)
>>>
>>> diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
>>> index 87bdf0f4cba1..902a7dd10e5c 100644
>>> --- a/fs/jffs2/super.c
>>> +++ b/fs/jffs2/super.c
>>> @@ -285,10 +285,8 @@ static int jffs2_fill_super(struct super_block *sb, void *data, int silent)
>>>       sb->s_fs_info = c;
>>>
>>>       ret = jffs2_parse_options(c, data);
>>> -     if (ret) {
>>> -             kfree(c);
>>> +     if (ret)
>>>               return -EINVAL;
>>> -     }
> 
> Reviewed-by: Richard Weinberger <richard@nod.at>
> 
> We can carry this via the MTD tree.
Thanks for that.

Regards,
Tao

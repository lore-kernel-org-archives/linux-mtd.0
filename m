Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZOcWb-0000vq-JC
 for linux-mtd@lists.infradead.org; Mon, 10 Aug 2015 02:09:18 +0000
Message-ID: <55C8065B.20404@cn.fujitsu.com>
Date: Mon, 10 Aug 2015 10:03:07 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, <viro@ZenIV.linux.org.uk>,
 <jack@suse.cz>, <dedekind1@gmail.com>, <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>
Subject: Re: [PATCH v2 21/35] ubifs: disable quota in ubifs_put_super
References: <1438235311-23788-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1438235311-23788-22-git-send-email-yangds.fnst@cn.fujitsu.com>
 <55C66FB1.2050302@nod.at>
In-Reply-To: <55C66FB1.2050302@nod.at>
Content-Type: text/plain; charset="ISO-8859-15"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/09/2015 05:08 AM, Richard Weinberger wrote:
> Am 30.07.2015 um 07:48 schrieb Dongsheng Yang:
>> We need to disable quota in umounting ubifs. So we have to
>> disable quota in ubifs_put_super(). But quota disable will
>> write quota file, and we have to budget for it.
>>
>> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
>> ---
>>   fs/ubifs/super.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
>> index 3609d7b..7031c16 100644
>> --- a/fs/ubifs/super.c
>> +++ b/fs/ubifs/super.c
>> @@ -2027,6 +2027,8 @@ static void ubifs_put_super(struct super_block *sb)
>>
>>   	ubifs_msg(c, "un-mount UBI device %d", c->vi.ubi_num);
>>
>> +	if (!c->ro_mount)
>> +		dquot_disable(sb, -1, DQUOT_USAGE_ENABLED | DQUOT_LIMITS_ENABLED);
>
> I fear this will explode in your face.
> dquot_disable disables all inodes needed for quota support, once enabled
> you have to shut down quota support.
> IOW if someone remounts UBIFS read only or UBIFS does itself due to an error
> you'll leak inodes.

Yes, you are right. I filter the read-only for a bug in quota which
call sync_fs directly even in ro-mode. But I have addressed it in quota,
so I will update this patch in next version.

Thanx a lot, Richard.
Yang
>
> Thanks,
> //richard
>
> .
>

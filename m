Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZOcXW-000173-Bn
 for linux-mtd@lists.infradead.org; Mon, 10 Aug 2015 02:10:16 +0000
Message-ID: <55C80697.40403@cn.fujitsu.com>
Date: Mon, 10 Aug 2015 10:04:07 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, <viro@ZenIV.linux.org.uk>,
 <jack@suse.cz>, <dedekind1@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>
Subject: Re: [PATCH v2 24/35] ubifs: suspend & resume quota properly in
 ubifs_remount
References: <1438235311-23788-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1438235311-23788-25-git-send-email-yangds.fnst@cn.fujitsu.com>
 <55C6738E.4090206@nod.at>
In-Reply-To: <55C6738E.4090206@nod.at>
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

On 08/09/2015 05:24 AM, Richard Weinberger wrote:
> Am 30.07.2015 um 07:48 schrieb Dongsheng Yang:
>> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
>> ---
>>   fs/ubifs/super.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
>> index 6ed35e2..06dd7af 100644
>> --- a/fs/ubifs/super.c
>> +++ b/fs/ubifs/super.c
>> @@ -2128,11 +2128,13 @@ static int ubifs_remount_fs(struct super_block *sb, int *flags, char *data)
>>   		err = ubifs_remount_rw(c);
>>   		if (err)
>>   			return err;
>> +		dquot_resume(sb, -1);
>>   	} else if (!c->ro_mount && (*flags & MS_RDONLY)) {
>>   		if (c->ro_error) {
>>   			ubifs_msg(c, "cannot re-mount R/O due to prior errors");
>>   			return -EROFS;
>>   		}
>> +		dquot_suspend(sb, -1);
>
> Is it really safe to ignore the return values of both function?

Good point. I will do it.

Thanx
Yang
>
> Beside of that,
> Reviewed-by: Richard Weinberger <richard@nod.at>
>
> Thanks,
> //richard
> .
>

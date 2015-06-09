Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2Bjd-0001eX-B0
 for linux-mtd@lists.infradead.org; Tue, 09 Jun 2015 05:06:02 +0000
Message-ID: <557672FF.8080407@cn.fujitsu.com>
Date: Tue, 9 Jun 2015 13:00:47 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <adrian.hunter@intel.com>, <dedekind1@gmail.com>
Subject: Re: [PATCH RESEND] ubifs: Introduce a mount option of force_atime.
References: <1433758060-18614-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <55761D51.7000005@nod.at> <55765C65.80302@cn.fujitsu.com>
In-Reply-To: <55765C65.80302@cn.fujitsu.com>
Content-Type: text/plain; charset="ISO-8859-15"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-fsdevel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/09/2015 11:24 AM, Dongsheng Yang wrote:
> On 06/09/2015 06:55 AM, Richard Weinberger wrote:
>> Am 08.06.2015 um 12:07 schrieb Dongsheng Yang:
>>> -    ubifs_assert(mutex_is_locked(&ui->ui_mutex));
>>>       if (!ui->dirty) {
>>> +        if (!locked) {
>>> +            /*
>>> +             * It's a little tricky here, there is only one
>>> +             * possible user of ubifs_dirty_inode did not do
>>> +             * a budget for this inode. At the same time, this
>>> +             * user is not holding the ui->ui_mutex. Then if
>>> +             * we found ui->ui_mutex is not locked, we can say:
>>> +             * we need to do a budget in ubifs_dirty_inode here.
>>> +             */
>>> +            struct ubifs_budget_req req = { .dirtied_ino = 1,
>>> +                    .dirtied_ino_d = ALIGN(ui->data_len, 8) };
>>> +
>>> +            ret = ubifs_budget_space(c, &req);
>>> +            if (ret)
>>> +                goto out;
>>> +        }
>>
>> So, this is the new case when ->dirty_inode() is called via
>> generic_update_time()?
>> Did you research whether you can detect that case also by looking at
>> the flags parameter?
>> I'd give I_DIRTY_TIME a try. This way you could get at least rid of
>> the mutex_is_locked()
>> usage.
>
> Okey, after a reading, I'm afraid I can not think a better idea
> out. The flags between *old* cases and the *new* case can possiblly
> be same. Then we can't use the flags to filter the new case from old
> cases.

Oops, sorry, my bad!!

generic_upadte_time() is the only way to use I_DIRTY_TIME here currently.
You are right!. we can get rid of mutex_is_locked() at least.

Thanx
Yang
>
> But I think I can append a patch to add a support for lazytime here:
>      if (flags == I_DIRTY_TIME)
>          return;
>
> Thanx
> Yang
>
>>
>> Thanks,
>> //richard
>> .
>>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-fsdevel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> .
>

Received: from mail-pd0-x235.google.com ([2607:f8b0:400e:c02::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WN5Ca-0008NN-DE
 for linux-mtd@lists.infradead.org; Mon, 10 Mar 2014 18:45:29 +0000
Received: by mail-pd0-f181.google.com with SMTP id p10so7400249pdj.40
 for <linux-mtd@lists.infradead.org>; Mon, 10 Mar 2014 11:45:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAFLxGvyyD4YOdprkVNYacf1_1pZdzEBjTOU56FWZB0vcjrij6Q@mail.gmail.com>
References: <1394237487-2728-1-git-send-email-f.fainelli@gmail.com>
 <CAFLxGvyyD4YOdprkVNYacf1_1pZdzEBjTOU56FWZB0vcjrij6Q@mail.gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Date: Mon, 10 Mar 2014 11:44:23 -0700
Message-ID: <CAGVrzcZzt+Jii5D8zNTECn92L2-ASoxd4Bcz5WvSNq3rsd754g@mail.gmail.com>
Subject: Re: [PATCH] UBIFS: add missing znode freeing in tcn_insert()
To: Richard Weinberger <richard.weinberger@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2014-03-08 2:46 GMT-08:00 Richard Weinberger <richard.weinberger@gmail.com>:
> On Sat, Mar 8, 2014 at 1:11 AM, Florian Fainelli <f.fainelli@gmail.com> wrote:
>> In case the zi allocation fails in the do_split label, we will fail
>> freeing zn that we allocated before, add a missing kfree.
>>
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>> ---
>>  fs/ubifs/tnc.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
>> index 9083bc7ed4ae..9b84d91ea530 100644
>> --- a/fs/ubifs/tnc.c
>> +++ b/fs/ubifs/tnc.c
>> @@ -2105,8 +2105,10 @@ do_split:
>>         dbg_tnc("creating new zroot at level %d", znode->level + 1);
>>
>>         zi = kzalloc(c->max_znode_sz, GFP_NOFS);
>> -       if (!zi)
>> +       if (!zi) {
>> +               kfree(zn);
>>                 return -ENOMEM;
>> +       }
>>
>
> I'm not sure whether this is correct.
>
> Around line 2050 we have:
> ... else {
>                 /* Insert into new znode */
>                 zi = zn; <---------
>                 n -= keep;
>                 /* Re-parent */
>                 if (zn->level != 0)
>                         zbr->znode->parent = zn;
>         }
>
> And later:
> insert_zbranch(zi, zbr, n);
>
> By freeing zn you may introduce a use after free bug.

Yes, you are right, I cannot find a good way to make sure this is not
the case, variables re-use in this function makes it particularly hard
to read BTW.
-- 
Florian

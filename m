Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T3jW8-0006iw-2T
 for linux-mtd@lists.infradead.org; Tue, 21 Aug 2012 08:08:52 +0000
Received: by lagu2 with SMTP id u2so3577451lag.36
 for <linux-mtd@lists.infradead.org>; Tue, 21 Aug 2012 01:08:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1345404739.1930.11.camel@kyv>
References: <1345214124-5478-1-git-send-email-richard.genoud@gmail.com>
 <1345214124-5478-4-git-send-email-richard.genoud@gmail.com>
 <1345404739.1930.11.camel@kyv>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Tue, 21 Aug 2012 10:08:27 +0200
Message-ID: <CACQ1gAgcvxX7Dh8JRdj1S_agnh0F-08cK3EBWdb9Rzo-+ox+fw@mail.gmail.com>
Subject: Re: [PATCH 3/8] UBI: introduce MTD_PARAM_MAX_COUNT
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/8/19 Artem Bityutskiy <dedekind1@gmail.com>:
> On Fri, 2012-08-17 at 16:35 +0200, Richard Genoud wrote:
>> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
>> ---
>>  drivers/mtd/ubi/build.c |    7 +++++--
>>  1 files changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
>> index 82d11e1..1f45f51 100644
>> --- a/drivers/mtd/ubi/build.c
>> +++ b/drivers/mtd/ubi/build.c
>> @@ -46,6 +46,9 @@
>>  /* Maximum length of the 'mtd=' parameter */
>>  #define MTD_PARAM_LEN_MAX 64
>>
>> +/* Maximum number of comma-separated items in ht 'mtd=' parameter */
>> +#define MTD_PARAM_MAX_COUNT 2
>
> Fixed the spelling of "the" and pushed to linux-ubi.git, thanks!
>
> --
> Best Regards,
> Artem Bityutskiy
Hi Artem,

It seems that this patch has been dropped on linux-ubi/master. Is it a
git-reset accident or my patches didn't apply cleanly on it ?
Anyway, if you want me to re-send it rebased on top of
linux-ubi/master, just ask (I guess there will be a little conflit on
the #define)

Best Regards,
Richard.



-- 
for me, ck means con kolivas and not calvin klein... does it mean I'm a geek ?

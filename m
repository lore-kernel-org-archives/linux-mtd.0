Received: from ie-in-x022c.1e100.net ([2607:f8b0:4001:c03::22c]
 helo=mail-ie0-x22c.google.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U5XtG-0008N3-6i
 for linux-mtd@lists.infradead.org; Wed, 13 Feb 2013 08:40:30 +0000
Received: by mail-ie0-f172.google.com with SMTP id c10so1343064ieb.17
 for <linux-mtd@lists.infradead.org>; Wed, 13 Feb 2013 00:40:28 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAOMZO5D_e6qqFC-M8WtDR7QoSNCizrMrcD0n=60M1EQMrha0BQ@mail.gmail.com>
References: <1360597903-10378-1-git-send-email-festevam@gmail.com>
 <CALF0-+W=FiQvSchT9Z3DosGvf-r2d20PK9NZDFnYzmtpYi+ieQ@mail.gmail.com>
 <CAOMZO5D_e6qqFC-M8WtDR7QoSNCizrMrcD0n=60M1EQMrha0BQ@mail.gmail.com>
Date: Wed, 13 Feb 2013 05:40:26 -0300
Message-ID: <CALF0-+Ub1vqYqXc60tDjpe2ppxw3vmBbEsNU_GGJDeNHXRS-tQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: mxc_nand: Fix sparse warning
From: Ezequiel Garcia <elezegarcia@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 artem.bityutskiy@linux.intel.com, linux-mtd@lists.infradead.org,
 joe@perches.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Fabio,

On Tue, Feb 12, 2013 at 5:50 PM, Fabio Estevam <festevam@gmail.com> wrote:
> On Tue, Feb 12, 2013 at 12:39 AM, Ezequiel Garcia <elezegarcia@gmail.com> wrote:
>
>>> diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
>>> index 45204e4..37037cb 100644
>>> --- a/drivers/mtd/nand/mxc_nand.c
>>> +++ b/drivers/mtd/nand/mxc_nand.c
>>> @@ -266,7 +266,7 @@ static struct nand_ecclayout nandv2_hw_eccoob_4k = {
>>>         }
>>>  };
>>>
>>> -static const char const *part_probes[] = {
>>> +static const char *part_probes[] = {
>>>         "cmdlinepart", "RedBoot", "ofpart", NULL };
>>>
>>
>> Are you sure checkpatch.pl didn't complain about this patch?
>
> Yes, checkpatch complains, but it seems that checkpatch and sparse are
> in contradiction then.
>

Well it doesn't seem in contradiction to me. You fixed a redundant
double const:

-static const char const *part_probes[] = {
+static const char *part_probes[] = {
        "cmdlinepart", "RedBoot", "ofpart", NULL };

Notice how the 'const char const' type is nonesense.
And checkpatch.pl will suggest you this in turn:

static const char * const part_probes[] = {
        "cmdlinepart", "RedBoot", "ofpart", NULL };

Notice how the second 'const' is after the pointer.

My point is, the code you're fixing needs a fix,
just not the fix you were proposing :-)

Hope it helped,

-- 
    Ezequiel

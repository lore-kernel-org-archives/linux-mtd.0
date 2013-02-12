Received: from mail-vb0-f43.google.com ([209.85.212.43])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U5Mnz-0006lz-C8
 for linux-mtd@lists.infradead.org; Tue, 12 Feb 2013 20:50:20 +0000
Received: by mail-vb0-f43.google.com with SMTP id fs19so328294vbb.30
 for <linux-mtd@lists.infradead.org>; Tue, 12 Feb 2013 12:50:18 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CALF0-+W=FiQvSchT9Z3DosGvf-r2d20PK9NZDFnYzmtpYi+ieQ@mail.gmail.com>
References: <1360597903-10378-1-git-send-email-festevam@gmail.com>
 <CALF0-+W=FiQvSchT9Z3DosGvf-r2d20PK9NZDFnYzmtpYi+ieQ@mail.gmail.com>
Date: Tue, 12 Feb 2013 18:50:17 -0200
Message-ID: <CAOMZO5D_e6qqFC-M8WtDR7QoSNCizrMrcD0n=60M1EQMrha0BQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: mxc_nand: Fix sparse warning
From: Fabio Estevam <festevam@gmail.com>
To: Ezequiel Garcia <elezegarcia@gmail.com>
Content-Type: text/plain; charset=UTF-8
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

Hi Ezequiel,

On Tue, Feb 12, 2013 at 12:39 AM, Ezequiel Garcia <elezegarcia@gmail.com> wrote:

>> diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
>> index 45204e4..37037cb 100644
>> --- a/drivers/mtd/nand/mxc_nand.c
>> +++ b/drivers/mtd/nand/mxc_nand.c
>> @@ -266,7 +266,7 @@ static struct nand_ecclayout nandv2_hw_eccoob_4k = {
>>         }
>>  };
>>
>> -static const char const *part_probes[] = {
>> +static const char *part_probes[] = {
>>         "cmdlinepart", "RedBoot", "ofpart", NULL };
>>
>
> Are you sure checkpatch.pl didn't complain about this patch?

Yes, checkpatch complains, but it seems that checkpatch and sparse are
in contradiction then.

Regards,

Fabio Estevam

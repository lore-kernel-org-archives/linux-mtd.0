Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XjZjM-0003SL-7B
 for linux-mtd@lists.infradead.org; Wed, 29 Oct 2014 20:20:33 +0000
Message-ID: <54514BF6.1010201@nod.at>
Date: Wed, 29 Oct 2014 21:20:06 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Andrew Murray <amurray@embedded-bits.co.uk>
Subject: Re: [PATCH 1/2] UBI: Implement UBI_METAONLY
References: <1414594338-14695-1-git-send-email-richard@nod.at>
 <CAPcvp5HBnuAHTwFHLJ1Ve6o2MSeQ8Qnn6x7Q0wD2G-yP6p7OLA@mail.gmail.com>
In-Reply-To: <CAPcvp5HBnuAHTwFHLJ1Ve6o2MSeQ8Qnn6x7Q0wD2G-yP6p7OLA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 29.10.2014 um 21:11 schrieb Andrew Murray:
> On 29 October 2014 14:52, Richard Weinberger <richard@nod.at> wrote:
>> diff --git a/include/linux/mtd/ubi.h b/include/linux/mtd/ubi.h
>> index c3918a0..82b693f 100644
>> --- a/include/linux/mtd/ubi.h
>> +++ b/include/linux/mtd/ubi.h
>> @@ -34,11 +34,13 @@
>>   * UBI_READONLY: read-only mode
>>   * UBI_READWRITE: read-write mode
>>   * UBI_EXCLUSIVE: exclusive mode
>> + * UBI_METAONLY: modify voulme meta data only
> 
> Typo - s/voulme/volume/g

Thanks. :)

>>   */
>>  enum {
>>         UBI_READONLY = 1,
>>         UBI_READWRITE,
>> -       UBI_EXCLUSIVE
>> +       UBI_EXCLUSIVE,
>> +       UBI_METAONLY
>>  };
>>
> 
> Also you may want to add something similar to this:
> 
> --- a/drivers/mtd/ubi/ubi.h
> +++ b/drivers/mtd/ubi/ubi.h
> @@ -339,7 +339,7 @@ struct ubi_volume {
>  /**
>   * struct ubi_volume_desc - UBI volume descriptor returned when it is opened.
>   * @vol: reference to the corresponding volume description object
> - * @mode: open mode (%UBI_READONLY, %UBI_READWRITE, or %UBI_EXCLUSIVE)
> + * @mode: open mode (%UBI_READONLY, %UBI_READWRITE, %UBI_EXCLUSIVE or
> %UBI_METAONLY)
>   */
>  struct ubi_volume_desc {
>         struct ubi_volume *vol;
> 
> There is also a similar mention in gluebi.c: 'readers/writes/exclusive'.

Please send a patch for that. :)

Thanks,
//richard

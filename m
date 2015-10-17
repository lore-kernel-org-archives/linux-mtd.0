Received: from mail-wi0-f173.google.com ([209.85.212.173])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZnVwf-0008Ou-RI
 for linux-mtd@lists.infradead.org; Sat, 17 Oct 2015 18:11:06 +0000
Received: by wicfv8 with SMTP id fv8so29020548wic.0
 for <linux-mtd@lists.infradead.org>; Sat, 17 Oct 2015 11:10:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <56228D96.7070408@nod.at>
References: <1445104555-30509-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <56228D96.7070408@nod.at>
Date: Sat, 17 Oct 2015 15:10:43 -0300
Message-ID: <CAAEAJfDEPj1nuLbPxcLvmnGUKWh7WNwXncTW2uTpD-3Sa3hz0A@mail.gmail.com>
Subject: Re: [PATCH] UBI: Fastmap: Fix PEB array type
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Richard Weinberger <richard@nod.at>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, hs@denx.de
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 17 October 2015 at 15:04, Richard Weinberger <richard@nod.at> wrote:
> Am 17.10.2015 um 19:55 schrieb Ezequiel Garcia:
>> The PEB array is an array of __be32, so let's fix the
>> scan_pool() prototype accordingly.
>>
>> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>> ---
>>  drivers/mtd/ubi/fastmap.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
>> index db3defdfc3c0..c867707a1d04 100644
>> --- a/drivers/mtd/ubi/fastmap.c
>> +++ b/drivers/mtd/ubi/fastmap.c
>> @@ -383,7 +383,7 @@ static void unmap_peb(struct ubi_attach_info *ai, in=
t pnum)
>>   * < 0 indicates an internal error.
>>   */
>>  static int scan_pool(struct ubi_device *ubi, struct ubi_attach_info *ai=
,
>> -                  int *pebs, int pool_size, unsigned long long *max_sqn=
um,
>> +                  __be32 *pebs, int pool_size, unsigned long long *max_=
sqnum,
>>                    struct list_head *eba_orphans, struct list_head *free=
)
>>  {
>>       struct ubi_vid_hdr *vh;
>
> The change makes sense, but does it fix a real issue?

No, doesn't fix any issue as far as I know.

> I suspect it silences a compiler warning, which one?
>

It fixes a silly warning that's printed if -Wpointer-sign. Linux
disables the warning, so this patch doesn't even fix a warning.

I'd say it's merely cosmetic.
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar

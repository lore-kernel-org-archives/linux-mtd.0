Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bGWZg-0006Sw-6H
 for linux-mtd@lists.infradead.org; Fri, 24 Jun 2016 19:15:33 +0000
Subject: Re: [PATCH] ubi: Make volume resize power cut aware
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
References: <1466703038-13044-1-git-send-email-richard@nod.at>
 <CAAEAJfC4jKniYR=Y609_O3vfufoQFFamrgRXc33UuW4jLaTE4g@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>, stable@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <576D86B9.5020100@nod.at>
Date: Fri, 24 Jun 2016 21:15:05 +0200
MIME-Version: 1.0
In-Reply-To: <CAAEAJfC4jKniYR=Y609_O3vfufoQFFamrgRXc33UuW4jLaTE4g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 24.06.2016 um 20:05 schrieb Ezequiel Garcia:
> Hi guys,
> 
> I have a few questions.

I like questions. :-)

> On 23 June 2016 at 14:30, Richard Weinberger <richard@nod.at> wrote:
>> When the volume resize operation shrinks a volume,
>> LEBs will be unmapped. Since unmapping will not erase these
>> LEBs immediately we have to wait for that operation to finish.
>> Otherwise in case of a power cut right after writing the new
>> volume table the UBI attach process can find more LEBs than the
>> volume table knows. This will render the UBI image unattachable.
>>
>> Fix this issue by waiting for erase to complete and write the new volume table afterward.
>>
>> Cc: <stable@vger.kernel.org>
>> Reported-by: Boris Brezillon <boris.brezillon@free-electrons.com>
>> Signed-off-by: Richard Weinberger <richard@nod.at>
>> ---
>>  drivers/mtd/ubi/vmt.c | 25 ++++++++++++++++++-------
>>  1 file changed, 18 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
>> index 10059df..0138f52 100644
>> --- a/drivers/mtd/ubi/vmt.c
>> +++ b/drivers/mtd/ubi/vmt.c
>> @@ -488,13 +488,6 @@ int ubi_resize_volume(struct ubi_volume_desc *desc, int reserved_pebs)
>>                 spin_unlock(&ubi->volumes_lock);
>>         }
>>
>> -       /* Change volume table record */
>> -       vtbl_rec = ubi->vtbl[vol_id];
>> -       vtbl_rec.reserved_pebs = cpu_to_be32(reserved_pebs);
>> -       err = ubi_change_vtbl_record(ubi, vol_id, &vtbl_rec);
>> -       if (err)
>> -               goto out_acc;
>> -
>>         if (pebs < 0) {
>>                 for (i = 0; i < -pebs; i++) {
>>                         err = ubi_eba_unmap_leb(ubi, vol, reserved_pebs + i);
>> @@ -512,6 +505,24 @@ int ubi_resize_volume(struct ubi_volume_desc *desc, int reserved_pebs)
>>                 spin_unlock(&ubi->volumes_lock);
>>         }
>>
>> +       /*
>> +        * When we shrink a volume we have to flush all pending (erase) work.
>> +        * Otherwise it can happen that upon next attach UBI finds a LEB with
>> +        * lnum > highest_lnum and refuses to attach.
>> +        */
>> +       if (pebs < 0) {
>> +               err = ubi_wl_flush(ubi, vol_id, UBI_ALL);
>> +               if (err)
>> +                       goto out_acc;
>> +       }
>> +
> 
> What will happen if the power-cut happens right here,
> before the volume table is written?

Since you are always allowed to unmap LEBs nothing will happen.
UBI will find a volume with 0 LEBs used.

>> +       /* Change volume table record */
>> +       vtbl_rec = ubi->vtbl[vol_id];
>> +       vtbl_rec.reserved_pebs = cpu_to_be32(reserved_pebs);
>> +       err = ubi_change_vtbl_record(ubi, vol_id, &vtbl_rec);
>> +       if (err)
>> +               goto out_acc;
>> +
>>         vol->reserved_pebs = reserved_pebs;
>>         if (vol->vol_type == UBI_DYNAMIC_VOLUME) {
>>                 vol->used_ebs = reserved_pebs;
> 
> 
> Also, should we have a similar change for ubi_remove_volume?

Nope since you are allowed to unmap LEBs.

But there is an interesting connection between volume creation and deletion in UBI.
When you remove a volume all LEBs get unmapped and erased in async manner.
Next you create a volume with the same volume id and face a power cut.
Then there would be the case that UBI finds old LEBs which have not been erased and
will assign them wrongly to the new volume.
To mediate this issue UBI will do a ubi_wl_flush() at volume creation time.

That said, I'm going to review more UBI management code, maybe there are more issues
hidden.

Thanks,
//richard

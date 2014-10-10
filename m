Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XchRr-0002B4-7I
 for linux-mtd@lists.infradead.org; Fri, 10 Oct 2014 21:10:04 +0000
Message-ID: <54384B11.6080209@nod.at>
Date: Fri, 10 Oct 2014 23:09:37 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Andrew Murray <amurray@embedded-bits.co.uk>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: UBI_READWRITE constraint when opening volumes to rename
References: <CAPcvp5E=MgV0-f8q9SFuMCzCEt-WVQiEu4XGJXj2QLyf5L1ohw@mail.gmail.com>	<20141009102546.GA2755@arch.hh.imgtec.org>
 <CAPcvp5FammqUr67rv_LvqWPoPegLsPMLBTT-mkQ2u=VCs2-_8g@mail.gmail.com>
In-Reply-To: <CAPcvp5FammqUr67rv_LvqWPoPegLsPMLBTT-mkQ2u=VCs2-_8g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

Am 09.10.2014 um 13:03 schrieb Andrew Murray:
> Hi Ezequiel,
> 
> On 9 October 2014 11:25, Ezequiel Garcia
> <ezequiel.garcia@free-electrons.com> wrote:
>> On 07 Oct 03:31 PM, Andrew Murray wrote:
>>> Hello,
>>>
>>> I'd like to be able to safely rename a UBI volume that contains a
>>> mounted UBIFS volume.
>>>
>>> This allows for firmware upgrade via the following steps:
>>>
>>> - ubimkvol rootfs_new
>>> - ubiupdatevol rootfs_new
>>> - ubirename rootfs rootfs_old rootfs_new rootfs
>>> - reboot
>>> - ubirmvol rootfs_old
>>>
>>> Such an approach makes upgrade of a root filesystem simple as there is
>>> no need to unmount the root filesystem. I believe this question has
>>> been asked before on this mailing list
>>> (http://lists.infradead.org/pipermail/linux-mtd/2012-February/039743.html).
>>>
>>> This process isn't possible at the moment as 'rename_volumes' opens
>>> the UBI volume with UBI_READWRITE. Unfortunately UBIFS always opens
>>> UBI with UBI_READWRITE regardless to if the user mounts as read-only.
>>
>> How about making UBIFS honour the read-only mount flag?
> 
> Thanks for the suggestion, I didn't consider this as I assumed there
> was a good reason for it being UBI_READWRITE - though it appears as
> though it's always been UBI_READWRITE since the initial
> implementation.
> 
>>
>> A quick look to fs/ubifs/io.c shows that UBIFS will show an error message
>> if a LEB erase/write operation is attempted on a read-only mounted or
>> read-only media. So, hopefully, this is reasonable (the patch is completely
>> untested!):
> 
> Is there any reason why UBIFS would need to write to UBI when the user
> mounts UBIFS as R/O? I know that scrubbing can occur in the UBI layer
> - will this still occur if the volume is opened as UBI_READONLY?
> 
>>
>> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
>> index 106bf20..ce445ce 100644
>> --- a/fs/ubifs/super.c
>> +++ b/fs/ubifs/super.c
>> @@ -1998,11 +1998,16 @@ static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
>>  {
>>         struct ubifs_info *c = sb->s_fs_info;
>>         struct inode *root;
>> -       int err;
>> +       int err, mode;
>> +
>> +       /*
>> +        * Re-open the UBI device in read-write mode, or keep it read-only if
>> +        * explicitly requested.
>> +        */
>> +       mode = (sb->s_flags & MS_RDONLY) ? UBI_READONLY : UBI_READWRITE;
>>
>>         c->vfs_sb = sb;
>> -       /* Re-open the UBI device in read-write mode */
>> -       c->ubi = ubi_open_volume(c->vi.ubi_num, c->vi.vol_id, UBI_READWRITE);
>> +       c->ubi = ubi_open_volume(c->vi.ubi_num, c->vi.vol_id, mode);
>>         if (IS_ERR(c->ubi)) {
>>                 err = PTR_ERR(c->ubi);
>>                 goto out;
>>
> 
> I will try this later and get back to you - this seems like the right fix.

As discussed with Ezequiel on IRC the right thing is to fix the UBI rename logic.

> To satisfy my curiosity - does the UBI rename function really need to
> open the UBI volume as UBI_READWRITE to rename? Does it matter that a
> UBIFS fileystem may be writing UBI whilst a UBI rename occurs - I've
> assumed that UBIFS doesn't ever read/write the volume label - so it
> doesn't matter if it changes beneath it? (I'm not too familiar with
> UBI/UBIFS internals).

Correct. Renaming a volume does not alter nor read volume data.
Only the UBI volume table is altered.
This is why I've cooked up the following patch.
Please give it some testing!

Thanks,
//richard

diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index 7646220..4c4c455 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -731,7 +731,7 @@ static int rename_volumes(struct ubi_device *ubi,
 			goto out_free;
 		}

-		re->desc = ubi_open_volume(ubi->ubi_num, vol_id, UBI_READWRITE);
+		re->desc = ubi_open_volume(ubi->ubi_num, vol_id, UBI_METAONLY);
 		if (IS_ERR(re->desc)) {
 			err = PTR_ERR(re->desc);
 			ubi_err("cannot open volume %d, error %d", vol_id, err);
diff --git a/drivers/mtd/ubi/kapi.c b/drivers/mtd/ubi/kapi.c
index 3aac1ac..cfc49cd 100644
--- a/drivers/mtd/ubi/kapi.c
+++ b/drivers/mtd/ubi/kapi.c
@@ -137,7 +137,7 @@ struct ubi_volume_desc *ubi_open_volume(int ubi_num, int vol_id, int mode)
 		return ERR_PTR(-EINVAL);

 	if (mode != UBI_READONLY && mode != UBI_READWRITE &&
-	    mode != UBI_EXCLUSIVE)
+	    mode != UBI_EXCLUSIVE && mode != UBI_METAONLY)
 		return ERR_PTR(-EINVAL);

 	/*
@@ -186,6 +186,10 @@ struct ubi_volume_desc *ubi_open_volume(int ubi_num, int vol_id, int mode)
 			goto out_unlock;
 		vol->exclusive = 1;
 		break;
+	case UBI_METAONLY:
+		if (vol->metaonly)
+			goto out_unlock;
+		vol->metaonly = 1;
 	}
 	get_device(&vol->dev);
 	vol->ref_count += 1;
@@ -343,6 +347,8 @@ void ubi_close_volume(struct ubi_volume_desc *desc)
 		break;
 	case UBI_EXCLUSIVE:
 		vol->exclusive = 0;
+	case UBI_METAONLY:
+		vol->metaonly = 0;
 	}
 	vol->ref_count -= 1;
 	spin_unlock(&ubi->volumes_lock);
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 7bf4163..629973f 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -260,6 +260,7 @@ struct ubi_fm_pool {
  * @readers: number of users holding this volume in read-only mode
  * @writers: number of users holding this volume in read-write mode
  * @exclusive: whether somebody holds this volume in exclusive mode
+ * @metaonly: whether somebody is altering only meta data of this volume
  *
  * @reserved_pebs: how many physical eraseblocks are reserved for this volume
  * @vol_type: volume type (%UBI_DYNAMIC_VOLUME or %UBI_STATIC_VOLUME)
@@ -308,6 +309,7 @@ struct ubi_volume {
 	int readers;
 	int writers;
 	int exclusive;
+	int metaonly;

 	int reserved_pebs;
 	int vol_type;
@@ -389,7 +391,8 @@ struct ubi_debug_info {
  * @volumes_lock: protects @volumes, @rsvd_pebs, @avail_pebs, beb_rsvd_pebs,
  *                @beb_rsvd_level, @bad_peb_count, @good_peb_count, @vol_count,
  *                @vol->readers, @vol->writers, @vol->exclusive,
- *                @vol->ref_count, @vol->mapping and @vol->eba_tbl.
+ *                @vol->metaonly, @vol->ref_count, @vol->mapping and
+ *                @vol->eba_tbl.
  * @ref_count: count of references on the UBI device
  * @image_seq: image sequence number recorded on EC headers
  *
diff --git a/include/linux/mtd/ubi.h b/include/linux/mtd/ubi.h
index c3918a0..262aae1 100644
--- a/include/linux/mtd/ubi.h
+++ b/include/linux/mtd/ubi.h
@@ -34,11 +34,13 @@
  * UBI_READONLY: read-only mode
  * UBI_READWRITE: read-write mode
  * UBI_EXCLUSIVE: exclusive mode
+ * UBI_METAONLY: modify voume meta data only
  */
 enum {
 	UBI_READONLY = 1,
 	UBI_READWRITE,
-	UBI_EXCLUSIVE
+	UBI_EXCLUSIVE,
+	UBI_METAONLY
 };

 /**

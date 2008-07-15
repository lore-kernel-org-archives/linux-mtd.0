Received: from mail.slimdevices.com ([67.155.107.5])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KIiH2-0006Ez-IL
	for linux-mtd@lists.infradead.org; Tue, 15 Jul 2008 11:00:49 +0000
Message-ID: <487C8357.7050307@logitech.com>
Date: Tue, 15 Jul 2008 12:00:39 +0100
From: Richard Titmuss <richard_titmuss@logitech.com>
MIME-Version: 1.0
To: dedekind@infradead.org
Subject: Re: [RFC] UBI volume re-name
References: <1216029951.29469.7.camel@sauron>
In-Reply-To: <1216029951.29469.7.camel@sauron>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

That's excellent, and exactly the functionality I need. I have also 
started a patch to add -N support to ubinfo, ubirmvol and ubiupdatevol. 
I've got a little distracted with another couple of projects right now, 
but hope to return to looking at UBI again next week.

Thanks,
Richard



Artem Bityutskiy wrote:
> Hi,
>
> here is implementation of the volume re-name ioctl suggested
> by Richard Titmuss. I think it was quite nice idea which allows
> users to upgrade UBI volumes atomically:
>
> 1. Suppose we want to update volumes A and B atomically.
> 2. Create temporary volumes A1 and B1
> 3. Put new contents to volumes A1 and B1
> 4. Atomically rename A1->A and A->A1, B1->B and B->B1.
> 5. Now A and B have new contents
> 6. Remove A1 and B1.
>
> Of course volume id of A1 and B1 would change, but if the
> volumes are only referred by name, then it'll be fine.
>
> >From b285d9230c753890e9f57c43174559e4d1122c11 Mon Sep 17 00:00:00 2001
> From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Date: Sun, 13 Jul 2008 21:47:47 +0300
> Subject: [PATCH] UBI: implement multiple volumes rename
>
> Quite useful ioctl which allows to make atomic system upgrades.
> The idea belongs to Richard Titmuss <richard_titmuss@logitech.com>
>
> Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> ---
>  drivers/mtd/ubi/cdev.c |   95 ++++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/mtd/ubi/ubi.h  |    5 ++-
>  drivers/mtd/ubi/vmt.c  |   30 +++++++++++++++
>  drivers/mtd/ubi/vtbl.c |   46 +++++++++++++++++++++++
>  include/mtd/ubi-user.h |   42 +++++++++++++++++++++
>  5 files changed, 217 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
> index 333c98e..b29c362 100644
> --- a/drivers/mtd/ubi/cdev.c
> +++ b/drivers/mtd/ubi/cdev.c
> @@ -599,6 +599,75 @@ static int verify_rsvol_req(const struct ubi_device *ubi,
>  	return 0;
>  }
>  
> +/**
> + * rename_volumes - rename UBI volumes.
> + * @ubi: UBI device description object
> + * @req: volumes re-name request
> + *
> + * This is a helper function for the volume re-name IOCTL which validates the
> + * the request, opens the volume and calls corresponding volumes management
> + * function. Returns zero in case of success and a negative error code in case
> + * of failure.
> + */
> +static int rename_volumes(struct ubi_device *ubi,
> +			  struct ubi_rnvol_req *req)
> +{
> +	int i, n, err;
> +	struct ubi_volume_desc *desc[UBI_MAX_RNVOL];
> +
> +	if (req->count < 0 || req->count > UBI_MAX_RNVOL)
> +		return -EINVAL;
> +
> +	/* Validate volume IDs and names in the request */
> +	for (i = 0; i < req->count; i++) {
> +		if (req->vols[i].vol_id < 0 ||
> +		    req->vols[i].vol_id >= ubi->vtbl_slots)
> +			return -EINVAL;
> +		if (req->vols[i].name_len < 0)
> +			return -EINVAL;
> +		if (req->vols[i].name_len > UBI_VOL_NAME_MAX)
> +			return -ENAMETOOLONG;
> +		req->vols[i].name[req->vols[i].name_len] = '\0';
> +		n = strlen(req->vols[i].name);
> +		if (n != req->vols[i].name_len)
> +			err = -EINVAL;
> +	}
> +
> +	/* Make sure volume IDs and names are unique */
> +	for (i = 0; i < req->count - 1; i++) {
> +		for (n = i + 1; n < req->count; n++) {
> +			if (req->vols[i].vol_id == req->vols[n].vol_id) {
> +				dbg_err("duplicated volume id %d",
> +					req->vols[i].vol_id);
> +				return -EINVAL;
> +			}
> +			if (!strcmp(req->vols[i].name, req->vols[n].name)) {
> +				dbg_err("duplicated volume name %s",
> +					req->vols[i].name);
> +				return -EINVAL;
> +			}
> +		}
> +	}
> +
> +	/* Open all involeved volumes in exclusive mode */
> +	for (i = 0; i < req->count; i++) {
> +		desc[i] = ubi_open_volume(ubi->ubi_num, req->vols[i].vol_id,
> +					  UBI_EXCLUSIVE);
> +		if (IS_ERR(desc[i])) {
> +			err = PTR_ERR(desc[i]);
> +			goto out;
> +		}
> +	}
> +
> +	i = req->count;
> +	err = ubi_rename_volumes(ubi, req);
> +
> +out:
> +	for (n = 0; n < i; n++)
> +		ubi_close_volume(desc[n]);
> +	return err;
> +}
> +
>  static int ubi_cdev_ioctl(struct inode *inode, struct file *file,
>  			  unsigned int cmd, unsigned long arg)
>  {
> @@ -711,6 +780,32 @@ static int ubi_cdev_ioctl(struct inode *inode, struct file *file,
>  		break;
>  	}
>  
> +	/* Re-name volumes command */
> +	case UBI_IOCRNVOL:
> +	{
> +		struct ubi_rnvol_req *req;
> +
> +		dbg_msg("re-name volumes");
> +		req = kmalloc(sizeof(struct ubi_rnvol_req), GFP_KERNEL);
> +		if (!req) {
> +			err = -ENOMEM;
> +			break;
> +		};
> +
> +		err = copy_from_user(req, argp, sizeof(struct ubi_rnvol_req));
> +		if (err) {
> +			err = -EFAULT;
> +			kfree(req);
> +			break;
> +		}
> +
> +		mutex_lock(&ubi->volumes_mutex);
> +		err = rename_volumes(ubi, req);
> +		mutex_unlock(&ubi->volumes_mutex);
> +		kfree(req);
> +		break;
> +	}
> +
>  	default:
>  		err = -ENOTTY;
>  		break;
> diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
> index 940f6b7..e41f508 100644
> --- a/drivers/mtd/ubi/ubi.h
> +++ b/drivers/mtd/ubi/ubi.h
> @@ -273,7 +273,7 @@ struct ubi_wl_entry;
>   * @vtbl_size: size of the volume table in bytes
>   * @vtbl: in-RAM volume table copy
>   * @volumes_mutex: protects on-flash volume table and serializes volume
> - *                 changes, like creation, deletion, update, resize
> + *                 changes, like creation, deletion, update, re-size and re-name
>   *
>   * @max_ec: current highest erase counter value
>   * @mean_ec: current mean erase counter value
> @@ -427,12 +427,15 @@ extern struct mutex ubi_devices_mutex;
>  /* vtbl.c */
>  int ubi_change_vtbl_record(struct ubi_device *ubi, int idx,
>  			   struct ubi_vtbl_record *vtbl_rec);
> +int ubi_vtbl_rename_volumes(struct ubi_device *ubi,
> +			    const struct ubi_rnvol_req *req);
>  int ubi_read_volume_table(struct ubi_device *ubi, struct ubi_scan_info *si);
>  
>  /* vmt.c */
>  int ubi_create_volume(struct ubi_device *ubi, struct ubi_mkvol_req *req);
>  int ubi_remove_volume(struct ubi_volume_desc *desc);
>  int ubi_resize_volume(struct ubi_volume_desc *desc, int reserved_pebs);
> +int ubi_rename_volumes(struct ubi_device *ubi, const struct ubi_rnvol_req *req);
>  int ubi_add_volume(struct ubi_device *ubi, struct ubi_volume *vol);
>  void ubi_free_volume(struct ubi_device *ubi, struct ubi_volume *vol);
>  
> diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
> index bfa7c5d..03a6042 100644
> --- a/drivers/mtd/ubi/vmt.c
> +++ b/drivers/mtd/ubi/vmt.c
> @@ -602,6 +602,36 @@ out_free:
>  }
>  
>  /**
> + * ubi_vtbl_rename_volumes - re-name UBI volumes.
> + * @req: volumes re-name request
> + *
> + * This function re-names multiple volumes specified in @req. Returns zero in
> + * case of success and a negative error code in case of failure.
> + */
> +int ubi_rename_volumes(struct ubi_device *ubi, const struct ubi_rnvol_req *req)
> +{
> +	int i, err;
> +
> +	err = ubi_vtbl_rename_volumes(ubi, req);
> +	if (err)
> +		return err;
> +
> +	spin_lock(&ubi->volumes_lock);
> +	for (i = 0; i < req->count; i++) {
> +		int vol_id = req->vols[i].vol_id;
> +		int name_len = req->vols[i].name_len;
> +		const char *name = req->vols[i].name;
> +		struct ubi_volume *vol = ubi->volumes[vol_id];
> +
> +		vol->name_len = name_len;
> +		memcpy(vol->name, name, name_len + 1);
> +	}
> +	spin_unlock(&ubi->volumes_lock);
> +
> +	return 0;
> +}
> +
> +/**
>   * ubi_add_volume - add volume.
>   * @ubi: UBI device description object
>   * @vol: volume description object
> diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
> index d9af11a..8629574 100644
> --- a/drivers/mtd/ubi/vtbl.c
> +++ b/drivers/mtd/ubi/vtbl.c
> @@ -115,6 +115,52 @@ int ubi_change_vtbl_record(struct ubi_device *ubi, int idx,
>  }
>  
>  /**
> + * ubi_vtbl_rename_volumes - rename UBI volumes in the volume table.
> + * @ubi: UBI device description object
> + * @req: volumes re-name request
> + *
> + * This function re-names multiple volumes specified in @req in the volume
> + * table. Returns zero in case of success and a negative error code in case of
> + * failure.
> + */
> +int ubi_vtbl_rename_volumes(struct ubi_device *ubi,
> +			    const struct ubi_rnvol_req *req)
> +{
> +	int i, err;
> +	struct ubi_volume *layout_vol;
> +
> +	for (i = 0; i < req->count; i++) {
> +		uint32_t crc;
> +		int vol_id = req->vols[i].vol_id;
> +		int name_len = req->vols[i].name_len;
> +		const char *name = req->vols[i].name;
> +		struct ubi_vtbl_record *vtbl_rec = &ubi->vtbl[vol_id];
> +
> +		vtbl_rec->name_len = cpu_to_be16(name_len);
> +		memset(vtbl_rec->name, 0, UBI_VOL_NAME_MAX + 1);
> +		memcpy(vtbl_rec->name, name, name_len);
> +		crc = crc32(UBI_CRC32_INIT, vtbl_rec,
> +			    UBI_VTBL_RECORD_SIZE_CRC);
> +		vtbl_rec->crc = cpu_to_be32(crc);
> +	}
> +
> +	layout_vol = ubi->volumes[vol_id2idx(ubi, UBI_LAYOUT_VOLUME_ID)];
> +	for (i = 0; i < UBI_LAYOUT_VOLUME_EBS; i++) {
> +		err = ubi_eba_unmap_leb(ubi, layout_vol, i);
> +		if (err)
> +			return err;
> +
> +		err = ubi_eba_write_leb(ubi, layout_vol, i, ubi->vtbl, 0,
> +					ubi->vtbl_size, UBI_LONGTERM);
> +		if (err)
> +			return err;
> +	}
> +
> +	return 0;
> +}
> +
> +
> +/**
>   * vtbl_check - check if volume table is not corrupted and contains sensible
>   *              data.
>   * @ubi: UBI device description object
> diff --git a/include/mtd/ubi-user.h b/include/mtd/ubi-user.h
> index a7421f1..bd93b57 100644
> --- a/include/mtd/ubi-user.h
> +++ b/include/mtd/ubi-user.h
> @@ -58,6 +58,13 @@
>   * device should be used. A &struct ubi_rsvol_req object has to be properly
>   * filled and a pointer to it has to be passed to the IOCTL.
>   *
> + * UBI volumes re-name
> + * ~~~~~~~~~~~~~~~~~~~
> + *
> + * To rename several volumes atomically at one go, the %UBI_IOCRNVOL command
> + * of the UBI character device should be used. A &struct ubi_rnvol_req object
> + * has to be properly filled and a pointer to it has to be passed to the IOCTL.
> + *
>   * UBI volume update
>   * ~~~~~~~~~~~~~~~~~
>   *
> @@ -104,6 +111,8 @@
>  #define UBI_IOCRMVOL _IOW(UBI_IOC_MAGIC, 1, int32_t)
>  /* Re-size an UBI volume */
>  #define UBI_IOCRSVOL _IOW(UBI_IOC_MAGIC, 2, struct ubi_rsvol_req)
> +/* Re-name volumes */
> +#define UBI_IOCRNVOL _IOW(UBI_IOC_MAGIC, 3, struct ubi_rnvol_req)
>  
>  /* IOCTL commands of the UBI control character device */
>  
> @@ -128,6 +137,9 @@
>  /* Maximum MTD device name length supported by UBI */
>  #define MAX_UBI_MTD_NAME_LEN 127
>  
> +/* Maximum amount of UBI volumes that can be renamed at one go */
> +#define UBI_MAX_RNVOL 32
> +
>  /*
>   * UBI data type hint constants.
>   *
> @@ -251,6 +263,36 @@ struct ubi_rsvol_req {
>  } __attribute__ ((packed));
>  
>  /**
> + * struct ubi_rnvol_req - volumes rename request.
> + * @count: count of volumes to rename
> + * @padding1:  reserved for future, not used, has to be zeroed
> + * @vol_id: ID of the volume to rename
> + * @name_len: name length
> + * @padding2:  reserved for future, not used, has to be zeroed
> + * @name: new volume name
> + *
> + * UBI allows to rename up to %32 volumes at one go. The count of volumes to
> + * rename is specified in the @count field. The ID of the volumes to rename
> + * and the new names are specified in the @vol_id and @name fields.
> + *
> + * The UBI volume rename operation is atomic, which means that should power cut
> + * happen, the volumes will have either old name or new name. So the possible
> + * use-cases of this command is atomic upgrade. Indeed, to upgrade, say, volumes
> + * A and B one may create temporary volumes A1 and B1 with the new contents,
> + * then atomically rename A1->A and A->A1, B1->B and B->B1.
> + */
> +struct ubi_rnvol_req {
> +	int32_t count;
> +	uint8_t padding1[12];
> +	struct {
> +		int32_t vol_id;
> +		int16_t name_len;
> +		uint8_t padding2[2];
> +		char name[UBI_MAX_VOLUME_NAME + 1];
> +	} vols[UBI_MAX_RNVOL];
> +} __attribute__ ((packed));
> +
> +/**
>   * struct ubi_leb_change_req - a data structure used in atomic logical
>   *                             eraseblock change requests.
>   * @lnum: logical eraseblock number to change
>   

Received: from mail-qy0-f179.google.com ([209.85.221.179])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MIhTe-0002cb-DY
	for linux-mtd@lists.infradead.org; Mon, 22 Jun 2009 11:14:24 +0000
Received: by qyk9 with SMTP id 9so1384208qyk.28
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Jun 2009 04:14:16 -0700 (PDT)
MIME-Version: 1.0
Sender: brijesh.s.singh@gmail.com
In-Reply-To: <1245656068.9487.31.camel@localhost.localdomain>
References: <6b5362aa0906190401l51bcf28bg44b9a7a9f49aa773@mail.gmail.com>
	<1245655796.9487.29.camel@localhost.localdomain>
	<1245656068.9487.31.camel@localhost.localdomain>
Date: Mon, 22 Jun 2009 16:44:16 +0530
Message-ID: <6b5362aa0906220414s7b79011akd181adbedb322ea7@mail.gmail.com>
Subject: Re: [PATCH] [UBI] Volume table update fix
From: Brijesh Singh <brij.singh@samsung.com>
To: dedekind@infradead.org
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable
Cc: brijesh.s.singh@gmail.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,
    Thanks for the comments.Sending the cleaned up patch.

    This patch fixes the consistency problem during volume update.
UBI writes two copies of vtbl during volume update. If the first  copy  was
successfully written, and second copy fails, UBI returns failure. But UBI
recovers updated vtbl during next mount. So it should have returned success=
.
It should go to read only mode to avoid further failures.

Signed-off-by: Brijesh Singh <brij.singh@samsung.com>
---
diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index 1afc61e..77659d4 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -84,7 +84,7 @@ static struct ubi_vtbl_record empty_vtbl_record;
 int ubi_change_vtbl_record(struct ubi_device *ubi, int idx,
 			   struct ubi_vtbl_record *vtbl_rec)
 {
-	int i, err;
+	int copy, err, err1;
 	uint32_t crc;
 	struct ubi_volume *layout_vol;

@@ -99,19 +99,35 @@ int ubi_change_vtbl_record(struct ubi_device *ubi, int =
idx,
 	}

 	memcpy(&ubi->vtbl[idx], vtbl_rec, sizeof(struct ubi_vtbl_record));
-	for (i =3D 0; i < UBI_LAYOUT_VOLUME_EBS; i++) {
-		err =3D ubi_eba_unmap_leb(ubi, layout_vol, i);
+	for (copy =3D 0; copy < UBI_LAYOUT_VOLUME_EBS; copy++) {
+		err =3D ubi_eba_unmap_leb(ubi, layout_vol, copy);
 		if (err)
-			return err;
+			goto out_error;

-		err =3D ubi_eba_write_leb(ubi, layout_vol, i, ubi->vtbl, 0,
+		err =3D ubi_eba_write_leb(ubi, layout_vol, copy, ubi->vtbl, 0,
 					ubi->vtbl_size, UBI_LONGTERM);
 		if (err)
-			return err;
+			goto out_error;
 	}

 	paranoid_vtbl_check(ubi);
 	return 0;
+
+out_error:
+	ubi_err("error writing volume table copy #%d", copy+1);
+	err1 =3D ubi_eba_unmap_leb(ubi, layout_vol, copy);
+	if (!err1)
+		ubi_wl_flush(ubi);
+
+	/* Only one valid copy of vtbl left, go to read only mode for safty. */
+	ubi_ro_mode(ubi);
+
+	/*
+	 * If first copy was written successfully, this copy will be recovered
+	 * during next mount. So vtbl updation should be successful.
+	 * But if first copy itself was not written, volume update should fail.
+	 */
+	return copy ? 0 : err;
 }

 /**


On Mon, Jun 22, 2009 at 1:04 PM, Artem Bityutskiy<dedekind@infradead.org> w=
rote:
> On Mon, 2009-06-22 at 10:29 +0300, Artem Bityutskiy wrote:
>> > + =9A if (copy > 0)
>> > + =9A =9A =9A =9A =9A return 0;
>> > + =9A else
>> > + =9A =9A =9A =9A =9A return err;
>> This is a tricky place, IMO, and deserves a comment. Could we have
>> something like:
>>
>> /*
>> =9A* If the first volume table copy has been changed then overall the
>> =9A* operation has succeeded, because the change would be there if we no=
w
>> =9A* re-attached the UBI device. Thus, return success in this case.
>> =9A*/
>>
> This looks a bit more elegant:
>
> /*
> =9A* If the first volume table copy has been changed then overall the
> =9A* operation has succeeded, because the change would be there if we now
> =9A* re-attached the UBI device. Thus, return success in this case.
> =9A*/
> return copy ? 0 : err;
>
> --
> Best regards,
> Artem Bityutskiy (=E2=C9=D4=C0=C3=CB=C9=CA =E1=D2=D4=A3=CD)
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>

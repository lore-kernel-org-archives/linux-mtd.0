Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZN6ki-0003Xq-3R
 for linux-mtd@lists.infradead.org; Wed, 05 Aug 2015 22:01:36 +0000
Subject: Re: ubi_wl_get_peb: Unable to get a free PEB from user WL pool
To: =?UTF-8?Q?J=c3=b6rg_Krause?= <joerg.krause@embedded.rocks>,
 linux-mtd@lists.infradead.org
References: <1438809724.6328.18.camel@embedded.rocks>
 <55C28070.2000804@nod.at> <1438810690.6328.26.camel@embedded.rocks>
 <55C2840B.5000709@nod.at> <1438811611.6328.32.camel@embedded.rocks>
From: Richard Weinberger <richard@nod.at>
Message-ID: <55C287A9.8000006@nod.at>
Date: Thu, 6 Aug 2015 00:01:13 +0200
MIME-Version: 1.0
In-Reply-To: <1438811611.6328.32.camel@embedded.rocks>
Content-Type: multipart/mixed; boundary="------------020605020604000601030805"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------020605020604000601030805
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Am 05.08.2015 um 23:53 schrieb Jörg Krause:
> On Mi, 2015-08-05 at 23:45 +0200, Richard Weinberger wrote:
>> Jörg,
>>
>> Am 05.08.2015 um 23:38 schrieb Jörg Krause:
>>> On Mi, 2015-08-05 at 23:30 +0200, Richard Weinberger wrote:
> 
> [snip]
> 
>>>
>>> I attached the kernel boot log.
>>
>> Thanks.
>> That's a really small UBI setup.
>> [    3.202421] ubi1: default fastmap pool size: 10
>> [    3.207174] ubi1: default fastmap WL pool size: 5
> 
> What do you exactly mean by small UBI setup? The fastmap pool size? The
> UBI layout?

The UBI image it self. Your MTD is very small.
But it should not matter.

> [snip]
> 
>>>
>>> It is enabled in the kernel config. Not sure how to use it.
>>
>> Then just disable it. :)
> 
> I did :) I thought fastmap is used automatically by the UBI driver?

It will *use* fastmap automatically but not convert non-fastmap UBI images
to fastmap.
You can enable ubi.fm_autoconvert to do so.

>> Meanwhile I'll find out what exactly is going on.
> 
> Many thanks!

Can you please apply the attached debug patch?
I wonder why exactly the auto resize function is failing.

Thanks,
//richard

--------------020605020604000601030805
Content-Type: text/x-patch;
 name="debug.diff"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="debug.diff"

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 22fd19c..89aa7ac9 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -820,8 +820,8 @@ static int autoresize(struct ubi_device *ubi, int vol=
_id)
 		err =3D ubi_resize_volume(&desc,
 					old_reserved_pebs + ubi->avail_pebs);
 		if (err)
-			ubi_err(ubi, "cannot auto-resize volume %d",
-				vol_id);
+			ubi_err(ubi, "cannot auto-resize volume %d: %d",
+				vol_id, err);
 	}
=20
 	if (err)
diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
index 1ae17bb..7be6fa3 100644
--- a/drivers/mtd/ubi/vmt.c
+++ b/drivers/mtd/ubi/vmt.c
@@ -498,8 +498,10 @@ int ubi_resize_volume(struct ubi_volume_desc *desc, =
int reserved_pebs)
 	if (pebs < 0) {
 		for (i =3D 0; i < -pebs; i++) {
 			err =3D ubi_eba_unmap_leb(ubi, vol, reserved_pebs + i);
-			if (err)
+			if (err) {
+				ubi_err(ubi, "unable to unmap LEB");
 				goto out_acc;
+			}
 		}
 		spin_lock(&ubi->volumes_lock);
 		ubi->rsvd_pebs +=3D pebs;

--------------020605020604000601030805--

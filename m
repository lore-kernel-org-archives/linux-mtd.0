Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZNFdu-0008FQ-Ly
 for linux-mtd@lists.infradead.org; Thu, 06 Aug 2015 07:31:12 +0000
Subject: Re: ubi_wl_get_peb: Unable to get a free PEB from user WL pool
To: =?UTF-8?Q?J=c3=b6rg_Krause?= <joerg.krause@embedded.rocks>,
 linux-mtd@lists.infradead.org
References: <1438809724.6328.18.camel@embedded.rocks>
 <55C28070.2000804@nod.at> <1438810690.6328.26.camel@embedded.rocks>
 <55C2840B.5000709@nod.at> <1438811611.6328.32.camel@embedded.rocks>
 <55C287A9.8000006@nod.at> <1438813074.6328.35.camel@embedded.rocks>
From: Richard Weinberger <richard@nod.at>
Message-ID: <55C30D24.1010504@nod.at>
Date: Thu, 6 Aug 2015 09:30:44 +0200
MIME-Version: 1.0
In-Reply-To: <1438813074.6328.35.camel@embedded.rocks>
Content-Type: multipart/mixed; boundary="------------000607060206080603090900"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------000607060206080603090900
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Jörg,

Am 06.08.2015 um 00:17 schrieb Jörg Krause:
>>>> Then just disable it. :)
>>>
>>> I did :) I thought fastmap is used automatically by the UBI driver?
>>
>> It will *use* fastmap automatically but not convert non-fastmap UBI 
>> images
>> to fastmap.
>> You can enable ubi.fm_autoconvert to do so.
> 
> Sorry for asking, but how do I create an UBI image with fastmap
> support? I've never read something about this.

You have to use the ubi.fm_autoconvert parameter. The UBI will automatically
write down a fastmap if needed.

Currently it is not possible to create a fastmap-enabled UBI image
using ubinize.
The reason is that fastmap stores the LEB->PEB mappings to allow
a fast attach. ubinize cannot know which PEBs are bad.
So, we'd need a tool which creates the fastmap while flashing to the nand.

>>>> Meanwhile I'll find out what exactly is going on.
>>>
>>> Many thanks!
>>
>> Can you please apply the attached debug patch?
>> I wonder why exactly the auto resize function is failing.
> 
> autoresize: cannot auto-resize volume 0: -28

I have good and bad news.
The good news is that I know what is going on, the bad one
is that I don't have an good solution for it.

UBI is requesting a new PEB but your system is still busy with
erasing them. With fastmap disabled UBI can use produce_free_peb()
and wait for a new erased PEB.
But fastmap cannot use this helper as it releases ->wl_lock
and would lead to a inconsistent fastmap state.
Kernels < 4.1 did so and faced interesting fastmap corruptions.
I hoped using the current retry logic the issue you're facing cannot
happen. But as it seems I was wrong.

Can you please give the attached patch a try?

Thanks,
//richard

--------------000607060206080603090900
Content-Type: text/x-patch;
 name="dirty_hack.diff"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="dirty_hack.diff"

diff --git a/drivers/mtd/ubi/fastmap-wl.c b/drivers/mtd/ubi/fastmap-wl.c
index b2a6653..e47974d 100644
--- a/drivers/mtd/ubi/fastmap-wl.c
+++ b/drivers/mtd/ubi/fastmap-wl.c
@@ -206,12 +206,12 @@ again:
=20
 	if (pool->used =3D=3D pool->size) {
 		spin_unlock(&ubi->wl_lock);
-		if (retried) {
+		if (retried > 5) {
 			ubi_err(ubi, "Unable to get a free PEB from user WL pool");
 			ret =3D -ENOSPC;
 			goto out;
 		}
-		retried =3D 1;
+		retried++;
 		up_read(&ubi->fm_eba_sem);
 		goto again;
 	}

--------------000607060206080603090900--

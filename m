Received: from mail-fx0-f226.google.com ([209.85.220.226])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MghOB-0002tR-W7
	for linux-mtd@lists.infradead.org; Thu, 27 Aug 2009 15:59:56 +0000
Received: by fxm26 with SMTP id 26so1077215fxm.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 27 Aug 2009 08:59:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090826175503.GC25726@shareable.org>
References: <62cbdcd90908260842l66275d12na133bdb7cc4ac14@mail.gmail.com>
	<20090826175503.GC25726@shareable.org>
Date: Thu, 27 Aug 2009 17:59:49 +0200
Message-ID: <62cbdcd90908270859t65ca7c3bs67cbbfa07b2c65a6@mail.gmail.com>
Subject: Re: [PATCH] [MTD] CHIPS: 0xFF intolerance for M29W128G
From: massimo cirillo <maxcir@gmail.com>
To: Jamie Lokier <jamie@shareable.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: augulis.darius@gmail.com, linux-mtd@lists.infradead.org,
	RichardRetanubun@ruggedcom.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2009/8/26 Jamie Lokier <jamie@shareable.org>:
> massimo cirillo wrote:
>> From: Massimo Cirillo <maxcir@gmail.com>
>>
>> The M29W128G Numonyx flash devices are intolerant to any 0xFF command:
>> in the Cfi_util.c the function cfi_qry_mode_off() (that resets the devic=
e
>> after the autoselect mode) must have a 0xF0 command after the 0xFF comma=
nd.
>> Intel-like devices are not influenced by a 0xF0 command.
>> This fix solves also the cause of the fixup_M29W128G_write_buffer() fix,
>> that can be commented out now.
>> The following patch applies to 2.6.30 kernel.
>
> This change was discussed 1 year ago:
>
> =A0 http://lists.infradead.org/pipermail/linux-mtd/2008-August/022497.htm=
l
>
> The conclusion was that 0xf0 after 0xff might not be safe for some
> chips ("early revisions of L30"), but nobody could confirm which
> chips, so Alexey Korolov suggested staying safe and using fixup
> functions.
>
> I'm inclined to think a per-manufacturer (ignoring chip-id) reset
> function would be better than the attempt to poke several different
> commands at a chip all mixed together in a careful order, knowing that
> some commands break some chips but later commands fix them again.
>
> -- Jamie
>

Jamie,
I've rewritten the patch: now only the function cfi_qry_mode_off()
has been patched, and only if the device is a M29W128G (16bit or 8bit)
a final 0xF0 is given. The fixup_M29W128G_write_buffer() keeps on being
removed, because the buffer write failure derived from the unstable
state due to the missing 0xF0 command.
Please give comments about this new version.

Signed-off-by: Massimo Cirillo <maxcir@gmail.com>
---
diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c
b/drivers/mtd/chips/cfi_cmdset_0002.c
old mode 100644
new mode 100755
index 61ea833..86cc313
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -308,7 +308,7 @@ static struct cfi_fixup cfi_fixup_table[] =3D {
 	{ CFI_MFR_AMD, 0x1301, fixup_s29gl064n_sectors, NULL, },
 	{ CFI_MFR_AMD, 0x1a00, fixup_s29gl032n_sectors, NULL, },
 	{ CFI_MFR_AMD, 0x1a01, fixup_s29gl032n_sectors, NULL, },
-	{ CFI_MFR_ST,  0x227E, fixup_M29W128G_write_buffer, NULL, },
+	/* { CFI_MFR_ST,  0x227E, fixup_M29W128G_write_buffer, NULL, }, */
 #if !FORCE_WORD_WRITE
 	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_use_write_buffers, NULL, },
 #endif
diff --git a/drivers/mtd/chips/cfi_util.c b/drivers/mtd/chips/cfi_util.c
old mode 100644
new mode 100755
index 34d40e2..43511ab
--- a/drivers/mtd/chips/cfi_util.c
+++ b/drivers/mtd/chips/cfi_util.c
@@ -81,6 +81,9 @@ void __xipram cfi_qry_mode_off(uint32_t base, struct
map_info *map,
 {
 	cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
 	cfi_send_gen_cmd(0xFF, 0, base, map, cfi, cfi->device_type, NULL);
+	/* send a 0xF0 if the device is M29W128G */
+	if ((cfi->mfr =3D=3D CFI_MFR_ST) && (cfi->id =3D=3D 0x227E || cfi->id =3D=
=3D 0x7E))
+		cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
 }
 EXPORT_SYMBOL_GPL(cfi_qry_mode_off);

--
Best Regards,
Massimo Cirillo <maxcir@gmail.com>

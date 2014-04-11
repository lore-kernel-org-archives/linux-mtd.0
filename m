Received: from bear.ext.ti.com ([192.94.94.41])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WYV4K-0004c6-OI
 for linux-mtd@lists.infradead.org; Fri, 11 Apr 2014 06:36:09 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Helmut Schaa <helmut.schaa@googlemail.com>, Scott Wood
 <scottwood@freescale.com>
Subject: RE: [PATCH] mtd: nand: Disable subpage writes for drivers without
 ecc->hwctl
Date: Fri, 11 Apr 2014 06:35:34 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAC2697@DBDE04.ent.ti.com>
References: <1397034804-27161-1-git-send-email-helmut.schaa@googlemail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAC1D46@DBDE04.ent.ti.com>
 <CAGXE3d8H=y3LeW54kwZg04-Edm-KkNbqXLCduNuPfAOrLymO+A@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAC1D89@DBDE04.ent.ti.com>
 <1397086473.20280.33.camel@snotra.buserror.net>
 <5dc1853e-694c-4add-bd62-e0c2a66f4c95@email.android.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAC2146@DBDE04.ent.ti.com>
 <CAGXE3d8892D5JjFvs0Yxz6bpMciudq_95zeaKogYQqi2yMV7Pg@mail.gmail.com>
In-Reply-To: <CAGXE3d8892D5JjFvs0Yxz6bpMciudq_95zeaKogYQqi2yMV7Pg@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "Huang Shijie \(b32955@freescale.com\)" <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <David.Woodhouse@intel.com>, Artem
 Bityutskiy <artem.bityutskiy@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Schaa, Scott,

>From: Helmut Schaa [mailto:helmut.schaa@googlemail.com]
>>On Thu, Apr 10, 2014 at 9:26 AM, Gupta, Pekon <pekon@ti.com> wrote:
>>>From: Helmut Schaa [mailto:helmut.schaa@googlemail.com]
>>>>Scott Wood <scottwood@freescale.com> schrieb:
>> [...]
>>>>> From: Pekon Gupta <pekon@ti.com>
>>>>> Date: Wed, 9 Apr 2014 15:51:25 +0530
>>>>> Subject: [PATCH] mtd: eLBC NAND: disable subpage write support
>>>>>
>>>>> As fsl_elbc_nand do not implement NAND ECC interfaces (like
>>>>chip->ecc.hwctl(),
>>>>> chip->ecc.calculate, and chip->ecc.correct) So it cannot use default
>>>>> implementation of nand_write_subpage_hwecc() as in nand_base.c.
>>>>> Hence disabling subpage write support till a custom implementation
>>>>for
>>>>> chip->ecc_write_subpage is added.
>>>>>
>>>>> CC: <stable@vger.kernel.org> # 3.10.x+
>>>>> Signed-off-by: Pekon Gupta <pekon@ti.com>
>>>>> ---
>>>>>  drivers/mtd/nand/fsl_elbc_nand.c | 1 +
>>>>>  1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/drivers/mtd/nand/fsl_elbc_nand.c
>>>>b/drivers/mtd/nand/fsl_elbc_nand.c
>>>>> index ec549cd..a21252c 100644
>>>>> --- a/drivers/mtd/nand/fsl_elbc_nand.c
>>>>> +++ b/drivers/mtd/nand/fsl_elbc_nand.c
>>>>> @@ -755,6 +755,7 @@ static int fsl_elbc_chip_init(struct fsl_elbc_mtd
>>>>*priv)
>>>>>
>>>>>         /* set up nand options */
>>>>>         chip->bbt_options =3D NAND_BBT_USE_FLASH;
>>>>> +       chip->options |=3D NAND_NO_SUBPAGE_WRITE;
>>>>
>>>>Won't this break compatibility with existing UBI volumes?  That's why I
>>>>didn't set this flag on eLBC when I set it on IFC (on the latter UBI is
>>>>simply broken without that flag, but eLBC gets away with it because of
>>>>the ECC algorithm used).
>>>
>>>Could be. I had to override the VID header offset accordingly to be able=
 to attach to the ubi volume after applying this patch ...
>>>
>> There could be some misconfiguration in the way you generate your
>> UBIFS image. Just check following:
>> (1) min-io-size (-m) passed to mkfs.ubifs and ubinize commands?
>> (2) vid-hdr-offset (-O) passed to ubinize and ubiattach commands?
>> (3) subpage-size (-s) passed to ubinize commands? [optional]
>> All of the above should be set to $PAGE_SIZE of your NAND device.
>>
>> Because if your image itself was generated such a way that vid-hdr was
>> offset at page-boundaries then you shouldn't have needed this change.
>> ---------------------------
>> nand_base.c @@ nand_write_page(..)
>>         if (!(chip->options & NAND_NO_SUBPAGE_WRITE) &&
>>                 chip->ecc.write_subpage)
>>                 subpage =3D offset || (data_len < mtd->writesize);   <<-=
----
>>         else
>>                 subpage =3D 0;
>>         [...]
>>         else if (subpage)  <<--------
>>                 status =3D chip->ecc.write_subpage(mtd, chip, offset, da=
ta_len,
>>                                                          buf, oob_requir=
ed);
>> ---------------------------
>> So, even if the subpage-write is enabled, but all the write accesses are
>> page-aligned, (that is offset=3D=3D0 && data_len % mtd->writesize =3D=3D=
0)
>> then also chip->ecc.write_subpage() does _not_ come in path.
>
>Reverting "mtd: nand: subpage write support for hardware based ECC
>schemes" and then
>using ubiformat (without additional options) to create a volume
>results in a VID header offset
>of 512. And it was possible to attach to this volume successfully.
>Setting NAND_NO_SUBPAGE_WRITE prevents this ubi volume to be attached
>without explicitly
>setting the VID header offset. This indicates that with this patch
>some setups might break.
>
As per [1] and [2], If the subpage is _not_ supported then VID-header offse=
t
should be aligned to  PAGE_SIZE boundary. And it has implications on LEB si=
ze
calculation too. I don't know how it was working earlier but if the earlier
UBI images were using 512 as VID Header offset even without subpage
Support then it's incorrect configuration.
Now whether we still want backward compatibility for something which was
incorrect, is something I leave it for Maintainers {Artem, Brian} to decide=
.

>I don't necessarily want to get my patch in but IMO this is not a regressi=
on in
>fsl_elbc_nand but in nand_base (also possibly affecting other drivers).
>
>Helmut
Yes, it's not about the patch, but to fix the root issue for all the driver=
s.
Hopefully you are observations are on latest mtd-utils, as older versions
of the tool might have some bug-fixes.

[1] http://www.linux-mtd.infradead.org/doc/ubi.html#L_min_io_unit
[2] http://www.linux-mtd.infradead.org/doc/ubi.html#L_subpage


with regards, pekon

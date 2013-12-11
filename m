Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vqqng-0008T7-Mc
 for linux-mtd@lists.infradead.org; Wed, 11 Dec 2013 20:54:33 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: RE: [PATCH v2 3/4] mtd: nand: support Micron READ RETRY
Date: Wed, 11 Dec 2013 20:54:03 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA546AE@DBDE04.ent.ti.com>
References: <20980858CB6D3A4BAE95CA194937D5E73EA53CF1@DBDE04.ent.ti.com>
 <20131211183710.GR27149@ld-irv-0074.broadcom.com>
In-Reply-To: <20131211183710.GR27149@ld-irv-0074.broadcom.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

>From: Brian Norris
>>On Wed, Dec 11, 2013 at 07:49:21AM +0000, Pekon Gupta wrote:
>> >From: Brian Norris
[...]

>> Do all Micron devices support this vendor-specific ONFI information ?
>> - legacy device ?
>> - SLC NAND ?
>> If not then we might need more filters here ..
>
>We can look at the vendor_revision (as of the previous patch, this is in
>p->vendor_revision). But the vendor block is really
>backwards-compatible, since byte 180 (the micron->read_retries field)
>defaulted to 0 on legacy and SLC Micron ONFI NAND. I'll summarize the
>datasheets I'm referring to:
>
>Needs retry   Cell-type    Part number          Vendor revision    Byte 18=
0
>-----------   ---------    ----------------     ---------------    -------=
-----
>No            SLC          MT29F16G08ABABA      01h, 00h           Reserve=
d (0)
>No            MLC          MT29F32G08CBABA      01h, 00h           Reserve=
d (0)
>No            SLC          MT29F1G08AACWP       01h, 00h           0
>Yes           MLC          MT29F32G08CBADA      01h, 00h           08h
>Yes           MLC          MT29F64G08CBABA      02h, 00h           08h
>
>These datasheets range from 2008 to 2012, and they cover the range of
>ONFI 1.0 to ONFI 2.3, so I think it's safe to say that all Micron
>revisions support this vendor block "number of read retry modes" byte.
>
Yes, I have a Micron MLC data-sheet [1] which marks 'read_retry_options'
Byte 180 as reserved (0x0). So asked this question..


>At most, we chould check for:
>
>	if (le16_to_cpu(p->vendor_revision) < 0x0100)
>		return;
>
But, your above table shows that there are MLC NAND devices with
Vendor_revision =3D=3D 01h, 00h there are both types of 'read_retry_options=
'
"Reserved(0)" and "08h". So, I think it would be safe to check for below:
@@nand_do_read_ops (..)
+		if (mtd->ecc_stats.failed - ecc_failures) {
+				if ((retry_mode + 1 < chip->read_retries) &&=20
+ ----->>>>				(!micron->read_retry_options)) {
+		=09
+		/* Then proceed with retry sequence */


 [...]


>>
>> >diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
>> >@@ -518,6 +521,7 @@ struct nand_buffers {
>> >  *			non 0 if ONFI supported.
>> >  * @onfi_params:	[INTERN] holds the ONFI page parameter when ONFI is
>> >  *			supported, 0 otherwise.
>> >+ * @read_retries:	[INTERN] the number of read retry modes supported
>> >  * @onfi_set_features:	[REPLACEABLE] set the features for ONFI nand
>> >  * @onfi_get_features:	[REPLACEABLE] get the features for ONFI nand
>> >  * @bbt:		[INTERN] bad block table pointer
>> >@@ -589,6 +593,8 @@ struct nand_chip {
>> > 	int onfi_version;
>> > 	struct nand_onfi_params	onfi_params;
>> >
>> >+	int read_retries;
>> >+
>> >
>> I think we should not add new field 'read_retries' to 'struct nand_chip'=
 bcoz
>> - It's a vendor specific feature,
>
>I don't know that much about other vendor's read-retry support, but I
>expect that they would have a similar parameter to control how many
>times we retry. This is not intended to be vendor-specific, and we can
>adapt if other vendors' approach is too different. (However, I suspect
>that we can't do this very well for some vendors; they don't
>standardize, and they are getting more and more difficult to support
>reliably without deep knowledge of their quirks.)
>
>> - And also specifically for MLC NAND.
>
>Your point? Where do you propose to put MLC information?
>
>> Alternatively you can indirectly access this as part of onfi_params ..
>> (struct nand_onfi_vendor_micron *) micron =3D chip->onfi_param->vendor
>> And then micron->read_retries.
>
>We shouldn't be probing our vendor-specific properties on every
>invocation of nand_do_read_ops(); it should either be in a field (like
>my nand_chip.read_retries) or in a callback that we assign per-vendor,
>like Huang suggested.
>
No, I'm not saying to probe it every time.

But I'm not getting one thing here that..
(1) 'struct nand_onfi_param' is itself is packed into 'struct nand_chip'.
  @@nand.h 	struct nand_onfi_params	onfi_params;
(2) And 'vendor block' information is already part of=20
    'struct nand_onfi_params' marked as vendor[88].
[Patch 2/4]
-	u8 reserved5[90];
+	__le16 vendor_revision;
+	u8 vendor[88];

Then why do we need another field 'int read_retries' in nand_chip ?
As 'read_retry_options' information is already packed in
'struct nand_chip' as part of 'onfi_param.vendor[]'. So all we just=20
need is to re-cast the u8 vendor[] array into meaningful fields.
.. correct ? Am I missing something here ?
So information in vendor[] is same as any other field in nand_chip,
Then why do we need to duplicate this data.


with regards, pekon

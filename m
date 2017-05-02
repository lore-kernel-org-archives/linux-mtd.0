Received: from us-smtp-delivery-212.mimecast.com ([216.205.24.212])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d5WMU-0006HU-Tj
 for linux-mtd@lists.infradead.org; Tue, 02 May 2017 11:53:01 +0000
Subject: Re: [PATCH] tango_nand.c: fix ecc.stats_corrected in empty flash case
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: Pavel Machek <pavel@ucw.cz>, linux-mtd <linux-mtd@lists.infradead.org>,
 Thibaud Cornic <thibaud_cornic@sigmadesigns.com>, Mason <slash.tmp@free.fr>
References: <20170419121332.GA26979@amd> <20170419231804.5a04ed69@bbrezillon>
 <20170421100813.GA4332@amd> <20170421133721.GA15332@amd>
 <20170421154903.2782cd06@bbrezillon> <20170422104033.GA14508@amd>
 <53204f36-9662-e8a0-c431-09fb68276ab6@sigmadesigns.com>
 <20170502114228.299fc862@bbrezillon>
From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Message-ID: <dfdc3280-8de9-e215-6bc2-9863c7afd9c7@sigmadesigns.com>
Date: Tue, 2 May 2017 13:52:30 +0200
MIME-Version: 1.0
In-Reply-To: <20170502114228.299fc862@bbrezillon>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/05/2017 11:42, Boris Brezillon wrote:

> Hi Marc,
>=20
> On Mon, 24 Apr 2017 10:58:47 +0200
> Marc Gonzalez <marc_gonzalez@sigmadesigns.com> wrote:
>=20
>> [ Trimming CC list ]
>>
>> On 22/04/2017 12:40, Pavel Machek wrote:
>>
>>> Fix ecc.stats_corrected in empty flash case.
>>>
>>> Signed-off-by: Pavel Machek <pavel@denx.de>
>>>
>>> ---
>>>
>>> This was suggested by Boris Brezillon in another context. Not tested;
>>> I don't have the hardware.
>>>
>>> diff --git a/drivers/mtd/nand/tango_nand.c b/drivers/mtd/nand/tango_nan=
d.c
>>> index 4a5e948..db4bff4 100644
>>> --- a/drivers/mtd/nand/tango_nand.c
>>> +++ b/drivers/mtd/nand/tango_nand.c
>>> @@ -193,6 +193,8 @@ static int check_erased_page(struct nand_chip *chip=
, u8 *buf)
>>>  =09=09=09=09=09=09  chip->ecc.strength);
>>>  =09=09if (res < 0)
>>>  =09=09=09mtd->ecc_stats.failed++;
>>> +=09=09else
>>> +=09=09=09mtd->ecc_stats.corrected +=3D res;
>>> =20
>>>  =09=09bitflips =3D max(res, bitflips);
>>>  =09=09buf +=3D pkt_size;
>>>  =20
>>
>> Hello Pavel,
>>
>> You may have noticed that ecc_stats.corrected is not updated in
>> decode_error_report() which is the main code path, i.e. the path
>> that will succeed 99.99% of the time (HW read).
>>
>> It turns out that the HW does not report the number of errors
>> corrected in a page... Instead it reports two values:
>> 1) U =3D number of errors corrected in the first packet/step
>> 2) V =3D max number of errors corrected in other packets/steps
>>
>> Thus, it is not possible to determine the actual number of errors
>> corrected in a page (unless V is 0). Otherwise, we just have an
>> interval; let n be the number of packets/steps:
>>
>> U + V <=3D corrected errors count <=3D U + (n-1)*V
>>
>> In my opinion, it is better to provide no information than to
>> provide incorrect information. Therefore, I did not update
>> ecc_stats.corrected in decode_error_report().
>=20
> Hm, not sure I agree with that. The situation is far from ideal, but
> some userspace tools query the number of corrected bits before and
> after doing a read operation to report the number of bitflips that
> have been correcte. Letting users think there were no bitflips at all is
> not a good thing IMO.

I (still) find the API of ecc->read_page somewhat confusing ;-)
Let me try to work through the assumptions, as I remember.

1) If the driver was not able to read the page,
then we return an error code < 0

2) If the driver was able to read the page, and there were
no bitflips, then we return 0

3) If the driver was able to read the page, and there were
less than 'strength' bitflips in each step, then we return
the *max* of all bitflips across all steps

4) If the driver was able to read the page, but there was
at least one step with too many bitflips, then we are
expected to increment mtd->ecc_stats.failed, and return
the max of all bitflips across successful steps

AFAICT, the NAND framework does not use or update ecc_stats.corrected?
What about the MTD layer?


>> One could argue that updating ecc_stats.corrected in
>> check_erased_page() sets the correct value, since the error
>> counts are computed in software for each step. But updating
>> the value here is IMO pointless if we can't do it in the main
>> code path.
>=20
> Well, it's not pointless if you want to inform the user that some
> bitflips were present on the NAND. Yes, the numbers you report
> won't be accurate in your case, but at least the user can tell when
> bitflips were discovered.

I do report some bitflips value: it's the return value from
ecc->read_page -- which is the max bitflips per step. But perhaps
that value is not available to user-space? In other words,
the NAND and MTD layers do not forward it to user-space, as this
is left as a responsibility of individual drivers?

> Note that ideally, we should have per-page (or per-block) max-bitflips
> information (where max-bitflips is the number returned by
> ecc->read_page()), because counting the total number of corrected bits
> is certainly not helping when it comes to checking how reliable a NAND
> page/eraseblock is.

That would be quite large an array for a 1 TB NAND chip?

Regards.

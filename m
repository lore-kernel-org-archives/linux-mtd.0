Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]
 helo=tx2outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VjPQ0-0003DT-Fz
 for linux-mtd@lists.infradead.org; Thu, 21 Nov 2013 08:15:21 +0000
Message-ID: <528DC1DB.2090007@freescale.com>
Date: Thu, 21 Nov 2013 16:18:35 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Angus Clark <angus.clark@st.com>
Subject: Re: [PATCH] mtd: m25p80: add support for Spansion s25fl128s chip
References: <1384937569-23893-1-git-send-email-b32955@freescale.com>
 <528C8C1B.7090902@st.com>
In-Reply-To: <528C8C1B.7090902@st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B411=E6=9C=8820=E6=97=A5 18:16, Angus Clark =E5=86=99=
=E9=81=93:
> Hi Huang Shijie,
>
> On 11/20/2013 08:52 AM, Huang Shijie wrote:
>> This chip supports the quad read.
>>
>> Signed-off-by: Huang Shijie<b32955@freescale.com>
>> ---
>>   drivers/mtd/devices/m25p80.c |    1 +
>>   1 files changed, 1 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80=
.c
>> index 7dc2c14..720899b 100644
>> --- a/drivers/mtd/devices/m25p80.c
>> +++ b/drivers/mtd/devices/m25p80.c
>> @@ -941,6 +941,7 @@ static const struct spi_device_id m25p_ids[] =3D {
>>   	 */
>>   	{ "s25sl032p",  INFO(0x010215, 0x4d00,  64 * 1024,  64, 0) },
>>   	{ "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128, 0) },
>> +	{ "s25fl128s",	INFO(0x012018, 0x4d01,  64 * 1024, 256, M25P80_QUAD_R=
EAD) },
>>   	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, 0) },
>>   	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, M25P80_QUAD=
_READ) },
>>   	{ "s25fl512s",  INFO(0x010220, 0x4d00, 256 * 1024, 256, 0) },
> I would suggest using the name "s25fl128s1" to indicate the 64KiB secto=
r variant
> [1].  However, I would also point out that there is already an entry in=
 the
> table that matches the jedec_id/ext_id:
>
> 	{ "s25fl129p1", INFO(0x012018, 0x4d01,  64 * 1024, 256, 0) },
yes.
> As far as I can tell, the m25p80.c driver is not sensitive to the diffe=
rences
> between the 'P' and the 'S' generations; both support M25P80_QUAD_READ,=
 so the
> flag could be added to the s25fl129p1 entry if required.
>
Does the s25fl129p1 support the DDR quad read?
I do not have the datasheet.

it's a little strange if we add the flag to the s25fl129p1.
The one who wants to enable the s25fl128s on its board, will add the the=20
name s25fl129p1 in the DTS.



> If it was deemed necessary to differentiate between the 'P' and 'S', th=
en the
> jedec_probe() code would need to be updated to consider the 6th READID =
byte
> (0x80 for 'S').
>
yes. I also think we should probe the 6th READID byte.
> Cheers,
>
> Angus
>
> [1] The name should really be "s25fl128s0" where the appended '0' repre=
sents the
> "model number" 0 for uniform 64KiB sectors.  However, all the other Spa=
nsion
yes. the s25fl128s0 is beter.

thanks
Huang Shijie

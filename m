Received: from eu1sys200aog112.obsmtp.com ([207.126.144.133])
 by merlin.infradead.org with smtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VjQP5-0004fq-Uq
 for linux-mtd@lists.infradead.org; Thu, 21 Nov 2013 09:18:29 +0000
Message-ID: <528DCFBD.9000905@st.com>
Date: Thu, 21 Nov 2013 09:17:49 +0000
From: Angus Clark <angus.clark@st.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd: m25p80: add support for Spansion s25fl128s chip
References: <1384937569-23893-1-git-send-email-b32955@freescale.com>
 <528C8C1B.7090902@st.com> <528DC1DB.2090007@freescale.com>
In-Reply-To: <528DC1DB.2090007@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/21/2013 08:18 AM, Huang Shijie wrote:
> 于 2013年11月20日 18:16, Angus Clark 写道:
>> Hi Huang Shijie,
>>
>> On 11/20/2013 08:52 AM, Huang Shijie wrote:
>>> This chip supports the quad read.
>>>
>>> Signed-off-by: Huang Shijie<b32955@freescale.com>
>>> ---
>>>   drivers/mtd/devices/m25p80.c |    1 +
>>>   1 files changed, 1 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
>>> index 7dc2c14..720899b 100644
>>> --- a/drivers/mtd/devices/m25p80.c
>>> +++ b/drivers/mtd/devices/m25p80.c
>>> @@ -941,6 +941,7 @@ static const struct spi_device_id m25p_ids[] = {
>>>        */
>>>       { "s25sl032p",  INFO(0x010215, 0x4d00,  64 * 1024,  64, 0) },
>>>       { "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128, 0) },
>>> +    { "s25fl128s",    INFO(0x012018, 0x4d01,  64 * 1024, 256,
>>> M25P80_QUAD_READ) },
>>>       { "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, 0) },
>>>       { "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512,
>>> M25P80_QUAD_READ) },
>>>       { "s25fl512s",  INFO(0x010220, 0x4d00, 256 * 1024, 256, 0) },
>> I would suggest using the name "s25fl128s1" to indicate the 64KiB
>> sector variant
>> [1].  However, I would also point out that there is already an entry
>> in the
>> table that matches the jedec_id/ext_id:> 
>>
>>     { "s25fl129p1", INFO(0x012018, 0x4d01,  64 * 1024, 256, 0) },
> yes.
>> As far as I can tell, the m25p80.c driver is not sensitive to the
>> differences
>> between the 'P' and the 'S' generations; both support
>> M25P80_QUAD_READ, so the
>> flag could be added to the s25fl129p1 entry if required.
>>
> Does the s25fl129p1 support the DDR quad read?
> I do not have the datasheet.

No, the s25fl129p1 only supports SDR "Quad Output Read" and "Quad I/O Read".  I
thought the M25P80_QUAD_READ flag was for the SDR operations though, hence why I
said the m25p80 driver was not sensitive to the differences between s25fl129p1
and s25fl128s1.  Is that not the case?

> it's a little strange if we add the flag to the s25fl129p1.
> The one who wants to enable the s25fl128s on its board, will add the the
> name s25fl129p1 in the DTS.

That should work, but the m25p_ids[] table is also used for probing unknown
devices, so we need to be careful when adding a new entry.

>> If it was deemed necessary to differentiate between the 'P' and 'S',
>> then the
>> jedec_probe() code would need to be updated to consider the 6th READID
>> byte
>> (0x80 for 'S').
>>
> yes. I also think we should probe the 6th READID byte.

I think that is by far the best approach...

Cheers,

Angus

>> Cheers,
>>
>> Angus
>>
>> [1] The name should really be "s25fl128s0" where the appended '0'
>> represents the
>> "model number" 0 for uniform 64KiB sectors.  However, all the other
>> Spansion
> yes. the s25fl128s0 is beter.
> 
> thanks
> Huang Shijie
> 
> 
> 
> 

-- 
-------------------------------------
Angus Clark
ST Microelectronics (R&D) Ltd.
1000 Aztec West, Bristol, BS32 4SQ
email: angus.clark@st.com
tel: +44 (0) 1454 462389
st-tina: 065 2389
-------------------------------------

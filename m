Received: from mail-vw0-f181.google.com ([209.85.212.181])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MoYu1-0001y1-Cn
	for linux-mtd@lists.infradead.org; Fri, 18 Sep 2009 08:33:18 +0000
Received: by vws11 with SMTP id 11so794587vws.28
	for <linux-mtd@lists.infradead.org>;
	Fri, 18 Sep 2009 01:33:10 -0700 (PDT)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <4AB33F08.1040004@nokia.com>
References: <1251975273-12432-1-git-send-email-ext-mika.2.korhonen@nokia.com>
	<1251975273-12432-2-git-send-email-ext-mika.2.korhonen@nokia.com>
	<1251975273-12432-3-git-send-email-ext-mika.2.korhonen@nokia.com>
	<4AB1133B.4080905@nokia.com> <4AB314B2.8010003@nokia.com>
	<4AB33F08.1040004@nokia.com>
Date: Fri, 18 Sep 2009 17:33:10 +0900
Message-ID: <9c9fda240909180133x258a0f47j957cadf4b05abd9f@mail.gmail.com>
Subject: Re: [PATCH 2/2] MTD: OneNAND: multiblock erase support
From: Kyungmin Park <kmpark@infradead.org>
To: Adrian Hunter <adrian.hunter@nokia.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: "amul.saha@samsung.com" <amul.saha@samsung.com>,
	"dedekind@infradead.org" <dedekind@infradead.org>,
	"Korhonen Mika.2 \(EXT-Ardites/Oulu\)" <ext-mika.2.korhonen@nokia.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Sep 18, 2009 at 5:04 PM, Adrian Hunter <adrian.hunter@nokia.com> wr=
ote:
> Korhonen Mika.2 (EXT-Ardites/Oulu) wrote:
>>
>> Hunter Adrian (Nokia-D/Helsinki) wrote:
>>>
>>> Korhonen Mika.2 (EXT-Ardites/Oulu) wrote:
>>>
>>>>
>>>> Add support for multiblock erase command. OneNANDs (excluding
>>>> Flex-OneNAND)
>>>> are capable of simultaneous erase of up to 64 eraseblocks which is muc=
h
>>>> faster.
>>>> This changes the erase requests for regions covering multiple
>>>> eraseblocks
>>>> to be performed using multiblock erase.
>>>>
>>>> Signed-off-by: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
>>>> ---
>>>>
>>>
>>> A few comments below.
>>>
>>>
>>
>> [...]
>>>
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 switch (state) {
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 case FL_RESETING:
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 intr_flags |=3D ONENAND_I=
NT_RESET;
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 case FL_PREPARING_ERASE:
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 intr_flags |=3D ONENAND_I=
NT_ERASE;
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 case FL_VERIFYING_ERASE:
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i =3D 51;
>>>
>>> I see 100us for this in some versions. =A0Perhaps Kyungmin can suggest
>>> a value.
>>>
>>
>> With the chip I had the actual time for 64-eb verify read was in the ran=
ge
>> of 20-30 us but you're right, there are chips for which the maximum time=
 is
>> specified to be 100 us. Is ok to just raise this to that value? Kyungmin=
?
>>
>> [...]
>>>>
>>>> +
>>>> + =A0 =A0 =A0 /* loop over 64 eb batches */
>>>> + =A0 =A0 =A0 while (len) {
>>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct erase_info verify_instr =3D *inst=
r;
>>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 verify_instr.addr =3D addr;
>>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 verify_instr.len =3D 0;
>>>> +
>>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 eb_count =3D 0;
>>>> +
>>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 while (len > block_size &&
>>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0eb_count < (MB_ERASE_MAX_=
BLK_COUNT - 1)) {
>>>>
>>>
>>> According to the manual I have you cannot do a multiblock erase
>>> across a chip boundary, so you must exit this loop at the boundary too.
>>>
>>
>> Ok, does this apply DDP chips only?
>
> Yes, AFAIK. Kyungmin?

Of course, Actually DDP has two chips. can't share the info between chips.
That's the reason to check DDP. :)

Thank you,
Kyungmin Park

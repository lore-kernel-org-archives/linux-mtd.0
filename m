Received: from mail-vw0-f181.google.com ([209.85.212.181])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MoWAg-00027d-Ij
	for linux-mtd@lists.infradead.org; Fri, 18 Sep 2009 05:38:19 +0000
Received: by vws11 with SMTP id 11so749267vws.28
	for <linux-mtd@lists.infradead.org>;
	Thu, 17 Sep 2009 22:38:13 -0700 (PDT)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <4AB314B2.8010003@nokia.com>
References: <1251975273-12432-1-git-send-email-ext-mika.2.korhonen@nokia.com>
	<1251975273-12432-2-git-send-email-ext-mika.2.korhonen@nokia.com>
	<1251975273-12432-3-git-send-email-ext-mika.2.korhonen@nokia.com>
	<4AB1133B.4080905@nokia.com> <4AB314B2.8010003@nokia.com>
Date: Fri, 18 Sep 2009 14:38:13 +0900
Message-ID: <9c9fda240909172238o2427386agd357225841b59b6b@mail.gmail.com>
Subject: Re: [PATCH 2/2] MTD: OneNAND: multiblock erase support
From: Kyungmin Park <kmpark@infradead.org>
To: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: "amul.saha@samsung.com" <amul.saha@samsung.com>,
	"dedekind@infradead.org" <dedekind@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"Hunter Adrian \(Nokia-D/Helsinki\)" <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Sep 18, 2009 at 2:03 PM, Mika Korhonen
<ext-mika.2.korhonen@nokia.com> wrote:
> Hunter Adrian (Nokia-D/Helsinki) wrote:
>>
>> Korhonen Mika.2 (EXT-Ardites/Oulu) wrote:
>>
>>>
>>> Add support for multiblock erase command. OneNANDs (excluding
>>> Flex-OneNAND)
>>> are capable of simultaneous erase of up to 64 eraseblocks which is much
>>> faster.
>>> This changes the erase requests for regions covering multiple erasebloc=
ks
>>> to be performed using multiblock erase.
>>>
>>> Signed-off-by: Mika Korhonen <ext-mika.2.korhonen@nokia.com>
>>> ---
>>>
>>
>> A few comments below.
>>
>>
>
> [...]
>>
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 switch (state) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 case FL_RESETING:
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 intr_flags |=3D ONENAND_IN=
T_RESET;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 case FL_PREPARING_ERASE:
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 intr_flags |=3D ONENAND_IN=
T_ERASE;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 case FL_VERIFYING_ERASE:
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i =3D 51;
>>
>> I see 100us for this in some versions. =A0Perhaps Kyungmin can suggest
>> a value.
>>
>
> With the chip I had the actual time for 64-eb verify read was in the rang=
e
> of 20-30 us but you're right, there are chips for which the maximum time =
is
> specified to be 100 us. Is ok to just raise this to that value? Kyungmin?

To correctness, It should be 100 as Spec.

Just FYI:
In recent OneNAND chips has 4KiB pagesize doesn't support Multi block
erase feature at my spec.

Right, these chips are not yet support at MTD. After make a patch, we
have to check the multi block erase feature.

Thank you,
Kyungmin Park

Received: from mail-pz0-f173.google.com ([209.85.222.173])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mnrcv-0008Cc-Qv
	for linux-mtd@lists.infradead.org; Wed, 16 Sep 2009 10:20:46 +0000
Received: by pzk3 with SMTP id 3so4092363pzk.28
	for <linux-mtd@lists.infradead.org>;
	Wed, 16 Sep 2009 03:20:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1253093770.3778.7.camel@localhost>
References: <630851df0909160009w35efd6b2kb058593b59e1be66@mail.gmail.com>
	<1253093770.3778.7.camel@localhost>
Date: Wed, 16 Sep 2009 15:50:40 +0530
Message-ID: <630851df0909160320y1721f8d8m23b0675d57558c28@mail.gmail.com>
Subject: Re: Doubt regarding mtd test ( mtd_oobtest ) interpretation of oob
	data !
From: Murali N <nalajala.murali@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
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

Hi Artem, can you please explain me a bit more about OOB_PLACE mode?.
Also in mtd tests i have seen there is ooboffs field being used in
OOB_AUTO mode.My doubt here was why AUTO mode cares about ooboffs
field.ECC layout structure is defined clearly in the AUTO mode? am i
correct? then what is the significance of ooboffs field?

i am not caring the ooboffs when the AUTO mode is selected in my
driver? i was bit confused where it is mentioned in the MTD
specification? can you please point to me if you have any info!!!

thanks

On Wed, Sep 16, 2009 at 3:06 PM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> On Wed, 2009-09-16 at 12:39 +0530, Murali N wrote:
>> Hi All,
>> i have a doubt on how the OOB data is being managed in MTD driver.
>> Recently i have enabled mtd-tests to test my driver for mtd
>> compliance.After i ran "mtd_oobtest" i was messed up with test and
>> come up with few questions:
>>
>> 1) Is these tests are well validated? can i trust these tests 100%
>> compliant to MTD API specification?
>> 2) In "mtd_oobtest" ( drivers/mtd/tests/ ), there was a "test 4 of 5"
>> in this there was a few checks for writing/reading end off OOB data.
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - In these tests what is the s=
ignificance of using
>> "ooboffs" in OOB_AUTO mode?
>> 3) Is MTD driver ask the below NAND driver to read/write the oob data
>> integral of oobavail size in OOB_AUTO mode? How MTD driver behaves if
>> it is not!!!
>> 4) Finally, can anyone please explain bit more about OOB_PLACE mode?
>> also the significance of ooboffs field usage?
>
> I do not understand your questions, and I do not quite remember these
> modes already, but the below code probably explains things well:
>
> /*
> =C2=A0* oob operation modes
> =C2=A0*
> =C2=A0* MTD_OOB_PLACE: =C2=A0 =C2=A0 =C2=A0 oob data are placed at the gi=
ven offset
> =C2=A0* MTD_OOB_AUTO: =C2=A0 =C2=A0 =C2=A0 =C2=A0oob data are automatical=
ly placed at the free
> areas
> =C2=A0* =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0which are defined by the ecclayout
> =C2=A0* MTD_OOB_RAW: =C2=A0 =C2=A0 =C2=A0 =C2=A0 mode to read raw data+oo=
b in one chunk. The oob
> data
> =C2=A0* =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0is inserted into the data. Thats a raw image of
> the
> =C2=A0* =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0flash contents.
> =C2=A0*/
> typedef enum {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0MTD_OOB_PLACE,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0MTD_OOB_AUTO,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0MTD_OOB_RAW,
> } mtd_oob_mode_t;
>
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
>
>



--=20
Regards,
Murali N

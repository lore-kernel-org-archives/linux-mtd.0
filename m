Received: from mail-bw0-f221.google.com ([209.85.218.221])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NWn6H-0004fc-6Y
	for linux-mtd@lists.infradead.org; Mon, 18 Jan 2010 08:36:46 +0000
Received: by bwz21 with SMTP id 21so606639bwz.4
	for <linux-mtd@lists.infradead.org>;
	Mon, 18 Jan 2010 00:36:39 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <a328840c1001180034n7fd1c3e9m420afef60f7c97ab@mail.gmail.com>
References: <a328840c1001130628h4bb0f03auad84dd1564fc08a7@mail.gmail.com>
	<1263724633.8276.135.camel@localhost.localdomain>
	<1263724992.8276.140.camel@localhost.localdomain>
	<a328840c1001180034n7fd1c3e9m420afef60f7c97ab@mail.gmail.com>
Date: Mon, 18 Jan 2010 09:36:38 +0100
Message-ID: <a328840c1001180036j771339a7t780960627e742c9b@mail.gmail.com>
Subject: Re: Memory leak on UBI volume truncating
From: Marek Skuczynski <mareksk7@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Artem,
> On Sun, Jan 17, 2010 at 11:43 AM, Artem Bityutskiy <dedekind1@gmail.com> =
wrote:
>> On Sun, 2010-01-17 at 12:37 +0200, Artem Bityutskiy wrote:
>>> Hi,
>>>
>>> On Wed, 2010-01-13 at 15:28 +0100, Marek Skuczynski wrote:
>>> > Hello,
>>> > =A0 I have prepare a simple volume update stress test (see test code =
below).
>>> > =A0 This test has been run for kernel 2.6.23 with some updates from 2=
.6.28,
>>> > =A0 and always after a few minutes the OOM killer was launched.
>>> >
>>> > =A0 What i found it that each an UBI volume truncate operation with
>>> > ubiupdatevol tool
>>> > =A0 causes memory leak. I think this happens because:
>>> >
>>> > =A0 - ubi_start_update() =A0param "bytes" is equal 0
>>> >
>>> > =A0 - vol->updating flag is re-set to 0
>>> >
>>> > =A0 - vol->upd_buf is allocated regardless of vol->updating flag,
>>> > =A0 =A0 =A0but not released on device close by vol_cdev_release()
>>> >
>>> > =A0 I never run the test on a newer kernel version, so I cannot confi=
rm
>>> > that this problem still exists.
>>> >
>>> > =A0 Please confirm, whether my findings are correct or not, thanks.
>>>
>>> thanks for this finding. Looks like your analysis is right. Does this
>>> simple patch help?
>>
>> Actually this even simpler patch should fix the issue. Could you please
>> test it and let me know if it helps.
>>
>> diff --git a/drivers/mtd/ubi/upd.c b/drivers/mtd/ubi/upd.c
>> index c1d7b88..425bf5a 100644
>> --- a/drivers/mtd/ubi/upd.c
>> +++ b/drivers/mtd/ubi/upd.c
>> @@ -155,6 +155,7 @@ int ubi_start_update(struct ubi_device *ubi, struct =
ubi_volume *vol,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (err)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return err;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0vol->updating =3D 0;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
>> =A0 =A0 =A0 =A0}
>>
>> =A0 =A0 =A0 =A0vol->upd_buf =3D vmalloc(ubi->leb_size);
>>
>> --

Thanks for you reply. It seems the fix solve the issue.

Regards,
=A0Marek

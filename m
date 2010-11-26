Received: from mail-pz0-f49.google.com ([209.85.210.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PLyxj-0002LD-Ck
	for linux-mtd@lists.infradead.org; Fri, 26 Nov 2010 14:07:44 +0000
Received: by pzk30 with SMTP id 30so412087pzk.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 26 Nov 2010 06:07:41 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1290779883.2552.4.camel@localhost>
References: <AANLkTinzy-qTsYfbZhkhoFN6Tz9G47+JUWsa97KCUAke@mail.gmail.com>
	<1290779883.2552.4.camel@localhost>
Date: Fri, 26 Nov 2010 23:07:41 +0900
Message-ID: <AANLkTimD45TxMY7ZL0QPqJg+MXnSUCR8saPetyY1B14u@mail.gmail.com>
Subject: Re: Flashing UBIFS over fastboot
From: Leo Barnes <barnes.leo@gmail.com>
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

Thanks for the extremely quick reply, will take a look at it.

//Leo

On Fri, Nov 26, 2010 at 10:58 PM, Artem Bityutskiy <dedekind1@gmail.com> wr=
ote:
> Hi,
>
> On Fri, 2010-11-26 at 22:39 +0900, Leo Barnes wrote:
>> I am trying to get UBIFS to work on a fastboot-based Android device.
>> So far, I have managed to create a working UBIFS partition on a
>> running device using ubiformat/nandwrite, but whenever I try to flash
>> images with fastboot, the flashing process fails. I assume that this
>> is because fastboot expects YAFFS2 images (which contain OOB-data)
>> while what I am trying to flash is UBIFS images (which do not). So my
>> question:
>>
>> Has anyone either got fastboot to work directly with UBIFS images, or
>> is it possible to somehow create UBIFS images that "look like" YAFFS2
>> images (by creating dummy OOB-data for instance)? As it is, fastboot
>> obviously misinterprets the images. Or does anyone have any data on
>> exactly how the UBIFS and YAFFS2 image formats look like? In that case
>> I might be able to figure out some way of doing it.
>
> I think you can hack ubinize and teach it to add OOB bytes.
>
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
>
>

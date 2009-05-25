Received: from mail-bw0-f160.google.com ([209.85.218.160])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M8VSc-0006dt-4y
	for linux-mtd@lists.infradead.org; Mon, 25 May 2009 08:23:12 +0000
Received: by bwz4 with SMTP id 4so3394369bwz.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 25 May 2009 01:23:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1243238323.21646.64.camel@localhost.localdomain>
References: <1243232787-29108-1-git-send-email-corentincj@iksaif.net>
	<1243232787-29108-2-git-send-email-corentincj@iksaif.net>
	<1243232787-29108-3-git-send-email-corentincj@iksaif.net>
	<1243238323.21646.64.camel@localhost.localdomain>
Date: Mon, 25 May 2009 10:23:03 +0200
Message-ID: <71cd59b00905250123o516a293an3c5c541cc417fc94@mail.gmail.com>
Subject: Re: [PATCH 2/2] mkfs.ubifs: use libubi to format UBI volume
From: Corentin Chary <corentin.chary@gmail.com>
To: dedekind@infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 25, 2009 at 9:58 AM, Artem Bityutskiy
<dedekind@infradead.org> wrote:
>
> I know this is nit-picking, but would be nicer to close libubi
> in case of errors. Namely, in the second and third checks.

In case of error, close_target() will close libubi. (if(ubi) libubi_close(u=
bi)).
But maybe you want to explicitly close libubi here ?


>> +static int write_empty_leb(int lnum, int dtype)
>> =A0{
>> - =A0 =A0 return write_leb(lnum, 0, leb_buf);
>> + =A0return write_leb(lnum, 0, leb_buf, dtype);
>> =A0}
>
> You screwed the indentation here a bit.

Arg... M-x c-set-style gnu :/

>> - =A0 =A0 err =3D stat(root, &root_st);
>> - =A0 =A0 if (err)
>> - =A0 =A0 =A0 =A0 =A0 =A0 return sys_err_msg("bad root file-system direc=
tory '%s'", root);
>> + =A0 =A0 if (root) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 err =3D stat(root, &root_st);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (err)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return sys_err_msg("bad root f=
ile-system directory '%s'"
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0, root);
>
> This is a little ugly. Could you please leave the comma at close to the
> " symbol, and move "root" to the second line. This is just how the rest
> of the code is written. Let's be consistent.

The comma is just at the 80 column limit.
Using Lindent, we get:
                        return
                            sys_err_msg("bad root file-system directory '%s=
'",
                                        root);

Is this ok ?

>
>> --- a/mkfs.ubifs/ubifs.h
>> +++ b/mkfs.ubifs/ubifs.h
>> @@ -366,6 +366,9 @@ struct ubifs_info
>> =A0 =A0 =A0 int dead_wm;
>> =A0 =A0 =A0 int dark_wm;
>>
>> + =A0 =A0 struct ubi_dev_info di;
>> + =A0 =A0 struct ubi_vol_info vi;
>
> For consistency, you should probably comment these new fields.
Ok



--=20
Corentin Chary
http://xf.iksaif.net - http://uffs.org

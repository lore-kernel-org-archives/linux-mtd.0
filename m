Received: from mail-vx0-f177.google.com ([209.85.220.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QIMnL-0000Xs-B0
	for linux-mtd@lists.infradead.org; Fri, 06 May 2011 15:18:19 +0000
Received: by vxd2 with SMTP id 2so4457628vxd.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 06 May 2011 08:18:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1304694168.7222.68.camel@localhost>
References: <BANLkTinVHD1QYpqSTG0_WcLy-aA1ere34g@mail.gmail.com>
	<1304694168.7222.68.camel@localhost>
Date: Fri, 6 May 2011 11:18:17 -0400
Message-ID: <BANLkTikgYvy9Dk8NXnmUP+1bWAjfoB-LVw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] ubifs: add ubifs_fixup_free_space()
From: "Matthew L. Creech" <mlcreech@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
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

On Fri, May 6, 2011 at 11:02 AM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
>> +
>> + =A0 =A0 ubifs_assert(len >=3D 0);
>> + =A0 =A0 ubifs_assert(len % c->min_io_size =3D=3D 0);
>
> So if this is true.
>
>> +
>> + =A0 =A0 /* Pad if necessary */
>> + =A0 =A0 aligned_len =3D ALIGN(len, c->min_io_size);
>> + =A0 =A0 if (aligned_len > len) {
>
> This will be always false and the below code can be removed, right?
>

Oh, yes you're right - I added it before you had mentioned that the
lengths would be min_io_size-aligned.  :)  Thanks

--=20
Matthew L. Creech

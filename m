Received: from rproxy.gmail.com ([64.233.170.201])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DXfdG-0000et-M0
	for linux-mtd@lists.infradead.org; Mon, 16 May 2005 09:27:43 -0400
Received: by rproxy.gmail.com with SMTP id y7so637655rne
	for <linux-mtd@lists.infradead.org>;
	Mon, 16 May 2005 06:27:48 -0700 (PDT)
Message-ID: <f6d0cd0605051606276d2c6f94@mail.gmail.com>
Date: Mon, 16 May 2005 18:57:48 +0530
From: Niraj Maheshwari <niraj.maheshwari@gmail.com>
To: "Artem B. Bityuckiy" <dedekind@yandex.ru>
In-Reply-To: <42889498.5080003@yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <f6d0cd0605051603533fa9fbd1@mail.gmail.com>
	<42889498.5080003@yandex.ru>
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 error while Copying
Reply-To: Niraj Maheshwari <niraj.maheshwari@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

Any concrete cause for this problem for which i should look in to the code =
?

I have verified the Flash Driver as it works fine for Intel W18 NOR
flash and i have not modified anything for the Intel Strata W18 flash.
Ideally it should work as it
is as both the flashes are CFI compliant.

Thanks
Niraj

On 5/16/05, Artem B. Bityuckiy <dedekind@yandex.ru> wrote:
> Niraj Maheshwari wrote:
> > Node totlen on flash (0x00800080) !=3D totlen from node ref (0x0000000c=
).
> I asked about your message in IRC:
>=20
> dedekind dwmw2, "Node totlen on flash (0x00800080) !=3D totlen from node
> ref (0x0000000c)" - have you ever seen something like this ?
> jwb that looks like a status register
> jwb 0x00800080 i mean
> dedekind hmm
> dedekind i.e. he configured partition incorrectly ?
> dedekind and reads some mapped registers?
> jwb not necessarily
> jwb it could be that the MTD and JFFS2 layers were out of sync
> jwb or it could just be random data that just _looks_ like the value of
> a status register
> dwmw2 soudns like a flash driver bug
> dwmw2 I've seen that kind of thing before, yes
> dwmw2 flash in status mode when we think we're reading from it
>=20
> --
> Best Regards,
> Artem B. Bityuckiy,
> St.-Petersburg, Russia.
>

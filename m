Received: from zproxy.gmail.com ([64.233.162.194])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EmWoz-00072E-9F
	for linux-mtd@lists.infradead.org; Wed, 14 Dec 2005 08:37:33 -0500
Received: by zproxy.gmail.com with SMTP id i11so114687nzi
	for <linux-mtd@lists.infradead.org>;
	Wed, 14 Dec 2005 05:37:28 -0800 (PST)
Message-ID: <625fc13d0512140537h20e291e8i10951ced01f2a290@mail.gmail.com>
Date: Wed, 14 Dec 2005 07:37:28 -0600
From: Josh Boyer <jwboyer@gmail.com>
To: alfred hitch <alfred.hitch@gmail.com>
In-Reply-To: <29f916510512132353y39427546j1413e0fdc5dcaa7a@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <29f916510512132353y39427546j1413e0fdc5dcaa7a@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtd size calcualtion assumes same size'd flashes ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/14/05, alfred hitch <alfred.hitch@gmail.com> wrote:
> Hi,
>
> Please correct me if my understanding is wrong here:
> but while grepp'ing through the code of linux 2.6 base I had.
> File cfi_cmdset0001.c :
> function: static struct mtd_info *cfi_intelext_setup(struct map_info *map=
)
>
>       mtd->size =3D devsize * cfi->numchips;
>
> This seems to me an assumption that the flash'es in system are all of
> same size and so can be added up ?
> Is my understanding correct, sorry dont have latest code access.

I believe your understanding is correct.  Your device size can span
multiple chips if they are physically contiguous and of the same type.

>
> If that is the case, any reasons to do so  ?
> My system happened to have an odd sized flash config and was creating mes=
sups.
> If my understanding is correct, I would have like to patch and post it.

The normal method of dealing with heterogenous chips is to create
separate MTD devices for each chip in your map driver.  You can then
use MTD_CONCAT to  concatenate these separate devices into one large
device.

josh

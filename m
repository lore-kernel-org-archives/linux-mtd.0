Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HkF6w-0002rD-R7
	for linux-mtd@lists.infradead.org; Sat, 05 May 2007 03:55:24 -0400
Subject: Re: [PATCH] UBI: dereference after kfree in create_vtbl
From: Artem Bityutskiy <dedekind@infradead.org>
To: Satyam Sharma <satyam.sharma@gmail.com>
In-Reply-To: <a781481a0705042055u5e9ba060w95da83b0fbeff76a@mail.gmail.com>
References: <463A04A5.5030103@gmail.com>
	<a781481a0705041442h37453fb6k26d04eb5356e9dc0@mail.gmail.com>
	<463BC019.40305@gmail.com>
	<a781481a0705042055u5e9ba060w95da83b0fbeff76a@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Sat, 05 May 2007 10:55:11 +0300
Message-Id: <1178351711.3659.54.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Florin Malita <fmalita@gmail.com>, linux-mtd@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

thanks for finding bugs in this patch. Although this path will likely
never happen, this is good to have it bug-free.

On Sat, 2007-05-05 at 09:25 +0530, Satyam Sharma wrote:
> Artem would have to step in here to verify if there really is a good
> reason why we kmalloc a fresh ubi_scan_leb every time we want to add
> one to a list.=20
Particularly in vtbl.c there is no good reason. Leftover of itsy-bitsy
units. I'll make ubi_scan_add_to_list static, as well as
ubi_scan_add_used(). And I'll rename them to something shorter. They are
only useful in scan.c.

And it is fine to use list_add_tail() directly in vtbl.c. Will be fixed.

> If possible, the best solution would be to change
> ubi_scan_add_to_list() to take in a valid struct ubi_scan_leb and just
> add that to the specified list (using list_add_tail or whatever) --
> and leave allocation up to callers,=20
In scan.c it is useful because _all_ callers have to allocate it. vtbl.c
is the only place which does not need it. I'll fix this.

> >though this likely requires a
> major cleanup of this driver w.r.t. ubi_scan_leb lifetime semantics.
What is wrong with the semantics, please be more specific.

I'll fix this shortly.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)

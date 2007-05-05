Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HkJ4r-0000xC-SV
	for linux-mtd@lists.infradead.org; Sat, 05 May 2007 08:09:33 -0400
Subject: Re: [PATCH] UBI: dereference after kfree in create_vtbl
From: Artem Bityutskiy <dedekind@infradead.org>
To: Satyam Sharma <satyam.sharma@gmail.com>
In-Reply-To: <a781481a0705042055u5e9ba060w95da83b0fbeff76a@mail.gmail.com>
References: <463A04A5.5030103@gmail.com>
	<a781481a0705041442h37453fb6k26d04eb5356e9dc0@mail.gmail.com>
	<463BC019.40305@gmail.com>
	<a781481a0705042055u5e9ba060w95da83b0fbeff76a@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Sat, 05 May 2007 15:09:19 +0300
Message-Id: <1178366959.3659.95.camel@sauron>
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

On Sat, 2007-05-05 at 09:25 +0530, Satyam Sharma wrote:
> Again, I saw that too, but would still prefer using the higher level
> function ubi_scan_add_to_list() to add to the corrupted list, but with
> a different identifier for the return value to avoid overwriting err.
> list_add_tail seems best left as an implementation detail below
> ubi_scan_add_to_list(), IMO. So if it fails in the error path, we'd
> have to return with the original (write error) return value and the
> ENOMEM sort of goes ... unreturned. Alas!

I've put the fix here:
http://git.infradead.org/?p=3Dusers/dedekind/ubi-2.6.git;a=3Dcommit;h=3D512=
5237efb6a3309fbf5b9a7a21aaf716787f2a2

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)

Received: from exprod6og105.obsmtp.com ([64.18.1.189])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N0Hx2-0004QP-RL
	for linux-mtd@lists.infradead.org; Tue, 20 Oct 2009 16:52:53 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: RE: [PATCH] mtd: Fix kernel NULL pointer dereference in physmap.c
Date: Tue, 20 Oct 2009 12:52:45 -0400
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190901E2483A@mi8nycmail19.Mi8.com>
In-Reply-To: <20091021.011750.71092490.anemo@mba.ocn.ne.jp>
References: <BD79186B4FD85F4B8E60E381CAEE190901E246A0@mi8nycmail19.Mi8.com><20091021.002941.41633716.anemo@mba.ocn.ne.jp><BD79186B4FD85F4B8E60E381CAEE190901E2481C@mi8nycmail19.Mi8.com>
	<20091021.011750.71092490.anemo@mba.ocn.ne.jp>
From: "H Hartley Sweeten" <hartleys@visionengravers.com>
To: "Atsushi Nemoto" <anemo@mba.ocn.ne.jp>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday, October 20, 2009 9:18 AM, Atsushi Nemoto wrote:
> On Tue, 20 Oct 2009 12:08:00 -0400, "H Hartley Sweeten" =
<hartleys@visionengravers.com> wrote:
>>>> Also, cleanup the #ifdef CONFIG_MTD_PARTITIONS stuff by using
>>>> mtd_has_partitions().
>>>
>>> And this cleanup cause build errors when CONFIG_MTD_PARTITIONS was =
not
>>> set.  A separate patch might be better for such cleanup.
>>=20
>> Hmm..  Not sure why that would cause a build error.  Regardless, I =
will
>> remove that change from this patch.
>
> Thank you.  The build errors are something like:
>
> physmap.c:53: error: 'struct physmap_flash_info' has no member named =
'nr_parts'
> physmap.c:174: error: 'part_probe_types' undeclared (first use in this =
function)

Ok.  That makes sense.

struct physmap_flash_info {
	struct mtd_info		*mtd[MAX_RESOURCES];
	struct mtd_info		*cmtd;
	struct map_info		map[MAX_RESOURCES];
#ifdef CONFIG_MTD_PARTITIONS
	int			nr_parts;
	struct mtd_partition	*parts;
#endif
};

#ifdef CONFIG_MTD_PARTITIONS
static const char *part_probe_types[] =3D { "cmdlinepart", "RedBoot", =
NULL };
#endif

I assumed that mtd_has_partitions() when CONFIG_MTD_PARTITIONS was not =
defined
would end up as something like this when compiled:

	if (mtd_has_partitions()) {
		/* ... */
	}

Would become:

	if (0) {
		/* ... */
	}

Then it would just optimze away.  It appears the code in the if (0) =
condition is
still parsed by the compiler so you get the errors above since the =
symbols are
#ifdef'ed out.

Oh well... I did post the updated patch based on your other comment.

Regards,
Hartley

Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Iu7UZ-0002ih-Kg
	for linux-mtd@lists.infradead.org; Mon, 19 Nov 2007 09:20:58 -0500
Subject: Re: Yet Another UBI Question
From: Artem Bityutskiy <dedekind@infradead.org>
To: Vinit Agnihotri <vinit.agnihotri@gmail.com>
In-Reply-To: <9b52d64c0711190206h6f845a07h6bb6817b61cb95c@mail.gmail.com>
References: <B1EDF20A6EAAD74EA65E46F774F1784502B64384@orsmsx413.amr.corp.intel.com>
	<B1EDF20A6EAAD74EA65E46F774F1784502B9D207@orsmsx413.amr.corp.intel.com>
	<9b52d64c0711190124p6730356ep3b0c7a381863a905@mail.gmail.com>
	<1195465265.1119.24.camel@sauron>
	<9b52d64c0711190206h6f845a07h6bb6817b61cb95c@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Mon, 19 Nov 2007 16:20:46 +0200
Message-Id: <1195482046.3231.24.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2007-11-19 at 15:36 +0530, Vinit Agnihotri wrote:
> Agree but What I mean is instead of implementing cdev & FTL on it.
> Why not to implement block device for a volume in the first place.
> ofcourse this block device will also have abilities of upadate, read/writ=
e.
>=20
> Stacking is good approach but then stacking will causes performance degra=
de,
> as we'll be emulating block device over a character device. But if we
> can avoid it, we'll get performance improvements
> & also widesread use of UBI as any FS could be put on UBI volumes with
> no efforts.
> User should not be given additional & complex task of writing FTL just
> to put his FS on top of UBI volume.

When we wrote UBI we _did not_ mean to create FTL or something close _at
all_. We solved other problems: wear-leveling across whole flash chip,
volumes creation/deletion/re-size, reliability (static volumes,
transparent clever errors and bad-block handling, bit-flips handling,
updates).

FTL is a completely different task, we _did not_ intend solve it! If one
needs FTL - please go ahead and implement it!

But I say that it will be easier to do this on top of UBI then on top of
MTD device because UBI already solves many (but not all) problems FTL
has to solve (see the above). If one wants better performance because of
less stacking - please, just write FTL on top of MTD.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)

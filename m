Received: from mail-vx0-f177.google.com ([209.85.220.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QHk98-0007ta-Tn
	for linux-mtd@lists.infradead.org; Wed, 04 May 2011 22:02:15 +0000
Received: by vxd2 with SMTP id 2so2060198vxd.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 04 May 2011 15:02:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1304507625.7222.16.camel@localhost>
References: <BANLkTin-7YDkQ+k8bD1E2D8Qa-VsNyoK-Q@mail.gmail.com>
	<1304507625.7222.16.camel@localhost>
Date: Wed, 4 May 2011 18:02:13 -0400
Message-ID: <BANLkTimi=Xvvy98aj9u3Gaapzkb3hWSNgQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] ubifs: add ubifs_mount_fixup_lebs()
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

All makes sense Artem, thanks for the feedback.

On Wed, May 4, 2011 at 7:13 AM, Artem Bityutskiy <dedekind1@gmail.com> wrot=
e:
> On Tue, 2011-05-03 at 18:55 -0400, Matthew L. Creech wrote:
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (!(lprops->flags & LPROPS_EMPTY) &&
>
> I think this is not quite right, because empty taken LEBs will not be
> fixed up. I think you should only look at free space and nothing else.
>

OK, however I did find that I needed to check for (lprops->flags &
LPROPS_TAKEN) in addition to (lprops->free =3D=3D c->leb_size) before
unmapping a LEB.  Failing to do so caused this:

UBIFS error (pid 1): check_lpt_type: invalid type (15) in LPT node type 1
UBIFS error (pid 1): ubifs_read_nnode: error -22 reading nnode at 8:783

so apparently it was unmapping part of the LPT, I guess?

--=20
Matthew L. Creech

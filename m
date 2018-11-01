Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gI933-0004G9-S3
 for linux-mtd@lists.infradead.org; Thu, 01 Nov 2018 09:13:55 +0000
From: Richard Weinberger <richard@nod.at>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: linux-mtd@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Russell Senior <russell@personaltelco.net>, Stable <stable@vger.kernel.org>
Subject: Re: [PATCH] ubifs: Handle re-linking of inodes correctly while
 recovery
Date: Thu, 01 Nov 2018 10:13:29 +0100
Message-ID: <6483105.q6B1KMqZtl@blindfold>
In-Reply-To: <CACna6rxJBR=uUfVv3tBfwyKHvK_4HhEy7rD6f66n0o8FkPmmhQ@mail.gmail.com>
References: <20181028214407.20965-1-richard@nod.at>
 <CACna6rxJBR=uUfVv3tBfwyKHvK_4HhEy7rD6f66n0o8FkPmmhQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Donnerstag, 1. November 2018, 09:55:53 CET schrieb Rafa=C5=82 Mi=C5=82ec=
ki:
> On Sun, 28 Oct 2018 at 22:44, Richard Weinberger <richard@nod.at> wrote:
> > UBIFS's recovery code strictly assumes that a deleted inode will never
> > come back, therefore it removes all data which belongs to that inode
> > as soon it faces an inode with link count 0 in the replay list.
> > Before O_TMPFILE this assumption was perfectly fine. With O_TMPFILE
> > it can lead to data loss upon a power-cut.
> >
> > Consider a journal with entries like:
> > 0: inode X (nlink =3D 0) /* O_TMPFILE was created */
> > 1: data for inode X /* Someone writes to the temp file */
> > 2: inode X (nlink =3D 0) /* inode was changed, xattr, chmod, =E2=80=A6 =
*/
> > 3: inode X (nlink =3D 1) /* inode was re-linked via linkat() */
> >
> > Upon replay of entry #2 UBIFS will drop all data that belongs to inode =
X,
> > this will lead to an empty file after mounting.
> >
> > As solution for this problem, scan the replay list for a re-link entry
> > before dropping data.
> >
> > Fixes: 474b93704f32 ("ubifs: Implement O_TMPFILE")
> > Cc: stable@vger.kernel.org
> > Reported-by: Russell Senior <russell@personaltelco.net>
> > Reported-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> > Signed-off-by: Richard Weinberger <richard@nod.at>
>=20
> Thank you Richard!!!
>=20
> Tested-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

Thanks for testing and providing the reproducer!
I'll send a v2 of the patch soon where I've optimized the list scanning mor=
e.
In fact, the correct and fasted approach is walking the replay list backwar=
ds
to find the final link state of an inode.

Thanks,
//richard

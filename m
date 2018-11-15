Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNG9w-0004Dj-Dc
 for linux-mtd@lists.infradead.org; Thu, 15 Nov 2018 11:50:11 +0000
Received: by mail-wm1-x342.google.com with SMTP id f19-v6so15699855wmb.0
 for <linux-mtd@lists.infradead.org>; Thu, 15 Nov 2018 03:49:57 -0800 (PST)
MIME-Version: 1.0
References: <20181107220443.29573-1-richard@nod.at>
In-Reply-To: <20181107220443.29573-1-richard@nod.at>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Thu, 15 Nov 2018 12:49:44 +0100
Message-ID: <CACna6ryKs4LcSK8-FY3MB27O4b7MJqVROaSTQKtpGkqqZoQS7g@mail.gmail.com>
Subject: Re: [PATCH v2] ubifs: Handle re-linking of inodes correctly while
 recovery
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Stable <stable@vger.kernel.org>,
 Russell Senior <russell@personaltelco.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 7 Nov 2018 at 23:04, Richard Weinberger <richard@nod.at> wrote:
> UBIFS's recovery code strictly assumes that a deleted inode will never
> come back, therefore it removes all data which belongs to that inode
> as soon it faces an inode with link count 0 in the replay list.
> Before O_TMPFILE this assumption was perfectly fine. With O_TMPFILE
> it can lead to data loss upon a power-cut.
>
> Consider a journal with entries like:
> 0: inode X (nlink =3D 0) /* O_TMPFILE was created */
> 1: data for inode X /* Someone writes to the temp file */
> 2: inode X (nlink =3D 0) /* inode was changed, xattr, chmod, =E2=80=A6 */
> 3: inode X (nlink =3D 1) /* inode was re-linked via linkat() */
>
> Upon replay of entry #2 UBIFS will drop all data that belongs to inode X,
> this will lead to an empty file after mounting.
>
> As solution for this problem, scan the replay list for a re-link entry
> before dropping data.
>
> Fixes: 474b93704f32 ("ubifs: Implement O_TMPFILE")
> Cc: stable@vger.kernel.org
> Cc: Russell Senior <russell@personaltelco.net>
> Cc: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> Reported-by: Russell Senior <russell@personaltelco.net>
> Reported-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> Signed-off-by: Richard Weinberger <richard@nod.at>

Thank you!!!

Tested-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

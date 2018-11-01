Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gI8m1-0005Qk-52
 for linux-mtd@lists.infradead.org; Thu, 01 Nov 2018 08:56:18 +0000
Received: by mail-wr1-x442.google.com with SMTP id y16so19292822wrw.3
 for <linux-mtd@lists.infradead.org>; Thu, 01 Nov 2018 01:56:06 -0700 (PDT)
MIME-Version: 1.0
References: <20181028214407.20965-1-richard@nod.at>
In-Reply-To: <20181028214407.20965-1-richard@nod.at>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Thu, 1 Nov 2018 09:55:53 +0100
Message-ID: <CACna6rxJBR=uUfVv3tBfwyKHvK_4HhEy7rD6f66n0o8FkPmmhQ@mail.gmail.com>
Subject: Re: [PATCH] ubifs: Handle re-linking of inodes correctly while
 recovery
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Russell Senior <russell@personaltelco.net>,
 Stable <stable@vger.kernel.org>
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

On Sun, 28 Oct 2018 at 22:44, Richard Weinberger <richard@nod.at> wrote:
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
> Reported-by: Russell Senior <russell@personaltelco.net>
> Reported-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> Signed-off-by: Richard Weinberger <richard@nod.at>

Thank you Richard!!!

Tested-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

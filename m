Received: from mail-ey0-f177.google.com ([209.85.215.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SJQIN-0008Hw-6J
 for linux-mtd@lists.infradead.org; Sun, 15 Apr 2012 14:19:16 +0000
Received: by eaak13 with SMTP id k13so1092569eaa.36
 for <linux-mtd@lists.infradead.org>; Sun, 15 Apr 2012 07:19:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.00.1204151350450.13924@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1204151350450.13924@eristoteles.iwoars.net>
Date: Sun, 15 Apr 2012 11:19:11 -0300
Message-ID: <CAOMZO5BL8bKauB6-srbZCLapHJNAVRqB0g0uw+17_h1wy3_9-g@mail.gmail.com>
Subject: Re: mtdchar kernel oops
From: Fabio Estevam <festevam@gmail.com>
To: Joel Reardon <joel@clambassador.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Apr 15, 2012 at 8:58 AM, Joel Reardon <joel@clambassador.com> wrote=
:
> I think that this patch:
> "mtdchar: kill persistently held vfsmount"
> http://permalink.gmane.org/gmane.linux.kernel.commits.head/314175
>
> has started causing kernel oops's when running ubiformat. The oops is
> occuring in fs/namespace.c's mnt_add_count() line:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0this_cpu_add(mnt->mnt_pcp->mnt_count, n);

I also see kernel oops when running flash_eraseall on a SPI NOR flash.

If this patch is reverted the flash_eraseall operation is successful.

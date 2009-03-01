Received: from yw-out-1718.google.com ([74.125.46.153])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LdrvA-00059H-ST
	for linux-mtd@lists.infradead.org; Sun, 01 Mar 2009 20:05:59 +0000
Received: by yw-out-1718.google.com with SMTP id 4so1164241ywq.72
	for <linux-mtd@lists.infradead.org>;
	Sun, 01 Mar 2009 12:05:55 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20090301163512.17419.qmail@pro-236-98.rediffmailpro.com>
References: <20090301163512.17419.qmail@pro-236-98.rediffmailpro.com>
Date: Sun, 1 Mar 2009 14:05:55 -0600
Message-ID: <cb8016980903011205v76d9582en2cedc5e2a3190e6a@mail.gmail.com>
Subject: Re: nand with jffs2
From: Abraham Arce <abraham.arce.moreno@gmail.com>
To: Syed Ismail <ismail.riyaz@dyansys.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Syed,

On Sun, Mar 1, 2009 at 10:35 AM, Syed Ismail <ismail.riyaz@dyansys.com> wro=
te:
>
> Hi
> I am having problems using nand flash on my mx31 ads board. I use two 1 g=
b nand parts. I first want to ensure 1 gb works. File system used is jffs2 =
on linux 2.6.24.
> =A0If I make a mtd partition that has no bad blocks, I can erase it using=
 flash_eraseall =96j and then mount it with =96t jffs2 option. If I use thi=
s partition for root file system, it works fine, but some jffs2 warnings co=
me up, like crc errors.
> If I make a mtd partition that contain bad blocks, when mounting i get a =
lot of mtd-> read ecc errors, followed by jffs2 messages. It=92s like bad b=
locks are also being read, though when I do nand write, bad blocks get skip=
ped.
> The final 5 or 6 blocks always are shown as bad blocks when I do flash_er=
aseall( I have tried with four different chips). If my mtd partition contai=
ns these last 5 blocks, mounting gives input/output error, with messages of=
 "Cowardly refusing to erase blocks on filesystem with no valid JFFS2 nodes=
 ".

I was having same issue when trying to mount a onenand blockdevice
after formatted with -j option, are you using a OneNAND device?

# mount -t jffs2  /dev/mtdblock13 /mnt/flashdevice/
Cowardly refusing to erase blocks on filesystem with no valid JFFS2 nodes
empty_blocks 0, bad_blocks 9, c->nr_blocks 2025
mount: mounting /dev/mtdblock13 on /mnt/flashdevice/ failed

give a try erasing all without the -j option and mount again...

> One more thing is that, when I mount I get message of =93jffs2 not using =
oob=94.
> Can anyone help me here? Thanks

Best Regards
Abraham

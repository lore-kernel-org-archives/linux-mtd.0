Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OursJ-0000hU-B4
	for linux-mtd@lists.infradead.org; Sun, 12 Sep 2010 19:06:08 +0000
Received: by vws11 with SMTP id 11so4542994vws.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 12 Sep 2010 12:06:02 -0700 (PDT)
MIME-Version: 1.0
Sender: vapier.adi@gmail.com
In-Reply-To: <1284308851.1783.23.camel@brekeke>
References: <1284263480-31573-1-git-send-email-vapier@gentoo.org>
	<1284308851.1783.23.camel@brekeke>
From: Mike Frysinger <vapier@gentoo.org>
Date: Sun, 12 Sep 2010 15:05:42 -0400
Message-ID: <AANLkTinkp3O9uFhumuuBTq4T+Um9MSjFv3nb_byF0Q35@mail.gmail.com>
Subject: Re: [PATCH] nandwrite: add --nobad to write bad blocks
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
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

On Sun, Sep 12, 2010 at 12:27, Artem Bityutskiy wrote:
> On Sat, 2010-09-11 at 23:51 -0400, Mike Frysinger wrote:
>> Sometimes dumping bad blocks is useful, like when the block isn't actual=
ly
>> bad but the OOB layout isn't what the kernel is expecting or is otherwis=
e
>> screwed up. =C2=A0The --nobad option allows just that.
>
> How useful is this? I think instead you should implement the force flag
> we discussed and deal with 'otherwise screwed up' eraseblocks with
> flash_erase. I am afraid it is too dangerous to introduce this option.

i dont see how this is any more dangerous than adding an option to
force erasing of bad blocks ?  why should we be over protective of the
system ?  this is what got is into the existing rut of unrecoverable
blocks.

i find it useful during development to write out the content of pages
irregardless of the bad blocks and then read them back.  and for
recovering systems manually without having to resort to local access
to the bootloader.
-mike

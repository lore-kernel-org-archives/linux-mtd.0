Received: from mail-oi0-x22e.google.com ([2607:f8b0:4003:c06::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aYh1U-00012P-W3
 for linux-mtd@lists.infradead.org; Wed, 24 Feb 2016 21:31:06 +0000
Received: by mail-oi0-x22e.google.com with SMTP id x21so26465080oix.2
 for <linux-mtd@lists.infradead.org>; Wed, 24 Feb 2016 13:30:44 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <7F9DB42F7DDA544EA3EB31D694929A30EB84DA@PERU.autotrac.corp>
References: <7F9DB42F7DDA544EA3EB31D694929A30EB84DA@PERU.autotrac.corp>
Date: Wed, 24 Feb 2016 22:30:43 +0100
Message-ID: <CAFLxGvxbAoA_EJFe2rm8aSoyJowC02R1_8qV9g7thSpnH4LadA@mail.gmail.com>
Subject: Re: Filesystems over UBI can't handle badblocks
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Guilherme de Oliveira Costa <guilherme.oliveira@autotrac.com.br>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Feb 24, 2016 at 9:08 PM, Guilherme de Oliveira Costa
<guilherme.oliveira@autotrac.com.br> wrote:
> As you can see, UBI starts just fine, and I'm able to initialize ubiblk a=
nd at least mount the filesystem. I thought UBI was supposed to make any ba=
dblocks transparent to the upper layers... Is there a problem with that tou=
ght, or did my manual tampering (with nand markbad) got in the way of UBI's=
 bad block management capabilities?

So, you marked a block as bad, _after_ setting up UBI and your rootfs?
Well, this cannot work as from UBI's point of view the block is now
gone --> the rootfs is missing something.

--=20
Thanks,
//richard

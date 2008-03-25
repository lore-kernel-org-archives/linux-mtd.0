Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Je3C2-0005F0-9Q
	for linux-mtd@lists.infradead.org; Tue, 25 Mar 2008 07:03:34 +0000
Subject: Re: UBIFS: Does ubifs have volumes size min limitation?
From: Artem Bityutskiy <dedekind@infradead.org>
To: Nancy <nancydreaming@gmail.com>
In-Reply-To: <bae050c10803202323h371409dbg59517d86194ebf69@mail.gmail.com>
References: <bae050c10803202323h371409dbg59517d86194ebf69@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Tue, 25 Mar 2008 09:00:44 +0200
Message-Id: <1206428444.3856.6.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

On Fri, 2008-03-21 at 14:23 +0800, Nancy wrote:
> Hi,
>     The total size of mtd partitions which will be attached by ubi is 50M=
iB,
>    #ubimkvol -d 0 -n 0 -N ubifs -s 47MiB
>    # mount -t ubifs ubi0:ubifs /mnt/1
>    UBIFS error (pid 807): validate_sb: bad lsave_cnt
>    UBIFS error (pid 807): validate_sb: bad superblock
>    mount: mounting ubi0:ubifs on /mnt/1 failed: Invalid argument

Hmm... So you took an empty flash, attached it to UBI, and created this
volume? Or you used mkfs.ubifs utility?

Which version of UBIFS do you have (commit id)?

>    It is OK when the volume size is large.
Yes, should be fine.

>    Does ubifs have volumes size min limitation? why? and what is it exact=
ly?

Yes, it does have minimum volume size limitation, because it uses
several eraseblocks for internal purposes, for example it needs to
reserve at lease 2 LEBs for the FS indexing tree, for LEB properties
information, for Garbage collection, and so on. This is why.

Vs. "what is it exactly", I'm not sure. I guess we never tested it with
very small volumes so far. I tried it with ~ 8 MiB volumes and it worked
fine.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)

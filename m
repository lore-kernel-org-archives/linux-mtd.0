Received: from mail-px0-f177.google.com ([209.85.212.177])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OELkh-0006pG-IJ
	for linux-mtd@lists.infradead.org; Tue, 18 May 2010 12:18:28 +0000
Received: by pxi1 with SMTP id 1so3145551pxi.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 18 May 2010 05:18:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1274182023.6930.7023.camel@macbook.infradead.org>
References: <AANLkTimB1DsCd8HuMDc9jgVOnOAE_PVd2ktssp3TIwxc@mail.gmail.com>
	<1274105441.6930.6920.camel@macbook.infradead.org>
	<1274182023.6930.7023.camel@macbook.infradead.org>
Date: Tue, 18 May 2010 15:18:25 +0300
Message-ID: <AANLkTikvuNiLD-n9Qvf10NmMU2KFQ25YPfM1oYfXtHE9@mail.gmail.com>
Subject: Re: [PATCH v5] mtd: Do not corrupt backing device of device node
	inode
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Jan Kara <jack@suse.cz>, Artem Bityutskiy <dedekind1@gmail.com>,
	linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>,
	Alexander Shishkin <virtuoso@slind.org>, linux-mtd@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel@vger.kernel.org, stable@kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 18, 2010 at 2:27 PM, David Woodhouse <dwmw2@infradead.org> wrot=
e:
> On Mon, 2010-05-17 at 15:10 +0100, David Woodhouse wrote:
>> Now you're just reimplementing iget().
>>
>> Can we just use iget_locked() to get the appropriate inode (using the
>> mtd device number as the inode number)? Then we don't need to bother
>> storing it in mtd->inode at all, and we can iput() the last refcount on
>> it when the chardevice is closed -- we don't need it to stick around
>> until the MTD device is destroyed.
>
> ... and we don't _want_ it to stick around until the MTD device is
> destroyed, either. We may actually unload the mtdchar module and its
> inodes will be destroyed when we unregister the fs type; we don't want
> stale pointers to them hanging around to be reused if/when we reload the
> mtdchar module later.
>
> I've committed a version which keeps it entirely within the mtdchar
> code: http://git.infradead.org/mtd-2.6.git/commitdiff/cd874237

Looks ok. Thank you.

What about stable@?

>
> Thanks.
>
> --
> David Woodhouse =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Open Source Technology Centre
> David.Woodhouse@intel.com =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Intel Corporatio=
n
>
>

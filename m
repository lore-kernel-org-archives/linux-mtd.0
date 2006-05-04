Received: from nz-out-0102.google.com ([64.233.162.202])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FbjKe-0003IH-7e
	for linux-mtd@lists.infradead.org; Thu, 04 May 2006 15:17:54 -0400
Received: by nz-out-0102.google.com with SMTP id o1so522053nzf
	for <linux-mtd@lists.infradead.org>;
	Thu, 04 May 2006 12:17:46 -0700 (PDT)
Message-ID: <6934efce0605041217k3d6da532uf7dc0bc0ad5037da@mail.gmail.com>
Date: Thu, 4 May 2006 12:17:45 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "Dan Merillat" <harik.attar@gmail.com>
In-Reply-To: <c0c067900605041137r2f90ebc7kd56a24c10c08152@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <c0c067900605031926w730bc9a3sed5c7eee03585b2b@mail.gmail.com>
	<Pine.LNX.4.64.0605032257120.28543@localhost.localdomain>
	<c0c067900605040020n74a74da8s4ed1c3cd0abc3fed@mail.gmail.com>
	<Pine.LNX.4.64.0605040909570.28543@localhost.localdomain>
	<c0c067900605041137r2f90ebc7kd56a24c10c08152@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: CFI Extended (Intel P30) problems on an ARM PXA255
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Then I started linux and ended
> up with the same deal, after a write whatever the first read happens
> to be returns 0x0080 and gets all sorts of wacky corruption errors.

Okay.  Instead of mounting jffs2...
start with an erased volume.
'dd if=3D/dev/mtdX of=3D/original_data bs=3D32 count=3D1'
try 'flash_eraseall' then
'dd if=3D/dev/mtdX of=3D/erased_data bs=3D32 count=3D1'
try 'echo "jared is cool" >> /dev/mtdX'
'dd if=3D/dev/mtdX of=3D/written_data bs=3D32 count=3D1'

Now what do each *_data contain?

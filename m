Received: from portal.weinmann.de ([62.8.140.122])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SMDvi-0003Ug-JM
 for linux-mtd@lists.infradead.org; Mon, 23 Apr 2012 07:43:27 +0000
From: "Voss, Nikolaus" <N.Voss@weinmann.de>
To: "'Brian Norris'" <computersforpeace@gmail.com>
Date: Mon, 23 Apr 2012 09:43:08 +0200
Subject: RE: [PATCH (mtd-utils)] mtd_write: fall back to old method on ENOMEM
Message-ID: <EF2E73589CA71846A15D0B2CDF79505D0905DB4705@wm021.weinmann.com>
References: <EF2E73589CA71846A15D0B2CDF79505D0905DB465E@wm021.weinmann.com>
 <CAN8TOE_GxjW+W7f53Uvfqe3Urs6mh3mHnSV36rvqk5=7kCKe4Q@mail.gmail.com>
In-Reply-To: <CAN8TOE_GxjW+W7f53Uvfqe3Urs6mh3mHnSV36rvqk5=7kCKe4Q@mail.gmail.com>
Content-Language: de-DE
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian Norris wrote on 2012-04-23:
> On Sun, Apr 22, 2012 at 10:45 PM, Voss, Nikolaus <N.Voss@weinmann.de> wro=
te:
>> MEMWRITE ioctl tries to kmalloc the whole data. With usual
>> eraseblock sizes of 128 KiB, on memory constrained systems
>> this can easily lead to ENOMEM due to memory fragmentation
>> even if there are plenty of free pages left e.g.:
>>=20
>> --------------------------------------------------------------
>>=20
>> libmtd: error!: MEMWRITE ioctl failed for eraseblock 55 (mtd6)
>> =A0 =A0 =A0 =A0error 12 (Cannot allocate memory)
>> ubiformat: error!: cannot write eraseblock 55
>> =A0 =A0 =A0 =A0 =A0 error 12 (Cannot allocate memory)
>=20
> What version of mtd-utils are using? I don't think ubiformat should be
> utilizing the MEMWRITE codepath anymore, since commit 71c76e7.

I used the latest release, 1.4.9. Commit 71c76e7 fixes my ubiformat
issue, thanks for hint.

[...]
> the "fall back" is because this ioctl doesn't exist on
> older kernels. If MEMWRITE is causing real problems for the intended
> use case (writing page data + OOB), then userspace or kernel-space
> should be tweaked. But it's really not a problem AFAIK, since it's
> real use is for page-at-a-time (data+OOB) writes from tools like
> nandwrite.

Ok, I see your point, thanks for the explanation. I agree completely.

Niko

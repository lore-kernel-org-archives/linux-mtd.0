Received: from mail-ob0-f177.google.com ([209.85.214.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TGmSh-0006CI-HD
 for linux-mtd@lists.infradead.org; Wed, 26 Sep 2012 07:55:16 +0000
Received: by obbta17 with SMTP id ta17so320556obb.36
 for <linux-mtd@lists.infradead.org>; Wed, 26 Sep 2012 00:55:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1348645345.24309.24.camel@sauron.fi.intel.com>
References: <1347875449-19318-1-git-send-email-zajec5@gmail.com>
 <1348645345.24309.24.camel@sauron.fi.intel.com>
Date: Wed, 26 Sep 2012 09:55:14 +0200
Message-ID: <CACna6rwPVzgQ1NA_yN5wdmW=TMw9ZpOLyf69ZSj2yYdK0gsZ1g@mail.gmail.com>
Subject: Re: [PATCH V3] mtd: basic (read only) driver for BCMA serial flash
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
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

2012/9/26 Artem Bityutskiy <dedekind1@gmail.com>:
> On Mon, 2012-09-17 at 11:50 +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
>> This registers MTD driver for serial flash platform device. Right now it
>> supports reading only, writing still has to be implemented.
>>
>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
>
> Can you please confirm that you tested this and the driver works in R/O
> mode just fine. If yes, I would also like to add a note that this is R/O
> to the Kconfig text. If it does not even work, I am willing to drop it.

OFC it works! :) It nicely cooperates with bcm47xxpart (partitions are
detected) and I can read mtd content (bootloader, nvram, etc.).

You're right, we miss info about R/O in Kconfig, I didn't think about this.

--=20
Rafa=C5=82

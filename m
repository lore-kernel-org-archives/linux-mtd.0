Received: from mail-bw0-f160.google.com ([209.85.218.160])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M9J2r-0002pB-P3
	for linux-mtd@lists.infradead.org; Wed, 27 May 2009 13:19:57 +0000
Received: by bwz4 with SMTP id 4so5256594bwz.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 27 May 2009 06:19:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1243426912.11172.9.camel@localhost.localdomain>
References: <1243240816.21646.102.camel@localhost.localdomain>
	<1243343316-6201-1-git-send-email-corentincj@iksaif.net>
	<1243426912.11172.9.camel@localhost.localdomain>
Date: Wed, 27 May 2009 15:19:46 +0200
Message-ID: <71cd59b00905270619s642868f5od0c30f913e61fa0f@mail.gmail.com>
Subject: Re: [PATCH] mkfs.ubifs: use libubi to format UBI volume
From: Corentin Chary <corentin.chary@gmail.com>
To: dedekind@infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 27, 2009 at 2:21 PM, Artem Bityutskiy
<dedekind@infradead.org> wrote:
> On Tue, 2009-05-26 at 15:08 +0200, Corentin Chary wrote:
>> libubi is now used to format directly UBI volume.
>> Typing mkfs.ubifs /dev/ubi0_0 is now possible.
>> dtypes should be ok as they are taken from UBIFS code.
>>
>> Signed-off-by: Corentin Chary <corentincj@iksaif.net>
>> ---
>> =A0Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A02 +-
>> =A0mkfs.ubifs/Makefile =A0 =A0 | =A0 =A05 +-
>> =A0mkfs.ubifs/lpt.c =A0 =A0 =A0 =A0| =A0 10 ++--
>> =A0mkfs.ubifs/mkfs.ubifs.c | =A0179 ++++++++++++++++++++++++++++++++++++=
+---------
>> =A0mkfs.ubifs/mkfs.ubifs.h | =A0 =A04 +-
>> =A0mkfs.ubifs/ubifs.h =A0 =A0 =A0| =A0 =A06 ++
>> =A06 files changed, 163 insertions(+), 43 deletions(-)
>
> Works fine. Good job, thanks!
>
> It would be 200% cool if you also provided a patch for
> mtd-www and just added a note that the UBIFS image may
> be written directly to the UBI volum, not jut to a file.
>
> I mean here:
> http://www.linux-mtd.infradead.org/faq/ubifs.html#L_mkfubifs
>
> :-)
>
> Pushed your patch, thanks!

Ok, I'll do that ASAP, but I believe I won't find the time before next week=
.
Thanks

--=20
Corentin Chary
http://xf.iksaif.net - http://uffs.org

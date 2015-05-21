Received: from mail-ie0-x236.google.com ([2607:f8b0:4001:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YvKeu-0005Xm-RJ
 for linux-mtd@lists.infradead.org; Thu, 21 May 2015 07:12:49 +0000
Received: by iepj10 with SMTP id j10so1888355iep.3
 for <linux-mtd@lists.infradead.org>; Thu, 21 May 2015 00:12:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150520213546.GN11598@ld-irv-0074>
References: <1431624773-4165-1-git-send-email-computersforpeace@gmail.com>
 <20150515195541.GL11598@ld-irv-0074>
 <20150518104501.GD3551@leverpostej>
 <20150518183442.GR11598@ld-irv-0074>
 <CAMuHMdUCj2AXk_0mAgRfAStrveHPi=Rp2g-b177zO_ode8NaCw@mail.gmail.com>
 <20150519013415.GV11598@ld-irv-0074>
 <CACna6rzpxoXEJbeRyxaR0wiPpWc_MmgvnqoW-dSw4fF-=EMM_g@mail.gmail.com>
 <20150520213546.GN11598@ld-irv-0074>
Date: Thu, 21 May 2015 09:12:25 +0200
Message-ID: <CACna6rxq5zOR=7LT2vdbioWp3nD0eBeELJ_d9pPk7VwTWhmStg@mail.gmail.com>
Subject: Re: [PATCH] Documentation: dt: mtd: replace "nor-jedec" binding with
 "jedec, spi-nor"
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Marek Vasut <marex@denx.de>, Pawel Moll <Pawel.Moll@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Stephen Warren <swarren@wwwdotorg.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Kumar Gala <galak@codeaurora.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 20 May 2015 at 23:35, Brian Norris <computersforpeace@gmail.com> wrote:
> On Tue, May 19, 2015 at 09:27:50AM +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
>> On 19 May 2015 at 03:34, Brian Norris <computersforpeace@gmail.com> wrot=
e:
>> > So how about the following patch? It seems like we'll need to be able =
to
>> > ignore useless 'modalias' values in cases like this:
>> >
>> >         // modalias =3D "shinynewdevice"
>> >         compatible =3D "myvendor,shinynewdevice", "jedec,spi-nor";
>> >
>> > and also if somebody leaves off the entire shinynewdevice string:
>> >
>> >         // modalias =3D "spi-nor"
>> >         compatible =3D "jedec,spi-nor";
>> >
>> > So we rework the spi-nor library to not reject "bad" names, and just
>> > fall back to autodetection, and we add the .of_match_table to properly
>> > catch all "jedec,spi-nor".
>>
>> That's nice but what about platforms using platform data instead of
>> DT? I would like to use some kind of "spi-nor" (with some prefix
>> *maybe*) for them too.
>
> For platform devices, you might as well just use the name of the driver,
> which is 'm25p80'. Isn't that how most platform devices are matched with
> drivers?

Yes and I think it's ugly because it keeps causing the warning about
read flash model not matching specified one (m25p80). Are you
seriously not going to allow platform stuff *clearly* request flash
model detection (JEDEC RDID OP)? Just because they don't use DT?

--=20
Rafa=C5=82

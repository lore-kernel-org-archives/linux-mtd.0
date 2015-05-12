MIME-Version: 1.0
In-Reply-To: <5550AA08.5060001@free-electrons.com>
References: <1431066079-19725-1-git-send-email-zajec5@gmail.com>
 <5550AA08.5060001@free-electrons.com>
Date: Tue, 12 May 2015 07:07:58 +0200
Message-ID: <CACna6rzSPzdCYLPBGYNZB4QKoU_kgPan7aS9p0KWwj0e78JcKg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: kirkwood: add "nor-jedec" flash compatible
 binding
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Simon Guinot <simon.guinot@sequanux.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11 May 2015 at 15:09, Gregory CLEMENT
<gregory.clement@free-electrons.com> wrote:
> On 08/05/2015 08:21, Rafa=C5=82 Mi=C5=82ecki wrote:
>> Starting with commits
>> 8ff16cf ("Documentation: devicetree: m25p80: add "nor-jedec" binding")
>> 1103b85 ("mtd: m25p80: bind to "nor-jedec" ID, for auto-detection")
>> we have "nor-jedec" binding indicating support for JEDEC identification.
>
> I have the same question that for mvebu: did you actually check that all
> the NOR flash referenced in the dts supports the JEDEC identification?

Yes, I checked *all* of them.


> Then again, if it id the case I will add it in mvebu/dt soon, unless Andr=
ew,
> Jason or any other developer who has submitted the dts is aware of a rest=
riction
> about applying it.

Please wait to see if the binding will be changed or not (tegre patch
thread discussion).

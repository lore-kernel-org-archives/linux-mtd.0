MIME-Version: 1.0
In-Reply-To: <5550A92A.2040408@free-electrons.com>
References: <1431066023-19479-1-git-send-email-zajec5@gmail.com>
 <5550A92A.2040408@free-electrons.com>
Date: Tue, 12 May 2015 07:00:41 +0200
Message-ID: <CACna6rz9cisJt492kPyzX2nbvsSCig-ubhr6eGAxnxHzUNTvag@mail.gmail.com>
Subject: Re: [PATCH] ARM: mvebu: add "nor-jedec" flash compatible binding
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Andrew Lunn <andrew@lunn.ch>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Jason Cooper <jason@lakedaemon.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11 May 2015 at 15:05, Gregory CLEMENT
<gregory.clement@free-electrons.com> wrote:
> On 08/05/2015 08:20, Rafa=C5=82 Mi=C5=82ecki wrote:
>> Starting with commits
>> 8ff16cf ("Documentation: devicetree: m25p80: add "nor-jedec" binding")
>> 1103b85 ("mtd: m25p80: bind to "nor-jedec" ID, for auto-detection")
>> we have "nor-jedec" binding indicating support for JEDEC identification.
>
> did you actually check that all the NOR flash referenced in the dts suppo=
rts
> the JEDEC identification?

Yes, I did, yes, they do.


> If it is the case I will add it in mvebu/dt soon.

Please drop this patch as there is a discussion (in tegra patch) about
renaming the binding to "jedec,spi-nor".

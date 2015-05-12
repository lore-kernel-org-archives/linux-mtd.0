MIME-Version: 1.0
In-Reply-To: <20150511132052.GH9347@dragon>
References: <1431066065-19644-1-git-send-email-zajec5@gmail.com>
 <20150511132052.GH9347@dragon>
Date: Tue, 12 May 2015 06:54:22 +0200
Message-ID: <CACna6ryDk2TTsXnVMbaica2T8-4Xo2tU40Ov6sq3FVkx_p=zhw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: imx: add "nor-jedec" flash compatible binding
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Shawn Guo <shawn.guo@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Sascha Hauer <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11 May 2015 at 15:20, Shawn Guo <shawn.guo@linaro.org> wrote:
> On Fri, May 08, 2015 at 08:21:05AM +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
>> Starting with commits
>> 8ff16cf ("Documentation: devicetree: m25p80: add "nor-jedec" binding")
>> 1103b85 ("mtd: m25p80: bind to "nor-jedec" ID, for auto-detection")
>> we have "nor-jedec" binding indicating support for JEDEC identification.
>>
>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
>
> Applied, thanks.

Thanks, unfortunately after some discussion started by tegra patch, it
may happen we will rename it to jedec,spi-nor :( If that happens, I'll
care to provide another patch. Sorry for the problem.

--=20
Rafa=C5=82

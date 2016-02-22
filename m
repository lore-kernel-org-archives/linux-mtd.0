MIME-Version: 1.0
In-Reply-To: <1439705605-9127-1-git-send-email-zajec5@gmail.com>
References: <1439705605-9127-1-git-send-email-zajec5@gmail.com>
Date: Mon, 22 Feb 2016 07:20:37 +0100
Message-ID: <CACna6rzi2NJW2JL0X4eLJOXDsLyvcsj+piBEbP6LWOUvOfctRw@mail.gmail.com>
Subject: Re: [PATCH] ARM: tegra: add "jedec,spi-nor" flash compatible binding
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Alexandre Courbot <gnurou@gmail.com>, linux-tegra@vger.kernel.org
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 16 August 2015 at 08:13, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrot=
e:
> Starting with commit 8947e396a829 ("Documentation: dt: mtd: replace
> "nor-jedec" binding with "jedec, spi-nor"") we have "jedec,spi-nor"
> binding indicating support for JEDEC identification.
>
> Use it for all flashes that are supposed to support READ ID op according
> to the datasheets.

Hi, for some reason it seems this patch wasn't applied. I didn't get
any comment and it was sent to all e-mails listed in MAINTAINERS in
TEGRA ARCHITECTURE SUPPORT
which I hope it enough.

Could someone pick it, please? FWIW you can find it in the patchwork:
http://patchwork.ozlabs.org/patch/507676/

MIME-Version: 1.0
In-Reply-To: <2A3DCF3DA181AD40BDE86A3150B27B6B0356BABFAE@dbde02.ent.ti.com>
References: <1285596710-25658-1-git-send-email-s-ghorai@ti.com>
	<1285596710-25658-5-git-send-email-s-ghorai@ti.com>
	<AANLkTikKMnzHR5DZqzGdJJbnCXhCpxKA7K2C2ZtPhNke@mail.gmail.com>
	<2A3DCF3DA181AD40BDE86A3150B27B6B0356BABFAE@dbde02.ent.ti.com>
Date: Thu, 4 Nov 2010 11:52:10 +0200
Message-ID: <AANLkTinOhBNUt+gvNb0MWiyHD8ZYgLDJPz8tc=p+CsVW@mail.gmail.com>
Subject: Re: [PATCH RESEND v5 4/5] omap: nand: ecc layout select from board
	file
From: Grazvydas Ignotas <notasas@gmail.com>
To: "Ghorai, Sukumar" <s-ghorai@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: "Artem.Bityutskiy@nokia.com" <Artem.Bityutskiy@nokia.com>,
	Tony Lindgren <tony@atomide.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Vimal Singh <vimal.newwork@gmail.com>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 4, 2010 at 3:02 AM, Ghorai, Sukumar <s-ghorai@ti.com> wrote:
>> -----Original Message-----
>> From: Grazvydas Ignotas [mailto:notasas@gmail.com]
>> Sent: Wednesday, November 03, 2010 6:33 PM
>> To: Ghorai, Sukumar
>> Cc: linux-omap@vger.kernel.org; linux-mtd@lists.infradead.org; linux-arm=
-
>> kernel@lists.infradead.org; Vimal Singh; Artem.Bityutskiy@nokia.com
>> Subject: Re: [PATCH RESEND v5 4/5] omap: nand: ecc layout select from
>> board file
>>
>> On Mon, Sep 27, 2010 at 5:11 PM, Sukumar Ghorai <s-ghorai@ti.com> wrote:
>> > This patch makes it possible to select sw or hw (different layout
>> options)
>> > ecc scheme supported by omap nand driver. =A0And hw ecc layout selecte=
d
>> for
>> > sdp and zoom boards, by default.
>> >
>> > Signed-off-by: Vimal Singh <vimalsingh@ti.com>
>> > Signed-off-by: Sukumar Ghorai <s-ghorai@ti.com>
>>
>> Any news on this? Commit 2c01946c accidentally (?) enabled hardware
>> ECC and now my board is broken, as the driver always used sw ecc and
>> my NAND partitions are formatted accordingly. We should at least
>> switch the default back to sw ecc, don't you think?
> [Ghorai]
> 1. which board you are working.
> 2. and the default layout is the same as previous
> + =A0 =A0 =A0 board_nand_data.ecc_opt =A0 =A0 =A0 =A0 =3D OMAP_ECC_HAMMIN=
G_CODE_DIFF_LAYOUT;

OMAP3 pandora.
What I wanted to say is that current mainline code has hw ECC forced
which is wrong for some boards, and this patch did not make into last
merge window, so NAND is broken. It would be good to take this patch
out of larger series you sent earlier and resend as a fix for -rc1, so
that NAND works on 2.6.37.  It's not too large and should probably be
ok for -rc2.

MIME-Version: 1.0
In-Reply-To: <1285596710-25658-5-git-send-email-s-ghorai@ti.com>
References: <1285596710-25658-1-git-send-email-s-ghorai@ti.com>
	<1285596710-25658-5-git-send-email-s-ghorai@ti.com>
Date: Wed, 3 Nov 2010 15:02:36 +0200
Message-ID: <AANLkTikKMnzHR5DZqzGdJJbnCXhCpxKA7K2C2ZtPhNke@mail.gmail.com>
Subject: Re: [PATCH RESEND v5 4/5] omap: nand: ecc layout select from board
	file
From: Grazvydas Ignotas <notasas@gmail.com>
To: Sukumar Ghorai <s-ghorai@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Artem.Bityutskiy@nokia.com, Vimal Singh <vimalsingh@ti.com>,
	linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 27, 2010 at 5:11 PM, Sukumar Ghorai <s-ghorai@ti.com> wrote:
> This patch makes it possible to select sw or hw (different layout options=
)
> ecc scheme supported by omap nand driver. =A0And hw ecc layout selected f=
or
> sdp and zoom boards, by default.
>
> Signed-off-by: Vimal Singh <vimalsingh@ti.com>
> Signed-off-by: Sukumar Ghorai <s-ghorai@ti.com>

Any news on this? Commit 2c01946c accidentally (?) enabled hardware
ECC and now my board is broken, as the driver always used sw ecc and
my NAND partitions are formatted accordingly. We should at least
switch the default back to sw ecc, don't you think?

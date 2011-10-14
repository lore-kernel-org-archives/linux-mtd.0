Received: from na3sys009aog114.obsmtp.com ([74.125.149.211])
	by canuck.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
	id 1REj48-0006SX-6t
	for linux-mtd@lists.infradead.org; Fri, 14 Oct 2011 14:48:53 +0000
Received: by mail-bw0-f47.google.com with SMTP id t8so2066806bka.6
	for <linux-mtd@lists.infradead.org>;
	Fri, 14 Oct 2011 07:48:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20111014143816.GA32633@logfs.org>
References: <CA+Xn3W3-JCqMKjiXi2cLCGm_bHtRx8RPsc9P5BoOS6YmbGZmHw@mail.gmail.com>
	<20111012164837.GA13691@logfs.org>
	<CA+Xn3W18bwZWzdjmRzEDUCqe3bVHnmW-7bJ_wvaoXpJxO1KmjQ@mail.gmail.com>
	<1318597412.12351.124.camel@sauron>
	<CA+Xn3W2P_+xdwwrvcBKREZmsj2O6=GOfyaywW-N2HhGwo0WzVg@mail.gmail.com>
	<20111014143816.GA32633@logfs.org>
Date: Fri, 14 Oct 2011 16:48:45 +0200
Message-ID: <CA+Xn3W0dDEYMm7TZiB-0R41Qtb1C7EaBJM9px==kWzaepMnz2g@mail.gmail.com>
Subject: Re: Make phram work with kernel cmdline args when built-in
From: "Fache, Herve" <h-fache@ti.com>
To: =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 14, 2011 at 16:38, J=C3=B6rn Engel <joern@logfs.org> wrote:
> If there were a way to get rid of the #ifdefs, I would certainly be in
> favor of that. =C2=A0While I am happy with the functional improvements, I
> would be even happier if the code looked less scarred.
>
> I wonder how everyone else does it. =C2=A0Those two driver surely can't b=
e
> the only ones that depend on module parameters for initialization.

Looks like it's just a matter of properly using 'phram_init_called'.
Shall I submit a new version of the patch that does that?

Herv=C3=A9
--=20
Texas Instruments France SA, 821 Avenue Jack Kilby, 06270 Villeneuve
Loubet. 036 420 040 R.C.S Antibes. Capital de EUR 753.920

From: Stefan Roese <sr@denx.de>
To: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 1/3 v3] mtd: physmap_of: Add multiple regions and
	concatenation support
Date: Thu, 16 Apr 2009 15:49:44 +0200
References: <1239883845-17804-1-git-send-email-sr@denx.de>
	<200904161537.59048.sr@denx.de>
	<fa686aa40904160646v75a98e02s446fd89c08cfebae@mail.gmail.com>
In-Reply-To: <fa686aa40904160646v75a98e02s446fd89c08cfebae@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200904161549.44841.sr@denx.de>
Cc: linuxppc-dev@ozlabs.org, devicetree-discuss@ozlabs.org,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 16 April 2009, Grant Likely wrote:
> >> Yup, still looks good to me. =A0What boards has this been tested on?
> >
> > I tested this version on PPC405EX Kilauea equipped only one "standard"
> > Spansion S29GL512 NOR chip. And a slightly modified version on an MPC83=
60
> > board (kmeter1) which is equipped with the Intel P30 part mentioned in
> > the bindings description. Slightly modified since this board support is
> > not yet pushed upstream and currently using v2.6.28 (physmap_of.c has
> > received minor modifications after 2.6.28 release).
>
> Okay.  It will be good to get this one into -next for some testing
> exposure.  Unless he asks me to do otherwise, I'll leave this one to
> David to pick up.

Understood. Thanks Grant.

Best regards,
Stefan

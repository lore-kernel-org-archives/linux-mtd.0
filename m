Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNpc9-0002Ti-F3
 for linux-mtd@lists.infradead.org; Wed, 12 Mar 2014 20:18:58 +0000
Received: by mail-pb0-f49.google.com with SMTP id jt11so25835pbb.22
 for <linux-mtd@lists.infradead.org>; Wed, 12 Mar 2014 13:18:33 -0700 (PDT)
Sender: Warner Losh <wlosh@bsdimp.com>
Content-Type: text/plain; charset=windows-1252
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
Subject: Re: [RFC PATCH v2 04/14] mtd: nand: define struct nand_timings
From: Warner Losh <imp@bsdimp.com>
In-Reply-To: <20140312190737.GA27388@obsidianresearch.com>
Date: Wed, 12 Mar 2014 14:18:27 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <5B3F0425-9D7A-4D22-86A0-2E870E25396A@gmail.com>
References: <1391006064-28890-1-git-send-email-b.brezillon.dev@gmail.com>
 <1391006064-28890-5-git-send-email-b.brezillon.dev@gmail.com>
 <531DC1A4.7010208@gmail.com> <20140311185554.GD31835@obsidianresearch.com>
 <53208F7D.8090104@gmail.com> <20140312190737.GA27388@obsidianresearch.com>
To: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Cc: devicetree@vger.kernel.org, Boris BREZILLON <b.brezillon.dev@gmail.com>,
 linux-doc@vger.kernel.org, dev@linux-sunxi.org, linux-kernel@vger.kernel.org,
 Rob Herring <rob.herring@calxeda.com>, linux-mtd@lists.infradead.org,
 Grant Likely <grant.likely@linaro.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mar 12, 2014, at 1:07 PM, Jason Gunthorpe =
<jgunthorpe@obsidianresearch.com> wrote:

> On Wed, Mar 12, 2014 at 05:46:53PM +0100, Boris BREZILLON wrote:
>> I'm not a big fan of this name. I think timing structs should not
>> contain onfi in their names, because these timings are also
>> available on non ONFI chips.
>=20
> Explicitly defering to the ONFI spec makes it clear what the
> definition of the timing parameter actually is.

This is good, since ONFI is a very public spec.

> If JEDEC has a different model then drivers will need to configure
> their interfaces a little differently.

JEDEC=92s spec is just a public as ONFI=92s, but in the past at least it =
has been difficult
to get without purchase.

> So we might end up with a jedec_sdr_timings too :|

And onfi_ddr_timings and jedec_ddr_timings since those timing modes are =
appearing
on shipping parts.

Warner

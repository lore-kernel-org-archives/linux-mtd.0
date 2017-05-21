Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dCSwC-00033a-Rg
 for linux-mtd@lists.infradead.org; Sun, 21 May 2017 15:38:35 +0000
Subject: Re: [OpenWrt-Devel] [RFC] Pre-seeded files/directories for UBIFS
To: Ralph Sennhauser <ralph.sennhauser@gmail.com>
References: <8f4afb8e-7e98-d59f-abb6-64190ed717f5@nod.at>
 <3dcf8aac-5b84-8ced-fcf1-9fe026861cd6@gmail.com>
 <20170520213654.6b6d18eb@gmail.com>
 <CAMuHMdXQ4Tc92njixXKiP_JgasvgFELR15hqFpk4DjvfT453EQ@mail.gmail.com>
 <b193086e-322b-16a6-0306-5d9c47068872@nod.at>
 <20170521142336.6bdc8782@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 LEDE Development List <lede-dev@lists.infradead.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Christoph Hellwig <hch@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 OpenWrt Development List <openwrt-devel@lists.openwrt.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <e23b704b-a73e-8829-5297-ad3ba7c2f95a@nod.at>
Date: Sun, 21 May 2017 17:38:04 +0200
MIME-Version: 1.0
In-Reply-To: <20170521142336.6bdc8782@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ralph,

Am 21.05.2017 um 14:23 schrieb Ralph Sennhauser:
> If the seeded ubifs could be generalized to snapshot support ala btrfs
> that would change things a lot as it would enable uses far beyond just
> factory reset. No idea how feasible that is but might be worth
> considering instead.

I thought about that too but this requires much more invasive changes
in UBIFS.
So I'm not sure whether it is worth the hassle.

Thanks,
//richard

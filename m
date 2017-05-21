Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dCMPf-0001v1-LX
 for linux-mtd@lists.infradead.org; Sun, 21 May 2017 08:40:33 +0000
Subject: Re: [OpenWrt-Devel] [RFC] Pre-seeded files/directories for UBIFS
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Ralph Sennhauser <ralph.sennhauser@gmail.com>
References: <8f4afb8e-7e98-d59f-abb6-64190ed717f5@nod.at>
 <3dcf8aac-5b84-8ced-fcf1-9fe026861cd6@gmail.com>
 <20170520213654.6b6d18eb@gmail.com>
 <CAMuHMdXQ4Tc92njixXKiP_JgasvgFELR15hqFpk4DjvfT453EQ@mail.gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 LEDE Development List <lede-dev@lists.infradead.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Christoph Hellwig <hch@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 OpenWrt Development List <openwrt-devel@lists.openwrt.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <b193086e-322b-16a6-0306-5d9c47068872@nod.at>
Date: Sun, 21 May 2017 10:40:05 +0200
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXQ4Tc92njixXKiP_JgasvgFELR15hqFpk4DjvfT453EQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Geert,

Am 21.05.2017 um 10:37 schrieb Geert Uytterhoeven:
> On Sat, May 20, 2017 at 9:36 PM, Ralph Sennhauser
> <ralph.sennhauser@gmail.com> wrote:
>> There is also the size consideration. Unless a seeded ubifs can get
>> close to squashfs in terms of compression there would still be a
>> use-case for squashfs with an ubifs overlay. My current root as ubifs
>> instead of squashfs is 76.8% bigger.
> 
> As seeded files are stored and kept unmodified, they could be stored in
> compressed form?

This is what UBIFS already does.

Thanks,
//richard

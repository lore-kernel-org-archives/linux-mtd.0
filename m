Date: Sun, 21 May 2017 14:23:36 +0200
From: Ralph Sennhauser <ralph.sennhauser@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Florian Fainelli
 <f.fainelli@gmail.com>, Artem Bityutskiy <dedekind1@gmail.com>, LEDE
 Development List <lede-dev@lists.infradead.org>, Adrian Hunter
 <adrian.hunter@intel.com>, Christoph Hellwig <hch@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, OpenWrt
 Development List <openwrt-devel@lists.openwrt.org>
Subject: Re: [OpenWrt-Devel] [RFC] Pre-seeded files/directories for UBIFS
Message-ID: <20170521142336.6bdc8782@gmail.com>
In-Reply-To: <b193086e-322b-16a6-0306-5d9c47068872@nod.at>
References: <8f4afb8e-7e98-d59f-abb6-64190ed717f5@nod.at>
 <3dcf8aac-5b84-8ced-fcf1-9fe026861cd6@gmail.com>
 <20170520213654.6b6d18eb@gmail.com>
 <CAMuHMdXQ4Tc92njixXKiP_JgasvgFELR15hqFpk4DjvfT453EQ@mail.gmail.com>
 <b193086e-322b-16a6-0306-5d9c47068872@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard

On Sun, 21 May 2017 10:40:05 +0200
Richard Weinberger <richard@nod.at> wrote:

> Geert,
> 
> Am 21.05.2017 um 10:37 schrieb Geert Uytterhoeven:
> > On Sat, May 20, 2017 at 9:36 PM, Ralph Sennhauser
> > <ralph.sennhauser@gmail.com> wrote:  
> >> There is also the size consideration. Unless a seeded ubifs can get
> >> close to squashfs in terms of compression there would still be a
> >> use-case for squashfs with an ubifs overlay. My current root as
> >> ubifs instead of squashfs is 76.8% bigger.  
> > 
> > As seeded files are stored and kept unmodified, they could be
> > stored in compressed form?  
> 
> This is what UBIFS already does.

Right, or it would be some 400-500% difference.

Another advantage of the squashfs with overlay came to mind. OpenWrt
doesn't do a factory reset per se but boots into a "failsafe" mode which
just doesn't mount the overlay. This allows to fix the overlay (some
screwed up config value which prevents connection) or to reset the
password for example without having to reinstall packages and
reconfigure the device from ground up. Wiping the overlay is basically
the last resort.

With the expectation distributions to use the same approach for as many
devices possible I see the seeded ubifs running out of users fast. Some
commercial vendor backporting it to a 3.10 kernel maybe?

If the seeded ubifs could be generalized to snapshot support ala btrfs
that would change things a lot as it would enable uses far beyond just
factory reset. No idea how feasible that is but might be worth
considering instead.

Ralph

> 
> Thanks,
> //richard

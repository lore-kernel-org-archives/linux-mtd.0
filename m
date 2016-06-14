Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bClIl-0005iB-7J
 for linux-mtd@lists.infradead.org; Tue, 14 Jun 2016 10:10:32 +0000
Subject: Re: UBIFS Encryption
To: Stefano Babic <sbabic@denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <575FD3A7.4050905@denx.de>
Cc: ezequiel@vanguardiasur.com.ar
From: Richard Weinberger <richard@nod.at>
Message-ID: <575FD7FE.8030107@nod.at>
Date: Tue, 14 Jun 2016 12:10:06 +0200
MIME-Version: 1.0
In-Reply-To: <575FD3A7.4050905@denx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

Am 14.06.2016 um 11:51 schrieb Stefano Babic:
> Hi,
> 
> I have the necessity to encrypt UBIFS - I have read that there is some
> movement about this, for example here:
> 
> 	http://lists.infradead.org/pipermail/linux-mtd/2016-March/066277.html
> 
> and some years ago there was another attempt:
> 
> 	https://patchwork.ozlabs.org/patch/150160/

File level encryption for UBIFS did not materialize yet because my customer
decided against encryption and the project degraded to a "would be a nice to
have feature I'll do in my spare time when I'm bored" state.

That said, the feature was requested a few times but nobody was willing to do
a proper implementation nor fund it so far.

> It looks like from patchwork that the above patch was merged, but it is
> not. Anyway, this looks as a starting point to add encryption /
> decryption routine, for example using crypto hardware, to the compress /
> decompress functions. In my understanding (I have a i.MX6 with CAAM
> crypto hardware), this can be possible - but I am asking here if there
> are some progress and which could be the best long term solution.

Please use the VFS approach like ext4 and f2fs do. That way a lot of existing
infra structure can re-used. Think of key management.

Thanks,
//richard

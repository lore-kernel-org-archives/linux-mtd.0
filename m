Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bxdWE-0002pa-7g
 for linux-mtd@lists.infradead.org; Fri, 21 Oct 2016 17:22:11 +0000
Subject: Re: [PATCH 15/26] ubifs: Implement encrypt/decrypt for all IO
To: Michael Halcrow <mhalcrow@google.com>
References: <1477054121-10198-1-git-send-email-richard@nod.at>
 <1477054121-10198-16-git-send-email-richard@nod.at>
 <20161021171439.GA17121@google.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, dedekind1@gmail.com, adrian.hunter@intel.com,
 tytso@mit.edu, jaegeuk@kernel.org, david@sigma-star.at, wd@denx.de,
 sbabic@denx.de, dengler@linutronix.de
From: Richard Weinberger <richard@nod.at>
Message-ID: <78f09113-fcc3-c2d2-9849-ba980cd9c0b4@nod.at>
Date: Fri, 21 Oct 2016 19:21:04 +0200
MIME-Version: 1.0
In-Reply-To: <20161021171439.GA17121@google.com>
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

On 21.10.2016 19:14, Michael Halcrow wrote:
> Compress-before-encrypt is a hazard.
> 
> http://www.iacr.org/cryptodb/archive/2002/FSE/3091/3091.pdf

I'm fully aware of that. But as usual it depends on the use case.
Compression is optional in UBIFS, paranoid users can disable it
when encryption is enabled.

Thanks,
//richard

Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghdzY-0005x8-8L
 for linux-mtd@lists.infradead.org; Thu, 10 Jan 2019 17:19:41 +0000
Date: Thu, 10 Jan 2019 18:19:28 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Richard
 Weinberger <richard@nod.at>, Brian Norris <computersforpeace@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Marek Vasut <marex@denx.de>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [GIT PULL] mtd: Fixes for 5.0-rc2
Message-ID: <20190110181928.0fba0019@bbrezillon>
In-Reply-To: <CAHk-=wgKMPd0R9dXkJ+49s-rt+=YHTKgBX2WhBieFzi88_=ZYQ@mail.gmail.com>
References: <20190110092531.766738a0@bbrezillon>
 <CAHk-=wgKMPd0R9dXkJ+49s-rt+=YHTKgBX2WhBieFzi88_=ZYQ@mail.gmail.com>
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

On Thu, 10 Jan 2019 09:16:12 -0800
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Thu, Jan 10, 2019 at 12:25 AM Boris Brezillon <bbrezillon@kernel.org> wrote:
> >
> > MTD Fixes:
> > - Fix a bug introduced when exposing MTD devs as NVMEM providers and
> >   check for add_mtd_device() return code everywhere  
> 
> Ahh, and this should fix the reported NULL pointer thing in sysfs.

Exactly.

> 
> Thanks, pulled.
> 
>                Linus

Message-ID: <1422407074.32234.2.camel@ellerman.id.au>
Subject: Re: [PATCH 0/4] defconfigs: cleanup obsolete MTD configs
From: Michael Ellerman <mpe@ellerman.id.au>
To: semen.protsenko@globallogic.com
Date: Wed, 28 Jan 2015 12:04:34 +1100
In-Reply-To: <CAJOTznWHpRh8ysVxwSWyvZL1UAe-G9A64j=M6z0+zPeoycgkDg@mail.gmail.com>
References: <1422117213-3130-1-git-send-email-semen.protsenko@globallogic.com>
 <1422118156.27947.7.camel@x220>
 <CAJOTznWHpRh8ysVxwSWyvZL1UAe-G9A64j=M6z0+zPeoycgkDg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mips@linux-mips.org, Paul Bolle <pebolle@tiscali.nl>,
 linux-am33-list@redhat.com, Russell King <linux@arm.linux.org.uk>,
 linux-sh@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 adi-buildroot-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Haavard Skinnemoen <hskinnemoen@gmail.com>, linux-m68k@lists.linux-m68k.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Koichi Yasutake <yasutake.koichi@jp.panasonic.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 Hans-Christian Egtvedt <egtvedt@samfundet.no>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2015-01-24 at 22:54 +0200, Sam Protsenko wrote:
> > That's news for me. I thought they are silently ignored. Do you have an
> > example of such a warning?
> 
> Not really. It was just assumption. It seems you are right, they are just
> ignored silently. But item 2 is still relevant and it was actually confused
> me when I tried to figure out MTD configuration for my platform.
> Anyway, garbage should be taken out from time to time.

The usual way that this gets dealt with is that arch maintainers (ir)regularly
run make savedefconfig on all their defconfigs.

As it happens we've done that on powerpc just recently, if you rebase onto next
you should see that, so you can drop the powerpc hunks from your patches. 

cheers

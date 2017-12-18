Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eQyEy-00008R-6c
 for linux-mtd@lists.infradead.org; Mon, 18 Dec 2017 16:26:10 +0000
Date: Mon, 18 Dec 2017 17:25:46 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "# 3.4.x"
 <stable@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: cfi: convert inline functions to macros
Message-ID: <20171218172546.56922b38@bbrezillon>
In-Reply-To: <63bc4b60-ca3f-2895-b202-cabd9a14e3ca@gmail.com>
References: <20171011135419.3492681-1-arnd@arndb.de>
 <2276602.9klaxVRupl@blindfold>
 <CAK8P3a36m56q08L+ORRfMdSBMKCefWpwuCF1viA2SGZWKvscmw@mail.gmail.com>
 <112272f3-7d2f-128f-4e76-e98d945c902f@gmail.com>
 <CAK8P3a0oQ003waB94Ca+MMAu9bUvXjrmBNXvcoJENieZ72Yx+Q@mail.gmail.com>
 <63bc4b60-ca3f-2895-b202-cabd9a14e3ca@gmail.com>
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

Hi Marek,

On Mon, 18 Dec 2017 11:38:20 +0100
Marek Vasut <marek.vasut@gmail.com> wrote:

> On 12/18/2017 11:29 AM, Arnd Bergmann wrote:
> > On Mon, Dec 18, 2017 at 10:18 AM, Marek Vasut <marek.vasut@gmail.com> wrote:  
> >> On 12/18/2017 10:16 AM, Arnd Bergmann wrote:  
> >>> On Sun, Dec 17, 2017 at 9:34 PM, Richard Weinberger <richard@nod.at> wrote:  
> >>>> Am Mittwoch, 11. Oktober 2017, 15:54:10 CET schrieb Arnd Bergmann:  
> >>>>> The map_word_() functions, dating back to linux-2.6.8, try to perform
> >>>>> bitwise operations on a 'map_word' structure. This may have worked
> >>>>> with compilers that were current then (gcc-3.4 or earlier), but end
> >>>>> up being rather inefficient on any version I could try now (gcc-4.4 or
> >>>>> higher). Specifically we hit a problem analyzed in gcc PR81715 where we
> >>>>> fail to reuse the stack space for local variables.  
> > ...  
> >>>>>
> >>>>> With the latest gcc-8 snapshot, the problem is fixed in upstream gcc,
> >>>>> but nobody uses that yet, so we should still work around it in mainline
> >>>>> kernels and probably backport the workaround to stable kernels as well.
> >>>>> We had a couple of other functions that suffered from the same gcc bug,
> >>>>> and all of those had a simpler workaround involving dummy variables
> >>>>> in the inline function. Unfortunately that did not work here, the
> >>>>> macro hack was the best I could come up with.
> >>>>>
> >>>>> It would also be helpful to have someone to a little performance testing
> >>>>> on the patch, to see how much it helps in terms of CPU utilitzation.
> >>>>>
> >>>>> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=81715
> >>>>> Cc: stable@vger.kernel.org
> >>>>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>  
> >>>>
> >>>> Acked-by: Richard Weinberger <richard@nod.at>  
> >>>
> >>> Thanks!
> >>>  
> >>>> Marek, I know you are not super happy with this patch but IMHO this is the
> >>>> solution with the least hassle.
> >>>> While functions offer better type checking I think this functions are trivial
> >>>> enough to exist as macros too.
> >>>> Also forcing users to upgrade/fix their compilers is only possible in a
> >>>> perfect world.  
> >>>
> >>> Right. To clarify, this is a potential security issue, as it might be used to
> >>> construct a stack overflow to cause privilege escalation when combined
> >>> with some other vulnerabilities. I'd definitely want this backported to
> >>> stable kernels as a precaution, and I'm preparing a patch to warn
> >>> about this kind of problem again in 'allmodconfig' kernels that
> >>> currently disable the warning on arm64 and x86.  
> >>
> >> Wouldn't it make more sense to fix the compiler instead ?
> >> This still feels like we're fixing a bug at the wrong place ...  
> > 
> > See above: the compiler is fixed in the gcc-8.x release branch,
> > which won't be out until next spring. People use all kinds of versions
> > as old as gcc-4.3, even if the fix was backported to older compilers
> > (which it is not), most users never rebuild their toolchains to get the
> > latest bugfix releases.
> > 
> > For instance, the Android SDK comes with prebuilt binaries of
> > a gcc-4.9-prerelease version that has many known bugs that
> > were fixed either by the time the official 4.9 release happened,
> > or in one of the bugfix releases following it.  
> 
> But doesn't this mean we're taking the OpenSSL path (which didn't work
> out well for them IIRC) ?
> 
> I don't have a better solution for this though ...
> 

I know you don't like this solution, but until you propose a real
alternative I decided to apply it. If you come up with something
better, I'll consider reverting this patch and applying yours.

Regards,

Boris

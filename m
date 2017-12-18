Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eQrXj-0001Tg-H9
 for linux-mtd@lists.infradead.org; Mon, 18 Dec 2017 09:17:05 +0000
Received: by mail-oi0-x244.google.com with SMTP id u193so10146595oie.1
 for <linux-mtd@lists.infradead.org>; Mon, 18 Dec 2017 01:16:43 -0800 (PST)
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
In-Reply-To: <2276602.9klaxVRupl@blindfold>
References: <20171011135419.3492681-1-arnd@arndb.de>
 <2276602.9klaxVRupl@blindfold>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 18 Dec 2017 10:16:41 +0100
Message-ID: <CAK8P3a36m56q08L+ORRfMdSBMKCefWpwuCF1viA2SGZWKvscmw@mail.gmail.com>
Subject: Re: [PATCH] mtd: cfi: convert inline functions to macros
To: Richard Weinberger <richard@nod.at>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 "# 3.4.x" <stable@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Dec 17, 2017 at 9:34 PM, Richard Weinberger <richard@nod.at> wrote:
> Am Mittwoch, 11. Oktober 2017, 15:54:10 CET schrieb Arnd Bergmann:
>> The map_word_() functions, dating back to linux-2.6.8, try to perform
>> bitwise operations on a 'map_word' structure. This may have worked
>> with compilers that were current then (gcc-3.4 or earlier), but end
>> up being rather inefficient on any version I could try now (gcc-4.4 or
>> higher). Specifically we hit a problem analyzed in gcc PR81715 where we
>> fail to reuse the stack space for local variables.
>>
>> This can be seen immediately in the stack consumption for
>> cfi_staa_erase_varsize() and other functions that (with CONFIG_KASAN)
>> can be up to 2200 bytes. Changing the inline functions into macros brings
>> this down to 1280 bytes.  Without KASAN, the same problem exists, but
>> the stack consumption is lower to start with, my patch shrinks it from
>> 920 to 496 bytes on with arm-linux-gnueabi-gcc-5.4, and saves around
>> 1KB in .text size for cfi_cmdset_0020.c, as it avoids copying map_word
>> structures for each call to one of these helpers.
>>
>> With the latest gcc-8 snapshot, the problem is fixed in upstream gcc,
>> but nobody uses that yet, so we should still work around it in mainline
>> kernels and probably backport the workaround to stable kernels as well.
>> We had a couple of other functions that suffered from the same gcc bug,
>> and all of those had a simpler workaround involving dummy variables
>> in the inline function. Unfortunately that did not work here, the
>> macro hack was the best I could come up with.
>>
>> It would also be helpful to have someone to a little performance testing
>> on the patch, to see how much it helps in terms of CPU utilitzation.
>>
>> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=81715
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Acked-by: Richard Weinberger <richard@nod.at>

Thanks!

> Marek, I know you are not super happy with this patch but IMHO this is the
> solution with the least hassle.
> While functions offer better type checking I think this functions are trivial
> enough to exist as macros too.
> Also forcing users to upgrade/fix their compilers is only possible in a
> perfect world.

Right. To clarify, this is a potential security issue, as it might be used to
construct a stack overflow to cause privilege escalation when combined
with some other vulnerabilities. I'd definitely want this backported to
stable kernels as a precaution, and I'm preparing a patch to warn
about this kind of problem again in 'allmodconfig' kernels that
currently disable the warning on arm64 and x86.

       Arnd

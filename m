Subject: Re: [PATCH] MTD: Add nand_ecc test module
From: Artem Bityutskiy <dedekind1@gmail.com>
To: vimal singh <vimal.newwork@gmail.com>
In-Reply-To: <ce9ab5790910142342h20e459e5oa89675dc172488b2@mail.gmail.com>
References: <1255082095-22158-1-git-send-email-akinobu.mita@gmail.com>
	<1255268381.16942.74.camel@localhost>
	<20091013095836.GA3166@localhost.localdomain>
	<1255534912.32489.172.camel@localhost>
	<ce9ab5790910142205u41f6baf3v570515eec116edb3@mail.gmail.com>
	<1255588590.32489.209.camel@localhost>
	<ce9ab5790910142342h20e459e5oa89675dc172488b2@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 15 Oct 2009 09:50:49 +0300
Message-Id: <1255589449.32489.215.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Akinobu Mita <akinobu.mita@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-10-15 at 12:12 +0530, vimal singh wrote:
> On Thu, Oct 15, 2009 at 12:06 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > On Thu, 2009-10-15 at 10:35 +0530, vimal singh wrote:
> >> On Wed, Oct 14, 2009 at 9:11 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> >> > On Tue, 2009-10-13 at 18:58 +0900, Akinobu Mita wrote:
> >> >> > This should not be needed. MTD tests are always compiled as modules,
> >> >> > so you should not have copilation errors. And if MTD NAND support is
> >> >> > not present, modprobe will just fail.
> >> >>
> >> >> nand_calculate_ecc and nand_correct_data needs CONFIG_MTD_NAND=y|m,
> >> >> otherwise it will get link error:
> >> >>
> >> >> ERROR: "__nand_correct_data" [drivers/mtd/tests/nand_ecc-test.ko] undefined!
> >> >> ERROR: "__nand_calculate_ecc" [drivers/mtd/tests/nand_ecc-test.ko] undefined!
> >> >
> >> > How about splitting tests on 2 parts - one part which does not require
> >> > NAND, and one which does, and make the second part compile only if NAND
> >> > is enabled ("depends" operator in Kconfig) ?
> >>
> >> I thought purpose of this test was to test correctness of
> >> 'nand_calculate_ecc' and 'nand_correct_data' functions (i.e. algos),
> >> which are only compiled and available when NAND is enabled.
> >
> > That is exactly what I meant as well.
> 
> Then, what do you meant to test in first part of test. Sorry if I am
> misinterpreting you statement above.

May be this is me who is misunderstanding. We have tests which work fine
with both NOR and NAND. But some tests work only on NOR. E.g., the
subpage test. We did not have _compile_ dependencies, so it was not a
problem. NAND-only tests just returned on !NANDs.

This new test requeres NAND support to be compiled.

So what I suggested, is to split the tests on 2 groups on the Kconfig
level, and make the NAND-only group depend on NAND support. This will
make them be compiled only if NAND support is there. Then this new test
will be part of the NAND-only group.

I'm not 100% sure this is nice approach, though. But #ifdef NAND things
in the test are ugly, IMO.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

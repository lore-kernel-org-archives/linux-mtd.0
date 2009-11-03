Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N5E7P-0007GT-7Q
	for linux-mtd@lists.infradead.org; Tue, 03 Nov 2009 07:48:00 +0000
Subject: Re: [PATCH] mtd: add lock fixup for AT49BV640D and AT49BV640DT chips
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
In-Reply-To: <20091103084433.7bc4d9fb@hcegtvedt.norway.atmel.com>
References: <1256817902-16534-1-git-send-email-hans-christian.egtvedt@atmel.com>
	<1257231914.21596.39.camel@localhost>
	<20091103084433.7bc4d9fb@hcegtvedt.norway.atmel.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 03 Nov 2009 09:47:43 +0200
Message-Id: <1257234463.21596.54.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-11-03 at 08:44 +0100, Hans-Christian Egtvedt wrote:
> On Tue, 03 Nov 2009 09:05:14 +0200
> Artem Bityutskiy <dedekind1@gmail.com> wrote:
> 
> <snipp Atmel AT49BV640D(T) powerup lock fixup patch>
> 
> > >  static void fixup_use_write_buffers(struct mtd_info *mtd, void *param)
> > >  {
> > >  	struct map_info *map = mtd->priv;
> > > @@ -313,6 +319,8 @@ static struct cfi_fixup fixup_table[] = {
> > >  	 * we know that is the case.
> > >  	 */
> > >  	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_use_point, NULL },
> > > +	{ CFI_MFR_ATMEL, AT49BV640D, fixup_use_at49bv640dx_lock, NULL },
> > > +	{ CFI_MFR_ATMEL, AT49BV640DT, fixup_use_at49bv640dx_lock, NULL },
> > >  	{ 0, 0, NULL, NULL }
> > >  };
> > 
> > Why you add this to the fixup_table, not cfi_fixup_table?
> > 
> 
> It would probably be more appropriate to place it after the first Atmel
> fixup in the cfi_fixup_table, yes.
> 
> Really unsure why I ended up putting it in the fixup_table, because I
> used the fixup_unlock_powerup_lock as reference.
> 
> It is probably more correct that I set the FeatureSupport 0x20 (32)
> feature to indicate that the flash has "Instant block lock". I'll
> submit a v2 for the latter unless you have some other feedback?

The only other feed-back would be to CC Nicolas Pitre <nico@fluxnic.net>
when you re-submit v2.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

Received: from relay.atmel.no ([80.232.32.139])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N5E4M-00055X-JM
	for linux-mtd@lists.infradead.org; Tue, 03 Nov 2009 07:44:52 +0000
Date: Tue, 3 Nov 2009 08:44:33 +0100
From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
To: dedekind1@gmail.com
Subject: Re: [PATCH] mtd: add lock fixup for AT49BV640D and AT49BV640DT chips
Message-ID: <20091103084433.7bc4d9fb@hcegtvedt.norway.atmel.com>
In-Reply-To: <1257231914.21596.39.camel@localhost>
References: <1256817902-16534-1-git-send-email-hans-christian.egtvedt@atmel.com>
	<1257231914.21596.39.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 03 Nov 2009 09:05:14 +0200
Artem Bityutskiy <dedekind1@gmail.com> wrote:

<snipp Atmel AT49BV640D(T) powerup lock fixup patch>

> >  static void fixup_use_write_buffers(struct mtd_info *mtd, void *param)
> >  {
> >  	struct map_info *map = mtd->priv;
> > @@ -313,6 +319,8 @@ static struct cfi_fixup fixup_table[] = {
> >  	 * we know that is the case.
> >  	 */
> >  	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_use_point, NULL },
> > +	{ CFI_MFR_ATMEL, AT49BV640D, fixup_use_at49bv640dx_lock, NULL },
> > +	{ CFI_MFR_ATMEL, AT49BV640DT, fixup_use_at49bv640dx_lock, NULL },
> >  	{ 0, 0, NULL, NULL }
> >  };
> 
> Why you add this to the fixup_table, not cfi_fixup_table?
> 

It would probably be more appropriate to place it after the first Atmel
fixup in the cfi_fixup_table, yes.

Really unsure why I ended up putting it in the fixup_table, because I
used the fixup_unlock_powerup_lock as reference.

It is probably more correct that I set the FeatureSupport 0x20 (32)
feature to indicate that the flash has "Instant block lock". I'll
submit a v2 for the latter unless you have some other feedback?

-- 
Best regards,
Hans-Christian Egtvedt

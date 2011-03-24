Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q2fQ0-00061C-QF
	for linux-mtd@lists.infradead.org; Thu, 24 Mar 2011 07:57:21 +0000
Received: by wwi18 with SMTP id 18so6591825wwi.0
	for <linux-mtd@lists.infradead.org>;
	Thu, 24 Mar 2011 00:57:18 -0700 (PDT)
Subject: Re: [RFC] Handling of errors for AMD NOR (cfi_cmdset_0002) chips
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Alexander Stein <alexander.stein@systec-electronic.com>
In-Reply-To: <201103240845.04902.alexander.stein@systec-electronic.com>
References: <4D797E23.6070409@emcraft.com>
	<201103240845.04902.alexander.stein@systec-electronic.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 24 Mar 2011 09:55:23 +0200
Message-ID: <1300953323.2735.63.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Ilya Yanok <yanok@emcraft.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-03-24 at 08:45 +0100, Alexander Stein wrote:
> Hello,
> 
> On Friday 11 March 2011, 02:42:59 Ilya Yanok wrote:
> > current cfi_cmdset_0002.c code does not implement handling of error
> > statuses reported by the chip during write/erase and just waits for a
> > software timeout instead.
> > 
> > We think that proper handling of these conditions could help us to debug
> > the issue we have with the NOR flash and UBIFS so we'd like to implement
> > such handling.
> > 
> > I've tried to do this, please see my initial patch below. For now errors
> > are just reported via pr_debug().
> > 
> > I'd like to hear any comments. Am I doing things right or not? Maybe I'm
> > missing something?
> 
> I'm not that much into these cfi commands, but does this status check address 
> immediate finished flash erases?
> Let me explain: We have a NOR-Flash partition used for UBIFS. We noticed 
> ubiformat takes about 11 minutes to format it (~100MiB). In u-boot ubi create 
> takes about 2 _seconds_ iff the partition has been erased before.
> If the flash hasn't been erased before it takes about the same time.
> It seems u-boot can detect if the flash is already ready after invoking a 
> erase command on an empty sector while linux doesn't.
> I once checked the erase/format time for 1 sector in ubiformat:
> non-empty sector: ~1s
> empty-sector:    0.5s

That's just question of improving ubiformat a bit.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

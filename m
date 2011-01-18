Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pf7iU-0001Go-ND
	for linux-mtd@lists.infradead.org; Tue, 18 Jan 2011 09:19:14 +0000
Received: by fxm19 with SMTP id 19so6951241fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 18 Jan 2011 01:18:58 -0800 (PST)
Subject: Re: validate_sb: bad superblock, error 8 (Minimum UBI volume size
	for UBIFS image)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Andrew Murray <amurray@mpcdata.com>
In-Reply-To: <AANLkTikhFt32NA9Lhzh0LDCzQmem3tjJZTG1TnP6ugnK@mail.gmail.com>
References: <AANLkTikGddyMhxph92Dz7vpRNRKa2haQne7yxKBTKw3N@mail.gmail.com>
	<AANLkTikhFt32NA9Lhzh0LDCzQmem3tjJZTG1TnP6ugnK@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 18 Jan 2011 11:18:51 +0200
Message-ID: <1295342331.2470.99.camel@koala>
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

On Sat, 2011-01-15 at 10:48 +0000, Andrew Murray wrote:
> On 11 January 2011 09:47, Andrew Murray <amurray@mpcdata.com> wrote:
> >
> > Is there a way to determine the minimum UBI volume size which will
> > support a given UBIFS filesystem image?
> >
> 
> My conclusion is this (with my version of kernel and mkfs.ubifs tool):
> 
> (Min No. UBI Volume LEBS) = (jrn_lebs) + 3 + (log lebs) + (lpt_lebs) +
> (orph_lebs)
> 
> And these values can all be determined (or specified) by the
> mkfs.ubifs tool by using the verbose -v flag.
> 
> This seems to hold true - Does this seem reasonable?

These are definitions for ubifs-media.h kernel header file, and the
absolute minimum is UBIFS_MIN_LEB_CNT.

/*
 * The below constants define the absolute minimum values for various UBIFS
 * media areas. Many of them actually depend of flash geometry and the FS
 * configuration (number of journal heads, orphan LEBs, etc). This means that
 * the smallest volume size which can be used for UBIFS cannot be pre-defined
 * by these constants. The file-system that meets the below limitation will not
 * necessarily mount. UBIFS does run-time calculations and validates the FS
 * size.
 */

/* Minimum number of logical eraseblocks in the log */
#define UBIFS_MIN_LOG_LEBS 2
/* Minimum number of bud logical eraseblocks (one for each head) */
#define UBIFS_MIN_BUD_LEBS 3
/* Minimum number of journal logical eraseblocks */
#define UBIFS_MIN_JNL_LEBS (UBIFS_MIN_LOG_LEBS + UBIFS_MIN_BUD_LEBS)
/* Minimum number of LPT area logical eraseblocks */
#define UBIFS_MIN_LPT_LEBS 2
/* Minimum number of orphan area logical eraseblocks */
#define UBIFS_MIN_ORPH_LEBS 1
/*
 * Minimum number of main area logical eraseblocks (buds, 3 for the index, 1
 * for GC, 1 for deletions, and at least 1 for committed data).
 */
#define UBIFS_MIN_MAIN_LEBS (UBIFS_MIN_BUD_LEBS + 6)

/* Minimum number of logical eraseblocks */
#define UBIFS_MIN_LEB_CNT (UBIFS_SB_LEBS + UBIFS_MST_LEBS + \
                           UBIFS_MIN_LOG_LEBS + UBIFS_MIN_LPT_LEBS + \
                           UBIFS_MIN_ORPH_LEBS + UBIFS_MIN_MAIN_LEBS)
-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)

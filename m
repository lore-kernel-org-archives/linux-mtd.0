Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OYs3v-0006Pn-UR
	for linux-mtd@lists.infradead.org; Wed, 14 Jul 2010 02:51:08 +0000
Received: by bwz8 with SMTP id 8so1072754bwz.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 13 Jul 2010 19:51:06 -0700 (PDT)
Subject: Re: [PATCHv2 4/5] libmtd: add support for 64-bit offsets, OOB
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kevin Cernekee <cernekee@gmail.com>
In-Reply-To: <AANLkTilsz1EamG4I_45ey7dy0UTA0C3N9HWvz_dix2qN@mail.gmail.com>
References: <eb53f5a0215250d7e523de47d15b0d12@localhost>
	<c65631c48fb5d2de8d25f65bffa5e22d@localhost>
	<1279018143.31639.33.camel@localhost>
	<AANLkTilsz1EamG4I_45ey7dy0UTA0C3N9HWvz_dix2qN@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 14 Jul 2010 05:51:01 +0300
Message-Id: <1279075861.3212.23.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, jwboyer@gmail.com, saeed.bishara@gmail.com,
	vapier.adi@gmail.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-07-13 at 17:09 -0700, Kevin Cernekee wrote:
> On Tue, Jul 13, 2010 at 3:49 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > You should find out whether the new ioctl's are supported in
> > 'libmtd_open()'. This also means that all libmtd calls which need this
> > flag will need a 'libmtd_t desc' parameter.
> 
> Typically I just try the new ioctl first, then fall back to the old
> one if it returned -ENOTTY.  Could you recommend a way to detect the
> presence of the new ioctls from libmtd_open()?

Hmm, how about MEMERASE64 with start = length = -1? You can distinguish
between -ENOTTY and other error codes.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

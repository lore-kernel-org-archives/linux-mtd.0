Received: from mail-we0-x22a.google.com ([2a00:1450:400c:c03::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZ17p-0002Np-8D
 for linux-mtd@lists.infradead.org; Wed, 23 Oct 2013 16:17:38 +0000
Received: by mail-we0-f170.google.com with SMTP id u57so1073507wes.15
 for <linux-mtd@lists.infradead.org>; Wed, 23 Oct 2013 09:17:15 -0700 (PDT)
Message-ID: <1382545032.8882.3.camel@karhu.quadriga.com>
Subject: Re: problem with ecc errors and ubifs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Date: Wed, 23 Oct 2013 17:17:12 +0100
In-Reply-To: <alpine.DEB.2.00.1310221356080.28562@lnxricardw.se.axis.com>
References: <52666705.8040000@ammonit.com>
 <alpine.DEB.2.00.1310221356080.28562@lnxricardw.se.axis.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Steffen =?ISO-8859-1?Q?K=FChn?= <sk@ammonit.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2013-10-22 at 14:05 +0200, Ricard Wanderlof wrote:
> I know there have been discussions that when using ECC that can correct 
> more than a single bit in a given area, to not trigger scrubbing as soon 
> as a single bit goes bad, but use a threshold mechanism, so that scrubbing 
> is triggered first when, say, half the maximum amount of bits need 
> correcting (e.g. in your case when 4 bits need correcting), the reason 
> being that flashes which require multibit ecc tend to have bits here and 
> there that flip rather quickly after writing, so triggering on them leads 
> to undue scrubbing and hence wear on the flash.

We already have this stuff in mainline kernels for rather long time. See
the 'bitflip_threshold' variable in the mtd_info data structures. We
have a good piece of documentation in
Documentation/ABI/testing/sysfs-class-mtd

-- 
Best Regards,
Artem Bityutskiy

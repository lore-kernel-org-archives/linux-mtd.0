Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UDCES-0005hM-Pj
 for linux-mtd@lists.infradead.org; Wed, 06 Mar 2013 11:10:02 +0000
Message-ID: <1362568239.21850.29.camel@sauron>
Subject: Re: [PATCH v2] flash_otp_write: fix format string warning
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Date: Wed, 06 Mar 2013 13:10:39 +0200
In-Reply-To: <1362563020-14003-1-git-send-email-u.kleine-koenig@pengutronix.de>
References: <1362561546.21850.24.camel@sauron>
 <1362563020-14003-1-git-send-email-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, kernel@pengutronix.de
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2013-03-06 at 10:43 +0100, Uwe Kleine-König wrote:
> This fixes
> 	flash_otp_write.c: In function 'main':
> 	flash_otp_write.c:61:2: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'off_t' [-Wformat]
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Wait, sorry, I did not notice this at first, but I see that this is
already fixed by this commit:

commit f3f3a208048eac5f8b5752a17ebcd44db9230fd8
Author: Richard Genoud <richard.genoud@gmail.com>
Date:   Wed Sep 12 16:38:34 2012 +0200

    consistency between u_int32_t / off_t / off64_t
    
    We should use the off_t type instead of off64_t or u_int32_t as its
    length is controlled by the WITHOUT_LARGEFILE flag.
    
    Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
    Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

-- 
Best Regards,
Artem Bityutskiy

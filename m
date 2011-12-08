Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RYlz5-0007Qk-V7
 for linux-mtd@lists.infradead.org; Thu, 08 Dec 2011 21:58:32 +0000
Received: by laam7 with SMTP id m7so550151laa.36
 for <linux-mtd@lists.infradead.org>; Thu, 08 Dec 2011 13:58:30 -0800 (PST)
Subject: Re: [PATCH] mtdoops: fix the oops_page_used array size
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Roman Tereshonkov <roman.tereshonkov@nokia.com>
Date: Thu, 08 Dec 2011 23:58:27 +0200
In-Reply-To: <20111207152537.GA8719@nokia.com>
References: <1322563758-26317-1-git-send-email-roman.tereshonkov@nokia.com>
 <1323006318.9400.52.camel@sauron.fi.intel.com>
 <20111207152537.GA8719@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1323381509.2074.5.camel@koala>
Mime-Version: 1.0
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

On Wed, 2011-12-07 at 17:25 +0200, Roman Tereshonkov wrote:
> BITS_PER_LONG is equal to 32.
> If we want to allocate memory for 32 pages with one bit per page then
> 32 / BITS_PER_LONG  is equal to 1 byte that is 8 bits.
> To fix it we need to multiply the result by sizeof(unsigned long)
> equal to 4.

Ah, you are right. This should also go to the stable tree, I've
added Cc: stable@kernel.org

Pushed to l2-mtd-2.6.git thanks.

Artem.

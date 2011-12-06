Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RY2E5-0000iL-3v
 for linux-mtd@lists.infradead.org; Tue, 06 Dec 2011 21:06:57 +0000
Received: by laah2 with SMTP id h2so885376laa.36
 for <linux-mtd@lists.infradead.org>; Tue, 06 Dec 2011 13:06:55 -0800 (PST)
Subject: Re: [PATCH] mtd: pxa2xx-flash.c: It used to fall back to provided
 table.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, dwmw2@infradead.org
Date: Tue, 06 Dec 2011 23:06:51 +0200
In-Reply-To: <1321031180-6153-2-git-send-email-jic23@kernel.org>
References: <1321031180-6153-1-git-send-email-jic23@kernel.org>
 <1321031180-6153-2-git-send-email-jic23@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1323205614.2710.3.camel@koala>
Mime-Version: 1.0
Cc: dbaryshkov@gmail.com, Artem.Bityutskiy@nokia.com,
 linux-mtd@lists.infradead.org, Jonathan Cameron <jic23@cam.ac.uk>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-11-11 at 17:06 +0000, Jonathan Cameron wrote:
> From: Jonathan Cameron <jic23@cam.ac.uk>
> 
> Make this work again.
> 
> Signed-off-by: Jonathan Cameron <jic23@cam.ac.uk>

I guess this should be sent to Linus this merge window. David?

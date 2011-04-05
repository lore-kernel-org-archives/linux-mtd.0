Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q6y3N-0000Ux-UD
	for linux-mtd@lists.infradead.org; Tue, 05 Apr 2011 04:39:47 +0000
Received: by ewy3 with SMTP id 3so1931866ewy.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 04 Apr 2011 21:39:44 -0700 (PDT)
Subject: Re: [PATCH] MTD: Retry Read/Write Transfer Buffer Allocations
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Grant Erickson <marathon96@gmail.com>
In-Reply-To: <C9BF3A4C.27686%marathon96@gmail.com>
References: <C9BF3A4C.27686%marathon96@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 05 Apr 2011 07:39:41 +0300
Message-ID: <1301978381.2608.29.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jarkko Lavinen <jarkko.lavinen@nokia.com>, linux-mtd@lists.infradead.org,
	linux-kernel <linux-kernel@vger.kernel.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-04-04 at 09:05 -0700, Grant Erickson wrote:
> I propose a two-stage approach. This issue has been in the kernel for about
> six years. 
> 
> Can we take a modified version of Jarkko's or my simpler fixes for the first
> pass and then iterate toward the get_user_pages scatter/gather approach

Sure, I've just commented on your patch.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)

Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P7ODT-0004CW-4z
	for linux-mtd@lists.infradead.org; Sun, 17 Oct 2010 08:03:39 +0000
Received: by bwz7 with SMTP id 7so2806975bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 17 Oct 2010 01:03:38 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] mtd-utils: nanddump: Dynamic buffer, increase
	pagesize/oobsize
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
In-Reply-To: <1287189331-9475-1-git-send-email-computersforpeace@gmail.com>
References: <AANLkTi%3DXdvN2vGu7Z5M7jj%3Dz_qrx%3D9F93WiDnPYkcDgY@mail.gmail.com>
	<1287189331-9475-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 17 Oct 2010 11:00:34 +0300
Message-ID: <1287302434.1951.2.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-10-15 at 17:35 -0700, Brian Norris wrote:
> The buffers used for dumping page and OOB data needed dynamic
> allocation to help eliminate burdens for updating (i.e., every
> time there's a new OOB size we don't have to increase the sizes).
> 
> Also, there is no need to check flash chips for "standard sizes."
> With recent changes to the printing codebase, we should be able to
> handle arbitrary sizes with no problem.
> 
> More exit operations are now necessary on program failure, so
> "goto closeall" is used more liberally.
> 
> Also, common.h is included for the use of xmalloc.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---

Patches did not apply cleanly, but I've resolved conflicts an pushed
them, thank you.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

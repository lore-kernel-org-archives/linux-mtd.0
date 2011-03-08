Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pww7V-00023f-Tq
	for linux-mtd@lists.infradead.org; Tue, 08 Mar 2011 12:34:34 +0000
Received: by ewy23 with SMTP id 23so1952835ewy.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 08 Mar 2011 04:34:32 -0800 (PST)
Subject: Re: [PATCH v2] NAND: DaVinci: Removed header file that is not required
From: Artem Bityutskiy <dedekind1@gmail.com>
To: s-paulraj@ti.com
In-Reply-To: <1299523844-14034-1-git-send-email-s-paulraj@ti.com>
References: <1299523844-14034-1-git-send-email-s-paulraj@ti.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 08 Mar 2011 14:33:05 +0200
Message-ID: <1299587585.2754.28.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: davinci-linux-open-source@linux.davincidsp.com,
	linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-03-07 at 13:50 -0500, s-paulraj@ti.com wrote:
> From: Sandeep Paulraj <s-paulraj@ti.com>
> 
> The DaVinci NAND driver was including the mach-types.h header
> file.
> This prevented the DaVinci NAND driver from getting used
> in a DSP only device. The linux port on c6x devices can make
> use of the same driver and does not define a corresponding
> header file.
> 
> This header file was required in the driver because earlier there was code
> dependent on a machine_* check. This piece of code has now been factored out
> and is in arch/arm/mach-davinci/aemif.c
> 
> Thus removing the header file is harmless
> 
> Signed-off-by: Sandeep Paulraj <s-paulraj@ti.com>

Pushed to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

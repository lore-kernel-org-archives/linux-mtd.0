Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PwWKo-0007TN-8N
	for linux-mtd@lists.infradead.org; Mon, 07 Mar 2011 09:02:35 +0000
Received: by ewy23 with SMTP id 23so1267470ewy.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 07 Mar 2011 01:02:32 -0800 (PST)
Subject: Re: [PATCH] NAND: DaVinci: Removed header file that is not required
From: Artem Bityutskiy <dedekind1@gmail.com>
To: s-paulraj@ti.com
In-Reply-To: <1299019251-19518-1-git-send-email-s-paulraj@ti.com>
References: <1299019251-19518-1-git-send-email-s-paulraj@ti.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 07 Mar 2011 11:01:08 +0200
Message-ID: <1299488468.2746.7.camel@localhost>
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

On Tue, 2011-03-01 at 17:40 -0500, s-paulraj@ti.com wrote:
> From: Sandeep Paulraj <s-paulraj@ti.com>
> 
> The DaVinci NAND driver was including the mach-types.h header
> file.
> This prevented the DaVinci NAND driver from getting used
> in a DSP only device. The linux port on c6x devices can make
> use of the same driver and does not define a corresponding
> header file; so removing it.
> 
> Signed-off-by: Sandeep Paulraj <s-paulraj@ti.com>

Hi,

you explain why this include is bad for DSP. Buy you do not explain why
this include is there and why removing it is harmless for Linux.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

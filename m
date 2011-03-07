Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PwW8g-0007K5-1g
	for linux-mtd@lists.infradead.org; Mon, 07 Mar 2011 08:50:02 +0000
Received: by wwj40 with SMTP id 40so3589023wwj.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 07 Mar 2011 00:50:00 -0800 (PST)
Subject: Re: [PATCH v2 1/1] omap3: nand: report corrected ecc errors
From: Artem Bityutskiy <dedekind1@gmail.com>
To: John Ogness <john.ogness@linutronix.de>
In-Reply-To: <87y650pdc1.fsf_-_@vostro.fn.ogness.net>
References: <87oc64qr5b.fsf@vostro.fn.ogness.net>
	<1298631549.2798.56.camel@localhost>
	<87y650pdc1.fsf_-_@vostro.fn.ogness.net>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 07 Mar 2011 10:48:35 +0200
Message-ID: <1299487715.2746.1.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org, s-ghorai@ti.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-02-28 at 13:12 +0100, John Ogness wrote:
> From: John Ogness <john.ogness@linutronix.de>
> 
> The number of corrected ECC errors should be reported since other MTD
> systems make use of this information (such as UBI data scrubbing).
> 
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> ---
> Patch v2:
> o Patch against linux-next-20110225.
> o Added comments explaining return codes.

Pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QKVUD-0001w0-Q3
	for linux-mtd@lists.infradead.org; Thu, 12 May 2011 12:59:30 +0000
Received: by eyh6 with SMTP id 6so489207eyh.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 May 2011 05:59:24 -0700 (PDT)
Subject: Re: [PATCH RESEND] omap : nand : fix subpage ecc issue with prefetch
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kishore Kadiyala <kishore.kadiyala@ti.com>
In-Reply-To: <1305128847-12987-1-git-send-email-kishore.kadiyala@ti.com>
References: <1305128847-12987-1-git-send-email-kishore.kadiyala@ti.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 12 May 2011 15:56:00 +0300
Message-ID: <1305204960.14423.0.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Vimal Singh <vimal.newwork@gmail.com>, linux-omap@vger.kernel.org,
	linux-mtd@lists.infradead.org, stable@kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-05-11 at 21:17 +0530, Kishore Kadiyala wrote:
> When reading/writing a subpage (When HW ECC is not available/enabled)
> for number of bytes not aligned to 4, the mis-aligned bytes are handled
> first (by cpu copy method) before enabling the Prefetch engine to/from
> 'p'(start of buffer 'buf'). Then it reads/writes rest of the bytes with
> the help of Prefetch engine, if available, or again using cpu copy method.
> Currently, reading/writing of rest of bytes, is not done correctly since
> its trying to read/write again to/from begining of buffer 'buf',
> overwriting the mis-aligned bytes.
> 
> Read & write using prefetch engine got broken in commit '2c01946c'.
> We never hit a scenario of not getting 'gpmc_prefetch_enable' call
> success. So, problem did not get caught up.
> 
> Signed-off-by: Kishore Kadiyala <kishore.kadiyala@ti.com>
> Signed-off-by: Vimal Singh <vimal.newwork@gmail.com>
> Reported-by: Bryan DE FARIA <bdefaria@adeneo-embedded.com>
> Cc: stable@kernel.org [2.6.35+]

Pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

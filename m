Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QI3fA-0000J6-8d
	for linux-mtd@lists.infradead.org; Thu, 05 May 2011 18:52:36 +0000
Received: by ewy3 with SMTP id 3so844812ewy.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 05 May 2011 11:52:34 -0700 (PDT)
Subject: Re: [PATCH] omap : nand : fix subpage ecc issue with prefetch
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kishore Kadiyala <kishore.kadiyala@ti.com>
In-Reply-To: <1304334638-2198-1-git-send-email-kishore.kadiyala@ti.com>
References: <1304334638-2198-1-git-send-email-kishore.kadiyala@ti.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 05 May 2011 21:48:58 +0300
Message-ID: <1304621338.7222.55.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: bdefaria@adeneo-embedded.com, vimal.newwork@gmail.com,
	linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-05-02 at 16:40 +0530, Kishore Kadiyala wrote:
> For prefetch engine, read and write  got broken in commit '2c01946c'.
> We never hit a scenario of not getting 'gpmc_prefetch_enable'
> call success.
> When reading/writing a subpage with a non divisible by 4 ecc number
> of bytes, the mis-aligned bytes gets handled first before enabling
> the Prefetch engine, then it reads/writes rest of the bytes.
> 
> Signed-off-by: Kishore Kadiyala <kishore.kadiyala@ti.com>
> Signed-off-by: Vimal Singh <vimal.newwork@gmail.com>
> Reported-by: Bryan DE FARIA <bdefaria@adeneo-embedded.com>

This needs a better commit message with more explanation and analysis of
the problem and how it was fixed.This commit message is not very
understandable. And then it needs also:

Cc: stable@kernel.org [2.6.36+]

Right? And then we could send it upstream.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

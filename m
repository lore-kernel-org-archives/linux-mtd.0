Received: from mail-yw0-f49.google.com ([209.85.213.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QsyVr-0003RU-K6
	for linux-mtd@lists.infradead.org; Mon, 15 Aug 2011 14:51:36 +0000
Received: by ywp17 with SMTP id 17so3368463ywp.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 Aug 2011 07:51:33 -0700 (PDT)
Subject: Re: [PATCH v3] mtd: eLBC NAND: update ecc_stats.corrected when
	lteccr available
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MichaelHench@gmail.com
Date: Mon, 15 Aug 2011 17:53:11 +0300
In-Reply-To: <CAHyXW61rWcoE0Wcd9K7BsP3+VKzmQo=RPMM9+1DTw+QdF9MVew@mail.gmail.com>
References: <CAHyXW61rWcoE0Wcd9K7BsP3+VKzmQo=RPMM9+1DTw+QdF9MVew@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1313419997.2600.8.camel@sauron>
Mime-Version: 1.0
Cc: scottwood@freescale.com, linuxppc-dev@ozlabs.org,
	linux-mtd@lists.infradead.org, mlcreech@gmail.com, mhench@elutions.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-07-26 at 15:07 -0500, Michael Hench wrote:
> update ecc_stats.corrected if LTECCR register is available.
> 
> v2: kernel standard C formatting
> 
> v3: kernel standard C formatting again, changed a comment to get under 80 chars
> 
> Signed-off-by: Michael Hench <MichaelHench@gmail.com>

Pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy

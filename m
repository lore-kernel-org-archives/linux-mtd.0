Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T1vVi-0006og-5W
 for linux-mtd@lists.infradead.org; Thu, 16 Aug 2012 08:32:58 +0000
Received: by wgbez12 with SMTP id ez12so1573314wgb.18
 for <linux-mtd@lists.infradead.org>; Thu, 16 Aug 2012 01:32:56 -0700 (PDT)
Date: Thu, 16 Aug 2012 11:32:54 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: dedekind1@gmail.com
Subject: Re: [PATCH 3/4] UBI: use the whole MTD device size to get
 bad_peb_limit
Message-ID: <20120816113254.2950cf36@pixies.home.jungo.com>
In-Reply-To: <1345043331.3393.151.camel@sauron.fi.intel.com>
References: <1341937423-16516-1-git-send-email-richard.genoud@gmail.com>
 <1341937423-16516-4-git-send-email-richard.genoud@gmail.com>
 <1345043331.3393.151.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Richard Genoud <richard.genoud@gmail.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

One more thing...

On Wed, 15 Aug 2012 18:08:51 +0300 Artem Bityutskiy <dedekind1@gmail.com> wrote:
>  config MTD_UBI_BEB_LIMIT
> -	int "Percentage of maximum expected bad eraseblocks"
> -	default 2
> -	range 0 25
> +	int "Maximum expected bad eraseblock count per 1024 eraseblocks"
> +	default 20
> +	range 2 256

Those defconfigs that explicilty set an original LIMIT should be
adjusted as well, as the units have changed, no?

Regards,
Shmulik

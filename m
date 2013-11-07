Received: from mail-pb0-x234.google.com ([2607:f8b0:400e:c01::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VeKjg-0000Ai-N4
 for linux-mtd@lists.infradead.org; Thu, 07 Nov 2013 08:14:41 +0000
Received: by mail-pb0-f52.google.com with SMTP id rr4so246345pbb.39
 for <linux-mtd@lists.infradead.org>; Thu, 07 Nov 2013 00:14:19 -0800 (PST)
Date: Thu, 7 Nov 2013 00:14:15 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] mtd: dataflash: Say if we find a device we don't support
Message-ID: <20131107081415.GH3805@norris.computersforpeace.net>
References: <1381925774-10301-1-git-send-email-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1381925774-10301-1-git-send-email-broonie@kernel.org>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linaro-kernel@lists.linaro.org, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org, Mark Brown <broonie@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 16, 2013 at 01:16:14PM +0100, Mark Brown wrote:
> From: Mark Brown <broonie@linaro.org>
> 
> Ensure that the error message if we identify a flash we don't know how to
> talk to is displayed on the console in order to aid diagnostics. While
> we're at convert the message to use dev_info() rather than our hand rolled
> version of it for consistency.
> 
> Signed-off-by: Mark Brown <broonie@linaro.org>

Pushed to l2-mtd.git. Thanks!

Brian

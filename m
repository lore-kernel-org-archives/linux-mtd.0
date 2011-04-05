Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q780w-0005zM-1O
	for linux-mtd@lists.infradead.org; Tue, 05 Apr 2011 15:17:54 +0000
Received: by eyh6 with SMTP id 6so160146eyh.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 05 Apr 2011 08:17:52 -0700 (PDT)
Subject: Re: [PATCH 16/34] nand/denali: Drop __TIME__ usage
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Michal Marek <mmarek@suse.cz>
In-Reply-To: <1302015561-21047-17-git-send-email-mmarek@suse.cz>
References: <1302015561-21047-1-git-send-email-mmarek@suse.cz>
	<1302015561-21047-17-git-send-email-mmarek@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 05 Apr 2011 18:15:11 +0300
Message-ID: <1302016511.2760.146.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	Chuanxiao Dong <chuanxiao.dong@intel.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-04-05 at 16:59 +0200, Michal Marek wrote:
> The kernel already prints its build timestamp during boot, no need to
> repeat it in random drivers and produce different object files each
> time.
> 
> Cc: Chuanxiao Dong <chuanxiao.dong@intel.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: linux-mtd@lists.infradead.org
> Signed-off-by: Michal Marek <mmarek@suse.cz>
> ---
>  drivers/mtd/nand/denali.c |    3 +--
>  1 files changed, 1 insertions(+), 2 deletions(-)

Pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

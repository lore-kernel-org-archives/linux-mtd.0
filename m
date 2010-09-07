Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OsuZ8-0001P8-MX
	for linux-mtd@lists.infradead.org; Tue, 07 Sep 2010 09:34:14 +0000
Received: by bwz13 with SMTP id 13so5207912bwz.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Sep 2010 02:34:09 -0700 (PDT)
Subject: Re: [PATCH 11/14] ubifs: check return code of ubifs_lpt_lookup
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kulikov Vasiliy <segooon@gmail.com>
In-Reply-To: <1283711580-7546-1-git-send-email-segooon@gmail.com>
References: <1283711580-7546-1-git-send-email-segooon@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 07 Sep 2010 12:32:39 +0300
Message-ID: <1283851959.2979.27.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	Julia Lawall <julia@diku.dk>, Tejun Heo <tj@kernel.org>,
	linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2010-09-05 at 22:33 +0400, Kulikov Vasiliy wrote:
> From: Vasiliy Kulikov <segooon@gmail.com>
> 
> Function ubifs_lpt_lookup may return ERR_PTR(...). Check for it.
> 
> Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
> ---

Pushed both patches to the UBIFS tree, thanks:

http://git.infradead.org/ubifs-2.6.git

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

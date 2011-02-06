Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pm6MU-0000hO-As
	for linux-mtd@lists.infradead.org; Sun, 06 Feb 2011 15:17:15 +0000
Received: by eyd9 with SMTP id 9so1807219eyd.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 06 Feb 2011 07:17:12 -0800 (PST)
Subject: Re: [PATCH 20/20] fs: ubifs: world-writable debugfs dump_* files
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Vasiliy Kulikov <segoon@openwall.com>
In-Reply-To: <cd575609cc07581a71ba925308d9d69c6e0c6d79.1296818921.git.segoon@openwall.com>
References: <cover.1296818921.git.segoon@openwall.com>
	<cd575609cc07581a71ba925308d9d69c6e0c6d79.1296818921.git.segoon@openwall.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 06 Feb 2011 17:16:19 +0200
Message-ID: <1297005379.4460.34.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: security@kernel.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-02-04 at 15:24 +0300, Vasiliy Kulikov wrote:
> Don't allow everybody to dump sensitive information about filesystems.
> 
> Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>

Good catch, thanks. I'll push this patch to the ubifs-2.6.git tree,
thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

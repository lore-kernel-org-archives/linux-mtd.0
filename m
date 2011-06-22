Received: from mail-pz0-f49.google.com ([209.85.210.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZG5H-0000kt-1w
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2011 05:34:39 +0000
Received: by pzk28 with SMTP id 28so333922pzk.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 21 Jun 2011 22:34:34 -0700 (PDT)
Subject: Re: [PATCH/Trivial] jffs2: Avoid unneeded 'if' before kfree
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jesper Juhl <jj@chaosbits.net>
Date: Wed, 22 Jun 2011 08:35:17 +0300
In-Reply-To: <alpine.LNX.2.00.1106132213500.30934@swampdragon.chaosbits.net>
References: <alpine.LNX.2.00.1106132213500.30934@swampdragon.chaosbits.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1308720921.18119.33.camel@sauron>
Mime-Version: 1.0
Cc: trivial@kernel.org, David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-06-13 at 22:16 +0200, Jesper Juhl wrote:
> kfree() deals gracefully with NULL pointers, so it's pointless to test for 
> one prior to calling it.
> This removes such a test from jffs2_scan_medium().
> 
> Signed-off-by: Jesper Juhl <jj@chaosbits.net>

Pushed to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy

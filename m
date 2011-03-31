Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5IQo-0003TQ-LI
	for linux-mtd@lists.infradead.org; Thu, 31 Mar 2011 14:01:03 +0000
Received: by wyb28 with SMTP id 28so2504257wyb.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 31 Mar 2011 07:01:00 -0700 (PDT)
Subject: Re: [PATCH] jffs2: unused variables cleanup in jffs2_lookup and
	jffs2_readdir
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
In-Reply-To: <20110322121102.GC5086@swordfish.minsk.epam.com>
References: <20110322121102.GC5086@swordfish.minsk.epam.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 31 Mar 2011 16:58:28 +0300
Message-ID: <1301579908.2828.83.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-03-22 at 14:11 +0200, Sergey Senozhatsky wrote:
> jffs2: cleanup unused jffs2_sb_info *c variable and JFFS2_SB_INFO call from jffs2_lookup 
> and jffs2_readdir
> 
> Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>

I amended the commit message and pushed this to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

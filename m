Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QbntF-0004L2-AJ
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2011 06:04:46 +0000
Received: by iwn35 with SMTP id 35so966004iwn.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 28 Jun 2011 23:04:43 -0700 (PDT)
Subject: Re: [PATCH] jffs2: use mutex_is_locked() in __jffs2_flush_wbuf()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Alexey Khoroshilov <khoroshilov@ispras.ru>
Date: Wed, 29 Jun 2011 09:05:34 +0300
In-Reply-To: <1309206090-2805-1-git-send-email-khoroshilov@ispras.ru>
References: <1309206090-2805-1-git-send-email-khoroshilov@ispras.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1309327538.23597.97.camel@sauron>
Mime-Version: 1.0
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

On Tue, 2011-06-28 at 00:21 +0400, Alexey Khoroshilov wrote:
> Use a helper to test if a mutex is held instead of a hack with
> mutex_trylock().
> 
> Signed-off-by: Alexey Khoroshilov <khoroshilov@ispras.ru>

Pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy

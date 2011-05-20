Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QNITB-0003mg-CN
	for linux-mtd@lists.infradead.org; Fri, 20 May 2011 05:41:54 +0000
Received: by ewy3 with SMTP id 3so1282407ewy.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 19 May 2011 22:41:51 -0700 (PDT)
Subject: Re: [PATCH 2/2] driver:mtd:fix the bad format in the mtdcore.c
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Wanlong Gao <wanlong.gao@gmail.com>
In-Reply-To: <1305642979-7419-2-git-send-email-wanlong.gao@gmail.com>
References: <1305642979-7419-1-git-send-email-wanlong.gao@gmail.com>
	<1305642979-7419-2-git-send-email-wanlong.gao@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 20 May 2011 08:38:00 +0300
Message-ID: <1305869880.2630.88.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, akpm@linux-foundation.org,
	dwmw2@infradead.org, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-05-17 at 22:36 +0800, Wanlong Gao wrote:
> From: Wanlong Gao <wanlong.gao@gmail.com>
> 
> Fix the bad format in the mtdcore.c.
> 
> Signed-off-by: Wanlong Gao <wanlong.gao@gmail.com>
> ---
>  drivers/mtd/mtdcore.c |   34 +++++++++++++++++-----------------
>  1 files changed, 17 insertions(+), 17 deletions(-)

This patch does not apply to my l2 tree because proc-related functions
have been re-worked recently, see

http://git.infradead.org/users/dedekind/l2-mtd-2.6.git/commit/b930b5a0cee30792579a1893a732a485c1f1f0ba

Please, send a patch on top of l2-mtd-2.6.git:

git://git.infradead.org/users/dedekind/l2-mtd-2.6.git

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

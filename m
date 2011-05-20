Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QNIPh-0003kl-BK
	for linux-mtd@lists.infradead.org; Fri, 20 May 2011 05:38:17 +0000
Received: by ewy3 with SMTP id 3so1281825ewy.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 19 May 2011 22:38:14 -0700 (PDT)
Subject: Re: [PATCH 1/2] driver:mtd:use the wrapped __get_mtd_device in
	get_mtd_device_nm
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Wanlong Gao <wanlong.gao@gmail.com>
In-Reply-To: <1305642979-7419-1-git-send-email-wanlong.gao@gmail.com>
References: <1305642979-7419-1-git-send-email-wanlong.gao@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 20 May 2011 08:34:25 +0300
Message-ID: <1305869665.2630.86.camel@localhost>
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
> Use the wrapped function __get_mtd_device in the function
> get_mtd_device_nm instead of these get device reference codes.
> 
> Signed-off-by: Wanlong Gao <wanlong.gao@gmail.com>

Pushed this patch to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

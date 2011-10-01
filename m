Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R9xs8-00014x-LQ
	for linux-mtd@lists.infradead.org; Sat, 01 Oct 2011 11:36:49 +0000
Received: by bkat2 with SMTP id t2so3516810bka.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 01 Oct 2011 04:36:46 -0700 (PDT)
Subject: Re: [PATCH] jffs2/security.c: local functions should be static
From: Artem Bityutskiy <dedekind1@gmail.com>
To: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Sat, 01 Oct 2011 14:39:47 +0300
In-Reply-To: <201109231556.15973.hartleys@visionengravers.com>
References: <201109231556.15973.hartleys@visionengravers.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1317469194.19426.86.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd <linux-mtd@lists.infradead.org>, dwmw2@infradead.org,
	Linux Kernel <linux-kernel@vger.kernel.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-09-23 at 15:56 -0700, H Hartley Sweeten wrote:
> Quiets the sparse noise:
> 
> warning: symbol 'jffs2_initxattrs' was not declared. Should it be static?
> 
> Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
> Cc: David Woodhouse <dwmw2@infradead.org>

Against which tree is this patch? My l2-mtd-2.6 tree does not have this
function, and it is based on Linux 3.1-rc2.

-- 
Best Regards,
Artem Bityutskiy

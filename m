Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PM0Q2-0001lf-4x
	for linux-mtd@lists.infradead.org; Fri, 26 Nov 2010 15:41:03 +0000
Received: by fxm16 with SMTP id 16so1073527fxm.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 26 Nov 2010 07:41:01 -0800 (PST)
Subject: Re: [PATCH 06/17][trivial] mtd: Remove unnecessary casts of void
	ptr returning alloc function return values
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jesper Juhl <jj@chaosbits.net>
In-Reply-To: <alpine.LNX.2.00.1011082327290.23697@swampdragon.chaosbits.net>
References: <alpine.LNX.2.00.1011082327290.23697@swampdragon.chaosbits.net>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 26 Nov 2010 17:40:28 +0200
Message-ID: <1290786028.2552.20.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kirk Lee <kirk@hpc.ee.ntu.edu.tw>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, trivial@kernel.org,
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

On Tue, 2010-11-09 at 00:09 +0100, Jesper Juhl wrote:
> Hi,
> 
> The [vk][cmz]alloc(_node) family of functions return void pointers which
> it's completely unnecessary/pointless to cast to other pointer types since
> that happens implicitly.
> 
> This patch removes such casts from drivers/mtd/

Pushed to l2-mtd-2.6.git, thanks.


-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5foD-0002d1-Hu
	for linux-mtd@lists.infradead.org; Fri, 01 Apr 2011 14:58:46 +0000
Received: by wwb39 with SMTP id 39so2999187wwb.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 01 Apr 2011 07:58:44 -0700 (PDT)
Subject: Re: [PATCH 0/2] do not select KALLSYMS_ALL
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Paulo Marques <pmarques@grupopie.com>
In-Reply-To: <4D948D52.4040708@grupopie.com>
References: <1301474416-8202-1-git-send-email-dedekind1@gmail.com>
	<4D948D52.4040708@grupopie.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 01 Apr 2011 17:56:16 +0300
Message-ID: <1301669776.2789.92.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Randy Dunlap <randy.dunlap@oracle.com>,
	MTD list <linux-mtd@lists.infradead.org>,
	lkml <linux-kernel@vger.kernel.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-03-31 at 15:18 +0100, Paulo Marques wrote:
> Artem Bityutskiy wrote:
> > [...]
> > I personally think KALLSYMS_ALL should be just merged with KALLSYMS and
> > disappear - we should have only one option. CONFIG_KALLSYMS_EXTRA_PASS should
> > die as well.
> 
> That sounds a little too extreme...
> 
> KALLSYMS is useful for most kernels, since it provides nice readable
> stack dumps for panics and BUG's.
> 
> KALLSYMS_ALL adds a lot of extra symbols that can be useful mostly to
> development kernels and shouldn't be used to add unnecessary bloat to
> user kernels.

Well, ok, I've measured how much is this "a lot". On an embedded arm
platform this makes the kernel only 1.5% larger.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

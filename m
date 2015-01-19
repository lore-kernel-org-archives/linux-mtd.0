Received: from mail-pd0-x22d.google.com ([2607:f8b0:400e:c02::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YDGbN-0002L8-Ah
 for linux-mtd@lists.infradead.org; Mon, 19 Jan 2015 17:59:02 +0000
Received: by mail-pd0-f173.google.com with SMTP id fp1so12942427pdb.4
 for <linux-mtd@lists.infradead.org>; Mon, 19 Jan 2015 09:58:39 -0800 (PST)
Date: Mon, 19 Jan 2015 09:58:35 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: Re: [PATCH] MTD: Deletion of checks before the function call "iounmap"
Message-ID: <20150119175835.GH9759@ld-irv-0074>
References: <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <54BBE87C.9020705@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54BBE87C.9020705@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Julia Lawall <julia.lawall@lip6.fr>, Kyungmin Park <kyungmin.park@samsung.com>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jan 18, 2015 at 06:08:12PM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 18 Jan 2015 17:30:23 +0100
> 
> The iounmap() function performs also input parameter validation.
> Thus the test around the call is not needed.

Is this guaranteed for all arch'es? I expect that it would be, but I see
that, for instance, ARM allows replaceable iounmap() for
subarchitectures. Also, I see checks for various sorts of static
mappings in ARM and x86; these likely (always?) cover the NULL case, but
they're not always straightforward.

Anyway, I'm essentially saying that I'd like to be 100% sure we have a
guarantee before dropping all these.

> This issue was detected by using the Coccinelle software.

What script? Hand-rolled I guess?

Brian

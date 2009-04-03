Received: from mail-qy0-f122.google.com ([209.85.221.122])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LppsU-0001nB-62
	for linux-mtd@lists.infradead.org; Fri, 03 Apr 2009 20:20:45 +0000
Received: by qyk28 with SMTP id 28so2483554qyk.28
	for <linux-mtd@lists.infradead.org>;
	Fri, 03 Apr 2009 13:20:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <49D5B351.5040601@nokia.com>
References: <a95a62fe0904021632l14ddb299l7818f2f2d32c20ac@mail.gmail.com>
	<49D5B351.5040601@nokia.com>
Date: Fri, 3 Apr 2009 13:20:37 -0700
Message-ID: <a95a62fe0904031320i2ce699ffm7aa94bce0a049bdd@mail.gmail.com>
Subject: Re: [PATCH] MTD: nandsim should delete its partitions on module
	unload
From: Kevin Cernekee <kpc.mtd@gmail.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 2, 2009 at 11:57 PM, Adrian Hunter <adrian.hunter@nokia.com> wrote:
> Doesn't nand_release() already do that?

Yes.  The problem I was seeing (attempt to reregister mtd* sysfs
entries) was caused by something else.  I retract the patch.

Thanks.

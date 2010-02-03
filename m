Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NcVjv-0005vs-Ie
	for linux-mtd@lists.infradead.org; Wed, 03 Feb 2010 03:17:20 +0000
Received: by yxe5 with SMTP id 5so632131yxe.24
	for <linux-mtd@lists.infradead.org>;
	Tue, 02 Feb 2010 19:17:14 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1265165796-24686-1-git-send-email-stanley.miao@windriver.com>
References: <1265165796-24686-1-git-send-email-stanley.miao@windriver.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Tue, 2 Feb 2010 22:16:54 -0500
Message-ID: <8bd0f97a1002021916w59fd9f1scc7f21ea929a6244@mail.gmail.com>
Subject: Re:
To: "Stanley.Miao" <stanley.miao@windriver.com>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Feb 2, 2010 at 21:56, Stanley.Miao wrote:
> During some BSP development process, I found some tools in mtd-utils
> contain legacy interfaces and it is not suitable with the current linux
> kernel. I post my patches here in case somebody else need them.

these are good, but i think people might want to keep support for
older kernels around.  so you'd have the code try the newer ioctls
first and if those fail, fall back to the old ones.
-mike

Received: from [2002:c35c:fd02::1] (helo=ZenIV.linux.org.uk)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZkP4W-0005MF-VQ
 for linux-mtd@lists.infradead.org; Fri, 09 Oct 2015 04:14:22 +0000
Date: Fri, 9 Oct 2015 05:13:51 +0100
From: Al Viro <viro@ZenIV.linux.org.uk>
To: Heiko Schocher <hs@denx.de>
Cc: linux-kernel@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] UBI: rename free variable
Message-ID: <20151009041351.GZ22011@ZenIV.linux.org.uk>
References: <1444361361-12219-1-git-send-email-hs@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1444361361-12219-1-git-send-email-hs@denx.de>
Sender: Al Viro <viro@ftp.linux.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 09, 2015 at 05:29:21AM +0200, Heiko Schocher wrote:
> rename free variable into not "free", as "free" prevents
> ubi sources compiling under U-Boot. So rename "free"
> into "pfree" where it is a pointer, and into "freel",
> where it is a free list.

Huh?  If U-Boot has free defined as an object-like macro, it's an outright bug
in U-Boot and it should be fixed there.  If it's something else, it looks like
a toolchain bug.   Details, please...

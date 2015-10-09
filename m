Received: from [2002:c35c:fd02::1] (helo=ZenIV.linux.org.uk)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZkQPM-0005sp-E3
 for linux-mtd@lists.infradead.org; Fri, 09 Oct 2015 05:39:57 +0000
Date: Fri, 9 Oct 2015 06:39:31 +0100
From: Al Viro <viro@ZenIV.linux.org.uk>
To: Heiko Schocher <hs@denx.de>
Cc: linux-kernel@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] UBI: rename free variable
Message-ID: <20151009053931.GA22011@ZenIV.linux.org.uk>
References: <1444361361-12219-1-git-send-email-hs@denx.de>
 <20151009041351.GZ22011@ZenIV.linux.org.uk>
 <56174518.3050906@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56174518.3050906@denx.de>
Sender: Al Viro <viro@ftp.linux.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 09, 2015 at 06:39:52AM +0200, Heiko Schocher wrote:
> Hello Al,
> Sorry, I should have added this info immediately into the patch ...
> 
> We have in U-Boot a compat.h file, in which we collect all things
> we need to make linux code running under U-Boot, and there we map
> kfree() to free(), see:
> 
> http://git.denx.de/?p=u-boot.git;a=blob;f=include/linux/compat.h;h=fbebf910addd994d265d21c4fbaa0a2f48f4ccb1;hb=996ec1dcc58a34b53891acde0ec5df9141b5fcc2#l58
> 
> So, if we use a var name "free", this will conflict ... and I get
> for example when compiling the UBI code:
> 
>   CC      drivers/mtd/ubi/fastmap.o
> drivers/mtd/ubi/fastmap.c: In function 'scan_pool':
> drivers/mtd/ubi/fastmap.c:475:3: error: called object 'free' is not a function
> 
> So with this patch, we have less differences to kernel files ...

Umm... wouldn't it be easier to replace that mix of #define and static inline
with uniform use of static inline, rather than playing whack-a-mole like
that?

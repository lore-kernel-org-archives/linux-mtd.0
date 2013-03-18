Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UHU0z-0005aU-SC
 for linux-mtd@lists.infradead.org; Mon, 18 Mar 2013 06:57:51 +0000
Message-ID: <1363589936.20738.6.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: remove ixp2000 driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Paul Bolle <pebolle@tiscali.nl>
Date: Mon, 18 Mar 2013 08:58:56 +0200
In-Reply-To: <1363214471.1335.19.camel@x61.thuisdomein>
References: <1363206974.1335.10.camel@x61.thuisdomein>
 <1363214471.1335.19.camel@x61.thuisdomein>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
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

On Wed, 2013-03-13 at 23:41 +0100, Paul Bolle wrote:
> On Wed, 2013-03-13 at 21:36 +0100, Paul Bolle wrote:
> > Support for the IXP2000 platform got removed in commit
> > c65f2abf54a6d07260f1fa64773154e1d7047961 ("ARM: remove ixp23xx and
> > ixp2000 platforms"). That commit removed the ARCH_IXP2000 Kconfig
> > symbol. This removes the last driver depending on that symbol.
> > 
> > Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
> 
> It turns out that Artem Bityutskiy has published a series of patches
> removing this and similar drivers just yesterday:
> http://lists.infradead.org/pipermail/linux-mtd/2013-March/046170.html 

Hi,

yes, this mtd driver is removed now, thanks!

-- 
Best Regards,
Artem Bityutskiy

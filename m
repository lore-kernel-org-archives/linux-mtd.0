In-Reply-To: <20160128000559.GA14270@google.com>
References: <CAKatumo13ZM2o3dK9_ouxzta-sxeiB5E236Qh5dfbnEBc9CuMw@mail.gmail.com>
 <1453910781.20662.35.camel@infinera.com> <20160128000559.GA14270@google.com>
To: computersforpeace@gmail.com
Cc: Artem Bityutskiy <dedekind1@gmail.com>, Deng Chao <deng.chao1@zte.com.cn>,
 David Woodhouse <dwmw2@infradead.org>,
 Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-mtd" <linux-mtd-bounces@lists.infradead.org>,
 Ming Liu <liu.ming50@gmail.com>, "sztomi89@gmail.com" <sztomi89@gmail.com>,
 Thomas Betker <thomas.betker@freenet.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 wangzaiwei <wangzaiwei@top-vision.cn>
MIME-Version: 1.0
Subject: Re: JFFS2 deadlock
From: Thomas.Betker@rohde-schwarz.com
Message-ID: <OF7C1394C5.2BBD0A26-ONC1257F48.002BF506-C1257F48.002D6C9C@rohde-schwarz.com>
Date: Thu, 28 Jan 2016 09:16:08 +0100
Content-Type: text/plain; charset="US-ASCII"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Brian:

> No, I'm pretty sure this is not the first report. I think there have
> even been patches. The problem is that JFFS2 is effectively
> unmaintained, despite what MAINTAINERS has to say about it.
> 
> Previous reports:
> 
> Subject: Another JFFS2 deadlock, kernel 3.4.11
> http://thread.gmane.org/gmane.linux.drivers.mtd/62523
> 
> Subject: [JFFS2] Revision "jffs2: Fix lock acquisition order bug in
> jffs2_write_begin" introduces another dead lock.
> http://thread.gmane.org/gmane.linux.drivers.mtd/47986

> For reference: outstanding patches, waiting for a maintainer (I've been
> keeping patchwork up-to-date, mostly, but I'm not touching JFFS2 myself,
> for the most part):
> http://patchwork.ozlabs.org/project/linux-mtd/list/?q=jffs2

Subject: [PATCH] Revert "jffs2: Fix lock acquisition order bug in 
jffs2_write_begin"
http://article.gmane.org/gmane.linux.drivers.mtd/62951

This is a patch revising my original patch, which I sent to linux-mtd on 
10-Nov-2015. I didn't see a response yet, but it's one of the outstanding 
patches above.

Best regards,
Thomas

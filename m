In-Reply-To: <1454336914.133285.297.camel@infradead.org>
References: <CAKatumo13ZM2o3dK9_ouxzta-sxeiB5E236Qh5dfbnEBc9CuMw@mail.gmail.com>	
 <1453910781.20662.35.camel@infinera.com>
 <20160128000559.GA14270@google.com>	
 <OF7C1394C5.2BBD0A26-ONC1257F48.002BF506-C1257F48.002D6C9C@rohde-schwarz.com>
 <1454336914.133285.297.camel@infradead.org>
To: dwmw2@infradead.org
Cc: computersforpeace@gmail.com, Artem Bityutskiy <dedekind1@gmail.com>,
 Deng Chao <deng.chao1@zte.com.cn>,
 Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 linux-mtd <linux-mtd-bounces@lists.infradead.org>,
 Ming Liu <liu.ming50@gmail.com>, "sztomi89@gmail.com" <sztomi89@gmail.com>,
 Thomas Betker <thomas.betker@freenet.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 wangzaiwei <wangzaiwei@top-vision.cn>
MIME-Version: 1.0
Subject: Re: JFFS2 deadlock
From: Thomas.Betker@rohde-schwarz.com
Message-ID: <OF2969B332.8B296F0B-ONC1257F4C.006307EB-C1257F4C.0067DE60@rohde-schwarz.com>
Date: Mon, 1 Feb 2016 19:54:29 +0100
Content-Type: text/plain; charset="US-ASCII"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello David:

> > Subject: [PATCH] Revert "jffs2: Fix lock acquisition order bug in 
> > jffs2_write_begin"
> > http://article.gmane.org/gmane.linux.drivers.mtd/62951
> > 
> > This is a patch revising my original patch, which I sent to linux-mtd 
on 
> > 10-Nov-2015. I didn't see a response yet, but it's one of the 
outstanding 
> > patches above.
> 
> That looks necessary but not sufficient. I think we need this
> (untested) patch on top of it, to ensure that we *always* take the page
> lock before f->sem?
> 
> Please could you try what's in the tree at
> http://git.infradead.org/users/dwmw2/jffs2-fixes.git

I have been using a variant of Deng Chao's patch here for a long time, so 
that one has been tested quite a bit: 
http://lists.infradead.org/pipermail/linux-mtd/2013-August/048352.html. 
The problem with that patch was that it modified mm/filemap.c and 
include/linux/pagemap.h, which we were not too happy about.

Your patch looks much simpler, and I will definitely test it. It may take 
a few days, though, as I have to unearth the test scripts, and find a time 
slot for testing.

Best regards,
Thomas Betker

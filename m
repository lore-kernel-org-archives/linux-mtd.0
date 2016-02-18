In-Reply-To: <OF2969B332.8B296F0B-ONC1257F4C.006307EB-C1257F4C.0067DE44@LocalDomain>
References: <CAKatumo13ZM2o3dK9_ouxzta-sxeiB5E236Qh5dfbnEBc9CuMw@mail.gmail.com>	
 <1453910781.20662.35.camel@infinera.com>
 <20160128000559.GA14270@google.com>	
 <OF7C1394C5.2BBD0A26-ONC1257F48.002BF506-C1257F48.002D6C9C@rohde-schwarz.com>
 <1454336914.133285.297.camel@infradead.org>
 <OF2969B332.8B296F0B-ONC1257F4C.006307EB-C1257F4C.0067DE44@LocalDomain>
To: David Woodhouse <dwmw2@infradead.org>
Cc: computersforpeace@gmail.com, Artem Bityutskiy <dedekind1@gmail.com>,
 Deng Chao <deng.chao1@zte.com.cn>,
 Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 linux-mtd <linux-mtd-bounces@lists.infradead.org>,
 Ming Liu <liu.ming50@gmail.com>, "sztomi89@gmail.com" <sztomi89@gmail.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 wangzaiwei <wangzaiwei@top-vision.cn>
MIME-Version: 1.0
Subject: Re: JFFS2 deadlock
From: Thomas.Betker@rohde-schwarz.com
Message-ID: <OF19585295.84AA7860-ONC1257F5D.0031E02A-C1257F5D.0036B10E@rohde-schwarz.com>
Date: Thu, 18 Feb 2016 10:57:21 +0100
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

> > Please could you try what's in the tree at
> > http://git.infradead.org/users/dwmw2/jffs2-fixes.git

> Your patch looks much simpler, and I will definitely test it. It may
> take a few days, though, as I have to unearth the test scripts, and 
> find a time slot for testing.

Here is what I did (sorry for the wait, things were piling up):

1) Removed Deng Chao's patch from my kernel, added your patch "jffs2: Fix 
page lock / f->sem deadlock". I am still on linux-3.14, but jffs2 hasn't 
changed much since then, so this shouldn't make a difference. Added a 
printk() before mutex_unlock(&f->sem) to check if the prospective page was 
locked, i.e. if the deadlock situation actually occurs.

2) On my target system, started wangzaiwei's test (with some fixes), plus 
a loop copying a large file over and over (to get GC rolling, which 
increases the chance of a deadlock).

3) After 24 hours, the system was still alive, and the printk() had been 
hit 32 times.

So yes, I am confident that your patch avoids the deadlock, and if that's 
good enough for you, please add my Tested-by:. However, I am going to run 
some more stress tests here just to check that there weren't any 
unexpected side effects. (Don't get me wrong -- I am sure the patch is 
fine, but for me it's a case of "once bitten, twice shy" ...)

Best regards,
Thomas Betker

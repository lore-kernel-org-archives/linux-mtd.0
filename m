Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SfHdh-0000YL-Cs
 for linux-mtd@lists.infradead.org; Thu, 14 Jun 2012 21:31:38 +0000
Received: by lbbgg6 with SMTP id gg6so2536186lbb.36
 for <linux-mtd@lists.infradead.org>; Thu, 14 Jun 2012 14:31:31 -0700 (PDT)
Date: Fri, 15 Jun 2012 00:31:21 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: mtd nand erase and bad block
Message-ID: <20120615003121.214a871c@halley>
In-Reply-To: <CAN8TOE_47JHHakwHYApZhOgb72dQxk7f1bxMoN5kb6NaxnqZBg@mail.gmail.com>
References: <4FC76039.6020701@sirius-es.it> <4FC771EC.4090500@intel.com>
 <4FC78012.5010704@sirius-es.it> <4FC8601C.5070708@intel.com>
 <Pine.LNX.4.64.1206010837100.4247@lnxricardw.se.axis.com>
 <4FC87D62.6020402@st.com>
 <1338540121.2536.150.camel@sauron.fi.intel.com>
 <20120601140445.346e322e@halley> <4FC8CBA7.6000702@st.com>
 <20120601175407.7c39a8fb@halley>
 <1338898670.2507.48.camel@sauron.fi.intel.com>
 <CAN8TOE_47JHHakwHYApZhOgb72dQxk7f1bxMoN5kb6NaxnqZBg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Angus CLARK <angus.clark@st.com>, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Thu, 14 Jun 2012 10:48:49 -0700 Brian Norris <computersforpeace@gmail.com> wrote:
> On Tue, Jun 5, 2012 at 5:17 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > On Fri, 2012-06-01 at 17:54 +0300, Shmulik Ladkani wrote:
> >>
> >> My personal preference would be:
> >> 1. A new ioctl (MEMSCRUB?)
> >> 2. debugfs flag, PER MTD PART (slightly safer than your global flag)
> >> 3. global debugfs flag
> >>
> > Yes, I guess option 1 is the best I think. Option 2 needs too much work.
> 
> 
> FWIW, a similar topic was brought up a long time back, with little result:
> http://lists.infradead.org/pipermail/linux-mtd/2010-October/032577.html

Thanks Brian for spotting this post.
It made me rethink of the MEMSCRUB suggestion and notice it is somewhat
limited.

I guess the main reason for erasing a block marked bad is to erase its
BBM (that was previously set for test purposes), so that the block will
no longer be considered bad.
But that would only work if BBM is the only bad-block identification
scheme (no on-flash BBT).

Hence the post by Jon Povey is actually better, as it provides a tiny
but useful building block: allow "scrubbing" the bad indication of
an erase-block. For a pure-BBM systems, that would be erasure of the
block; For pure flash-BBT, that would be updating the BBT; For systems
that update both BBM and BBT, we'll do both.

What do you think?

Regards,
Shmulik

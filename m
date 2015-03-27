Received: from mail-pd0-x230.google.com ([2607:f8b0:400e:c02::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YbYFr-0002As-UK
 for linux-mtd@lists.infradead.org; Fri, 27 Mar 2015 17:41:13 +0000
Received: by pdcp1 with SMTP id p1so11290893pdc.3
 for <linux-mtd@lists.infradead.org>; Fri, 27 Mar 2015 10:40:49 -0700 (PDT)
Date: Fri, 27 Mar 2015 10:40:42 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Viet Nga Dao <vndao@altera.com>
Subject: Re: [PATCH] mtd:spi-nor: Add lock and unlock callback functions to
 struct spi_nor
Message-ID: <20150327174042.GZ32500@ld-irv-0074>
References: <1426493714-3748-1-git-send-email-vndao@altera.com>
 <20150319174903.GT32500@ld-irv-0074>
 <CAN1oZWxzK_CuN-kHP-843X-zKQBFHo_UXgC+oZFUtfRYjNxCvg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAN1oZWxzK_CuN-kHP-843X-zKQBFHo_UXgC+oZFUtfRYjNxCvg@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 nga_chi86 <ngachi86@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 20, 2015 at 09:15:48AM +0800, Viet Nga Dao wrote:
> On Fri, Mar 20, 2015 at 1:49 AM, Brian Norris <computersforpeace@gmail.com> wrote:
> > On Mon, Mar 16, 2015 at 01:15:14AM -0700, vndao@altera.com wrote:
> >> From: VIET NGA DAO <vndao@altera.com>
> >>
> >> This patch introduces a properly-replaceable spi_nor callback that does
> >> flash specific lock and unlock. The existing code for spi_nor_lock and
> >> spi_nor_unlock is moved into their own functions which are stm_lock and
> >> stm_unlock.
> >
> > I'm curious; is this a complete ripoff of my code [1]? You haven't
> > credited my authorship at all. That's a big no-no. Typically you keep
> > the 'From:' and Signed-off-by of the original author if you're going to
> > modify/redistribute it. (Admittedly, I didn't provide the S-o-b on my
> > informal patch.)
> >
> > Anyway, that's all fine this time, but please avoid doing this in the
> > future; I can fix up the authorship, etc., and apply it, if it gets an
> > Ack/Tested-by from one or more reviewers (e.g., you). BTW, I hope you at
> > least tested this, right?
> 
> Hi Brian,
> I am so sorry for this mistake. it is not my intention. :(  I am new
> to kernel driver and up-streaming thing, that is why i do not know the
> proper way. Yes, please change the authorship to you.
> Yes, i tested it.

OK, no worries. Applied my own version (only differed by whitespace) and
added your Tested-by.

Brian

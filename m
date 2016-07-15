Received: from mail-pa0-x243.google.com ([2607:f8b0:400e:c03::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bNsl1-0001gJ-4O
 for linux-mtd@lists.infradead.org; Fri, 15 Jul 2016 02:21:39 +0000
Received: by mail-pa0-x243.google.com with SMTP id hh10so5399980pac.1
 for <linux-mtd@lists.infradead.org>; Thu, 14 Jul 2016 19:21:18 -0700 (PDT)
Date: Thu, 14 Jul 2016 19:21:13 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Jiancheng Xue <xuejiancheng@hisilicon.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, ezequiel@vanguardiasur.com.ar,
 jteki@openedev.com, cyrille.pitchen@atmel.com, robh+dt@kernel.org,
 yanhaifeng@hisilicon.com, yanghongwei@hisilicon.com,
 linshunquan1@hisilicon.com, Binquan Peng <pengbinquan@hisilicon.com>
Subject: Re: [PATCH v12] mtd: spi-nor: add hisilicon spi-nor flash controller
 driver
Message-ID: <20160715022113.GA144623@google.com>
References: <1467100099-6172-1-git-send-email-xuejiancheng@hisilicon.com>
 <20160714011331.GE54628@google.com>
 <57883BC5.7060600@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57883BC5.7060600@hisilicon.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 15, 2016 at 09:26:29AM +0800, Jiancheng Xue wrote:
> On 2016/7/14 9:13, Brian Norris wrote:
> > Pushed to l2-mtd.git, with the following diff due to API changes. Please
> > review to be sure it looks OK to you.
> > 
> 
> The changes are OK to me. Thanks!

Thanks for double checking.

> > Also, please base changes on l2-mtd.git or linux-next.git in the future.
> > 
> 
> The l2-mtd.git can't be accessed through http protocol now. The git protocol
> is forbidden in our office.

Hmm, that's too bad. I could probably bug the infradead.org admin to
change that...

At worst, you can at least check out the gitweb. e.g.:

http://git.infradead.org/l2-mtd.git/commitdiff/e523f11141bdc24f65775f0b1fa4a7ed404e68cc

> I will generate patch based on linux-next.git.

That will usually work just fine too. Although there can be some small
delay between linux-next updates (ranging from about a day, up to a week
or two (?) around the merge window).

Regards,
Brian

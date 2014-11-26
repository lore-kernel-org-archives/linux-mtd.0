Received: from mail-pd0-x22c.google.com ([2607:f8b0:400e:c02::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtSst-0002iD-NW
 for linux-mtd@lists.infradead.org; Wed, 26 Nov 2014 03:03:16 +0000
Received: by mail-pd0-f172.google.com with SMTP id y13so1844764pdi.31
 for <linux-mtd@lists.infradead.org>; Tue, 25 Nov 2014 19:02:53 -0800 (PST)
Date: Tue, 25 Nov 2014 19:02:50 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH] mtd: nand: print erase size on init
Message-ID: <20141126030250.GP24364@ld-irv-0074>
References: <1413842464-18016-1-git-send-email-zajec5@gmail.com>
 <5448344C.8020402@vanguardiasur.com.ar>
 <1414654390.23185.1.camel@sauron.fi.intel.com>
 <CACna6rzwerRpX=o4RarRnGg-FeiZpDoowqXpFM2GFz9OifOb9A@mail.gmail.com>
 <54712F77.9000200@vanguardiasur.com.ar>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <54712F77.9000200@vanguardiasur.com.ar>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Nov 22, 2014 at 09:51:03PM -0300, Ezequiel Garcia wrote:
> On 10/30/2014 09:35 AM, Rafał Miłecki wrote:
> > On 30 October 2014 08:33, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> >> On Wed, 2014-10-22 at 19:48 -0300, Ezequiel Garcia wrote:
> >>> Moreover, you have a /proc and a /sysfs interface to retrieve the erasesize:
> >>>
> >>> What's wrong with using any of the currently available interfaces:
> >>>
> >>> $ cat /sys/class/mtd/mtd0/erasesize
> >>> 131072
> >>>
> >>> $ cat /proc/mtd | grep mtd0 | awk '{print $3}'
> >>> 00020000
> >>>
> >>> Any reason why you want the info in the kernel log?
> >>
> >> When people ask for help and send their logs, it is very handy to have
> >> this information there.
> > 
> > Oops, forgot to reply. There are two reasons for this:
> > 1) It's easier to get erasesize from users/reporters when it simply
> > appears in the boot log.
> > 2) If user space breaks (e.g. because of wrong UBI image) we can't use
> > "cat" to read the erasesize
> > 
> 
> Hm.. OK. Those sound like good reasons.

Glad we can agree on this important issue :)

Pushed to l2-mtd.git.

Brian

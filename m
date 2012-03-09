Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5wID-0002ga-VN
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2012 09:39:22 +0000
Message-ID: <1331286099.22872.45.camel@sauron.fi.intel.com>
Subject: Re: [PATCH (mtd-utils)] Makefile: fix "make clean" for old GNU find
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Fri, 09 Mar 2012 11:41:39 +0200
In-Reply-To: <CAN8TOE9yLLnV2_imd0GUbue+z0A2PNdD6Vz7qr2dYaVjsugN=w@mail.gmail.com>
References: <1330726673-9860-1-git-send-email-computersforpeace@gmail.com>
 <CAMjpGUc1m8D-nKVoddTehEDfx0r9R+sMTgtqxkfEG9W2Ok6-6w@mail.gmail.com>
 <CAN8TOE9yLLnV2_imd0GUbue+z0A2PNdD6Vz7qr2dYaVjsugN=w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Mike Frysinger <vapier.adi@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2012-03-08 at 09:52 -0800, Brian Norris wrote:
> On Thu, Mar 8, 2012 at 8:54 AM, Mike Frysinger <vapier.adi@gmail.com> wrote:
> > On Fri, Mar 2, 2012 at 17:17, Brian Norris <computersforpeace@gmail.com> wrote:
> >> However, it will launch a lot more `rm' processes...
> >
> > indeed, that does suck.  you could do this, but it kind of sucks too ...
> > CLEAN_FIND = find "$(BUILDDIR)/" -xdev '(' -name '*.[ao]' -o -name
> > '.*.c.dep' ')'
> > ...
> >    @if test -d "$(BUILDDIR)/"; then
> >        $(CLEAN_FIND) -exec rm -f {} + 2>/dev/null || \
> >        $(CLEAN_FIND) -exec rm -f {} \; ; \
> >    fi
> 
> I'm fine with that too. It's a little uglier, but it's not quite as
> bad for systems that have a modern `find', I think. I'll resend with
> your suggestion if there are no better suggestions.

May be adding a one-line comment like "work-around for ancient find
utils not supporting '+'" would also be a good idea?

-- 
Best Regards,
Artem Bityutskiy

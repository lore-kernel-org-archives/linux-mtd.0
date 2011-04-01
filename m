Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5Zvj-00032v-C5
	for linux-mtd@lists.infradead.org; Fri, 01 Apr 2011 08:42:08 +0000
Subject: Re: [PATCH] Newly erased page read workaround
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Vipin Kumar <vipin.kumar@st.com>
In-Reply-To: <4D958DC2.5000607@st.com>
References: <c7baa4a77775b54f2ef8450d8d1f44d1dc011b41.1298527669.git.viresh.kumar@st.com>
	<1301579475.2828.82.camel@localhost> <4D95708A.7080204@st.com>
	<1301640710.2789.11.camel@localhost>  <4D958DC2.5000607@st.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 01 Apr 2011 11:39:40 +0300
Message-ID: <1301647180.2789.35.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Viresh KUMAR <viresh.kumar@st.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"David.Woodhouse@intel.com" <David.Woodhouse@intel.com>
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-04-01 at 14:03 +0530, Vipin Kumar wrote:
> >>> Also, Ivan pointed you the right thing - you might have bit-flips
> on an
> >>> erased eraseblock. If not on freshly, then on an erasblock which
> was
> >>> erased and then not used for long time. If this is not of your
> concern,
> >>
> >> In that case an ecc error would be reported since the ecc wont
> match the stored 
> >> ecc i.e FFFF and the driver would mark it as a normal corrupted
> page
> > 
> > I'm confused. So you erased eraseblock A. Everything there contains
> > 0xFFs, including the OOB area.
> > 
> > Now you have one of the modern lashes. You gen bit-flips in the
> page.
> > Say, a couple of bits flip. You read this page. You compare the
> contents
> > of the page with 0xFF and find out that the contends in not all
> 0xFFs.
> > What do you do then?
> > 
> 
> Then, the normal driver takes over and it reports an error because
> the 
> number of errors in the page are beyond 8 bits (maximum the FSMC ecc 
> logic can correct).

Why 8? It may be just 1 single bit-flip. Just one bits becomes 0 instead
of 1.

>  Effectively speaking, the read page returns an error 
> indicating that the page could not be read properly

But why? It can be read properly. If this is just 1 wrong bit, you
should be able to correct it. And as Ivan indicated, modern flashes are
so crappy that 1 bit-flip on erased eraseblock is just normal there.

> Ideally, any filesystem would mark it as a bad block 

That's the point - no. This is normal on modern flashes.

I think one solution could be that you make your check more
sophisticated. You check for 0xFFs, if this is not true, you see is this
"almost all 0xFFs" and count amount of non-0xFF bits. If the count is,
say, 2, you assume this page contains all 0xFFs plus 2 bit-flips. But
I'm not sure it would work.

Anyway, If you do not care about such bit-flips for your SoC - fine. I
just wanted you to understand and accept the issue and write about it in
the comment. And I also wanted you to _not_ do expensive 0xFF comparison
every time - but it seems you accepted this :-)

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

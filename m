Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCBy5-0005yv-J2
	for linux-mtd@lists.infradead.org; Tue, 19 Apr 2011 14:31:54 +0000
Subject: Re: [PATCHv3 3/3] serve_image: adjust classifier and type for printf
From: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
To: ext Mike Frysinger <vapier.adi@gmail.com>
In-Reply-To: <BANLkTikxr_RWMVTVo-JYCwDhBR_sJdp=Cw@mail.gmail.com>
References: <1303195429.2779.2.camel@localhost>
	<971bada1c870aa0baf6e8d07784f95e31bb98213.1303202005.git.ext-andriy.shevchenko@nokia.com>
	<82d06f0b9f3ad538d5a8dabfce6ac8337e07b0ae.1303202005.git.ext-andriy.shevchenko@nokia.com>
	<158e520ae5748a6e32eeefad99dea0395dd4c2a7.1303202005.git.ext-andriy.shevchenko@nokia.com>
	<BANLkTikxr_RWMVTVo-JYCwDhBR_sJdp=Cw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 19 Apr 2011 17:32:01 +0300
Message-ID: <1303223521.24954.23.camel@fs-test.research.nokia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-04-19 at 10:26 -0400, ext Mike Frysinger wrote:
> On Tue, Apr 19, 2011 at 04:34, Andy Shevchenko wrote:
> > -               fprintf(stderr, "Image size %ld bytes is not a multiple of erasesize %d bytes\n",
> > -                       st.st_size, erasesize);
> > +               fprintf(stderr, "Image size %" PRIu64 " bytes is not a multiple of "
> > +                               "erasesize %d bytes\n", st.st_size, erasesize);
> 
> i think we want to avoid splitting string constants
I looked to many other places in the code where it has split in string
constants. So, this is an irrelevant issue.
However, I could join back the strings which I touch in patches.


-- 
With Best Regards,
Andy Shevchenko

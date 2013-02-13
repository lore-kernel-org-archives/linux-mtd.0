Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U5ZXK-00022X-6Z
 for linux-mtd@lists.infradead.org; Wed, 13 Feb 2013 10:25:59 +0000
Message-ID: <1360751170.12703.130.camel@sauron.fi.intel.com>
Subject: Re: UBIFS space consumption
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Vikram Narayanan <vikram186@gmail.com>
Date: Wed, 13 Feb 2013 12:26:10 +0200
In-Reply-To: <510FEFE2.3060704@gmail.com>
References: <50F97E6C.7030201@gmail.com>
 <1359961435.13791.4.camel@sauron.fi.intel.com> <510FEFE2.3060704@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2013-02-04 at 22:59 +0530, Vikram Narayanan wrote:
> On 2/4/2013 12:33 PM, Artem Bityutskiy wrote:
> > On Fri, 2013-01-18 at 22:25 +0530, Vikram Narayanan wrote:
> >> But according to "df",  UBI volume 0 is sized 148.9 MiB. That's, 15.8
> >> MiB more in terms of consumption.
> >
> > Df is not accurate with UBIFS by design, this is covered by this FAQ
> > entry:
> >
> > http://www.linux-mtd.infradead.org/faq/ubifs.html#L_df_report
> >
> 
> Sorry, I think you've mistaken my question. I've referred the above FAQ 
> before framing this mail.
> 
> The above FAQ explains why the _free_ space shown by 'df' isn't 
> accurate. I'm concerned here about the _total_ size shown to me by df, 
> which is less than what is reported by ubinfo.

I guess dmesg output may give some clue - probably that space is spent
for the journal, orphans area, and indexing area.

-- 
Best Regards,
Artem Bityutskiy

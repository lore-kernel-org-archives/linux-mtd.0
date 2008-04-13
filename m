Subject: Re: [BUG] JFFS2 usage of write_begin and write_end functions
	causes kernel panic
From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
In-Reply-To: <20080413105046.GB6022@logfs.org>
References: <Pine.LNX.4.64.0804101152270.13226@pentafluge.infradead.org>
	<200804101918.21362.jpihet@mvista.com>
	<Pine.LNX.4.64.0804111824450.12186@pentafluge.infradead.org>
	<1207937133.5965.17.camel@sauron>  <20080413105046.GB6022@logfs.org>
Content-Type: text/plain; charset=UTF-8
Date: Sun, 13 Apr 2008 13:42:56 +0100
Message-Id: <1208090577.3026.95.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: nickpiggin@yahoo.com.au, Alexey Korolev <akorolev@infradead.org>,
	Jean Pihet <jpihet@mvista.com>, linux-mtd@lists.infradead.org,
	akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2008-04-13 at 12:50 +0200, Jörn Engel wrote:
> On Fri, 11 April 2008 21:05:33 +0300, Artem Bityutskiy wrote:
> > 
> > So why did you start this project? How about just making all your work
> > to go into mainline instead?
> 
> At least one of the patches should not go to mainline.  It is one of
> those strange "If I change the code here, all symptoms disappear"
> patches that doesn't cure the cause.  Someone should spend some time to
> find the root couse, but noone has.

Indeed. I'm very reluctant to merge band-aids when the root cause isn't
properly understood. I'm normally a bit better at taking over from such
'hints' and tracking problems down for myself, but over the last few
months I haven't had time for that (or indeed for _anything_ much).
That situation should be improved now -- I have no plans to leave the
country between now and OLS.

> Keeping such patches somewhere easily accessable - but not in mainline -
> might be a good idea.  Would be even better if the root cause was found
> and fixed, of course.

That's the reason I give out accounts on git.infradead.org. I believe
Alexey has such an account.

-- 
dwmw2

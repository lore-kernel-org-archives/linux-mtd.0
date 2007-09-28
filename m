From: "Kyungmin Park" <kmpark@infradead.org>
To: <dedekind@infradead.org>
References: <1190889529.12445.11.camel@sauron>
	<1190890228.25883.3.camel@sauron>
Subject: RE: [PATCH try 3] MTD: OneNAND: fix numerous races
Date: Fri, 28 Sep 2007 15:18:00 +0900
Message-ID: <002c01c80197$5895a230$e1ac580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
In-reply-to: <1190890228.25883.3.camel@sauron>
Cc: linux-mtd@lists.infradead.org, 'David Woodhouse' <dwmw2@infradead.org>
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> I did not test _this_ particular patch, I tested a slightly different
> version of it. But the patch fixes quite severe problems which lead
> to rare bugs which are very difficult to track.
> 
> Can you please try it on your setup, so that I'd ask dwmw2
> to apply it and send upstream during the next merge window?

I tested it and working well.
This is the same patch previous merged in NAND bbt issue.

Acked-by: Kyungmin Park <kyungmin.park@samsung.com>

Thank you,
Kyungmin Park

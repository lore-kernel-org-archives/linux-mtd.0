From: David Woodhouse <dwmw2@infradead.org>
To: Simon Haynes <simon@baydel.com>
In-Reply-To: <405ACD50.8515.211AB9@localhost>
References: <B1CA6BCA5B0C@baydel.com>  <405ACD50.8515.211AB9@localhost>
Content-Type: text/plain
Message-Id: <1079694679.16952.273.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 19 Mar 2004 11:11:20 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 Corruption.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2004-03-19 at 10:37 +0000, Simon Haynes wrote:
> > That was a bug in the scanning code. Should be fixed in v1.58 of
> > scan.c in CVS. Please could you try that and let me know if it works?
> > 
> I have not had chance a yet to download scan from CVS. However I did make the 
> simple change you suggested and everything worked fine.

What I committed was slightly more complicated -- and also broken.
Thomas fixed it though. :)

-- 
dwmw2

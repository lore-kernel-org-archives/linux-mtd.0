Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19KDdV-0004lM-Gb
	for <linux-mtd@lists.infradead.org>; Mon, 26 May 2003 09:47:17 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Stuart Menefy <stuart.menefy@st.com>
In-Reply-To: <20030523235020.3ca198e1.stuart.menefy@st.com>
References: <20030523235020.3ca198e1.stuart.menefy@st.com>
Message-Id: <1053938881.17182.54.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Mon, 26 May 2003 09:48:01 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: CFI fixup code
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2003-05-23 at 23:50, Stuart Menefy wrote:
> Folks
> 
> Having been bitten several times now by buggy CFI data in various chips, I
> thought I'd try and come up with an generic mechanism for working round
> this problem.

Me Likee. Thanks. One comment though...

+	if (extp->MajorVersion != '1' || 
+	    (extp->MinorVersion < '0' || extp->MinorVersion > '3')) {

You've made it accept CFI table versions 1.0 through 1.3 for _all_
chips, while some were only accepting 1.0->1.2 before.

That's probably not a problem since they _ought_ to be
backward-compatible, but if we actually trusted the hardware
manufacturers to display a modicum of intelligence, we wouldn't have had
that check there at all. And you wouldn't have been writing this patch
in the first place. I'm happy to remove it and perhaps reinstate it if
it ever actually bites.

Other than that, it looks fine. Please go ahead and commit it.

-- 
dwmw2

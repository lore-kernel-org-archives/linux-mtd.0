Received: from outmail1.freedom2surf.net ([194.106.33.237]
	helo=outmail.freedom2surf.net)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bz1zO-0002GQ-Lv
	for linux-mtd@lists.infradead.org; Sun, 22 Aug 2004 19:43:07 -0400
Received: from wirenth (i-195-137-81-187.freedom2surf.net [195.137.81.187])
	by outmail.freedom2surf.net (8.12.10/8.12.10) with SMTP id
	i7MNh5nF019835
	for <linux-mtd@lists.infradead.org>; Mon, 23 Aug 2004 00:43:05 +0100
Date: Mon, 23 Aug 2004 00:43:04 +0100
From: Ian Molton <spyro@f2s.com>
To: linux-mtd@lists.infradead.org
Message-Id: <20040823004304.0befb1b3.spyro@f2s.com>
In-Reply-To: <20040823003835.712122c3.spyro@f2s.com>
References: <20040820132332.42c78dcc.spyro@f2s.com>
	<20040821002633.13ba0927.spyro@f2s.com>
	<20040822141042.3b3f0dfa.spyro@f2s.com>
	<20040823003835.712122c3.spyro@f2s.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: supporting stupid chips part IV
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 23 Aug 2004 00:38:35 +0100
Ian Molton <spyro@f2s.com> wrote:

Hit ctrl-enter, oops... try again...

> This gets worse...
> 
> So, now we have the chip reading OK with soft ECC, albeit using a
> *bizarre* layout for the ECC data.
> 
> but it appears the hardware ECC doesnt work! the little bugger.

looking at winCE code more closely, I now see that winCE only uses hw
ECC when *writing*, although it actually seems to reset and enable hw
ECC when reading - just discards the results, bah!

oh well. I guess its back ot soft ECC for now... I'll send an email to
toshiba and see if they have anything to say...

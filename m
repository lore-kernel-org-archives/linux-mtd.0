Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16mxNS-0002Hl-00
	for <linux-mtd@lists.infradead.org>; Mon, 18 Mar 2002 13:40:42 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <PCEBLNKIDOKLBPDJECFEKEBDDHAA.sbardsley@rlwinc.com> 
References: <PCEBLNKIDOKLBPDJECFEKEBDDHAA.sbardsley@rlwinc.com> 
To: "Stephen Bardsley" <sbardsley@rlwinc.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: bad block recovery 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 18 Mar 2002 13:52:10 +0000
Message-ID: <3886.1016459530@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>


sbardsley@rlwinc.com said:
>  I took a quick look at the code and see that meminfo.erasesize is
> used to scale various values.  I don't see why 8Kb is a limit.  I have
> found that my chip's erase size to be 16Kb; is there any way for me to
> use nftl_format? If necessary, I don't mind modifying the code, but I
> don't want to screw it up.  Any hints? 

You _ought_ to be able to just remove that check, if you first verify that 
we'll do the right thing through the rest of the code rather than using a 
hardcoded 8KiB. I put the check in just because I'd never tested the larger 
erase size.

--
dwmw2

Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19nFX1-00033W-Ac
	for <linux-mtd@lists.infradead.org>; Thu, 14 Aug 2003 11:40:35 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Matthew Dharm <mdharm@momenco.com>
In-Reply-To: <NEBBLJGMNKKEEMNLHGAIEEDODDAA.mdharm@momenco.com>
References: <NEBBLJGMNKKEEMNLHGAIEEDODDAA.mdharm@momenco.com>
Message-Id: <1060857620.3152.19.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 14 Aug 2003 11:40:20 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: "Linux-Mtd@Lists. Infradead. Org" <linux-mtd@lists.infradead.org>
Subject: Re: put_chip error?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-08-14 at 02:39, Matthew Dharm wrote:
> 	put_chip() called with oldstate 1!!


revision 1.127
date: 2003/07/02 20:29:38;  author: acurtis;  state: Exp;  lines: +2 -1
Added FL_STATUS to the FL_READY case in put_chip(). (Eliminate noise)


-- 
dwmw2

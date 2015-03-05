Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YTT67-0006Y4-0U
 for linux-mtd@lists.infradead.org; Thu, 05 Mar 2015 10:33:44 +0000
Message-ID: <54F830EA.4080106@nod.at>
Date: Thu, 05 Mar 2015 11:33:14 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 0/5] UBI: Coverity-inspired fixes
References: <1425119009-28634-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1425119009-28634-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
Cc: kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian,

Am 28.02.2015 um 11:23 schrieb Brian Norris:
> Except for the last one, these were inspired by Coverity Scan results.
> 
> These fixes have barely been tested, but they are pretty straightforward
> logically. As they've been sitting in my dust pile too long, I thought I'd at
> least get them out there.
> 
> Brian Norris (5):
>   UBI: account for bitflips in both the VID header and data
>   UBI: fix out of bounds write
>   UBI: initialize LEB number variable
>   UBI: fix check for "too many bytes"
>   UBI: align comment for readability

Nice work!
I'll test them later today.
Just a quick question, no patch has a stable tag, is this by design?
>From a first look most of them look like stable material.

Thanks,
//richard

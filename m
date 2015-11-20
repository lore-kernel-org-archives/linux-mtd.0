Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zzty6-0000jj-7W
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2015 22:15:47 +0000
Subject: Re: [PATCH] UBI: fix use of "VID" vs. "EC" in header self-check
To: Brian Norris <computersforpeace@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
References: <1448057454-32664-1-git-send-email-computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <564F9B79.9070105@nod.at>
Date: Fri, 20 Nov 2015 23:15:21 +0100
MIME-Version: 1.0
In-Reply-To: <1448057454-32664-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 20.11.2015 um 23:10 schrieb Brian Norris:
> Looks like a typo, using UBI_EC_HDR_SIZE_CRC (note the "EC") to compute
> the CRC for the VID header.
> 
> This shouldn't cause any functional change, as both structures are 64
> bytes. Verified with:
> 
> 	BUILD_BUG_ON(UBI_VID_HDR_SIZE_CRC != UBI_EC_HDR_SIZE_CRC);
> 
> Reported here:
> http://lists.infradead.org/pipermail/linux-mtd/2013-September/048570.html
> 
> Reported by: Bill Pringlemeir <bpringlemeir@gmail.com>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
> I was sorting through really old email. Don't ask.

Patch looks good, thanks for the exhumation! ;)

Thanks,
//richard

Received: from moutng.kundenserver.de ([212.227.126.179])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JPgGR-0005ek-6e
	for linux-mtd@lists.infradead.org; Thu, 14 Feb 2008 15:44:50 +0000
From: Stefan Roese <sr@denx.de>
To: Peter Korsgaard <jacmet@sunsite.dk>
Subject: Re: [PATCH v2] mtd: Fix physmap_of to not exit upon unsuccessful
	partition scan
Date: Thu, 14 Feb 2008 16:44:06 +0100
References: <1202901592-19718-1-git-send-email-sr@denx.de>
	<87skzvr5eu.fsf@macbook.be.48ers.dk>
In-Reply-To: <87skzvr5eu.fsf@macbook.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200802141644.07115.sr@denx.de>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 14 February 2008, Peter Korsgaard wrote:
> >>>>> "Stefan" == Stefan Roese <sr@denx.de> writes:
>
>  Stefan> The patch 9a310d21196f38f6ad0ad146057548653e495c09 ("[MTD]
>  Stefan> Factor out OF partition support from the NOR driver.")
>  Stefan> introduced an problem. Now the physmap_of driver returns with
>  Stefan> error upon the first unsuccessful partition scan
>  Stefan> (parse_mtd_partitions()). This is not wanted, since even when
>  Stefan> the RedBoot/cmdlinepart partition scan is unsuccessful, the
>  Stefan> other scan's (of_mtd_parse_partitions(),
>  Stefan> parse_obsolete_partitions()) should be done nevertheless.
>
> Doesn't it make more sense to fix the real problem (E.G. cmdlinepart.c
> flagging missing partition info as an error) - See the patch I posted
> earlier today.

Yes, this is probably even better. I just tested it successfully on my board.

Do you plan to post a "real patch" with Signed-off-by? You can add my Acked-by 
too then.

BTW: I would really like to see one of the solutions go into 2.6.25 since it's 
really a bug fix.

Thanks.

Best regards,
Stefan

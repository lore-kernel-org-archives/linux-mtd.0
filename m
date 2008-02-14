Received: from ug-out-1314.google.com ([66.249.92.175])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JPerV-0002hM-Em
	for linux-mtd@lists.infradead.org; Thu, 14 Feb 2008 14:15:00 +0000
Received: by ug-out-1314.google.com with SMTP id 23so1000934ugr.45
	for <linux-mtd@lists.infradead.org>;
	Thu, 14 Feb 2008 06:14:52 -0800 (PST)
To: Stefan Roese <sr@denx.de>
Subject: Re: [PATCH v2] mtd: Fix physmap_of to not exit upon unsuccessful
	partition scan
References: <1202901592-19718-1-git-send-email-sr@denx.de>
From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 14 Feb 2008 15:14:49 +0100
In-Reply-To: <1202901592-19718-1-git-send-email-sr@denx.de> (Stefan Roese's
	message of "Wed\, 13 Feb 2008 12\:19\:52 +0100")
Message-ID: <87skzvr5eu.fsf@macbook.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: Peter Korsgaard <jacmet@gmail.com>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>>>> "Stefan" == Stefan Roese <sr@denx.de> writes:

 Stefan> The patch 9a310d21196f38f6ad0ad146057548653e495c09 ("[MTD]
 Stefan> Factor out OF partition support from the NOR driver.")
 Stefan> introduced an problem. Now the physmap_of driver returns with
 Stefan> error upon the first unsuccessful partition scan
 Stefan> (parse_mtd_partitions()). This is not wanted, since even when
 Stefan> the RedBoot/cmdlinepart partition scan is unsuccessful, the
 Stefan> other scan's (of_mtd_parse_partitions(),
 Stefan> parse_obsolete_partitions()) should be done nevertheless.

Doesn't it make more sense to fix the real problem (E.G. cmdlinepart.c
flagging missing partition info as an error) - See the patch I posted
earlier today.

-- 
Bye, Peter Korsgaard

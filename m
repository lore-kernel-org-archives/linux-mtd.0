Received: from az33egw02.freescale.net ([192.88.158.103])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JP0mS-00082a-AP
	for linux-mtd@lists.infradead.org; Tue, 12 Feb 2008 19:27:06 +0000
Message-ID: <47B1F30E.4000509@freescale.com>
Date: Tue, 12 Feb 2008 13:27:10 -0600
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: Stefan Roese <sr@denx.de>
Subject: Re: [PATCH] mtd: Fix physmap_of to not exit upon unsuccessful
	partition scan
References: <1202832181-1783-1-git-send-email-sr@denx.de>
	<47B1E02A.3090709@freescale.com> <200802122015.08811.sr@denx.de>
In-Reply-To: <200802122015.08811.sr@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Stefan Roese wrote:
> On Tuesday 12 February 2008, Scott Wood wrote:
>> Under what conditions are you actually seeing this fail?
> 
> When CONFIG_MTD_REDBOOT_PARTS is not defined for example it returns with -22 
> (EINVAL).

Ah, I see -- it seems the cmdline partition code behaves differently 
than the redboot code.

Your patch changes it to treat zero as success, however -- which breaks 
some other cases.  The test should be "err <= 0", which is what 
parse_mtd_partiitions() itself uses in its loop.

-Scott

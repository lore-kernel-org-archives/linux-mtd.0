From: David Woodhouse <dwmw2@infradead.org>
To: avc@cctechnol.com
In-Reply-To: <7iu14yeq4s.fsf@thor.cctechnol.com>
References: <7iu14yeq4s.fsf@thor.cctechnol.com>
Content-Type: text/plain
Message-Id: <1070446904.15108.88.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 03 Dec 2003 10:21:45 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: DiskOnChip 2000 TSOP bad blocks table
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-11-20 at 14:33 -0600, Al Cousson wrote:
> But, the M-Systems utilities are again reporting "Unreadable bad
> blocks table".

Ouch.

> 1.  Is it possible that the INFTL driver is corrupting the bad blocks
>     table?

The INFTL driver completely ignores the bad block table. Running
eraseall wipes the bad block table. 

This is a bad thing. I have disabled the support for these devices
until the Bad Block Table is properly handled.

> 2.  Does doc_loadbios need to be updated to work on the DiskOnChip
>     2000 TSOP? 

No, the driver needs to be updated to understand and enforce the BBT.

> 3.  Or, did I just get 2 bad DiskOnChips?

No, we broke them by erasing them.

The Bad Block Table is fairly simple. It won't be that hard to implement
proper support for it.

-- 
dwmw2

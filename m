From: David Woodhouse <dwmw2@infradead.org>
To: sandeep.lahane@wipro.com
In-Reply-To: <5DE86B4C624D4545B8A5CA1467DB9364024535BB@PNE-HJN-MBX01.wipro.com>
References: <5DE86B4C624D4545B8A5CA1467DB9364024535BB@PNE-HJN-MBX01.wipro.com>
Content-Type: text/plain
Date: Wed, 17 May 2006 16:24:32 +0100
Message-Id: <1147879472.3875.20.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: How to use TrueFFs and smartMedia Disk FAT on Linux 2.6/2.4?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-03-31 at 10:45 +0530, sandeep.lahane@wipro.com wrote:
> 1.      Is TrueFFs / SmartMedia disk FAT freely available for Linux
> 2.6 and 2.4? 

TrueFFS probably refers to either NFTL or INFTL, both of which are
implemented (for use on the DiskOnChip). There are newer 'version' of
TrueFFS which are not yet implemented, too. 

The SmartMedia format was implemented in CVS, in drivers/mtd/ssfdc.c --
that could do with being updated and made mergeable.


I wouldn't normally reply to HTML posts, or posts with disclaimers --
but since someone mistakenly allowed it through to the list, and since I
_want_ someone to fix up the SmartMedia stuff, I'll make an exception
this time...

MAKE SURE YOU READ ALL OF http://david.woodhou.se/email.html BEFORE
REPLYING.

-- 
dwmw2

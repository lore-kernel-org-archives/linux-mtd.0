Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E58lV-0006k6-69
	for linux-mtd@lists.infradead.org; Tue, 16 Aug 2005 17:14:37 -0400
Message-ID: <4302572E.1070202@mvista.com>
Date: Tue, 16 Aug 2005 14:14:22 -0700
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: Ralph Siemsen <ralphs@netwinder.org>
References: <200508161441.KAA07341@www21.ureach.com>	<43020232.60908@ru.mvista.com>	<20050816155703.GA21462@wohnheim.fh-wedel.de>
	<4302173F.10303@mvista.com> <430236BF.1050004@netwinder.org>
In-Reply-To: <430236BF.1050004@netwinder.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Intel NOR flash(P30) query
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ralph Siemsen wrote:
> Todd Poynor wrote:
> 
>> By the way, if anybody has mtd working on the new P30 chips it would 
>> be good to know; I haven't seen a system with these chips yet.  They 
>> are CFI 1.4, and some changes for 1.4 were added by Nicolas recently 
>> to support M18 "Sibley" chips, but not sure if those changes are 
>> required for P-series chips.  Thankis,
> 
> 
> Are these changes merged into mainline kernel, or only in MTD CVS?  I 
> may be in a position to test this soon-ish, as we are looking for a 
> replacement for the now obsoleted J/K strataflash parts and seem to be 
> headed towards the P30's...

Pretty sure linux-mtd-only, these came in during the settle down period 
for 2.6.13 rc's.  The CFI 1.3-based code probably works after a quick 
adjustment of a revision level check (to ignore new fields at end of 
vendor-specific extended query table), if you want to try kernel.org, 
but testing linux-mtd is always better for us here.  Thanks,

-- 
Todd

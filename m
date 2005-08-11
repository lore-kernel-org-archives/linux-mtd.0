Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E3JaE-00037p-TL
	for linux-mtd@lists.infradead.org; Thu, 11 Aug 2005 16:23:23 -0400
Message-ID: <42FBB3B1.2080609@mvista.com>
Date: Thu, 11 Aug 2005 13:23:13 -0700
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: Vitaly Wool <vwool@ru.mvista.com>
References: <42FB5E72.2010402@ru.mvista.com>
In-Reply-To: <42FB5E72.2010402@ru.mvista.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: power management routines for NAND driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Vitaly Wool wrote:

> I've looked through mtd code and found mtd_pm_callback that should be 
> called to handle PM events. This callback should in turn call 
> mtd->suspend/mtd->resume functions, if any. Therefore one evident way of 
> PM stuff implementation for this NAND flash is to provide suspend/resume 
> functions. However, pm_send (that calls mtd_pm_callback) is never called
> on ARM targets. So I doubt if it's appropriate to implement PM for the 
> driver this way since it's looking somehow obsolete.
> 
> Another way could be define the platform_device and provide its 
> suspend/resume functions, that would be called during the power state 
> transition. 

Yes, the pm_send etc. APM-style calls are deprecated.  The Linux Driver 
Model PM hooks (incl. struct device_driver suspend/resume callbacks) are 
the way to do it now.  I floated a patch for another board in thread 
"MTD PM Resume" in July that does approximately what you're talking 
about, although calling existing Intel/Sharp CFI NOR flash routines.  If 
there's no objections to that style of PM support then I'll check it in.

-- 
Todd

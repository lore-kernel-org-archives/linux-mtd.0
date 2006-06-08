Received: from nz-out-0102.google.com ([64.233.162.201])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FoQOP-0002yW-Vi
	for linux-mtd@lists.infradead.org; Thu, 08 Jun 2006 15:42:19 -0400
Received: by nz-out-0102.google.com with SMTP id 4so487000nzn
	for <linux-mtd@lists.infradead.org>;
	Thu, 08 Jun 2006 12:42:08 -0700 (PDT)
Message-ID: <44887D8C.2040806@gmail.com>
Date: Thu, 08 Jun 2006 12:42:04 -0700
From: Todd Poynor <toddpoynor@gmail.com>
MIME-Version: 1.0
To: Guennadi Liakhovetski <gl@dsa-ac.de>
Subject: Re: pxa2xx-flash again, please?
References: <Pine.LNX.4.63.0606080916491.1760@pcgl.dsa-ac.de>
	<20060608073632.GA12338@wohnheim.fh-wedel.de>
	<Pine.LNX.4.63.0606080955050.1760@pcgl.dsa-ac.de>
	<20060608115208.GA4155@wohnheim.fh-wedel.de>
	<Pine.LNX.4.63.0606081356100.1760@pcgl.dsa-ac.de>
In-Reply-To: <Pine.LNX.4.63.0606081356100.1760@pcgl.dsa-ac.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: tpoynor@infradead.org, linux-mtd@lists.infradead.org,
	=?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>,
	dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Guennadi Liakhovetski wrote:
> On Thu, 8 Jun 2006, Jörn Engel wrote:
> 
>> On Thu, 8 June 2006 09:59:10 +0200, Guennadi Liakhovetski wrote:
>>>
>>> Sorry. This patch has been committed to mtd CVS (I think so, as it
>>> appeared on mtd-cvs ML:
>>> http://lists.infradead.org/pipermail/linux-mtd-cvs/2005-December/005252.html) 
>>>
>>> and I asked this question already a few weeks ago, so, I thought it 
>>> might
>>> ring the bell... The problem is - the patch has been submitted last
>>> December still it is not in stock kernel nor in 2 mtd git-trees on
>>> kernel.org/git, so...
>>
>> Well, the cvs has basically been abandoned.  There was some effort to
>> pull the important patches from cvs into git, but as you noticed,
>> things were lost.
>>
>> Not sure whether the patch makes sense or not.  Maybe Todd can comment
>> that.
> 
> I think it does. It makes one file per (pxa) platform fewer.

When I last checked the patch was a good thing, collapsing two 
practically identical XScale PXA2xx mapping drivers into one and 
converting to platform devices.  It had previously been acked by PXA2xx 
and MTD guy Nicolas Pitre, and Russell King accepted the ARM-side 
changes, which are in kernel.org waiting to become useful.  I think the 
patch happened to hit a window in which it wasn't merged upstream and 
has sat in limbo since then.

(And then the driver is almost totally generic other than relying on the 
ARM-only (last I knew) asm/mach/flash.h stuff and needs pxa-specific 
cache invalidate functions, in case anybody's tackling those problems.)


-- 
Todd

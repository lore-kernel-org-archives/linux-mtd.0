Received: from pro20.abac.com ([66.226.64.21])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CpAN2-0002WH-Mz
	for linux-mtd@lists.infradead.org; Thu, 13 Jan 2005 14:11:04 -0500
Date: Thu, 13 Jan 2005 11:10:36 -0800
From: Brian Fox <bfox@netCelerant.com>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>,
	Jared Hulbert <jaredeh@gmail.com>
Message-ID: <BE0C07AC.5D8E%bfox@netCelerant.com>
In-Reply-To: <Pine.LNX.4.58.0501131849160.17331@phoenix.infradead.org>
Mime-version: 1.0
Content-type: text/plain;
	charset="US-ASCII"
Content-transfer-encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 1/13/05 10:55 AM, "Artem B. Bityuckiy" <dedekind@infradead.org> wrote:

> May be smth like:
> #ifdef I_AM_NOT_PARANOID
> static inline uint32_t
> checksum(void *buf)
> {
> return 0;
> } 

Well, David says a mount time option, which means it should be available all
the time, and on a per mount basis.

So, why not have a checksum function jump table, per filesystem, and have
all of the callers use that?

Thanks,

Brian
-- 
-------------------------------------------------------------------
Brian J. Fox                                       netCelerant, Inc
CTO                                             www.netCelerant.com
bfox@netCelerant.com                             Ph: (805) 275-0214
-------------------------------------------------------------------

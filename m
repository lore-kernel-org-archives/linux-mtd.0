Subject: Re: How stable is jffs2 summarize option?
From: David Woodhouse <dwmw2@infradead.org>
To: Thorsten =?ISO-8859-1?Q?M=FChlfelder?= <muehlfelder@enertex.de>
In-Reply-To: <201005311503.42629.muehlfelder@enertex.de>
References: <201005311503.42629.muehlfelder@enertex.de>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 01 Jun 2010 10:15:15 +0100
Message-ID: <1275383715.25797.14.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-05-31 at 15:03 +0200, Thorsten Mühlfelder wrote:
> to reduce boot time of a device I want to use the jffs2 summarize option on my 
> root file system. Currently 'm using Linux 2.6.24 on that specific device and 
> the summarize option is marked as "experimental", so I wonder if it is stable 
> enough for a productive system?
> Are there any well known devices that use this option, too?
> Do I have to use a newer kernel version?

There are other reasons why you should update from 2.6.24 if you're
using JFFS2, but I don't think the summary code has changed much since
then. The only reason it was still marked as 'experimental' is because I
wanted to optimise the on-medium format.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation

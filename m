Received: from smtp3.newsguy.com ([74.209.136.66] helo=smtp.newsguy.com)
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rms0h-00028r-Fe
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2012 19:14:28 +0000
Message-ID: <4F1476F2.7040800@newsguy.com>
Date: Mon, 16 Jan 2012 11:13:54 -0800
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v4] MTD: nand: add support for diskonchip G4 nand flash
 device
References: <1325635544-17885-1-git-send-email-mikedunn@newsguy.com>
 <1326183912.8847.10.camel@sauron.fi.intel.com> <4F0E567F.8020405@newsguy.com>
 <87y5t9xm0r.fsf@free.fr>
In-Reply-To: <87y5t9xm0r.fsf@free.fr>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/15/2012 03:06 AM, Robert Jarzmik wrote:
> I looked through. It looks good to me.


Thanks again Robert.


> I have one warning remaining (on top of Linus tree):
> drivers/mtd/nand/docg4.c: In function '__check_ignore_badblocks':
> drivers/mtd/nand/docg4.c:52: warning: return from incompatible pointer type


Ha! This is the result of a patch to moduleparam.h that just went in on Friday
(commit 72db395ffadb1d33233fd123c2bf87ba0198c6c1)

According to Rusty Russell, this will soon become a hard error.


>
> My feeling is that the driver is good to be sent upstream, with my:
> Reviewed-by: Robert Jarzmik <robert.jarzmik@free.fr>
>
> If anything comes up, it can be fixed later, and I think we should go forward.


I'd like to resubmit the patch to fix the warning.  Alternatively, I can follow
up with a separate patch once this one is pushed if the maintainers prefer.

Thanks,
Mike

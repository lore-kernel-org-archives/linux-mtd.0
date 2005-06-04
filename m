Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DeNOw-0003WK-Ci
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2005 21:24:39 -0400
Message-ID: <42A102D2.5090108@mvista.com>
Date: Fri, 03 Jun 2005 18:24:34 -0700
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: Todd Blumer <todd@sdgsystems.com>
References: <429FC658.7030206@sdgsystems.com>
In-Reply-To: <429FC658.7030206@sdgsystems.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Aric Blumer <aric@sdgsystems.com>, linux-mtd@lists.infradead.org
Subject: Re: MTD PM Resume
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Todd Blumer wrote:
...
> So, we added some code to drivers/mtd/chips/cfi_cmdset_0001.c in
> cfi_intelext_resume() to unlock the blocks of the flash chips on resume.
> However, cfi_intelext_resume() is not be run on resume. In fact, as far
> as I can tell, pm_send() is not being called in kernel/power/pm.c on
> suspend or resume.

Hi, I'm not sure what calls the APM-style deprecated interfaces anymore...

If you initiated the suspend via a call to pm_suspend() or 
/sys/power/state then LDM suspend/resume driver methods will be called, 
and it looks like nothing in the mtd core will automatically register 
drivers or devices in LDM.  There are existing examples of registering 
with LDM in some map drivers, registering a driver with the platform 
bus.  Looks like boards that power cycle flash chips for certain sleep 
states need to also register a device, and add suspend/resume callbacks 
in the struct_driver that end up calling the chip driver suspend/resume 
methods (even if they don't use flash that powers up locked, since the 
mtd state machine needs to be reset to assume the flash chips are in 
ready state).  Documentation/power/devices.txt has some more info on 
those interfaces.

Or if anybody has a better way to handle this I'm all ears.  A class 
device for generic mtd might do it, not sure.

You just reminded me I need to figure out how to do this for a couple of 
boards, thanks.  If there's no disagreement on the above being the 
correct approach I'll float a patch soon.


-- 
Todd

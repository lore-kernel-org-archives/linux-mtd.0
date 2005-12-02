Received: from gateway-1237.mvista.com ([12.44.186.158] helo=hermes.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EiGCR-0004i0-1n
	for linux-mtd@lists.infradead.org; Fri, 02 Dec 2005 14:04:09 -0500
Message-ID: <43909AC6.7050509@mvista.com>
Date: Fri, 02 Dec 2005 11:04:38 -0800
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: Steven Scholz <steven.scholz@imc-berlin.de>
References: <439097CD.7000901@imc-berlin.de>
In-Reply-To: <439097CD.7000901@imc-berlin.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: When to call cfi_amdstd_suspend() ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Steven Scholz wrote:
> Hi all,
> 
> I implemented my MTD board driver as a platform device with support for
> suspend/resume.
> 
> Upon suspend-to-ram its ->suspend() funktion is called three times for
> levels SUSPEND_DISABLE, SUSPEND_SAVE_STATE and SUSPEND_POWER_DOWN.
> 
> In which level should I call the MTD suspend function (i.e.
> cfi_amdstd_suspend() in my case) ?

You can pretty much just choose one... SUSPEND_POWER_DOWN may be a good 
choice.  Same for resume.  The levels aren't really used anymore in the 
PM subsystem.

> What happens if I called it in every level as it is done in pxa2xx-flash.c?

That file is ported to a newer version of the code that drops the levels 
and the suspend/resume callbacks are only called once.


-- 
Todd

Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CDSAS-0004iw-2i
	for linux-mtd@lists.infradead.org; Fri, 01 Oct 2004 14:30:11 -0400
Message-ID: <415DA224.4020408@mvista.com>
Date: Fri, 01 Oct 2004 11:29:56 -0700
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: Ben Dooks <ben-mtd@fluff.org>
References: <20041001112332.GN22627@home.fluff.org>
In-Reply-To: <20041001112332.GN22627@home.fluff.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Suspend problem on 2.6.x
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ben Dooks wrote:
> mtdblockd when running on 2.6 is either ignorning or
> not dealing with the suspend-to-memory request, and therefore
> the system is not shutting down when asked to.
> 
> bash-2.05a# echo mem > /sys/power/state
> Stopping tasks: ==
>  stopping tasks failed (1 tasks remaining)
> Restarting tasks...<6> Strange, mtdblockd not stopped
>  done
> bash-2.05a#
> 
> I have worked round this for the moment by
> adding PF_NOFREEZE to the current->flags at the start of 
> mtd_bldevs.c:mtd_blktrans_thread()

Right, this same fix was committed to infradead cvs a few weeks ago.  It 
is the freeze execution signal that is being ignored (the thread does 
not enable or poll for such signals).  Since mtdblockd/ftld might need 
to perform I/O to save state during a suspend, and since these probably 
doesn't need to access resources that are impaired during the state save 
phase, exempting these from execution freeze via PF_NOFREEZE seems the 
right solution.

-- 
Todd

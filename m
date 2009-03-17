Received: from [213.79.90.228] (helo=buildserver.ru.mvista.com)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Ljewc-0001dl-Jd
	for linux-mtd@lists.infradead.org; Tue, 17 Mar 2009 19:27:30 +0000
Date: Tue, 17 Mar 2009 22:01:26 +0300
From: Anton Vorontsov <avorontsov@ru.mvista.com>
To: Wolfgang Grandegegr <wg@grandegger.com>
Subject: Re: [PATCH 3/4] NAND: FSL-UPM: Add wait flags to support
	board/chip specific delays
Message-ID: <20090317190126.GA4287@oksana.dev.rtsoft.ru>
References: <1237281143-8768-1-git-send-email-wg@grandegger.com>
	<1237281143-8768-2-git-send-email-wg@grandegger.com>
	<1237281143-8768-3-git-send-email-wg@grandegger.com>
	<1237281143-8768-4-git-send-email-wg@grandegger.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf8
Content-Disposition: inline
In-Reply-To: <1237281143-8768-4-git-send-email-wg@grandegger.com>
Cc: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org
Reply-To: avorontsov@ru.mvista.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 17, 2009 at 10:12:21AM +0100, Wolfgang Grandegegr wrote:
> From: Wolfgang Grandegger <wg@grandegger.com>
> 
> The NAND flash on the TQM8548_BE modules requires a short delay after
> running the UPM pattern. The TQM8548_BE requires a further short delay
> after writing out a buffer. Normally the R/B pin should be checked, but
> it's not connected on the TQM8548_BE. The existing driver uses similar
> fixed delay points. To manage these extra delays in a more general way,
> I introduced the "wait_flags" field allowing the board-specific driver
> to specify various types of extra delay.
> 
> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
> ---

Just a nitpick...

> +	prop = of_get_property(ofdev->node, "wait-flags", &size);
> +	if (prop && size == sizeof(uint32_t))
> +		fun->wait_flags = *prop;
> +	else
> +		fun->wait_flags = (FSL_UPM_WAIT_RUN_PATTERN |
> +				   FSL_UPM_WAIT_WRITE_BYTE);

No need for parenthesis here.

Thanks,

-- 
Anton Vorontsov
email: cbouatmailru@gmail.com
irc://irc.freenode.net/bd2

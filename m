Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BPqXf-0001Jf-IO
	for linux-mtd@lists.infradead.org; Mon, 17 May 2004 23:25:04 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Cristiano Paris <paris@disp.uniroma2.it>
In-Reply-To: <20040517153758.GA9992@sackville.theshire.org>
References: <20040517153758.GA9992@sackville.theshire.org>
Content-Type: text/plain
Message-Id: <1084832701.6607.597.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Mon, 17 May 2004 23:25:01 +0100
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Low-level access to USB pendrive
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-05-17 at 17:37 +0200, Cristiano Paris wrote:
> Hi everyone,
> 
> I know that the external interface to usb flash pendrives is implemented
> as a block device. I also know that this is a logical organization of the
> underlying flash memory. The question is: is it possible to access the
> flash memory directly bypassing this "logical-to-physical" mapping layer?

Generally no. A USB pendrive is a SCSI-over-USB disk. If there's a way
to bypass its internal 'translation layer' and access the flash
directly, it's very manufacturer-specific and not documented.

-- 
dwmw2

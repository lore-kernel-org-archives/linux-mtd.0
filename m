From: David Woodhouse <dwmw2@infradead.org>
To: simon@baydel.com
In-Reply-To: <69D8404D0D5E@baydel.com>
References: <4034E8ED.5757.55A2D9@localhost> <69BCB2F40B2B@baydel.com>
	 <1077639264.7826.516.camel@hades.cambridge.redhat.com>
	 <69D8404D0D5E@baydel.com>
Content-Type: text/plain
Message-Id: <1077641461.7826.578.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 24 Feb 2004 16:51:02 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 Corruption.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-02-24 at 16:17 +0000, Simon Haynes wrote:
> My problem only occurs across reboots. As the ramdisk is not persistent 
> storage how can I try and reproduce the problem. I have tried to reproduce 
> the problem on mtd devices without rebooting and I have not managed to to 
> this. 

The ramdisk isn't _involved_ as a form of storage. JFFS2 doesn't _use_
the block device for _anything_ except for looking at its minor number
to decide which actual MTD device to use.

Hack JFFS2 to always get_mtd_device number 2 and boot with
root=/dev/ram0


-- 
dwmw2

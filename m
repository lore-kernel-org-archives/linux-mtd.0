From: David Woodhouse <dwmw2@infradead.org>
To: Mark Richards <markr@massmicro.com>
In-Reply-To: <009a01c3defc$5a0b9820$6e01a8c0@solarwave>
References: <009a01c3defc$5a0b9820$6e01a8c0@solarwave>
Content-Type: text/plain
Message-Id: <1074607648.29472.17.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 20 Jan 2004 14:07:29 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: MTD - DOC 2000 freezes on umount
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-01-19 at 21:23 -0500, Mark Richards wrote:
> I've been through several good learning experiences getting my development
> system set up to work with a DOC 2000 for an embedded project.  I've finally
> settled on a RedHat 7.2 distribution and the 2.4.24 kernel.  All worked well
> with the MTD drivers in several other setups: RedHat 9, Mandrake 9.2, but
> for reasons I can't yet fathom, the MTD drivers seem a bit unstable in this
> particular kernel.
> 
> Most frequently when I perform a umount /mnt/doc (doc being the mount point)
> the shell session freezes (the umount command does not return a prompt).

Hit SysRq-P and/or SysRq-T to see precisely where it's locked up.


> I tried in one kernel build to apply the latest sources to my source tree
> using the instructions (and the shell script) but this caused a compile
> failure.  

Insufficient information to diagnose.

-- 
dwmw2

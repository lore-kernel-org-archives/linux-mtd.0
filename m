Subject: Re: Preventing FS full
From: David Woodhouse <dwmw2@infradead.org>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
In-Reply-To: <OF2C2A2D93.9DE54A3F-ONC12577CA.004EC5B1-C12577CA.004F2498@transmode.se>
References: <OF2C2A2D93.9DE54A3F-ONC12577CA.004EC5B1-C12577CA.004F2498@transmode.se>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 28 Oct 2010 15:39:08 +0100
Message-ID: <1288276748.1538.58.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-10-28 at 16:24 +0200, Joakim Tjernlund wrote:
> Is there any way to temporarily lower the FS full limit(preferably on
> a process basis) on JFFS2?
> 
> I want to safeguard the OS from FS full due to some process filling up
> the disk.

The thresholds are in the resv_blocks_* variables and should be
relatively easy to tweak. I've toyed with the idea of exposing them in
sysfs. Tweaking them on a per-process basis is slightly less trivial but
shouldn't be that hard... you could add a certain number if the process
has CAP_SYS_RESOURCE or something.

Although it should *never* be possible to actually fill the space.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation

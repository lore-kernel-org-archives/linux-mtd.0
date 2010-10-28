Subject: Re: Preventing FS full
From: David Woodhouse <dwmw2@infradead.org>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
In-Reply-To: <OF3909837A.3650BEA2-ONC12577CA.0054F770-C12577CA.00554ADB@transmode.se>
References: <OF2C2A2D93.9DE54A3F-ONC12577CA.004EC5B1-C12577CA.004F2498@transmode.se>
	<1288276748.1538.58.camel@macbook.infradead.org>
	<OF3909837A.3650BEA2-ONC12577CA.0054F770-C12577CA.00554ADB@transmode.se>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 28 Oct 2010 22:34:57 +0100
Message-ID: <1288301697.25013.10.camel@macbook.infradead.org>
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

On Thu, 2010-10-28 at 17:31 +0200, Joakim Tjernlund wrote:
> hmm, don't quite get that. Isn't it possible to write until the FS is
> full.
> Surley you must at some pint return ENOSPC to user space and then you
> cannot write more files. or ...?

Oh, yeah -- that kind of full. Just not the *broken* kind of "eep,
there's no more space for GC" full :)

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation

Subject: Re: [PATCH 2/7] mtd: Add map file for mpc83xx boards
From: David Woodhouse <dwmw2@infradead.org>
To: Li Yang-r58472 <LeoLi@freescale.com>
In-Reply-To: <9FCDBA58F226D911B202000BDBAD467306E04FD3@zch01exm40.ap.freescale.net>
References: <9FCDBA58F226D911B202000BDBAD467306E04FD3@zch01exm40.ap.freescale.net>
Content-Type: text/plain
Date: Wed, 28 Jun 2006 15:27:41 +0100
Message-Id: <1151504861.17134.39.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Phillips Kim-R1AAHA <Kim.Phillips@freescale.com>,
	Yin Olivia-r63875 <Hong-Hua.Yin@freescale.com>,
	"'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>,
	linuxppc-dev@ozlabs.org,
	"'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>,
	Chu hanjin-r52514 <Hanjin.Chu@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2006-06-28 at 22:23 +0800, Li Yang-r58472 wrote:
> Flash mapping file for MPC83xx MDS platforms.

I'm not accepting any more individual map drivers unless they're
absolutely necessary, which this one isn't.

Use a platform device and physmap. Or better still, extend physmap to
handle of_devices too and just stick the flash information in the device
tree.

-- 
dwmw2

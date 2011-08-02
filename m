Received: from devils.ext.ti.com ([198.47.26.153])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qo8Xq-0006EX-AC
	for linux-mtd@lists.infradead.org; Tue, 02 Aug 2011 06:33:39 +0000
From: "Rajashekhara, Sudhakar" <sudhakar.raj@ti.com>
To: "Rajashekhara, Sudhakar" <sudhakar.raj@ti.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Tue, 2 Aug 2011 12:03:22 +0530
Subject: RE: [PATCH] mtd: nand: davinci: Add cpufreq support
Message-ID: <B85A65D85D7EB246BE421B3FB0FBB593024DE782F8@dbde02.ent.ti.com>
References: <1311241163-4576-1-git-send-email-sudhakar.raj@ti.com>
In-Reply-To: <1311241163-4576-1-git-send-email-sudhakar.raj@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "davinci-linux-open-source@linux.davincidsp.com"
	<davinci-linux-open-source@linux.davincidsp.com>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,

On Thu, Jul 21, 2011 at 15:09:23, Rajashekhara, Sudhakar wrote:
> This patch adds cpufreq support for NAND driver. During cpufreq
> transition, 'davinci_aemif_setup_timing()' function will be called
> to reconfigure that AEMIF timings for the new frequency.
>=20
> Tested on TI DA850/OMAP-L138 EVM.
>=20
> Signed-off-by: Rajashekhara, Sudhakar <sudhakar.raj@ti.com>

I have not seen any comments on this patch. Can you pull it in into your tr=
ee?

Thanks,
Sudhakar

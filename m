Received: from relay3-d.mail.gandi.net ([2001:4b98:c:538::195])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VvDSu-0000N1-Pt
 for linux-mtd@lists.infradead.org; Mon, 23 Dec 2013 21:55:09 +0000
Date: Mon, 23 Dec 2013 13:54:26 -0800
From: Josh Triplett <josh@joshtriplett.org>
To: "Franky (Zhenhui) Lin" <frankyl@broadcom.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "John W. Linville" <linville@tuxdriver.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Arend van Spriel <arend@broadcom.com>,
 Bill Metzenthen <billm@melbpc.org.au>, Brett Rudley <brudley@broadcom.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hante Meuleman <meuleman@broadcom.com>,
 Henk de Groot <pe1dnn@amsat.org>, Ingo Molnar <mingo@redhat.com>,
 Jingoo Han <jg1.han@samsung.com>, Larry Finger <Larry.Finger@lwfinger.net>,
 Lisa Nguyen <lisa@xenapiadmin.com>, Michal Marek <mmarek@suse.cz>,
 Pieter-Paul Giesberts <pieterpg@broadcom.com>,
 Piotr Haber <phaber@broadcom.com>, Shawn Guo <shawn.guo@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 brcm80211-dev-list@broadcom.com, devel@driverdev.osuosl.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, x86@kernel.org
Subject: [PATCH 0/7] Eliminate uses of __DATE__ and __TIME__
Message-ID: <cover.1387833347.git.josh@joshtriplett.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Using the __DATE__ and __TIME macros makes the kernel build non-deterministic.
The kernel already optionally records this information at build time, so random
kernel code shouldn't duplicate that.  Eliminate all uses of __DATE__ and
__TIME__, and then turn on a new GCC warning if available to make sure no new
uses get added.

Josh Triplett (7):
  mtd: denali: Drop print of build date/time
  net: wireless: brcm80211: Drop debug version with build date/time
  staging: rtl8188eu: Drop print of build date/time
  staging: rts5139: Drop print of build time
  staging: wlags49_h2: Drop debug macro recording build date/time
  x86: math-emu: Drop already-disabled print of build date
  Makefile: Build with -Werror=date-time if the compiler supports it

 Makefile                                             | 3 +++
 arch/x86/math-emu/errors.c                           | 5 -----
 drivers/mtd/nand/denali_pci.c                        | 1 -
 drivers/net/wireless/brcm80211/brcmfmac/dhd_common.c | 7 -------
 drivers/staging/rtl8188eu/os_dep/usb_intf.c          | 1 -
 drivers/staging/rts5139/rts51x_scsi.c                | 1 -
 drivers/staging/wlags49_h2/wl_version.h              | 4 ----
 7 files changed, 3 insertions(+), 19 deletions(-)

-- 
1.8.5.2

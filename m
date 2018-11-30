Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSoS7-0002pj-LT
 for linux-mtd@lists.infradead.org; Fri, 30 Nov 2018 19:27:52 +0000
From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To: linux-kernel@vger.kernel.org
Cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Amir Goldstein <amir73il@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Axtens <dja@axtens.net>, David Miller <davem@davemloft.net>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA
 GEFORCE/QUADRO GPUS), Eric Dumazet <edumazet@google.com>,
 Federico Vaga <federico.vaga@vaga.pv.it>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Helge Deller <deller@gmx.de>,
 Jonathan Corbet <corbet@lwn.net>, Joshua Kinard <kumba@gentoo.org>,
 Kees Cook <keescook@chromium.org>,
 linux-doc@vger.kernel.org (open list:DOCUMENTATION),
 linux-fsdevel@vger.kernel.org (open list:INOTIFY),
 linux-ide@vger.kernel.org (open list:IDE SUBSYSTEM),
 linux-m68k@lists.linux-m68k.org (open list:M68K ARCHITECTURE),
 linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)),
 linux-mips@linux-mips.org (open list:MIPS),
 linux-mtd@lists.infradead.org (open list:MEMORY TECHNOLOGY DEVICES (MTD)),
 linux-parisc@vger.kernel.org (open list:PARISC ARCHITECTURE),
 linux-pm@vger.kernel.org (open list:CPU FREQUENCY DRIVERS),
 linux-scsi@vger.kernel.org (open list:SCSI SUBSYSTEM),
 Matthias Brugger <matthias.bgg@gmail.com>,
 netdev@vger.kernel.org (open list:NETWORKING DRIVERS),
 nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO
 GPUS), Paolo Abeni <pabeni@redhat.com>, Paul Burton <paul.burton@mips.com>,
 Petr Mladek <pmladek@suse.com>, Rob Herring <robh@kernel.org>,
 Sean Wang <sean.wang@mediatek.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Shannon Nelson <shannon.nelson@oracle.com>,
 Stefano Brivio <sbrivio@redhat.com>,
 "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
 "Tobin C. Harding" <me@tobin.cc>,
 Toshiaki Makita <makita.toshiaki@lab.ntt.co.jp>,
 Willem de Bruijn <willemb@google.com>, Yonghong Song <yhs@fb.com>,
 Zhu Yanjun <yanjun.zhu@oracle.com>
Subject: [PATCH RFC 00/15] Zero ****s, hugload of hugs <3
Date: Fri, 30 Nov 2018 11:27:09 -0800
Message-Id: <20181130192737.15053-1-jarkko.sakkinen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In order to comply with the CoC, replace **** with a hug.

Jarkko Sakkinen (15):
  MIPS: replace **** with a hug
  Documentation: replace **** with a hug
  drm/nouveau: replace **** with a hug
  m68k: replace **** with a hug
  parisc: replace **** with a hug
  cpufreq: replace **** with a hug
  ide: replace **** with a hug
  media: replace **** with a hug
  mtd: replace **** with a hug
  net/sunhme: replace **** with a hug
  scsi: replace **** with a hug
  inotify: replace **** with a hug
  irq: replace **** with a hug
  lib: replace **** with a hug
  net: replace **** with a hug

 Documentation/kernel-hacking/locking.rst      |  2 +-
 arch/m68k/include/asm/sun3ints.h              |  2 +-
 arch/mips/pci/ops-bridge.c                    | 24 +++++++++----------
 arch/mips/sgi-ip22/ip22-setup.c               |  2 +-
 arch/parisc/kernel/sys_parisc.c               |  2 +-
 drivers/cpufreq/powernow-k7.c                 |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/bios/init.c   |  2 +-
 .../nouveau/nvkm/subdev/pmu/fuc/macros.fuc    |  2 +-
 drivers/ide/cmd640.c                          |  2 +-
 drivers/media/i2c/bt819.c                     |  8 ++++---
 drivers/mtd/mtd_blkdevs.c                     |  2 +-
 drivers/net/ethernet/sun/sunhme.c             |  4 ++--
 drivers/scsi/qlogicpti.h                      |  2 +-
 fs/notify/inotify/inotify_user.c              |  2 +-
 kernel/irq/timings.c                          |  2 +-
 lib/vsprintf.c                                |  2 +-
 net/core/skbuff.c                             |  2 +-
 17 files changed, 33 insertions(+), 31 deletions(-)

-- 
2.19.1

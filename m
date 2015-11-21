Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a0HL8-0003P1-9v
 for linux-mtd@lists.infradead.org; Sat, 21 Nov 2015 23:13:06 +0000
Received: by wmec201 with SMTP id c201so115967099wme.0
 for <linux-mtd@lists.infradead.org>; Sat, 21 Nov 2015 15:12:44 -0800 (PST)
Subject: [PATCH 0/3] spi: mtd: Handle HW message length restrictions
References: <564CEB61.2000601@gmail.com>
 <20151118215755.GL31303@sirena.org.uk> <564D0098.4030107@gmail.com>
 <20151119114057.GN31303@sirena.org.uk>
 <F224F5F3-FAD5-47FE-9419-39E53BCBB8C6@sperl.org>
 <20151119171538.GO31303@sirena.org.uk>
 <9CDADBED-FD18-4635-82A9-5AB14C9ABCAE@sperl.org>
 <20151120120502.GT31303@sirena.org.uk>
 <08871ECD-52DF-4CBF-AF3D-4C3A442C008A@sperl.org>
 <20151121134946.GI26072@sirena.org.uk> <56507B3B.4080608@gmail.com>
 <CAOMqctR=UDEPbgJDY3YvxpbVEEp4t6ajkyv=cVAZp2fLBNBanA@mail.gmail.com>
Cc: Michal Suchanek <hramrach@gmail.com>, Martin Sperl <martin@sperl.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, Brian Norris <computersforpeace@gmail.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <5650F743.9050500@gmail.com>
Date: Sat, 21 Nov 2015 23:59:15 +0100
MIME-Version: 1.0
In-Reply-To: <CAOMqctR=UDEPbgJDY3YvxpbVEEp4t6ajkyv=cVAZp2fLBNBanA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Based on the ongoing discussion how to handle HW restrictions
like max SPI message size this is a new proposal.

Heiner Kallweit (3):
  spi: core: add max_msg_size to spi_master
  mtd: m25p80: handle HW message size restrictions
  spi: fsl-espi: make use of max_msg_size in spi_master to handle HW restrictions

 drivers/mtd/devices/m25p80.c | 39 ++++++++++++++++++++++++++++++++++-----
 drivers/spi/spi-fsl-espi.c   |  1 +
 include/linux/spi/spi.h      |  4 ++++
 3 files changed, 39 insertions(+), 5 deletions(-)

-- 
2.6.2

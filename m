From: LABBE Corentin <clabbe.montjoie@gmail.com>
To: computersforpeace@gmail.com, davem@davemloft.net, dwmw2@infradead.org,
 herbert@gondor.apana.org.au, jamie@jamieiles.com, josh.wu@atmel.com,
 linux-arm-kernel@lists.infradead.org
Cc: LABBE Corentin <clabbe.montjoie@gmail.com>, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: [PATCH v2 0/2] fix a possible NULL dereference
Date: Fri, 20 Nov 2015 08:45:15 +0100
Message-Id: <1448005517-26004-1-git-send-email-clabbe.montjoie@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello

The main goal of this patch series is to fix a possible NULL dereference.
Even if the probability of this case is very low, fixing it made
static analyzers happy.
In the same time it permits to remove a "cast that drop const qualifiers.

Regards

Changes since v1
- Use of_device_get_match_data
- Add the missing patch for constify atmel_nand_caps structures

LABBE Corentin (2):
  mtd: nand: atmel_nand: constify atmel_nand_caps structures
  mtd: nand: atmel_nand: fix a possible NULL dereference

 drivers/mtd/nand/atmel_nand.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

-- 
2.4.10

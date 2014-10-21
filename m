From: Roger Quadros <rogerq@ti.com>
To: <computersforpeace@gmail.com>, <dwmw2@infradead.org>
Subject: [PATCH 0/2] mtd: oobtest: Add parameter to ignore bitflip errors
 within specified limit
Date: Tue, 21 Oct 2014 16:53:26 +0300
Message-ID: <1413899608-3911-1-git-send-email-rogerq@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Roger Quadros <rogerq@ti.com>, linux-mtd@lists.infradead.org,
 akinobu.mita@gmail.com, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

The oobtest case uses raw NAND read/writes to OOB area bypassing the error correction
mechanism and hence is bound to be affected by bitflip errors which are normal
in NAND memories. (e.g. we can never get DRA7-evm's NAND to fully pass
mtd_oobtest).

In these patches we add a module parameter "bitflip_limit" to specify how many
bitflips per page are tolerable. Not specifiing the parameter defaults to old
behaviour (i.e. zero bitflips tolerated).
Specifying bitflip_limit=1 makes us pass on DRA7-evm with 0 errors.

Introduce a new memcmpshow() function that shows the data byte where comparison failed.
This is useful for debugging. The same function is also used to calculate number of
bitflip errors over the data block.

cheers,
-roger

Roger Quadros (2):
  mtd: mtd_oobtest: Show the verification error location and data
  mtd: mtd_oobtest: add bitflip_limit parameter

 drivers/mtd/tests/oobtest.c | 77 +++++++++++++++++++++++++++++++++++++--------
 1 file changed, 64 insertions(+), 13 deletions(-)

-- 
1.8.3.2

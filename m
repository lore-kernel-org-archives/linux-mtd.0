From: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
To: Santosh Shilimkar <santosh.shilimkar@ti.com>, Rob Landley
 <rob@landley.net>, Russell King <linux@arm.linux.org.uk>
Subject: [PATCH v2 05/10] mtd: nand: davinci: move bindings under mtd
Date: Thu, 21 Nov 2013 13:28:20 +0200
Message-ID: <1385033305-13179-6-git-send-email-ivan.khoronzhuk@ti.com>
In-Reply-To: <1385033305-13179-1-git-send-email-ivan.khoronzhuk@ti.com>
References: <1385033305-13179-1-git-send-email-ivan.khoronzhuk@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 grygorii.strashko@ti.com, Pawel Moll <pawel.moll@arm.com>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@kernel.crashing.org>, Rob Herring <rob.herring@calxeda.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Move bindings under mtd. Do this in order to make davinci-nand
driver usable by keystone architecture.

Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
Acked-by: Santosh Shilimkar <santosh.shilimkar@ti.com>
Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 .../{arm/davinci/nand.txt => mtd/davinci-nand.txt} |    0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/{arm/davinci/nand.txt => mtd/davinci-nand.txt} (100%)

diff --git a/Documentation/devicetree/bindings/arm/davinci/nand.txt b/Documentation/devicetree/bindings/mtd/davinci-nand.txt
similarity index 100%
rename from Documentation/devicetree/bindings/arm/davinci/nand.txt
rename to Documentation/devicetree/bindings/mtd/davinci-nand.txt
-- 
1.7.9.5

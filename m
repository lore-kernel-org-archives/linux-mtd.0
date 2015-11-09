Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zvfrz-0002FM-G1
 for linux-mtd@lists.infradead.org; Mon, 09 Nov 2015 06:24:00 +0000
Received: by pabfh17 with SMTP id fh17so188817080pab.0
 for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2015 22:23:37 -0800 (PST)
From: Saurabh Sengar <saurabh.truth@gmail.com>
To: andy.shevchenko@gmail.com
Cc: joern@lazybastard.org, dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Saurabh Sengar <saurabh.truth@gmail.com>
Subject: [PATCH v2] mtd: phram: error handling
Date: Mon,  9 Nov 2015 11:53:18 +0530
Message-Id: <1447050198-20562-1-git-send-email-saurabh.truth@gmail.com>
In-Reply-To: <CAHp75VeUie1VdWUgXfFD6XqU5t_9j-40papME3-8MUvjMh1iMw@mail.gmail.com>
References: <CAHp75VeUie1VdWUgXfFD6XqU5t_9j-40papME3-8MUvjMh1iMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

registering the device with NULL pointer can lead to crash,
hence fixing it

Signed-off-by: Saurabh Sengar <saurabh.truth@gmail.com>
---
> Andy Shevchenko wrote:
> Hmm… Why not just checking it before an register attempt? I think user
> is in right to know as many problems as they have at one shot, with
> your patch if there are two problems the user has to try twice.
Yes, taken your feedback, fixing it here in v2 as you recommended

 drivers/mtd/devices/phram.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index 8b66e52..46b7a8a 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -257,6 +257,9 @@ static int phram_setup(const char *val)
 		parse_err("illegal device length\n");
 	}
 
+	if(!name)
+		return -EINVAL;
+
 	ret = register_device(name, start, len);
 	if (!ret)
 		pr_info("%s device: %#llx at %#llx\n", name, len, start);
-- 
1.9.1

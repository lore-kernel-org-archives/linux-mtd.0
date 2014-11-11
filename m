Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XoABb-00057f-0v
 for linux-mtd@lists.infradead.org; Tue, 11 Nov 2014 12:04:40 +0000
Message-ID: <1415707434.22887.158.camel@sauron.fi.intel.com>
Subject: Re: [PATCH V6] UBI: Extend UBI layer debug/messaging capabilities
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>
Date: Tue, 11 Nov 2014 14:03:54 +0200
In-Reply-To: <5461C5AD.5040705@nod.at>
References: <1415023112-21704-1-git-send-email-tlinder@codeaurora.org>
 <5460F7D8.2030100@nod.at> <5461C5AD.5040705@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Tanya Brokhman <tlinder@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2014-11-11 at 09:15 +0100, Richard Weinberger wrote:
> > Do we really want the function name in every log message?
> > IMHO this is not wise except for pure debug logs.
> 
> BTW: Why UBI-X? This looks odd. Either use UBIX or ubiX.

How about something like this (untested):


From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Date: Tue, 11 Nov 2014 13:56:34 +0200
Subject: [PATCH] UBI: clean-up printing helpers

Let's prefix UBI messages with 'ubiX' instead of 'UBI-X' - this is more
consistent with the way we name UBI devices.

Also, commit "32608703 UBI: Extend UBI layer debug/messaging capabilities"
added the function name print to 'ubi_msg()' - lets revert this change, since
these messages are supposed to be just informative messages, and not debugging
messages.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/ubi.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index f80ffab..7a92283 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -50,13 +50,13 @@
 #define UBI_NAME_STR "ubi"
 
 /* Normal UBI messages */
-#define ubi_msg(ubi, fmt, ...) pr_notice("UBI-%d: %s:" fmt "\n", \
-					 ubi->ubi_num, __func__, ##__VA_ARGS__)
+#define ubi_msg(ubi, fmt, ...) pr_notice("ubi%d: " fmt "\n", \
+					 ubi->ubi_num, ##__VA_ARGS__)
 /* UBI warning messages */
-#define ubi_warn(ubi, fmt, ...) pr_warn("UBI-%d warning: %s: " fmt "\n", \
+#define ubi_warn(ubi, fmt, ...) pr_warn("ubi%d warning: %s: " fmt "\n", \
 					ubi->ubi_num, __func__, ##__VA_ARGS__)
 /* UBI error messages */
-#define ubi_err(ubi, fmt, ...) pr_err("UBI-%d error: %s: " fmt "\n", \
+#define ubi_err(ubi, fmt, ...) pr_err("ubi%d error: %s: " fmt "\n", \
 				      ubi->ubi_num, __func__, ##__VA_ARGS__)
 
 /* Background thread name pattern */
-- 
1.9.3

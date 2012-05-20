Received: from [78.46.68.141] (helo=eristoteles.iwoars.net)
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SW4Q5-0001Cr-F5
 for linux-mtd@lists.infradead.org; Sun, 20 May 2012 11:35:30 +0000
Date: Sun, 20 May 2012 13:35:26 +0200 (CEST)
From: Joel Reardon <joel@clambassador.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [patch] UBIFS: improved comment for data node's format history
In-Reply-To: <1337427288.2041.24.camel@koala>
Message-ID: <alpine.DEB.2.00.1205201334080.26953@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1205151101100.17750@eristoteles.iwoars.net>
 <1337087022.2528.204.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1205161451250.27131@eristoteles.iwoars.net>
 <alpine.DEB.2.00.1205191027340.18672@eristoteles.iwoars.net>
 <1337427288.2041.24.camel@koala>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A few more lines of comment on ksa_pos field in struct ubifs_data_node.

Signed-off-by: Joel Reardon <reardonj@inf.ethz.ch>
---
 fs/ubifs/ubifs-media.h |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/fs/ubifs/ubifs-media.h b/fs/ubifs/ubifs-media.h
index 55f2ccd..90f348c 100644
--- a/fs/ubifs/ubifs-media.h
+++ b/fs/ubifs/ubifs-media.h
@@ -545,6 +545,11 @@ struct ubifs_dent_node {
  * @padding: reserved for future, zeroes
  * @data: data
  *
+ * The @ksa_pos value is used for secure deletion enhancement of UBIFS.
+ * In older versions of UBIFS, @ksa_pos did not exist but was instead an
+ * unused part of @key and was set to all zeros. UBIFS partitions with secure
+ * deletion disabled also store all zeros for ksa_pos.
+ *
  * Note, do not forget to amend 'zero_data_node_unused()' function when
  * changing the padding fields.
  */
-- 
1.7.5.4

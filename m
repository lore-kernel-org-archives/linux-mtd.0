From: Li Wang <li.wang@windriver.com>
To: <dwmw2@infradead.org>, <Artem.Bityutskiy@nokia.com>, <stefani@seibold.net>
Subject: mtd: put flash block erasing into wait queue,
 if has any thread in queue
Date: Thu, 14 Aug 2014 17:50:32 +0800
Message-ID: <1408009833-26494-1-git-send-email-li.wang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


flash erasing maybe block writing operation.
make erasing operation sleep, when the other thread is in wait queue.

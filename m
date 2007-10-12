From: "Kyungmin Park" <kmpark@infradead.org>
To: "'Adrian Hunter'" <ext-adrian.hunter@nokia.com>,
	"'ext Kyungmin Park'" <kmpark@infradead.org>
References: <470F1FFE.2090306@nokia.com>
Subject: RE: [PATCH] MTD: OneNAND: Synchronize block locking operations
Date: Fri, 12 Oct 2007 18:23:52 +0900
Message-ID: <003701c80cb1$9e210d10$e1ac580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
In-reply-to: <470F1FFE.2090306@nokia.com>
Cc: linux-mtd@lists.infradead.org
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Ensure OneNAND's block locking operations are synchronized
> like all other operations.
> 
> Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>

Yes, it's reasonable.
While the read/write operation we can do lock/unlock request from userspace.

Acked-by: Kyungmin Park <kyungmin.park@samsung.com>

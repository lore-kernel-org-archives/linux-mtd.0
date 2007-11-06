From: "Kyungmin Park" <kyungmin.park@samsung.com>
To: "'Adrian Hunter'" <ext-adrian.hunter@nokia.com>,
	<linux-mtd@lists.infradead.org>
References: <47301505.60006@nokia.com>
Subject: RE: [PATCH] [MTD] [OneNAND] Do not stop reading for ECC errors
Date: Tue, 6 Nov 2007 17:26:41 +0900
Message-ID: <002001c8204e$c71577f0$e1ac580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-reply-to: <47301505.60006@nokia.com>
Cc: joern@logfs.org, kmpark@infradead.org
Reply-To: kyungmin.park@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Subject: [PATCH] [MTD] [OneNAND] Do not stop reading for ECC errors
> 
> When an ECC error occurs, the read should be completed
> anyway before returning -EBADMSG.  Returning -EBADMSG
> straight away is incorrect.
> 
> Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>

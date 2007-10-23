Subject: Re: [PATCH]CFI fix of kernel deadlock caused by get_chip recursion
From: David Woodhouse <dwmw2@infradead.org>
To: Alexey Korolev <akorolev@infradead.org>
In-Reply-To: <Pine.LNX.4.64.0710221745440.25306@pentafluge.infradead.org>
References: <Pine.LNX.4.64.0710181501270.32655@pentafluge.infradead.org>
	<1192888614.26380.50.camel@shinybook.infradead.org>
	<Pine.LNX.4.64.0710221745440.25306@pentafluge.infradead.org>
Content-Type: text/plain
Date: Tue, 23 Oct 2007 11:57:10 +0100
Message-Id: <1193137030.20893.43.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Nico@cam.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2007-10-22 at 17:55 +0100, Alexey Korolev wrote:
> Oops. It seems I missed the latest changes in CFI driver. Thank you.
> The patch is corrected. It should be Ok now.

Still doesn't apply to the mtd-2.6 tree or to Linus' tree.

-- 
dwmw2

From: David Woodhouse <dwmw2@infradead.org>
To: Russell King <rmk@arm.linux.org.uk>
In-Reply-To: <20050124233941.C5541@flint.arm.linux.org.uk>
References: <20050124233941.C5541@flint.arm.linux.org.uk>
Content-Type: text/plain
Date: Mon, 24 Jan 2005 23:43:19 +0000
Message-Id: <1106610200.6480.97.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Fix MTD device probing... (really)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-01-24 at 23:39 +0000, Russell King wrote:
> Fix MTD device probing, trying larger numbers of chips before smaller
> numbers of chips across the bus width.
> 
> This means we'll avoid misdetecting a 2 x16 array as 1 x32 if the
> high 16-bits happen to read as zeros in the QRY area.

Looks obviously correct to me. Please commit it.

-- 
dwmw2

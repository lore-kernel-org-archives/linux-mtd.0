From: David Woodhouse <dwmw2@infradead.org>
To: Dave Dillow <dave@thedillows.org>
In-Reply-To: <1103151351.5814.12.camel@dillow.idleaire.com>
References: <EFF9A3506F74924AB5CC77BDC66E7935181391@atcml01.atc.army.mil>
	<1103149330.5809.1.camel@dillow.idleaire.com>
	<1103151351.5814.12.camel@dillow.idleaire.com>
Content-Type: text/plain
Date: Tue, 21 Dec 2004 11:43:14 +0000
Message-Id: <1103629394.6111.59.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: Big Problem with DOC 128Mbyte Help! ADDED Note
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-12-15 at 17:55 -0500, Dave Dillow wrote:
> Have you tried an alternate means of booting? Perhaps using a modified
> grub in place of M-System's BIOS driver? I've not tried it, but it
> could help you avoid having their code trample your filesystem

The real answer is to fix our implementation of INFTL so that it isn't
considered corrupt by their code. Unfortunately the INFTL documentation
isn't public -- but there are people from M-Systems on this list.
Perhaps they could look at it?

-- 
dwmw2

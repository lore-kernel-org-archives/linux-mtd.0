From: David Woodhouse <dwmw2@infradead.org>
To: Ian Campbell <icampbell@arcom.com>
In-Reply-To: <1099057831.24918.1684.camel@icampbell-debian>
References: <1099057831.24918.1684.camel@icampbell-debian>
Content-Type: text/plain
Message-Id: <1101121681.8191.7439.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Mon, 22 Nov 2004 11:08:02 +0000
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/2] fix detection of redboot fis partition table
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2004-10-29 at 14:50 +0100, Ian Campbell wrote:
> The patch (against BK) below sorts these out. Is it OK to commit to MTD
> CVS and then send to Linus?

Please commit them. I'll put them in the BK tree for pulling after
2.6.10 is released.

-- 
dwmw2

From: David Woodhouse <dwmw2@infradead.org>
To: Andre Sodermans <andreesje_werk@yahoo.com>
In-Reply-To: <20040511155327.9810.qmail@web41502.mail.yahoo.com>
References: <20040511155327.9810.qmail@web41502.mail.yahoo.com>
Content-Type: text/plain
Message-Id: <1084291123.4426.26.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 11 May 2004 16:58:44 +0100
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: diskonchip2000 support in 2.4.22
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-05-11 at 08:53 -0700, Andre Sodermans wrote:
> hmmmm
> 
> So, I do need 'CONFIG_INFTL'? I wasn't sure when I
> built my most recent kernel.

Yes, and then you need to write support for the Bad Block Table.
It's not hard -- I can help you. But I haven't got round to doing it
myself yet, and while it's not yet done the hardware driver deliberately
disables itself.

-- 
dwmw2

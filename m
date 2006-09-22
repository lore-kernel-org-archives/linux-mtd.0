Subject: Re: [PATCH] cmx270-nand: Make CMDLINE_PARTS usable
From: David Woodhouse <dwmw2@infradead.org>
To: Raphael Assenat <raph@8d.com>
In-Reply-To: <4513F01D.80608@8d.com>
References: <4507FE99.3030106@8d.com>
	<1158917790.24527.664.camel@pmac.infradead.org> <4513F01D.80608@8d.com>
Content-Type: text/plain
Date: Fri, 22 Sep 2006 15:44:00 +0100
Message-Id: <1158936240.24527.733.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-09-22 at 10:15 -0400, Raphael Assenat wrote:
> Oh, sorry. My patch applies over the patch Mike Rapoport sent to the list on July 18
> ([PATCH] [MTD] CM-x270 NAND flash support), which I thought was already accepted. Was 
> there anything wrong with it? Maybe you just missed it...
> 
> I also sent a patch to the list on July 21 which added NAND flash support for the cm-x255 
> boards ([PATCH] Add support for NAND flash on cm-x255) but received no feedback. I can 
> resend it if you wish.

July and August weren't really a good time for sending stuff that you
expect me to pay attention to; sorry. Yes -- please retest and resend.

Can you explain how these two boards differ, and why they need two
separate drivers?

> (BTW, every time I send to the linux-mtd list my message is held for moderator approval 
> for reason 'Message has a suspicious header'. Who should I contact for more information? 
> I'd like to know exactly what header(s) is/are 'suspicious' and fix them if possible).

It just doesn't like attachments. Send patches inline and they shouldn't
get trapped.

-- 
dwmw2

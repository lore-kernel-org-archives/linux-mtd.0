Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19CwMV-0006ZI-4Z
	for <linux-mtd@lists.infradead.org>; Tue, 06 May 2003 07:55:39 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Alex Pavloff <apavloff@eason.com>
In-Reply-To: <D3AF5F134D627243993F2F2FC32EE4D229C730@mailman.eason.com>
References: <D3AF5F134D627243993F2F2FC32EE4D229C730@mailman.eason.com>
Message-Id: <1052204152.7532.24.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Tue, 06 May 2003 07:55:52 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: CompactFlash...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2003-05-05 at 22:26, Alex Pavloff wrote:
> 1) Do CF cards when used in ATA (or other modes) have built in wear
> leveling?  Mfg docs appear to be inconsistent.

Maybe. The manufacturers aren't very forthcoming -- which probably means
'no'. Some of the more expensive ones may, though.

> 2) Would JFFS2 or other journaled file systems be applicable when using
> CompactFlash in I/O or Memory Mode (rather than True IDE mode)?

You have 'True IDE' mode where the electrical interface is IDE and you
plug it into an IDE controller, and you have the PCMCIA mode where you
plug it into a PCMCIA controller and it behaves as PCMCIA-IDE. There's
no way to bypass the IDE emulation and talk to the flash directly,
except possibly by undocumented vendor-specific commands.

-- 
dwmw2

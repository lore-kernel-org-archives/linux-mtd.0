Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KrpxJ-0003Kh-Ar
	for linux-mtd@lists.infradead.org; Mon, 20 Oct 2008 08:17:37 +0000
Date: Mon, 20 Oct 2008 10:17:31 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: "Spinelli, Claudio (Claudio)" <claudio@alcatel-lucent.com>
Subject: Re: Mark bad eraseblock back to good
In-Reply-To: <8F3CB692693422439A8F95F2D06F73E1E4D9DF@ILEXC3U01.ndc.lucent.com>
Message-ID: <Pine.LNX.4.64.0810201016060.6120@lnxricardw.se.axis.com>
References: <8F3CB692693422439A8F95F2D06F73E1E4D9DF@ILEXC3U01.ndc.lucent.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 17 Oct 2008, Spinelli, Claudio (Claudio) wrote:

> Hi,
>
> I am using a nand flash that has a lot of marked bad eraseblock. I think
> that are marked bad from previous mistake in my nand flash driver.
> Does anybody have a modified flash_eraseall that marks bad eraseblock
> back to good. Or any scripts that does that?

The inability to remove bad block markers is built into the mtd code so=20
there is no way around it using a userspace program.

It is easy however to remove or comment out the relevant lines in the mtd=
=20
code, rebuild the kernel, and then use flash_erase to erase the blocks.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30

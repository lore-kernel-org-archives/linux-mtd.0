Received: from nat-132.atmel.no ([80.232.32.132] helo=relay.atmel.no)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Hm5p2-0006qY-Cr
	for linux-mtd@lists.infradead.org; Thu, 10 May 2007 06:24:40 -0400
Subject: Re: Problems with cfi_cmdset_0002 and Atmel AT49BV642D
From: Hans-Christian Egtvedt <hcegtvedt@atmel.com>
To: Michael =?ISO-8859-1?Q?K=F6nig?= <Michael.Koenig@ipcas.de>
In-Reply-To: <EA3F0F32C26AA132D54202A0@franken3>
References: <D1CA5322EC0446D8F2053C9D@franken3>
	<B2FC9E5F094119A0F71B96EF@franken3>
	<1178718379.11554.34.camel@localhost.localdomain>
	<AFDBC52C05E4EA53B68C61AD@franken3>
	<1178781348.11554.52.camel@localhost.localdomain>
	<20070510102703.04a398ee@dhcp-252-105.norway.atmel.com>
	<EA3F0F32C26AA132D54202A0@franken3>
Content-Type: text/plain; charset=utf-8
Date: Thu, 10 May 2007 12:24:15 +0200
Message-Id: <1178792655.11554.62.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Haavard Skinnemoen <hskinnemoen@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-05-10 at 12:13 +0200, Michael König wrote:
> > So if you have the patch available, now would probably be a good time
> > to post it ;-)
> 
> Unfortunately I don't have any experience with GIT and also don't have the 
> time to set it up right now, but I'm attaching a "diff -p" for the changes 
> to the latest cfi_cmdset_0002.c in the repository.

Ah, very similar to the patch I posted against 2.6.20. The email is held
for approval for some reason, but this patch will do the same. Only
difference is that I put fixup_convert_atmel_pri on the top, since none
of the other fixups should read anything from an Atmel device CFI
information before it has been corrected.

-- 
With kind regards,

Hans-Christian Egtvedt, siv.ing. (M.Sc.)
Applications Engineer - AVR32 System Solutions - Atmel Norway

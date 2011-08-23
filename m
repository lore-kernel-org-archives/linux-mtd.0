Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qvx6c-0002uo-13
	for linux-mtd@lists.infradead.org; Tue, 23 Aug 2011 19:57:50 +0000
Received: by wwf10 with SMTP id 10so342984wwf.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 23 Aug 2011 12:57:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAB4PhKeGy9k2KwMiPcvT_WwcJAvL2Ugh-mgg7su62MOLYCXetw@mail.gmail.com>
References: <1313625029-19546-1-git-send-email-computersforpeace@gmail.com>
	<1313625029-19546-2-git-send-email-computersforpeace@gmail.com>
	<CAB4PhKeGy9k2KwMiPcvT_WwcJAvL2Ugh-mgg7su62MOLYCXetw@mail.gmail.com>
Date: Tue, 23 Aug 2011 12:57:47 -0700
Message-ID: <CAN8TOE8u+AGq9uEzOmngv-_UZ0BiHB4M2sJVEXzs2fgyTcYGYg@mail.gmail.com>
Subject: Re: [RFC 1/5] mtd: support MTD_MODE_RAW for writing OOB
From: Brian Norris <computersforpeace@gmail.com>
To: Jason Liu <liu.h.jason@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
	Mike Frysinger <vapier.adi@gmail.com>,
	Artem Bityutskiy <dedekind1@gmail.com>,
	Kevin Cernekee <cernekee@gmail.com>, b35362@freescale.com,
	Jim Quinlan <jim2101024@gmail.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, Matthew Creech <mlcreech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 22, 2011 at 10:25 PM, Jason Liu <liu.h.jason@gmail.com> wrote:
> 2011/8/18 Brian Norris <computersforpeace@gmail.com>:
>> This fixes issues with `nandwrite -n' and the MEMWRITEOOB[64] ioctls.
>
> It's worthy here stating clear what the issue you meet and how it fix.

The issue is simply that `nandwrite -n -o' does not work on my system;
`nandwrite -n' can write page data to my flash without applying ECC,
but when I use the `-o' option, ECC is applied (incorrectly), contrary
to the `--noecc' option.

I found that this is the case because my hardware computes and writes
ECC data to flash upon either OOB write or page write. Thus, to
support a proper "no ECC" write, my driver must know when we're
performing a raw OOB write vs. a normal ECC OOB write. However, MTD
does not pass any raw mode information to the write_oob functions.
This patch addresses the problems by:
1) Passing MTD_OOB_RAW down to lower layers, instead of just
defaulting to MTD_OOB_PLACE
2) Handling MTD_OOB_RAW within the NAND layer's `nand_do_write_oob'

Is this a better description? I'll include this description for v2.

Note that I have yet to update the appropriate `nand_write_page_raw'
function to properly handle an OOB-only write. I've fixed my own
driver, but there's an issue in the nand_base version. Will include in
v2.

Thanks,
Brian

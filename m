Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P8pRE-0006zB-3I
	for linux-mtd@lists.infradead.org; Thu, 21 Oct 2010 07:19:48 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 0/2] mtd-utils fixups
Date: Thu, 21 Oct 2010 00:19:35 -0700
Message-ID: <1287645577-13538-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <AANLkTikXF5CV8SFOC5Ygzw4fNBvgzbifQK2eeH7D1bbM@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Mike Frysinger <vapier.adi@gmail.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

OK, this should be a decent rewrite. Again, I'm very sorry for the very
previous mangled patches. There was some laziness on my part compounded
by my misreading of Mike's responses.

Please provide any comments you have, especially regarding usage of libmtd
and even tips on replacing straight-up calls to ioctl. I'm sure I haven't
hit everything important.

Also, I'm working through nandwrite at the moment. It seems a tougher
slog though.

Thanks,
Brian

Brian Norris (2):
  mtd-utils: nanddump/nandwrite: style, signed-ness, printing fixups
  mtd-utils: nanddump: add 64-bit support, utilize libmtd

 nanddump.c  |  126 ++++++++++++++++++++++++++++------------------------------
 nandwrite.c |   28 +++++++-------
 2 files changed, 75 insertions(+), 79 deletions(-)

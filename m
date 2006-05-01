Received: from smtpauth07.mail.atl.earthlink.net ([209.86.89.67])
	by pentafluge.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FagHT-0000hv-9c
	for linux-mtd@lists.infradead.org; Mon, 01 May 2006 22:50:14 +0100
Received: from [209.86.224.44] (helo=elwamui-ovcar.atl.sa.earthlink.net)
	by smtpauth07.mail.atl.earthlink.net with asmtp (Exim 4.34)
	id 1FagHE-0007CP-1K
	for linux-mtd@lists.infradead.org; Mon, 01 May 2006 17:49:56 -0400
Message-ID: <6361049.1146520195983.JavaMail.root@elwamui-ovcar.atl.sa.earthlink.net>
Date: Mon, 1 May 2006 17:49:55 -0400 (EDT)
From: Steve Finney <saf76@earthlink.net>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Subject: mtd-utils
Reply-To: Steve Finney <saf76@earthlink.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm new on this list, but not new to Linux...I've been using mtd-utils recently,
and find a few rough edges. I'd be happy to fix them, but I just wanted to check
first about whether there's some reason these aren't good ideas...

1) nandwrite and nanddump only take decimal for numbers like offsets; it
  seems as if a hex option would be useful (just change atoi to strtol).

2) nandump does not provide an option for reading non-error-corrected
  data; I'm playing with ECC on a Samsung chip. so this would be useful for
  debugging. I guess this would just be adding an SETOOBSEL as is done
  in nandwrite?

3) flash_erase doesn't have any usage or --help option.

If these would be generally useful things, I can post the (fairly trivial)
patches to the list.

sf

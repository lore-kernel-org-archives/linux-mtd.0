Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from [206.57.94.212] (helo=devel.ftel.com)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11fnIQ-0002jw-00
	for mtd@infradead.org; Mon, 25 Oct 1999 17:48:34 +0100
Message-Id: <199910251649.JAA01052@devel.ftel.com>
Date: Mon, 25 Oct 1999 09:49:16 -0700 (MST)
To: David.Woodhouse@mvhi.com
Cc: jeff@planetfall.com, ieure@uswest.net, linux-kernel@vger.rutgers.edu,
        mtd@infradead.org
From: Mike Kilburn <mkilburn@ftel.net>
Subject: Re[2]: Linux + DiskOnChip problems
In-Reply-To: <E11ech6-0003J5-00@devel2.axiom.internal>
MIME-Version: 1.0
Content-Type: text/plain
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse <David.Woodhouse@mvhi.com> wrote:
> OK - I've asked them about it.
> 
> It appears that the DiskOnChip firmware and LILO 'cannot work together since
> they use the same addresses'.

syslinux works fine with the normal firmware and the msys (IGEL) driver.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org

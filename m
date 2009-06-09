Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1ME0pb-0007E9-I8
	for linux-mtd@lists.infradead.org; Tue, 09 Jun 2009 12:53:44 +0000
Subject: Re: [PATCH] [MTD-UTILS] Bad block handling in nandwrite when
	reading from standard input
From: Artem Bityutskiy <dedekind@infradead.org>
To: Jehan Bing <jehan@orb.com>
In-Reply-To: <h0k3il$ij6$1@ger.gmane.org>
References: <h0k3il$ij6$1@ger.gmane.org>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 09 Jun 2009 15:53:03 +0300
Message-Id: <1244551983.5847.388.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-06-08 at 15:32 -0700, Jehan Bing wrote:
> Nandwrite tries to use lseek() when failing to write on a page. lseek() will fail when used on the standard input so nandwrite fails. This code replaces lseek with a buffer.
> 
> When the data is read, it is put in a buffer (filebuf). This buffer is reset at each block boundary. So a "seek" just means reading from the beginning of the buffer. writebuf and oobreadbuf are now just pointers to locations in filebuf.
> 
> With this change, reading from stdin or from a file now uses the same code path.
> 
> 
> Signed-off-by: Jehan Bing <jehan@orb.com>

Too large patch for me to review. Could you split it on few smaller
ones please?

Also, please, do not send e-mails with
 looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong
lines. Please, wrap them to 78 characters. You'll make it then
easier for other people to deal with you. Let's be nice.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)

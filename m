Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PN0R5-0004Na-VZ
	for linux-mtd@lists.infradead.org; Mon, 29 Nov 2010 09:54:18 +0000
Received: by wyf22 with SMTP id 22so4285070wyf.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 29 Nov 2010 01:54:14 -0800 (PST)
Sender: Peter Korsgaard <jacmet@gmail.com>
From: Peter Korsgaard <jacmet@sunsite.dk>
To: "Vladimir Khmelnitsky" <vladimir@broadlight.com>
Subject: Re: simple ubi reader
References: <AFC5977FF9FA3E449BB7803E9BA754EF01D8AE25@mailsrv.broadlight.com>
Date: Mon, 29 Nov 2010 10:54:04 +0100
In-Reply-To: <AFC5977FF9FA3E449BB7803E9BA754EF01D8AE25@mailsrv.broadlight.com>
	(Vladimir Khmelnitsky's message of "Sun, 28 Nov 2010 11:27:04 +0200")
Message-ID: <874ob0zc8z.fsf@macbook.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>>>> "Vladimir" == Vladimir Khmelnitsky <vladimir@broadlight.com> writes:

 Vladimir> Hi,

 Vladimir> I need to write bootloader which should read its second stage
 Vladimir> binary from ubi volume.  I wonder if there is some simple
 Vladimir> open source code I can use to implement ubi volume reader?

John Ogness from Linuxtronic did a short presentation about a small
bootloader doing this at ELCE:

http://www.elinux.org/images/4/45/Ipl_and_ubi.pdf

I don't know if his code is available online, but you could try mailing
him.

-- 
Bye, Peter Korsgaard

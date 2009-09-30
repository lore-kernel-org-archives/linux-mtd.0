Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Msrx0-0005JZ-JX
	for linux-mtd@lists.infradead.org; Wed, 30 Sep 2009 05:42:10 +0000
Subject: Re: UBIFS Error
From: Artem Bityutskiy <dedekind1@gmail.com>
To: JerinJacob <jerin.jacob@maxim-ic.com>
In-Reply-To: <4AC19FA0.1090301@maxim-ic.com>
References: <4AA5F37F.4050307@maxim-ic.com> <4AA60E6C.6060307@nokia.com>
	<4AA8EA9C.4070805@maxim-ic.com> <4AA8ED7B.5020509@nokia.com>
	<4AA8F6E4.1090209@maxim-ic.com> <4AA90351.3050000@nokia.com>
	<4AAA4005.9080707@maxim-ic.com> <1252938440.5060.102.camel@localhost>
	<1252938588.5060.103.camel@localhost> <4AAF5016.2030809@maxim-ic.com>
	<4AB1F58D.7070809@maxim-ic.com> <1254136949.3778.58.camel@localhost>
	<4AC19FA0.1090301@maxim-ic.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 30 Sep 2009 08:37:27 +0300
Message-Id: <1254289047.3778.118.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "Artem.Bityutskiy@nokia.com" <Artem.Bityutskiy@nokia.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"Hunter Adrian \(Nokia-D/Helsinki\)" <adrian.hunter@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-09-29 at 11:18 +0530, JerinJacob wrote:
> Do you still have UBIFS errors? Any new interesting findings? Did you
> manage to somehow reproduce this on nandsim?
> 
>  >Still the UBIFS crashing problem persist.
>  >Not able to reproduce with nandsim.
>  >Is there anything I can help you to accelerate this bug fix ? Please 
> let me know ?
>  >Even I could reproduce the problem 16MiB of nand partition(Earlier, I 
> Was testing with 500MiB partition)
>  >If possible,Could you please run the testapp on any target board(if 
> you have any).

First of all, it would be cool if you fixed your e-mail client. I
haven't ever seen before anything like this - you put _your_ answer to
the ">" quotations, not mine. Here are some guidelines:

http://www.infradead.org/~dwmw2/email.html

Try enabling UBI extra self-checks as it is suggested here:
http://www.linux-mtd.infradead.org/faq/ubi.html#L_how_debug

Similarly, try to enable UBIFS extra self-checks. Also, keep UBI/UBIFS
debugging enabled. With the debugging and self-checks you may catch
something.

Also, try to avoid doing 'ubiformat /dev/mtd6 -y', just to make sure it
is not ubiformat which screws something. Just do
'flash_eraseall /dev/mtd6'.

Also, when you send a bug report, include _all_ UBI/UBIFS output, not
only what you see on the console. E.g., use dmesg. Read more about this
here:

http://www.linux-mtd.infradead.org/faq/ubi.html#L_how_debug

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

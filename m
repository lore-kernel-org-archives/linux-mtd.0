Received: from dns1.vpop.net ([207.178.248.2] helo=boromir.vpop.net)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C0SFn-0007gK-PA
	for linux-mtd@lists.infradead.org; Thu, 26 Aug 2004 17:57:58 -0400
Message-ID: <412E5CD8.5020706@vpop.net>
Date: Thu, 26 Aug 2004 14:57:44 -0700
From: Matthew Reimer <mreimer@vpop.net>
MIME-Version: 1.0
To: Joshua Wise <joshua@joshuawise.com>
References: <412E5AFC.5050000@joshuawise.com>
In-Reply-To: <412E5AFC.5050000@joshuawise.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org,
	h2200-port mailing list <h2200-port@handhelds.org>,
	Kernel-discuss@handhelds.org
Subject: Re: [H2200-port] HAMCOP NAND driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Joshua.

Joshua Wise wrote:

> Hi folks,
>
> Is there any reason why HAMCOP NAND driver is not in the MTD directory 
> and MTD CVS as all the other NAND drivers are?

I can't recall exactly, but I probably put it there because it seemed 
like it ought to live with the rest of its SoC brethren, or it was 
easier. I think my first version did live in with mtd. It doesn't matter 
to me where it lives. Where does its cousin S3C2410 NAND driver live?

> Also, what is the status of that driver? A quick flip through seems to 
> show that it's only got support for read-in commands, although I'm not 
> too familiar with the HAMCOP's NAND architecture. If it's only got 
> read support, is someone already working on write? (If not, I will 
> volunteer to do that... don't want to duplicate work, though.)

Write support is there, but I haven't had the courage to try it out. :-) 
There is a write_enable module_param for shamcop_nand, which if set to 1 
would theoretically allow writes (which amounts to just setting the 
write enable bit).

Now that you're all set up with JTAG, you seem like the best person to 
try it out. :-)

Matt

Received: from h1.handhelds.org ([192.58.209.91] helo=handhelds.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C0Sec-00088i-QR
	for linux-mtd@lists.infradead.org; Thu, 26 Aug 2004 18:23:35 -0400
Message-ID: <412E62E4.4000007@joshuawise.com>
Date: Thu, 26 Aug 2004 18:23:32 -0400
From: Joshua Wise <joshua@joshuawise.com>
MIME-Version: 1.0
To: Matthew Reimer <mreimer@vpop.net>
References: <412E5AFC.5050000@joshuawise.com> <412E5CD8.5020706@vpop.net>
In-Reply-To: <412E5CD8.5020706@vpop.net>
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

> I can't recall exactly, but I probably put it there because it seemed 
> like it ought to live with the rest of its SoC brethren, or it was 
> easier. I think my first version did live in with mtd. It doesn't matter 
> to me where it lives.
Okay. Later today, I will throw it into the MTD tree (probably flip it 
over to the MTD list first to make sure that there's nothing too too 
wrong with it). I'll probably also change it to use a variable SHAMCOP 
base, as I'm going to be using that with a JTAG MTD mapping driver too.

> Write support is there, but I haven't had the courage to try it out. :-) 
> There is a write_enable module_param for shamcop_nand, which if set to 1 
> would theoretically allow writes (which amounts to just setting the 
> write enable bit).
Awesome! I will see what I can do later.

> Now that you're all set up with JTAG, you seem like the best person to 
> try it out. :-)
Ah, I'm almost set up with JTAG here. It seems that indeed when we 
doodle with CPU jtag, it leaves SHAMCOP JTAG in a funny state, which 
essentially amounts to making the SHAMCOP useless. Tomorrow I'll ask 
Jamey if there's a trace that I should be cutting to disable TDI on 
SHAMCOP. (Alternatively, we also have JTAG direct on SHAMCOP, although 
as noted previously, I don't know the boundary scan order for that.)

joshua

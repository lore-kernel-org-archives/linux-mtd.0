Received: from web53607.mail.yahoo.com ([206.190.37.40])
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Dq3nq-0000iP-QG
	for linux-mtd@lists.infradead.org; Wed, 06 Jul 2005 02:54:40 -0400
Message-ID: <20050706064754.77131.qmail@web53607.mail.yahoo.com>
Date: Tue, 5 Jul 2005 23:47:54 -0700 (PDT)
From: Komal Shah <komal_shah802003@yahoo.com>
To: Vikrant_Basotra <Vikrant_Basotra@Satyam.com>, linux-mtd@lists.infradead.org
In-Reply-To: <D8595042F3765A4285B848A78A2C2ED10162C4@bsdmsg002.corp.satyam.ad>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: Nishant_Galange <Nishant_Galange@Satyam.com>,
	Apoorv_Sangal <Apoorv_Sangal@Satyam.com>
Subject: Re: Porting Linux on MPC8266 custom board
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--- Vikrant_Basotra <Vikrant_Basotra@Satyam.com>
wrote:

> Hi All,
> 		I am porting Linux on MPC8266 custom board, after
> getting in to Linux the system seems to be struck at
> a point.
> Saved Environment variable:-
>       bootargs console=ttyS0,11520 root=1f00 and

root=1f00 is fine, but still better to use
root=/dev/mtdblock<n>. 

> 
> After that what I get on the terminal is pasted
> below for your
> reference.

Please enable the low level debugging CONFIG_DEBUG_LL.

Also it is good to enable to MTD debugging for tracing
the point at which it gives crashes if any.

> I couldn't make out any thing from the output, can
> any body tell me
> where I am doing wrong, and also I don't have any
> idea about the
> bootargs argument "root". Can any body give the
> precise description of
> this argument?

Hope you have enabled all the proper config options in
the kernel etc.

As you are using 2.4.x. I can't help on this. Let me
know once you are done with 2.6.x

---Komal Shah

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

Received: from wproxy.gmail.com ([64.233.184.204])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CiyxP-0002S4-Pb
	for linux-mtd@lists.infradead.org; Mon, 27 Dec 2004 12:47:00 -0500
Received: by wproxy.gmail.com with SMTP id 37so289836wra
	for <linux-mtd@lists.infradead.org>;
	Mon, 27 Dec 2004 09:46:58 -0800 (PST)
Message-ID: <6934efce04122709464e95ec21@mail.gmail.com>
Date: Mon, 27 Dec 2004 09:46:58 -0800
From: Jared Hulbert <jaredeh@gmail.com>
To: llandre <r&d2@dave-tech.it>
In-Reply-To: <6.0.1.1.0.20041227121334.01ec55d8@192.168.2.1>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
References: <6.0.1.1.0.20041227121334.01ec55d8@192.168.2.1>
Cc: linux-mtd@lists.infradead.org
Subject: Re: How to exploit STS pin of Strata Flash
Reply-To: Jared Hulbert <jaredeh@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 27 Dec 2004 12:23:18 +0100, llandre <r&d2@dave-tech.it> wrote:
> Hi,
> 
> I have a question about STS pin of Strata Flash.
> I'd like to implement a function in the low-level map driver
> in order to exploit the STS pin to read the ready/busy
> status (NAND-like).
> How should I hack the code? It seems there is
> no <board>_device_ready or something like that ...

Why?

How?  Connect it to a irq line?

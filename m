Received: from wx-out-0506.google.com ([66.249.82.233])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HiRB0-0001TD-LN
	for linux-mtd@lists.infradead.org; Mon, 30 Apr 2007 04:24:07 -0400
Received: by wx-out-0506.google.com with SMTP id t8so1519794wxc
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 Apr 2007 01:24:04 -0700 (PDT)
Message-ID: <acd2a5930704300124h43a04be7v3113a9573aed931f@mail.gmail.com>
Date: Mon, 30 Apr 2007 12:24:04 +0400
From: "Vitaly Wool" <vitalywool@gmail.com>
To: tglx@linutronix.de
Subject: Re: [PATH] NAND Flash support for Intel IXP4xx platform
In-Reply-To: <1177921076.5791.189.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <463332F9.9040105@ru.mvista.com>
	<1177763736.7646.149.camel@localhost.localdomain>
	<46334F28.70506@ru.mvista.com>
	<1177794151.7646.312.camel@localhost.localdomain>
	<46359C8A.4040306@ru.mvista.com>
	<1177921076.5791.189.camel@localhost.localdomain>
Cc: linux-mtd@lists.infradead.org, "Ruslan V. Sushko" <rsushko@ru.mvista.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 4/30/07, Thomas Gleixner <tglx@linutronix.de> wrote:
> > So I move
> > this functionality completely to hardware dependent part of driver (sent
> > to LAKML)
>
> Sigh. You need a platform driver in drivers/mtd/nand first to move
> anything related to nand into your arch code.

Ruslan, may I suggest that you post both parts of the driver (ie
platform-specific part and hardware-independent part) just as you see
those to this list? It's gonna be a lot easier to discuss things then,

Thanks,
   Vitaly

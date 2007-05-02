Received: from wx-out-0506.google.com ([66.249.82.227])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HjJGv-00085m-ND
	for linux-mtd@lists.infradead.org; Wed, 02 May 2007 14:09:50 -0400
Received: by wx-out-0506.google.com with SMTP id t8so212313wxc
	for <linux-mtd@lists.infradead.org>;
	Wed, 02 May 2007 11:09:48 -0700 (PDT)
Message-ID: <acd2a5930705021109n7aca4a75k59b3ad775e61811e@mail.gmail.com>
Date: Wed, 2 May 2007 22:09:48 +0400
From: "Vitaly Wool" <vitalywool@gmail.com>
To: dsaxena@plexity.net
Subject: Re: [PATH] NAND Flash support for Intel IXP4xx platform
In-Reply-To: <20070502160359.GA21292@plexity.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <463332F9.9040105@ru.mvista.com>
	<1177763736.7646.149.camel@localhost.localdomain>
	<46334F28.70506@ru.mvista.com>
	<1177794151.7646.312.camel@localhost.localdomain>
	<46359C8A.4040306@ru.mvista.com> <20070502160359.GA21292@plexity.net>
Cc: tglx@linutronix.de, linux-mtd@lists.infradead.org,
	"Ruslan V. Sushko" <rsushko@ru.mvista.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5/2/07, Deepak Saxena <dsaxena@plexity.net> wrote:
> Can't that extra functionality be stuffed into a structure that you
> point to via the priv member of platform_nand_chip?

Please see my recent posts/patches -- everything fits well in the
updated model, so either Ruslan finishes my work on generic NAND
driver or he'll have to wait till I clean up things.

Vitaly

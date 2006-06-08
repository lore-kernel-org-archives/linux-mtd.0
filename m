Received: from nz-out-0102.google.com ([64.233.162.195])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FoImk-0005lt-BR
	for linux-mtd@lists.infradead.org; Thu, 08 Jun 2006 07:34:57 -0400
Received: by nz-out-0102.google.com with SMTP id 4so378222nzn
	for <linux-mtd@lists.infradead.org>;
	Thu, 08 Jun 2006 04:34:42 -0700 (PDT)
Message-ID: <625fc13d0606080434k2e2edabcr43e63fcb9fc6a1cb@mail.gmail.com>
Date: Thu, 8 Jun 2006 06:34:42 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Joan Xiong" <j.xiong@simton.com>
Subject: Re: JFFS2 testcase
In-Reply-To: <200606081005.17670.j.xiong@simton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <200606081005.17670.j.xiong@simton.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 6/7/06, Joan Xiong <j.xiong@simton.com> wrote:
> Hi
>     Now I have my board support JFFS2+MTD+NAND, and do some stress test. It
> works OK. :-). But I need more detail test on my board.
>     Could you give me the detial testcase for JFFS2, expecially for NAND
> flash? Or tell me where can I find these testcase, thanks.

They don't exist.  You either have to write your own or use some of
the standard filesystem tests like bonnie++, iozone, and fsx.

josh

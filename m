Received: from an-out-0708.google.com ([209.85.132.247])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HqyIa-0008AW-1M
	for linux-mtd@lists.infradead.org; Wed, 23 May 2007 17:23:16 -0400
Received: by an-out-0708.google.com with SMTP id c3so98924ana
	for <linux-mtd@lists.infradead.org>;
	Wed, 23 May 2007 14:23:06 -0700 (PDT)
Message-ID: <47c31da80705231423n7912e8d9t78e2a076cf2ab377@mail.gmail.com>
Date: Wed, 23 May 2007 16:23:06 -0500
From: "Jonathan Kotta" <jpkotta@gmail.com>
To: "Semih Hazar" <semih.hazar@indefia.com>
Subject: Re: trouble with mounting ext2/jffs2
In-Reply-To: <4653FA11.7090403@indefia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <47c31da80705221208g11463f3bpdba6bea4fbd9747a@mail.gmail.com>
	<4653FA11.7090403@indefia.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5/23/07, Semih Hazar <semih.hazar@indefia.com> wrote:
> Can you try to mount /dev/mtdblock0 after doing flash_eraseall /dev/mtd0
> (without -j)
> As far as I see jffs2 doesn't like an empty flash with cleanmarkers. But
> it works fine with an all-empty flash. I think cleanmarkers are written
> as data is written.

Omitting the -j works.

> Another (and maybe better ?) way to go is
> * create a jffs2 image with mkfs.jffs2
> * erase the flash with -j so that cleanmarkers are written
> * and then use nandwrite to write your image to mtd.
>

Again, omitting -j works.

Thanks for the nudge.  Now I need to get DataFlash working...

-- 
Thanks,

Jonathan Kotta

Hofstadter's Law:
    It always takes longer than you expect, even
    when you take into account Hofstadter's Law.

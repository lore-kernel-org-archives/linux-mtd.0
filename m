Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1ea0bb-0003o4-1R
 for linux-mtd@lists.infradead.org; Fri, 12 Jan 2018 14:46:52 +0000
Date: Fri, 12 Jan 2018 15:46:39 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "Gudjon I. Gudjonsson" <gudjon@gudjon.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: ECC configuration of NAND from Linux  (MEMSETOOBSEL)
Message-ID: <20180112154639.63a8d133@bbrezillon>
In-Reply-To: <2132429.fBNFCxDbQz@fessender>
References: <2132429.fBNFCxDbQz@fessender>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Gudjon,

On Fri, 12 Jan 2018 01:29:55 +0100
"Gudjon I. Gudjonsson" <gudjon@gudjon.org> wrote:

> Hi list
> 
> I am trying to upgrade a few embedded Linux systems remotely 
> and increasing the number of ECC bits at the same time.
> 
> I read your FAQ and found the reference to ioctl (MEMSETOOBSEL) [1]
> but it seems to be removed from the kernel.
> /*
>  * Note, the following ioctl existed in the past and was removed:
>  * #define MEMSETOOBSEL           _IOW('M', 9, struct nand_oobinfo)
>  * Try to avoid adding a new ioctl with the same ioctl number.
>  */
> I assume this is an error in the documentation but I wonder if you
> know any solution to my problem?

It's not something you can change dynamically. When you change the ECC
config, it makes existing content unreadable. In order to change this
setting you'll have to erase the whole flash and then change the ECC
config in your DT or board file (note that not all drivers support
adjusting the ECC strength/step-size).

Regards,

Boris

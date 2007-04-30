Received: from [63.81.120.155] (helo=imap.sh.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HiY7w-00077c-10
	for linux-mtd@lists.infradead.org; Mon, 30 Apr 2007 11:49:25 -0400
Message-ID: <4636105F.8040408@ru.mvista.com>
Date: Mon, 30 Apr 2007 19:50:55 +0400
From: Sergei Shtylyov <sshtylyov@ru.mvista.com>
MIME-Version: 1.0
To: Vitaly <vitalywool@gmail.com>
Subject: Re: [patch/resend] nand: add containing structure for NAND platform
	data
References: <4635C35C.8000109@embeddedalley.com>
In-Reply-To: <4635C35C.8000109@embeddedalley.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

Vitaly wrote:

> In order to make it more convenient to pass platform-specific NAND stuff 
> to a generic driver which is hopefully to come out next, I've introduced
> a container structure for chip-specific and controller-specific data.
> I'd expect that use cases in platform code will be like
> 
> struct platform_nand_data nand_data = {
> 	...
> };
> 
> struct platform_device nand_device = {
> 	...
> 	.dev = {
> 		.platform_data = &nand_data,
> 		...
> 	},
> };
> 
> So, please find the patch below.
> 
>  include/linux/mtd/nand.h |   10 ++++++++++
>  1 files changed, 10 insertions(+)
> 
> Signed-off-by: Vitaly Wool <vitalywool@gmail.com> <mailto:vitalywool@gmail.com>

   Erm, I can't. ;-)

> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

MBR, Sergei

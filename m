Received: from mail.redswitch.com ([206.14.68.143] helo=redswitch.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18X8pW-0007yW-00
	for <linux-mtd@lists.infradead.org>; Fri, 10 Jan 2003 23:44:50 +0000
Message-ID: <3E1F61F5.8000706@redswitch.com>
Date: Fri, 10 Jan 2003 16:14:45 -0800
From: "Xiaogeng (Shawn) Jin" <xjin@redswitch.com>
MIME-Version: 1.0
To: Joakim Tjernlund <Joakim.Tjernlund@lumentis.se>
CC: linux-mtd@lists.infradead.org
Subject: Re: set_user_nice() not defined on 2.4.21+
References: <3E1F0F47.1080606@redswitch.com> <003101c2b8fc$a0947b30$0200a8c0@jockeXP>
In-Reply-To: <003101c2b8fc$a0947b30$0200a8c0@jockeXP>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi Jocke,

Are you maintaining at least mtd/compatmac.h? I also found a 
compatibility problem of rq_data_dir(). I did find that this function is 
already defined in linux/blkdev.h of 2.4.21-pre3. So probably 
mtd/compatmac.h needn't define it again.

Joakim Tjernlund wrote:
> Hi
> 
> I had the impression that set_user_nice() would be in 2.4.21 when I added set_user_nice() to 
> mtd/compatmac.h. I can change it to KERNEL_VERSION(2,5,0) or someone can
> submit a patch to Marcelo.

- Shawn.

Message-ID: <4AB0CD47.6040000@gmail.com>
Date: Wed, 16 Sep 2009 14:34:31 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: Raphael Derosso Pereira <raphael.pereira@dataprom.com>
Subject: Re: Oops on 2.6.31 with udev and root using ubifs
References: <1253041322.4496.6.camel@eng009>	<9c9fda240909151621s70d5d312k462aa51b7dddb0d8@mail.gmail.com>
	<1253099755.4496.10.camel@eng009>
In-Reply-To: <1253099755.4496.10.camel@eng009>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Kyungmin Park <kmpark@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/16/2009 02:15 PM, Raphael Derosso Pereira wrote:
> Hello,
>
> The patch is already applied. I have disabled gluebi from kernel (turned
> it to be compiled as module) and the Oops vanished. It really seems that
> the problem is related to have an UBI volume mounted and trying to use
> gluebi on top of that volume.

I think I fixed this at some point:

http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=8022c13c27b822cf22f13df10b42aae89cd56bf0

and it is a 2.6.31. Are you sure you are using 2.6.31?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

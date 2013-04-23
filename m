Received: from ch1ehsobe003.messaging.microsoft.com ([216.32.181.183]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UUWUm-00009c-4F
 for linux-mtd@lists.infradead.org; Tue, 23 Apr 2013 06:14:29 +0000
Message-ID: <5176271C.7030304@freescale.com>
Date: Tue, 23 Apr 2013 14:15:56 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2 3/8] mtd: get the ECC info from the Extended Parameter
 Page
References: <1366616878-29481-1-git-send-email-b32955@freescale.com>	<1366616878-29481-4-git-send-email-b32955@freescale.com>
 <CAN8TOE_xOBTv7weAqYinFMmTStXgY93KanV-jDAqFnY=CEfkdQ@mail.gmail.com>
In-Reply-To: <CAN8TOE_xOBTv7weAqYinFMmTStXgY93KanV-jDAqFnY=CEfkdQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B404=E6=9C=8823=E6=97=A5 05:22, Brian Norris =E5=86=99=
=E9=81=93:
> You never sent a command to the chip. How can you expect to read from i=
t?
>
> It seems that you are writing this function with the assumption of a
> particular calling context (a context in which the last command was
> CMD_PARAM). IMO, it would make a lot more sense that this function
> actually send its own CMD_PARAM followed by either X bytes of skipped
> read_buf() or a change read column command. Then it doesn't need the
> "last" argument, and its usage makes much more sense.
>
I finally find why i can not use the CHANGE READ COLUMN command:

When we detect the ONFI nand, we actually use the nand_command() to=20
issue the command which
does not works with CHANGE READ COLUMN command.

I use the nand_command_lp() to issue the CHANGE READ COLUMN command, it=20
works fine.

I can remove the "last" argument now.

thanks Brian.

Huang Shijie

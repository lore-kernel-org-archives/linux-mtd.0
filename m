Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OCYNT-0006CX-LZ
	for linux-mtd@lists.infradead.org; Thu, 13 May 2010 13:23:04 +0000
Received: by wwa36 with SMTP id 36so818025wwa.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 13 May 2010 06:23:01 -0700 (PDT)
MIME-Version: 1.0
Sender: jonringle@gmail.com
In-Reply-To: <AANLkTinD7cNOEhTKnmR9vCLkO4l3TLj5v_Q92QSQBnvZ@mail.gmail.com>
References: <n2g152584231004131315ge1d824bfm6820ccb877a0fde6@mail.gmail.com>
	<z2z152584231004201324tc69525a0hb86ff9fdeb679ca4@mail.gmail.com>
	<1272373142.7750.5.camel@localhost>
	<AANLkTinWOfcRRrfhgUO2tvBeVDu_PvnKeKa_0MQKbJtG@mail.gmail.com>
	<1273635175.8881.3.camel@localhost.localdomain>
	<AANLkTimjSxP9tCJM86hNRRgFKvj5MQLSYowOF5P-PpOe@mail.gmail.com>
	<AANLkTinbUzqx3hwbhB9vBUTvZqFJ5orIKDwSrKG6P5Mf@mail.gmail.com>
	<AANLkTinD7cNOEhTKnmR9vCLkO4l3TLj5v_Q92QSQBnvZ@mail.gmail.com>
Date: Thu, 13 May 2010 09:23:01 -0400
Message-ID: <AANLkTimd-_5jlWY39vg9CHfDVWuOjWRAS3KCS4lbT1Un@mail.gmail.com>
Subject: Re: Erase race?
From: Jon Ringle <jon@ringle.org>
To: massimo cirillo <maxcir@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 12, 2010 at 8:31 AM, massimo cirillo <maxcir@gmail.com> wrote:
> Have you any evidence of erase suspend occurrence ?
How do I know if erase suspend occurs?

> Could you try to disable erase suspend from cfi_cmdset_0001.c ?
> To this end, uncomment
> #define CMDSET0001_DISABLE_ERASE_SUSPEND_ON_WRITE
> #define CMDSET0001_DISABLE_WRITE_SUSPEND
> (they must be defined) at the beginning of the file and repeat
> your test.

Thanks. I will try this, however, since the problem is infrequent and
I don't know how to make the problem happen more reliably, it will
take some time to verify that this fixes the issue.

Jon

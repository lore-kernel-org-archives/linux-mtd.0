Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MaAPH-0003mU-2a
	for linux-mtd@lists.infradead.org; Sun, 09 Aug 2009 15:34:03 +0000
Message-ID: <4A7EEC03.6040506@gmail.com>
Date: Sun, 09 Aug 2009 18:32:19 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: Subodh Nijsure <nijsure.subodh@gmail.com>
Subject: Re: Trouble getting MTD to run -- permission denied messages
References: <110c8b2e0907311429k26d23f10jb220a4afdf89e949@mail.gmail.com>
In-Reply-To: <110c8b2e0907311429k26d23f10jb220a4afdf89e949@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/01/2009 12:29 AM, Subodh Nijsure wrote:
> Also mtdinfo -a display following message
>
> # /mtd/mtdinfo -a
> Count of MTD devices:           3
> MTD_open
> libmtd: error!: cannot open "/dev/mtd0"
>          error 13 (Permission denied)
> mtdinfo: error!: libmtd failed get MTD device 0 information
>           error 13 (Permission denied)
>
> I must have missed some basic step in getting things setup for NOR
> flash, would appreciate a nudge in right direction...

did you try to be root?
-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

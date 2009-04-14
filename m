Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lte3d-0005Uc-1r
	for linux-mtd@lists.infradead.org; Tue, 14 Apr 2009 08:32:01 +0000
Message-ID: <49E44A1F.9000605@nokia.com>
Date: Tue, 14 Apr 2009 11:32:31 +0300
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: jerry <jerrydreaming@gmail.com>
Subject: Re: ubifs corrupt
References: <71103bce0904140105l2aea95b4i2bfe460abacf66ec@mail.gmail.com>
In-Reply-To: <71103bce0904140105l2aea95b4i2bfe460abacf66ec@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

jerry wrote:
> Hi Artem,
> 
> I'm getting some problem with UBIFS when the power is switched off abruptly
>  during a write to flash(nandflash 2k/page). In the next boot the contents of
>  the file is not found and prints the following information.
> 
> UBIFS error (pid 358): ubifs_check_node: bad magic 0xffffffff,
> expected 0x6101831
> UBIFS error (pid 358): ubifs_check_node: bad node at LEB 27:251264
> UBIFS error (pid 358): ubifs_read_node: expected node type 2
> UBIFS error (pid 358): ubifs_check_node: bad magic 0xffffffff,
> expected 0x6101831
> UBIFS error (pid 358): ubifs_check_node: bad node at LEB 27:251264
> UBIFS error (pid 358): ubifs_read_node: expected node type 2
> problem renaming the file /Settings/qpe.conf.new to /Settings/qpe.conf
> UBIFS error (pid 358): ubifs_check_node: bad magic 0xffffffff,
> expected 0x6101831
> UBIFS error (pid 358): ubifs_check_node: bad node at LEB 27:251264
> UBIFS error (pid 358): ubifs_read_node: expected node type 2
> 
> I think the qpe.conf is writting when the power is off and The problem
> is reproducable.
> 
> Please could you tell me if this is a known issue.

Do you have this patch?

	http://git.infradead.org/ubifs-2.6.git?a=commitdiff;h=de0975781a1a8bc92e07eb7681d10ef9bb5e6df9

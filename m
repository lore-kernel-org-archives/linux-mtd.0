Received: from [211.21.46.12] (helo=pluto.setabox.com.tw)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Cnwzr-0008BD-2X
	for linux-mtd@lists.infradead.org; Mon, 10 Jan 2005 05:42:05 -0500
Message-ID: <41E25BE5.3090409@setabox.com>
Date: Mon, 10 Jan 2005 18:41:41 +0800
From: William J Beksi <wjbeksi@setabox.com>
MIME-Version: 1.0
To: pavel livshits <spavell@gmail.com>
References: <f6d36a4405011002065bef7372@mail.gmail.com>
In-Reply-To: <f6d36a4405011002065bef7372@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Adding Partition to MTD
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

pavel livshits wrote:

>Hi,
>
>I'm using Monta Vista Linux CEE for PXA271. I would like to add
>additional (forth) partition to MTD "Bulverdo flash" for test file
>system purpose.
>Where are the changes other then another name to static struct
>mtd_partition bulverde_partitions[]?
>  
>
None, just add another partition simply by modifying the mtd_partition 
partition_info[] struct in the driver for your particular board, 
recompile and reload the driver.

--
William

Received: from mailrelay2.inwind.it ([212.141.54.102])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16VGf5-0000kd-00
	for <linux-mtd@lists.infradead.org>; Mon, 28 Jan 2002 18:37:47 +0000
Received: from archimede (62.98.77.103) by mailrelay2.inwind.it (5.5.053)
        id 3C3ABE8B00B16655 for linux-mtd@lists.infradead.org; Mon, 28 Jan 2002 19:47:59 +0100
Message-ID: <007101c1a82c$33dec770$674d623e@archimede>
From: "Alessandro Staltari" <staltari@geocities.com>
To: <linux-mtd@lists.infradead.org>
References: <20020128100328.31708.qmail@web8102.in.yahoo.com>
Subject: Re: Cf Card vs DiskOnChip
Date: Mon, 28 Jan 2002 19:46:18 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

From: "Ramya Ravichandran"
>
>
> What we wnat is an application that takes about
> 100-120 MB disk storage space and 128MB memory
> footprint on top of linux. This communicates with a
> microcontroller which does some image procesing etc.
> The criteria for doing image processing is input from
> the user to the appln. on linux which inturn gives it
> to the microcontroller. All this in a dusty industrial
> environment.Amy I have ur sugesstions.
>

Please take care that if such huge application always have enough memory and
don't need to swap data to disk since flash disk is probably too slow for
this job.
Did you evaluate to remote it using an X-terminal, or mounting an NFS
partition?

Alessandro Staltari
staltari(a)geocities.com

Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 157dPM-0006Ae-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Jun 2001 14:31:36 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20010606152826.A9691@crystal.2d3d.co.za> 
References: <20010606152826.A9691@crystal.2d3d.co.za>  <F1BED55F35F4D3118C0F00E0295CFF4D995488@mail.mediatrix.com> 
To: Abraham vd Merwe <abraham@2d3d.co.za>
Cc: Frederic Giasson <fgiasson@mediatrix.com>,
    MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: mtd_info->write 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 06 Jun 2001 14:35:31 +0100
Message-ID: <14797.991834531@redhat.com>
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


abraham@2d3d.co.za said:
> > If the data is all ones ("1"), it has been erased.   If not, it has
> > not.

> Yes, I know, but I want to know whether I have to check if that's the
> case or not. 

The chip driver is not required to check that the data are all ones. You 
are permitted to write to the same location of a chip repeatedly. If you 
write a 1 where previously there was a zero, obviously the result will be a 
zero. But that is not an error.

--
dwmw2

Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 157dXx-0006Bs-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Jun 2001 14:40:29 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <F1BED55F35F4D3118C0F00E0295CFF4D99548C@mail.mediatrix.com> 
References: <F1BED55F35F4D3118C0F00E0295CFF4D99548C@mail.mediatrix.com> 
To: Frederic Giasson <fgiasson@mediatrix.com>
Cc: Abraham vd Merwe <abraham@2d3d.co.za>,
    MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: mtd_info->write 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 06 Jun 2001 14:41:20 +0100
Message-ID: <15619.991834880@redhat.com>
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

fgiasson@mediatrix.com said:
> That's right, but a read back validation has to show the error.

There is no such read back validation in any of the MTD code, is there?
If you write to a region which already contains data, then read back and 
compare with the data you wrote, you're likely to see differences.

Film at 11. :)

--
dwmw2
